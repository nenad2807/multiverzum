
*** Project Download

1. Install Python, Django, DBeaver, MySQLServer.

2. Clone the project from the above link.

*** Database setup

3. Using DBeaver or MySQLWorkbench create a new database schema with title "multiverzum"
4. Leave database password to be user: root, NO PASSWORD
5. After that open your project root directory from command line
6. Type the command:
```python
python manage.py migrate
```

This will create all the initial python generated tables in the database. You can use DBeaver to connect to the database you created on localhost and check if the tables were generated successfully.

7. Then type the command: 
```python
python manage.py makemigrations 
```
8. After that type: 
```python
python manage.py migrate
```
Hopefully this created all the tables for the project. Again using DBeaver check if the tables are there.


*** Run the project
```python
python manage.py runserver
```


*** Testing data setup
9. Import the tables from the sql files in the project root to have some testing data on your localhost. But you can also publish your own items locally and register profiles etc.
