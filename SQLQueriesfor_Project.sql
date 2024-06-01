/*
Count of Employees by Business Unit
*/

--select BusinessUnit , count(BusinessUnit) as TotalEmployees 
--from employee_data
--group by BusinessUnit;

/*
Count of Employees by Race and Marital Status
*/

--select  MaritalDesc , count(MaritalDesc) as TotalMaritalDesc
--from employee_data
--group by MaritalDesc;

--select  RaceDesc , count(RaceDesc) as TotalRaceDesc
--from employee_data
--group by RaceDesc;

/*
Number of Employees per Supervisor
*/
--select Supervisor , count(Supervisor) as Total_SuperVisor 
--from employee_data
--group by Supervisor 
--order by Supervisor desc;

/*
Number of Active ,Voluntarily Terminated,Leave of Absence, Terminated for Cause,Future Start, Employees
*/
--select EmployeeStatus, count(EmployeeStatus) As NumberEmployeeStatus
--from employee_data
--group by EmployeeStatus;

/*
Number of ActiveEmployees
*/
--select EmpID, FirstName, LastName, EmployeeStatus
--from employee_data
--where EmployeeStatus = 'Active';
/*
Employee Demographics
*/
--select ED.EmpID,ED.FirstName,ED.LastName,ED.DOB,ED.GenderCode,ED.DepartmentType,ED.EmployeeStatus,ED.EmployeeType,RD.Desired_Salary
--from employee_data as ED
--inner join [recruitment_data ] as RD
--on ED.EmpID = RD.Applicant_ID; 

/*
Recruitment Status Breakdown (How many Candidates are rejected aur hiring)
*/
--select Status, count(Status) 
--from [recruitment_data ]
--group by Status 
--order by Status;

/*
Training Costs by Program
*/
--select Training_Program_Name , count(Training_Program_Name) as TotalCourse, sum(Training_Cost) as TotalCost
--from training_and_development_data
--group by Training_Program_Name
--order by Training_Program_Name;
/*
Employee Engagement Scores
*/
--select FirstName , LastName, EESD.Engagement_Score , RD.Gender,RD.Job_Title
--from employee_engagement_survey_data as EESD
--inner join employee_data as ED 
--on EESD.Employee_ID = ED.EmpID
--inner join [recruitment_data ] as RD 
--on EESD.Employee_ID = RD.Applicant_ID;
/*
Applicants by Education Level
*/
--select Education_Level, Count(Education_Level) , Status 
--from [recruitment_data ]
--group by Education_Level,Status
--order by Education_Level,Status;
/*
Employee Exit Reasons
*/
--select ExitDate, TerminationDescription,TerminationType
--from employee_data;
/*
Average Desired Salary by Job Title
*/
--select Job_Title, count(Job_Title) As CountJob_Title , Avg(Desired_Salary) as AvgDesired_Salary
--from [recruitment_data ]
--group by Job_Title;
/*
Employee Performance Distribution
*/

--select distinct Performance_Score , count(Performance_Score) as Employees_Distribution
--from employee_data
--group by Performance_Score
--order by Performance_Score;
/*
Applicants by Country
*/
--select Country, count(Country) as Applicant_By_Country
--from  [recruitment_data ]
--group by Country;
/*
Training Duration by Type
*/
--select Training_Program_Name, Training_Duration_Days , count(Training_Duration_Days) as TotalTraining_Duration , count(Training_Type)  as CountTraining_Type
--from training_and_development_data
--group by Training_Duration_Days, Training_Program_Name
--order by Training_Duration_Days;
/*
Recruitment by Job Title and Gender
*/
--select  Job_Title ,count(Job_Title) as T_Infomation_G_Job , Gender
--from [recruitment_data ]
--group by Gender, Job_Title;
/*
Employee Count by State
*/
--select State , count(*) as EmployeeCount 
--from employee_data
--group by State
--order by EmployeeCount desc;
/*
Training Costs by Location
*/
--select Location , count(Location) as Employees_Work, sum(Training_Cost) as Total_Cost 
--from training_and_development_data
--group by Location
--order by Total_Cost desc;
/*
Employee Turn-over(Sales) by Gender and Marital Status
*/
--select GenderCode , MaritalDesc, count(*) as CountTurnOver
--from employee_data
--group by GenderCode,MaritalDesc
--order by CountTurnOver;
/*
Employee Demographics and Performance
*/
--select  GenderCode, RaceDesc,  Performance_Score, Avg(Current_Employee_Rating) as AvgRating 
--from employee_data
--group by  GenderCode, RaceDesc , Performance_Score;
/*
Employee Exit Reasons by Department
*/
--select DepartmentType,TerminationType, count(*) as ExitReason
--from employee_data
--group by DepartmentType, TerminationType	
--order by DepartmentType;

