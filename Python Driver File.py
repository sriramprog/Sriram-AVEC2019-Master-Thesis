# Module Imports
import mariadb
import sys

# Connect to MariaDB Platform
try:
    conn = mariadb.connect(
        user="root", # replace w/ correct username
        password="root", #replace w/ correct password
        host="127.0.0.1", #this is a loopback address or local address
        port=3306, # port by default mariadb is port 3306
        database="project2" #database name.

    )
#check for error!
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

# Get Cursor
cur = conn.cursor()

#simple queries 1
#This query will get Jeffery of whose order is 2021-12-05 or anyone
print("1.List the customer who ordered at the restaurant on Dec 5, 2021. (simple query)")
cur.execute (
    "SELECT CName FROM Customer,Orders WHERE Cid=customerId AND orderDate='2021-12-05'"
)
for i in cur:
    print(f"{i}\n")

#Simple queries 2
print("2.List the waiterID of Suzin. (simple query)")
cur.execute (
    "SELECT WaiterID FROM Waiter WHERE WaiterName='Suzin'"
)
for i in cur:
    print(f"{i}\n")

#aggregate Queries 1
print("3.How many productID’s, where they are assigned of integer type 2, are used in the menu? (aggregate query)")
cur.execute(
    "SELECT COUNT(productMenuID) FROM Menu, Product WHERE productMenuId=prodId AND productMenuId=2"
)
for i in cur:
    print(f"{i}\n")

#aggregat queries 2
print("4.List the count of orders were placed on Jan 5, 2022. (aggregate query)")
cur.execute(
    "SELECT COUNT(orderDate) FROM Orders WHERE orderDate='2022-01-05'"
)
for i in cur:
    print(f"{i}")
conn.close()