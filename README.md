# Barangay Portal

A Django-based system for managing barangay resident records, generating certificates, and maintaining an audit log, with field-level encryption for sensitive data and robust Excel/CSV import.

## Features

- Field-level encryption (Fernet) for sensitive resident data
- Transparent decrypt/encrypt in the app; ciphertext at rest in MySQL
- Robust Excel/CSV import with flexible header mapping and normalization
- Role-based permissions with superuser/Admin overrides
- Certificate generation flows with logging and archiving behavior
- Dashboard analytics and records filtering

## Tech Stack

- Python 3.x, Django 5
- MySQL/MariaDB
- cryptography (Fernet)
- openpyxl (Excel parsing)

## Project Structure (high level)

- barangayportal/settings.py — Django settings, reads `FERNET_KEY`
- authapp/models.py — Models incl. `PersonInformation`, `ArchivedResident`, and `EncryptedTextField`
- authapp/views.py — Views for records, CRUD, Excel/CSV upload, certificates
- authapp/templates/authapp/*.html — Templates (records, archived, certification, etc.)
- authapp/signals.py — Archives residents when status becomes Inactive (no delete)

## Setup

### Prerequisites
- Python 3.10+
- MySQL/MariaDB server
- pip / venv recommended

### 1) Clone and enter the project

```
git clone <your-repo-url>
cd sysarc
```

### 2) Create and activate virtual environment (recommended)

```
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate
```

### 3) Install dependencies

```
pip install -r requirements.txt
```

### 4) Configure database and environment

Set these environment variables or use a `.env` loader if you have one.

Required:
- `FERNET_KEY` — 32-byte base64 urlsafe key used by Fernet

Typical DB settings (set in environment or in settings/local settings):
- `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_HOST`, `DB_PORT`

Generate a Fernet key:
```
python -c "from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())"
```
Set it for your shell/session (Windows PowerShell example):
```
setx FERNET_KEY "<PASTE_GENERATED_KEY>"
```
Reopen your shell to ensure the environment is available to Django.

### 5) Migrate and create superuser

```
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
```

### 6) Run the server

```
python manage.py runserver
```
Visit http://127.0.0.1:8000/

## Encryption Details

Sensitive text fields in `PersonInformation` are stored encrypted at rest:
- `region`, `street_number`, `street`, `city`, `province`
- `place_of_birth`, `civil_status`, `occupation`, `citizenship`
- `relationship_to_household_head`

Plaintext/searchable fields remain unencrypted to keep filters fast and working:
- `first_name`, `middle_name`, `last_name`
- `gender`, `date_of_birth`
- `pwd_status`, `voter_status`, `resident_status`
- `barangay`
- `educational_background` (plaintext CharField with choices)

Implementation:
- `EncryptedTextField` in models transparently encrypts on save and decrypts on read via `FERNET_KEY`.
- If `FERNET_KEY` is missing, Django raises ImproperlyConfigured.

## Data Normalization

- Names and address-like fields are title-cased on save (model `save()` and importer normalization).
- Choice fields (e.g., gender, pwd_status, voter_status, resident_status) are mapped to valid choices.

## Excel/CSV Import

Navigate to Records page and use the Upload Excel form.

Accepted formats:
- `.xlsx` (Excel)
- `.csv` (UTF-8 or UTF-8 with BOM)

Flexible headers (order doesn’t matter). Common synonyms are mapped to expected fields. Recommended headers:
```
first_name,middle_name,last_name,date_of_birth,place_of_birth,gender,civil_status,occupation,citizenship,relationship_to_household_head,educational_background,street_number,street,barangay,city,province,region,pwd_status,voter_status,resident_status
```

Notes:
- Date formats supported: `YYYY-MM-DD`, `MM/DD/YYYY`, `DD/MM/YYYY`.
- `pwd_status`: YES/true → `PWD`, else `No`.
- `voter_status`: `Voter` or defaults to `Non-Voter`.
- `resident_status`: defaults to `Active` unless explicitly `Inactive`.
- `educational_background` mapped to choices: `No Formal Education`, `Elementary Graduate`, `High School Graduate`, `College Graduate`.
- Invalid rows are skipped and counted in the response.

### Sample CSVs
- Blank template: `sysarc/resident_import_template.csv`
- Populated sample: `sysarc/resident_sample_import.csv`

## Certificates and Archiving Behavior

- Generating certificates logs entries in the logbook.
- Only the `deceased_person` certificate sets the resident to `Inactive` and archives them as deceased.
- Manually setting a resident to `Inactive` (via edit) also triggers archiving.
- The signal in `authapp/signals.py` archives Inactive residents if not already archived and does NOT delete the record.
- Records page shows only `Active` by default; use the filter to view `Inactive`.

## Permissions

- Superusers have all permissions.
- Users in the `Admin` group effectively have full permissions.
- Other users can be granted fine-grained permissions via `RolePermission` model (e.g., `can_add_resident`, `can_edit_resident`, `can_delete_resident`, `can_upload_excel`).
- The upload endpoint allows superuser/Admin or users with `can_upload_excel=True`.

## Common Endpoints

- `/records/` — list and manage residents
- `/archived-records/` — view archived residents
- `/generate/<cert_type>/` — search resident for certificate
- `/generate/<cert_type>/<resident_id>/` — generate specific certificate
- `/upload_excel/` — Excel/CSV upload (POST)

## Troubleshooting

- Missing encryption key:
  - Ensure `FERNET_KEY` is set in environment and restart the shell/IDE.
- Can’t upload as Admin:
  - Ensure you are superuser or in `Admin` group, or have `can_upload_excel=True` in `RolePermission`.
  - The Records page upload button shows only when `permissions.can_upload` is true.
- Upload accepted but no new records:
  - Check the response message. Invalid rows are skipped (e.g., malformed dates). Use the sample template.
- Education or statuses not showing as expected:
  - Ensure the values map to one of the allowed choices listed above.
- MySQL/MariaDB warnings about Strict Mode:
  - Enable strict mode to prevent silent data truncation.

## Security Notes

- Never commit `FERNET_KEY` or database credentials to version control.
- Rotate `FERNET_KEY` carefully; rotating requires a migration/re-encryption strategy.

## Development Tips

- When changing model fields, run migrations: `python manage.py makemigrations && python manage.py migrate`.
- Use the Django admin or the Records page to verify new data is encrypted at rest (inspect DB) and readable in the UI.

## License

Specify your license here (e.g., MIT).
