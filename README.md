# Pewlett_Hackard_Analysis
Employee Database Analysis Project for UT Austin Data Analysis Bootcamp<br>

# Project Overview
The manager of the Pewlett-Hackard Corporation has requested we analyze their employee database to determine the number of soon-to-be-retiring employees by title and to identify employees who are eligible to participate in a mentorship program based on age.<br>

# Resources
- Data Sources: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, titles.csv, salaries.csv
- Software: PostgreSQL, pgAdmin 4, Visual Studio Code

# Results
The following schema demonstrates the relationships between the databases we were provided:<br>

<p align ="center">
<img src="Results/schema.png" alt="Schema" width="600"/><br>
</p>

- In order to find the number of employees who would be retiring soon by title, we joined columns from the employees and titles tables into a new table, which we labeled retirement_titles. We filtered this for employees born between 1952-1955 using the following code:<br>

<img src="Results/code1.png" alt="code1" height="120"/><br>

This gave us a table in which some employees who have held multiple titles appear more than once:<br>

<p align ="center">
<img src="Results/retirement_titles.png" alt="retirement_titles" height="400"/><br>
</p>

- To rectify the problem of having employees appearing multiple times we used the following DISTINCT ON command to remove the duplicates and created another table which we labeled unique_titles:<br>

<img src="Results/code2.png" alt="code2" height="140"/><br>

This produced a table without duplicates:<br>

<p align ="center">
<img src="Results/unique_titles.png" alt="unique_titles" height="400"/><br>
</p>

- We then used the COUNT function to find the total number of soon-to-retire employees by title:<br>

<img src="Results/code3.png" alt="code3" height="100"/><br>

<p align ="center">
<img src="Results/retiring_titles.png" alt="retiring_titles" width="300"/><br>
</p>

- In order to determine the number of employees eligible for the mentorship program we joined the employees, titles, and dept_employees tables, then filtered for employees who were born in 1965 and who were still currently employed (signified by the company under the arbitrary to_date of '9999-01-01'). Finally, we eliminated duplicate records by using the DISTINCT ON command:<br>

<img src="Results/code4.png" alt="code4" height="220"/><br>

This produced a table of employees eligible for the program:<br>

<p align ="center">
<img src="Results/mentorship_eligibility.png" alt="mentorship_eligibility" height="400"/><br>
</p>

# Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?<br>
As we can see in the retiring_titles table, the following numbers of positions will need to be filled:<br>

<p align ="center">
<img src="Results/retiring_titles.png" alt="retiring_titles" width="300"/><br>
</p>

We can anticipate that we will need to fill the roles of 29,414 Senior Engineers, 28,255 Senior Staff, 14,222 Engineers, 12,242 Staff, 4502 Technique Leaders, 1761 Assistant Engineers, and 2 Managers. To better understand what this means for the company we can compare the numbers of employees retiring to the numbers of the total workforce. We can find the numbers of titles of all current employees regardless of age using the following code:<br>

<img src="Results/code7.png" alt="code7" height="140"/><br>

<p align ="center">
<img src="Results/total_titles.png" alt="total_titles" width="300"/><br>
</p>

From this we can see that the number of employees retiring is a significant portion of the total employee population for each job title.<br>

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
In order to answer this question, we first need to determine the counts of mentorship-eligible employees by title. We can do this using the code:<br>

<img src="Results/code6.png" alt="code6" height="100"/><br>

<p align ="center">
<img src="Results/mentorship_titles.png" alt="mentorship_titles" width="300"/><br>
</p>

Compared to the number of employees who will be retiring soon, the number of employees eligible for the mentorship program is small, in the hundreds rather than the thousands. There are certainly enough employees of the older generation to mentor the next generation of leaders. <br>


