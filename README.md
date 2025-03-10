# SQL
Learning of MYSQL (Basic to Advance with Project)

My learning of Mysql and brush-up the skills from basic to advance

#Day 1 of Learning Conclusion -- 
-- Creation of DATABASE, TABLE, MAPPING ALL KEYS PROPERLY. 

#Day 2 of Learning Conclusion --
Explanation: 
This query joins the Student, StudentGrade, and Course tables to retrieve information about students who are enrolled in a specific course in this case “Advance DBMS” and have grade less than or equals to grade - 3.0. I have used here inner join which means it will return only the rows where there is a match in both tables being joined and Using Order By for Grades will give us the Desc to ASC order. Hence, it selects the student's ID, first name, last name, the course ID, course description, and their grade in the course.
For whom: 
This query is important for instructors and administrators who want to monitor the performance of students in a specific course and identify who has equals to or below 3.0 GPA. It helps them track the progress of students taking for a particular course, allowing them to provide necessary support or adjustments if needed.

Query 2:
Explanation:
This query uses a left join to combine the Course table with the StudentGrade table to determine which courses have no students enrolled or students less than 5. It returns all records from the left table (in our case, Course), and the matched records from the right table (StudentGrade). The result is NULL from the right side if there is no match. For this case we need to use COALESCE Which makes null to 0 and will filters for courses with no enrolled students (EnrolledStudents count is NULL or 0) or we check if it’s is less than 5. Hence, it will give the result of the CourseID , Course Description and Enrolled Student total Count. 
For whom: This query is important for course administrators and schedulers who need to identify courses that have low or no enrollment. It allows them to make informed decisions about course offerings and resource allocation. 
These SQL queries provide valuable insights into student performance, course enrollment, and faculty involvement, making them essential tools for different stakeholders within an educational institution.


#Day 3 
Scripting -- 
1 -- I am using one variable to store the count of all of the invoices in the Invoices table that have a balance due and another variable to store the sum of the balances due for all of those invoices.  If that total balance due is greater than or equal to $30,000, the script should display a result set that displays the values of both variables. 

2 -- I am declarring and sets a variable that's equal to the total outstanding balance due. If the balance due is greater than $10,000.00, the script should return a result set consisting of VendorName, Invoice Number, InvoiceDueDate, and Balance for each invoice with a balance due, sorted with the oldest due date first. If the total outstanding balance due is less than $10,000.00, the script will return the message "Balance due is less than $10,000.00

3 -- Using the the following script uses a derived table to return the date and invoice total of the earliest invoice issued by each vendor. Write a script that generates the same result set but uses a temporary table in place of the derived table. Script drops the temporary table if it already exists.


#Day 4 - 
Created several user defined fuction's 
1. Function named fnUnpaid InvoiceID that returns the InvoiceID of the earliest invoice with an unpaid balance.
2. function named fnDateRange, similar to the stored procedure of exercise 3 which is created here the function should require two parameters of the date type. without validating   parameters. Returning a result set that includes the InvoiceNumber, InvoiceDate, InvoiceTotal, and Balance for each invoice for which the InvoiceDate is within the date range. Invoke the function from within a SELECT statement to return those invoices with InvoiceDate between October 10 and October 20, 2022.


--- Sec Command -- 

tshark -nn -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x08 || wlan.fc.type_subtype == 0x05) && (wlan_mgt.fixed.capabilities.ess == 1) && (wlan_mgt.fixed.capabilities.ibss == 0))' 

tshark -nn -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x08 || wlan.fc.type_subtype == 0x05) && (wlan_mgt.fixed.capabilities.ess == 1) && (wlan_mgt.fixed.capabilities.ibss == 0))' -T fields -e wlan.bssid | uniq -c

((wlan.fc.type_subtype == 0x08 || wlan.fc.type_subtype == 0x05) && (wlan_mgt.fixed.capabilities.ess == 1) && (wlan_mgt.fixed.capabilities.ibss == 0))


wlan.fc.type_subtype == 0x20


tcpdump -nne -r wlan.pcap 'wlan[0] == 0x08' | wc -l

tcpdump -nne -r wlan.pcap 'wlan[0] == 0x08 and wlan[1] & 0x40 == 0x40' | wc -l

wlan.fc.type_subtype == 0x01 && wlan_mgt.fixed.status_code == 0x0000

