### Lec-11: Insert, Update & Delete from Foreign Key table | Referential Integrity
https://www.youtube.com/watch?v=DM2lAomoDrg

People understand how to create Foreign keys but the inner concept of why foreign key is needed is not clearly understood.

#### Foreign key maintains referencial integrity. 
Which means the value of certain records that occurs in many places should all be the same. Trace of record should only exist if it exists in the base table. If the record is deleted in base table information related to that record in other tables should also be deleted.

Base Table (Referenced Table) : the table where you have the primary key of that record
Referencing table: The table that has Foreign Key which is basically a copy of primary key in the base table

#### Crud operation on Base tables
- INSERT operation in base table will not create any issue
- DELETE operation in base table may cause issue. If that deleted record is present in other table (Referencing table). 
    - We can solve this problem by usig ON DELETE CASCADE operation. ON DELETE CASCADE will delete all rows in referencing tables.
    - We can also solve this problem using ON DELETE SET NULL. This will replace the FK value to NULL. However, If the foreign key in the referencing table is also the primary key of that table, then you can't set that to NULL. Because primary key cannot be NULL.
    - We can also have ON DELETE NO ACTION. It will give error. So you need to first delete from the referencing table then you can delete in the base table.
- UPDATE operation in base table of the Primary Key will create issues. We can't do that directly without affecting other tables. We have same way to fix it like the DELETE operation
    - ON UPDATE CASCADE
    - ON UPDATE SET NULL
    - ON UPDATE NO ACTION

### Crud operation on Referencing tables
- INSERT operation may cause data inconsitency. 
- DELETE operation does not cause any data inconsistency. 
- UPDATE operation may cuase data inconsistency if you change the Foreign Key. 