/*
Average Desired Salary by Education Level
*/
--select Education_Level , AVG(Desired_Salary) as AvgSalary   
--from [recruitment_data ]
--group by Education_Level
--order by Education_Level;
/*
Employee Current_EmployeeRating (Performance) by Gender and Department
*/
--select GenderCode , DepartmentType , avg(Current_Employee_Rating) as Employees_Performance
--from employee_data
--group by GenderCode , DepartmentType
--order by GenderCode;
/*
Average Employee Rating by Gender and Marital Status
*/
--select GenderCode, MaritalDesc , avg(Current_Employee_Rating) as Average_Employee_Rating 
--from employee_data
--group by GenderCode, MaritalDesc;
/*
Average Training Duration by Training Program Type
*/
--select Training_Program_Name, avg(Training_Duration_Days) as AvgTraining_Duration
--from training_and_development_data
--group by Training_Program_Name
--order by Training_Program_Name;
/*
Recruitment by Education Level and Gender
*/
--select Education_Level, Gender , COUNT(*) as Total_Recuritment_Result
--from [recruitment_data ]
--group by Gender ,Education_Level
--order by Education_Level , Gender;
/*
Employee Count by Department and Job Title
*/
--select DepartmentType , count(*) as Count_Employees
--from employee_data
--group by DepartmentType
--order by DepartmentType;
/*
Employee Count by Department and Job Descripton
*/
--select DepartmentType, JobFunctionDescription, COUNT(*) as Count_JobDescription
--from employee_data
--group by DepartmentType,JobFunctionDescription
--order by DepartmentType , Count_JobDescription desc ;
/*
Total Training Costs by Business-Unit
*/
--select ED.BusinessUnit, Sum(TDD.Training_Cost) as Total_Cost
--from employee_data as ED 
--inner join training_and_development_data as TDD
--on ED.EmpID = TDD.Employee_ID
--group by ED.BusinessUnit
--order by Total_Cost desc;
/*
Employee Engagement-Trends-Over Time
*/
--select Survey_Date , avg(Engagement_Score) as AvgTrend_Over 
--from employee_engagement_survey_data
--group by Survey_Date
--order by Survey_Date;
/*
Recruitment by City and State
*/
--select City , State , count(*) as Count_CityandState
--from [recruitment_data ]
--group by City , State 
--order by Count_CityandState desc;
/*
Training Type Distribution
*/
--select  Training_Type , count(*) as Total_Distribution
--from training_and_development_data
--group by Training_Type 
--Order by Total_Distribution desc;
/*
Top-performing Supervisor by Employee Rating
*/
--select Supervisor  , avg(Current_Employee_Rating) as Avg_ER 
--from employee_data
--group by Supervisor, Current_Employee_Rating
--having Avg(Current_Employee_Rating) >= 4.0
--order by Avg_ER desc;
/*
Employee Engagement by Location
*/
--select ED.LocationCode, Avg(EESD.Engagement_Score) as Avg_Enagement 
--from employee_data as ED
--join employee_engagement_survey_data as EESD 
--on ED.EmpID = EESD.Employee_ID
--group by ED.LocationCode
--order by Avg_Enagement desc;
/*
Training Cost per Employee by Business Unit 
*/
--select ED.BusinessUnit , sum(TDD.Training_Cost) / count(ED.EmpID) as Cost_Per_Employee
--from  employee_data as ED
--join  training_and_development_data as TDD
--on ED.EmpID = TDD.Employee_ID
--group by ED.BusinessUnit
--order by Cost_Per_Employee desc;
/*
Average Desired Salary by Gender and Education Level
*/
--select  Education_Level, Gender , Avg(Desired_Salary) as Avg_DesiredSalary
--from [recruitment_data ]
--group by Education_Level, Gender
--order by Education_Level , Gender;
/*
Employees and Their Training Programs
*/
--select ED.FirstName +  ED.LastName as Employees_Names , ED.GenderCode, TDD.Training_Program_Name
--from employee_data as ED
--join training_and_development_data as TDD
--on ED.EmpID = TDD.Employee_ID;
/*
Recruitment Status and Desired Salary by Job
*/
--with cte_Recruitment  as (
--select Job_Title , [Status] , Desired_Salary
--from [recruitment_data ]
--where [Status] = 'Offered' and Desired_Salary >=60000
--) 
--select Job_Title , [Status] , Desired_Salary 
--from cte_Recruitment;