tcpdump -nne -r wlan.pcap 'wlan[0] == 0x10 and wlan[26:2] == 0x0000' | awk '{print $3}' | sort | uniq -c | sort -nr

wlan.fc.type_subtype == 0x01 && wlan_mgt.fixed.status_code == 0x0000


tcpdump -nne -r wlan.pcap 'wlan[0] == 0x10 and wlan[26:2] == 0x0000' | awk '{print $3}' | sort | uniq -c | sort -nr
//

wlan.fc.type_subtype == 0x08
wlan.fc.type_subtype == 0x20


tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1)) && (wlan.bssid == 00:23:69:00:d0)' | wc -l


tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == xx:xx:xx:xx:xx:xx))' | wc -l

tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == xx:xx:xx:xx:xx:xx))' -T fields -e wlan.sa | sort | uniq -c | sort -nr

tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == xx:xx:xx:xx:xx:xx))' -T fields -e wlan.da | sort | uniq -c | sort -nr

//

tcpdump   -nne   -r   wlan . pcap   ‘wlan [0]   =   0x08   and   wlan [1]   &   0x40   =   0x40’ | wc   -l


tcpdump -nne -r wlan.pcap 'wlan[0] == 0x08 and wlan[1] & 0x40 == 0x40' | wc -l

///

wlan.fc.type_subtype == 0x01 && wlan_mgt.fixed.status_code == 0x0000


tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1)) && (wlan.bssid == 00:23:69:00:d0)' | wc -l

tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == 00:23:69:61:00:d0))' -T fields -e wlan.da | sort | uniq -c | sort -nr

//
tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == 00:23:69:61:00:d0))' -T fields -e wlan.sa -e wlan.da | sort | uniq -c | sort -nr
//
For 12
capinfos wlan.pcap


//

$ tcpdump -nnr wlan.pcap | head -1
$ tcpdump -nnr wlan.pcap | tail -1

//

tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == 00:23:69:61:00:d0) && (wlan.sa == 1c:4b:d6:69:cd:07))' -T fields -e wlan.da | sort | uniq -c | sort -nr

15 
tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == 00:23:69:61:00:d0) && (wlan.sa == 1c:4b:d6:69:cd:07))' -T fields -e frame.time | awk '{print $4}' | head -1
tshark -r wlan.pcap -Y '((wlan.fc.type_subtype == 0x20) && (wlan.fc.protected == 1) && (wlan.bssid == 00:23:69:61:00:d0) && (wlan.sa == 1c:4b:d6:69:cd:07))' -T fields -e frame.time | awk '{print $4}' | tail -1

//

tshark -r wlan.pcap -Y '(wlan.fc.type == 2) && (wlan.bssid == 00:23:69:61:00:ce) && (wlan.sa == 00:23:69:61:00:ce)' -T fields -e wlan.da | sort | uniq -c | sort -nr


//

tshark -r wlan.pcap -Y '(wlan.fc.type == 2) && (wlan.bssid == 00:23:69:61:00:d0) && (wlan.sa == de:ad:be:ef:13:37)' -T fields -e wlan.da | sort | uniq -c | sort -nr

//

tshark -r wlan.pcap -Y '(wlan.fc.type == 2) && (wlan.bssid == 00:23:69:61:00:ce) && (wlan.sa == 00:23:69:61:00:ce)' -T fields -e wlan.da | sort | uniq -c | sort -nr

//

tshark -r wlan.pcap -Y '(wlan.fc.type == 2) && (wlan.bssid == 00:23:69:61:00:d0) && (wlan.sa == 00:23:69:61:00:ce)' -T fields -e wlan.da | sort | uniq -c | sort -nr

//

tshark -r wlan.pcap -Y '(wlan.bssid == 00:23:69:61:00:d0) && (wlan.sa == 1c:4b:d6:69:cd:07) && (wlan.fc.type_subtype == 0x00)' -T fields -e frame.time | tail -1

//

tshark  -r  wlan . pcap  -Y  '( wlan. bssid  ==  00:23:69:61:00: d0 )  &&  ( wlan .sa == 1c:4 b: d6 :69: cd :07) && ( wlan .fc. type_subtype == 0x00) ' -T fields -e frame. time| tail   -1

-- Part 2 - 
https://cloudgeniusguide.com/the-interoptic-case-study/












