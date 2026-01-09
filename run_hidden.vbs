Set WshShell = CreateObject("WScript.Shell")

WshShell.CurrentDirectory = "C:\Users\Laptop Supplier PH\Documents\sysarc"

WshShell.Run "python manage.py runserver 127.0.0.1:8000", 0, False