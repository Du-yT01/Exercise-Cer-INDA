-- SELECT * FROM ONE TABLE ---
SELECT * FROM EMPLOYEES

SELECT * FROM CUSTOMERS

SELECT * FROM ORDERS

SELECT * FROM PRODUCTS

-- SELECT SPECIFIC COLUMNS in ONE TABLE--

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE
FROM EMPLOYEES

SELECT CUSTOMER_ID, NAME, ADDRESS
FROM CUSTOMERS

SELECT ORDER_ID, CUSTOMER_ID, ORDER_DATE, SALESMAN_ID
FROM ORDERS

SELECT PRODUCT_ID, PRODUCT_NAME, DESCRIPTION
FROM PRODUCTS

-- SELECT COLUMN ALIAS, TABLE ALIAS

SELECT  EMPLOYEE_ID AS MA_NHAN_VIEN, 
        FIRST_NAME AS TEN_GOI, 
        LAST_NAME AS TEN_HO, 
        EMAIL AS THU_DIEN_TU, 
        HIRE_DATE AS NGAY_NHAN_VIEC
FROM EMPLOYEES

SELECT  CUSTOMER_ID AS MA_KHACH_HANG,
        NAME AS TEN_KHACH_HANG, 
        ADDRESS AS DIA_CHI_KHACH_HANG 
FROM CUSTOMERS

SELECT  ORDER_ID AS MA_DON_HANG, 
        CUSTOMER_ID AS MA_KHACH_HANG, 
        ORDER_DATE AS NGAY_DAT_HANG, 
        SALESMAN_ID AS NGUOI_BAN 
FROM ORDERS

SELECT  PRODUCT_ID AS MA_SAN_PHAM,
        PRODUCT_NAME AS TEN_SAN_PHAM,
        DESCRIPTION AS MO_TA 
FROM PRODUCTS

-- SELECT DISTINCT

SELECT DISTINCT JOB_TITLE
FROM EMPLOYEES

SELECT DISTINCT FIRST_NAME 
FROM EMPLOYEES

-- WHERE Clause AND OR BETWEEN EQUAL, GREATER, LESS

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '28'

SELECT *
FROM EMPLOYEES
WHERE EMAIL = 'abigail.palmer@example.com'
    AND PHONE = '650.505.4876'

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'Elliot'
    AND FIRST_NAME = 'Cooper'

SELECT * 
FROM CUSTOMERS
WHERE CREDIT_LIMIT > 1000

SELECT * 
FROM CUSTOMERS
WHERE CREDIT_LIMIT >= 2000

SELECT * 
FROM CUSTOMERS
WHERE CREDIT_LIMIT < 3200

SELECT * 
FROM CUSTOMERS
WHERE CREDIT_LIMIT <= 24000


SELECT * 
FROM ORDERS
WHERE ORDER_DATE > TO_DATE('01-JAN-17','DD-MM-RR')

--C�CH 1
SELECT * 
FROM ORDERS 
WHERE ORDER_DATE BETWEEN TO_DATE('01-JAN-2017', 'DD-MON-RR') 
    AND TO_DATE('01-JAN-2019', 'DD-MON-RR');

-- C�CH 2
SELECT * 
FROM ORDERS 
WHERE ORDER_DATE >= TO_DATE('01-JAN-2017', 'DD-MON-RR') 
    AND ORDER_DATE < TO_DATE('02-JAN-2019', 'DD-MON-RR');


-- WILDCARD
SELECT * 
FROM CUSTOMERS
WHERE NAME LIKE 'American%'

SELECT * 
FROM CUSTOMERS
WHERE NAME LIKE '%Corp.'

SELECT * 
FROM CUSTOMERS
WHERE NAME LIKE '%american%' 
    or NAME LIKE '%American%' 
    or NAME LIKE '%Bank%' 
    or NAME LIKE '%bank%';

SELECT * 
FROM CUSTOMERS
WHERE NAME LIKE 'I__' 

SELECT * 
FROM CUSTOMERS
WHERE NAME LIKE '_P' 

SELECT * 
FROM CUSTOMERS
WHERE NAME LIKE '__n%' 


-- IN
SELECT * 
FROM PRODUCTS 
WHERE PRODUCT_NAME IN (
    'G.Skill Ripjaws V Series', 
    'ASRock X99 Extreme11', 
    'Intel Xeon E5-2697 V2'
);