/*
Employees with High Engagement Scores
*/
--with cte_Enagement_Score as
--(
--select ED.FirstName + ED.LastName as FullName , ED.EmployeeStatus , ED.EmployeeType , EESD.Engagement_Score 
--from employee_data as ED 
--join employee_engagement_survey_data as EESD
--on ED.EmpID =  EESD.Employee_ID
--where ED.EmployeeStatus = 'Active' and EESD.Engagement_Score >= 4.5
--),
--cte_Enagement_Score2 as
--(
--select ED.FirstName + ED.LastName as FullName , ED.EmployeeStatus , ED.EmployeeType , EESD.Engagement_Score 
--from employee_data as ED 
--join employee_engagement_survey_data as EESD
--on ED.EmpID =  EESD.Employee_ID
--where ED.EmployeeStatus = 'Future Start' and EESD.Engagement_Score = 5 and ED.EmployeeType = 'Contract'
--)
--select CES.FullName, CES.EmployeeStatus, CES.EmployeeType, CES.Engagement_Score from cte_Enagement_Score as CES
--union all
--select CES2.FullName, CES2.EmployeeStatus, CES2.EmployeeType, CES2.Engagement_Score from cte_Enagement_Score2 as CES2
--order by CES.Engagement_Score desc
/*
Employees and Their Training Costs
*/
--select ED.FirstName + ED.LastName as Full_Name , TDD.Training_Cost
--from employee_data as ED
--join training_and_development_data as TDD
--on ED.EmpID = TDD.Employee_ID
--where TDD.Training_Cost > 500
/*
Recruitment by State and Highest Education Level 
*/
--select RD.State , RD.Education_Level, count(*) as Count_Result 
--from [recruitment_data ] as RD
--group by RD.State, RD.Education_Level
--having RD.Education_Level = 'PhD'
--order by Count_Result desc
/*
Training Costs by Training Type and Specific-Location
*/
--select Training_Type ,  Location, sum(Training_Cost)  as Total_Cost
--from training_and_development_data
--group by Training_Type, Location
--having Location = 'Lake Tony'
--order by Total_Cost desc
/*
Training Programs by Employee and Location
*/
--select ED.FirstName + ED.LastName as Full_Name , ED.LocationCode
--from employee_data as ED
--where EmpID = (select Employee_ID from training_and_development_data as TDD where Location = 'Port Greg')
select ED.FirstName + ED.LastName as Full_Name , TDD.Location
from employee_data as ED
join training_and_development_data as TDD
on ED.EmpID = TDD.Employee_ID
order by Full_Name;
select * from [recruitment_data ];