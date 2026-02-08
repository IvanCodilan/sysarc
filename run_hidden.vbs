Set WshShell = CreateObject("WScript.Shell")

' Set project directory
WshShell.CurrentDirectory = "C:\Users\Laptop Supplier PH\Documents\sysarc"

' Run Django using venv Python (hidden)
WshShell.Run _
"""" & "C:\Users\Laptop Supplier PH\Documents\sysarc\venv\Scripts\python.exe" & _
""" manage.py runserver 127.0.0.1:8000", 0, False