SELECT * 
FROM PRODUCTS 
WHERE PRODUCT_NAME NOT IN (
    'Corsair Vengeance LPX', 
    'Corsair Dominator Platinum', 
    'G.Skill Ripjaws V Series', 
    'Kingston', 
    'Supermicro X10SDV-8C-TLN4F', 
    'Intel DP35DPM', 
    'Asus X99-E-10G WS', 
    'Asus ROG MAXIMUS IX EXTREME'
);


--B�I T?P V? NH�

--C�u 1
SELECT *
FROM PRODUCTS

--C�u 2
SELECT *
FROM PRODUCTS
WHERE PRODUCT_ID = '225'

--C�u 3
SELECT *
FROM PRODUCTS
WHERE STANDARD_COST > '300'

--C�u 4
SELECT *
FROM PRODUCTS
WHERE STANDARD_COST NOT LIKE '500'

--C�u 5
SELECT *
FROM PRODUCTS
WHERE LIST_PRICE BETWEEN '300' AND '700'

--C�u 6
SELECT *
FROM PRODUCTS
WHERE STANDARD_COST > '500'
    AND PRODUCT_NAME = 'G.Skill Trident Z'

--C�u 7
SELECT *
FROM PRODUCTS
WHERE STANDARD_COST >= '600'
    AND LIST_PRICE > '700'
    AND PRODUCT_NAME = 'Corsair Dominator Platinum'

--C�u 8
SELECT *
FROM PRODUCTS
WHERE PRODUCT_ID < '500'

--C�u 9
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE '%Kingston%'

--C�u 10
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'G.Skill%'
    AND LIST_PRICE > '650'

--C�u 11
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE '%Series'
    AND DESCRIPTION LIKE '%128GB%'

--C�u 12
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'C______'
    AND LIST_PRICE NOT LIKE '700'

--C�u 13
SELECT *
FROM PRODUCTS
WHERE  LIST_PRICE IN ('2200','1850','1756','1249')


-- S? d?ng b?ng ORDER
--C�u 15
SELECT * 
FROM ORDERS
WHERE ORDER_DATE BETWEEN TO_DATE('01-JAN-2017', 'DD-MON-RR') 
    AND TO_DATE('31-DEC-2017', 'DD-MON-RR');

--C�u 16
SELECT * 
FROM ORDERS 
WHERE ORDER_DATE BETWEEN TO_DATE('01-JAN-2016', 'DD-MON-RR') 
    AND TO_DATE('31-DEC-2017', 'DD-MON-RR');


--C�u 17
SELECT *
FROM ORDERS
WHERE order_date > TO_DATE('2017-02-17', 'YYYY-MM-DD')

--c�U 18
SELECT * 
FROM ORDERS 
WHERE ORDER_DATE = TO_DATE('2017-02-17', 'YYYY-MM-DD') 
  AND STATUS = 'Shipped';

--C�u 19
SELECT 
    ORDERS.ORDER_ID, 
    ORDERS.ORDER_DATE, 
    ORDERS.CUSTOMER_ID, 
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS TOTAL
FROM 
    ORDERS
INNER JOIN 
    ORDER_ITEMS 
ON 
    ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
WHERE 
    ORDER_DATE = TO_DATE('2017-02-17', 'YYYY-MM-DD')
GROUP BY 
    ORDERS.ORDER_ID, 
    ORDERS.ORDER_DATE, 
    ORDERS.CUSTOMER_ID
ORDER BY 
    TOTAL ASC;

--C�u 20

SELECT 
    ORDERS.ORDER_ID, 
    ORDERS.ORDER_DATE, 
    ORDERS.CUSTOMER_ID, 
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS TOTAL
FROM 
    ORDERS
INNER JOIN 
    ORDER_ITEMS 
ON 
    ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
WHERE 
    ORDER_DATE != TO_DATE('2017-08-15', 'YYYY-MM-DD')
GROUP BY 
    ORDERS.ORDER_ID, 
    ORDERS.ORDER_DATE, 
    ORDERS.CUSTOMER_ID
ORDER BY 
    TOTAL DESC;

--C�u 20

SELECT 
    ORDERS.ORDER_ID, 
    ORDERS.ORDER_DATE, 
    ORDERS.CUSTOMER_ID, 
    ORDERS.STATUS,
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS TOTAL
FROM 
    ORDERS
INNER JOIN 
    ORDER_ITEMS 
ON 
    ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
WHERE 
    ORDERS.STATUS IN ('Pending', 'Shipped')
GROUP BY 
    ORDERS.ORDER_ID, 
    ORDERS.ORDER_DATE, 
    ORDERS.CUSTOMER_ID, 
    ORDERS.STATUS
HAVING 
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) > 400000
ORDER BY 
    ORDERS.ORDER_DATE ASC;



































