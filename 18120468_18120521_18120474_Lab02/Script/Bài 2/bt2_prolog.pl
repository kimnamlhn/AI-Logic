%Thông tin nghề nghiệp
work('John','Technician','Electricity').
work('Tim','Engineer','Electricity').
work('Rose','Accountant','Accounting').
work('Medith','Accounting Manager','Accounting').
work('Jasmine','Accountant','Accounting').
work('Billy','Supervisor','Electricity').
work('Richard','Technician','Electricity').
work('Ian','Salesman','Sales').
work('Henry','Marketing Agent','Sales').
work('Lisa','Sales Manager','Sales').
work('Emily','Executive Director','Board of Directors').

%Thông tin nơi sinh sống
live('John','Houston Street').
live('Tim','Allen Street').
live('Rose','Orchard Street').
live('Medith','Allen Street').
live('Jasmine','Leonard Street').
live('Billy','Third Avenue').
live('Richard','Jones Street').
live('Ian','Third Avenue').
live('Lisa','Third Avenue').
live('Henry','Park Avenue').
live('Emily','Wall Street').

%Chức vụ cấp cao hơn
reportTo('Technician','Engineer').
reportTo('Engineer','Supervisor').
reportTo('Salesman','Sales Manager').
reportTo('Marketing Agent','Sales Manager').
reportTo('Accountant','Accounting Manager').

%Làm việc cho phòng ban nào
workAt(Person, Branch):- work(Person, Job, Branch).
%Làm công việc gì trong phòng ban
workAs(Person, Job):- work(Person, Job, Branch).
%Làm việc cho cấp trên trực tiếp là ai
workFor(Person1, Person2):- work(Person1, Job1, Branch), work(Person2, Job2, Branch), subordinate(Job1, Job2).

%Tên người
person(Person):- live(Person, Street), work(Person, Job, Branch).
%Công việc (bao gồm chức vụ và phòng ban)
employment(Job, Branch):- work(Person, Job, Branch).
%Nghề (hay chức vụ)
occupation(Job):- employment(Job, Branch).
%Phòng ban
department(Branch):- employment(Job, Branch).

%Nếu chung chức vụ và phòng ban thì là đồng nghiệp
colleague(Person1, Person2):- work(Person1, Job, Branch), work(Person2, Job, Branch).
%Cấp trên (không tính phòng ban)
superior(Job1, Job2):- reportTo(Job2, Job1).
superior(Job1, Job2):- workAs(Person1, Job1), workAs(Person2, Job2), director(Person1), not(director(Person2)).
superior(Job1, Job2):- reportTo(Job3, Job1), superior(Job3, Job2).
%Cấp dưới (không tính phòng ban)
subordinate(Job1, Job2):- superior(Job2, Job1).
%Quản lý
manager(Person, Branch):- work(Person, Job, Branch), workFor(Employee, Person).
%Giám đốc
director(Person):- work(Person, Job, 'Board of Directors').

%Tên phố
street(Street):- live(Person, Street).
%Nếu sống cùng phố thì là hàng xóm
neighbor(Person1, Person2):- live(Person1, Street), live(Person2, Street).