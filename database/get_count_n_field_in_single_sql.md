RESULT expect: 
```
Total_Number_Of_Male_Employee | Total_Number_Of_Female_Employee | Total_Number_of_Other
|            3                |              5                  |         1            |
===========================================================================================
```

```sql
create table Employee
(
   Gender ENUM('Male','Female', 'Other')
);

insert into Employee values('Male');
insert into Employee values('Male');
insert into Employee values('Male');
insert into Employee values('Female');
insert into Employee values('Female');
insert into Employee values('Female');
insert into Employee values('Female');
insert into Employee values('Other');
```

SQL:
```sql
select
sum(case when Gender='Male' then 1 else 0 end) as Total_Number_Of_Male_Employee,
sum(case when Gender='Female' then 1 else 0 end) as Total_Number_Of_Female_Employee
sum(case when Gender='Other' then 1 else 0 end) as Total_Number_of_Other
from Employee;
```
