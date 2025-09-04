create database newscript;
use newscript;

# Req 1
DROP TABLE IF EXISTS Feed1;

CREATE TABLE Feed1 (
    col_1 INT,
    col_2 VARCHAR(255), col_3 VARCHAR(255), col_4 VARCHAR(255), col_5 VARCHAR(255),
    col_6 VARCHAR(255), col_7 VARCHAR(255), col_8 VARCHAR(255), col_9 VARCHAR(255), col_10 VARCHAR(255)
);

INSERT INTO Feed1
SELECT n,
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8)
FROM (
    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
    SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
) t;


INSERT INTO Feed1 SELECT * FROM Feed1 LIMIT 1;



DROP TABLE IF EXISTS Feed2;

CREATE TABLE Feed2 (
    col_1 INT,
    col_2 VARCHAR(255), col_3 VARCHAR(255), col_4 VARCHAR(255), col_5 VARCHAR(255),
    col_6 VARCHAR(255), col_7 VARCHAR(255), col_8 VARCHAR(255), col_9 VARCHAR(255), col_10 VARCHAR(255),
    col_11 VARCHAR(255), col_12 VARCHAR(255), col_13 VARCHAR(255), col_14 VARCHAR(255), col_15 VARCHAR(255)
);

INSERT INTO Feed2
SELECT n,
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8)
FROM (
    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
    SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL
    SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
) t;

INSERT INTO Feed2 SELECT * FROM Feed2 LIMIT 2;



DROP TABLE IF EXISTS Feed3;

CREATE TABLE Feed3 (
    col_1 INT,
    col_2 VARCHAR(255), col_3 VARCHAR(255), col_4 VARCHAR(255), col_5 VARCHAR(255),
    col_6 VARCHAR(255), col_7 VARCHAR(255), col_8 VARCHAR(255), col_9 VARCHAR(255), col_10 VARCHAR(255),
    col_11 VARCHAR(255), col_12 VARCHAR(255), col_13 VARCHAR(255), col_14 VARCHAR(255), col_15 VARCHAR(255),
    col_16 VARCHAR(255), col_17 VARCHAR(255), col_18 VARCHAR(255), col_19 VARCHAR(255), col_20 VARCHAR(255)
);

INSERT INTO Feed3
SELECT n,
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8),
       SUBSTRING(MD5(RAND()),1,8), SUBSTRING(MD5(RAND()),1,8)
FROM (
    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
    SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL
    SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL
    SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
) t;


INSERT INTO Feed3 SELECT * FROM Feed3 LIMIT 3;



SELECT 'Feed1' AS table_name, COUNT(*) AS row_count FROM Feed1
UNION ALL
SELECT 'Feed2', COUNT(*) FROM Feed2
UNION ALL
SELECT 'Feed3', COUNT(*) FROM Feed3;



# Req2
DELIMITER $$

CREATE PROCEDURE generate_feed(
    IN table_name VARCHAR(255),
    IN num_cols INT,
    IN num_rows INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE create_table_sql TEXT;
    DECLARE col_list TEXT;
    DECLARE val_list TEXT;

    
    SET @drop_sql = CONCAT('DROP TABLE IF EXISTS ', table_name);
    PREPARE stmt FROM @drop_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- 2. Build CREATE TABLE dynamicallySET create_table_sql = CONCAT('CREATE TABLE ', table_name, ' (');
    WHILE i <= num_cols DO
        SET create_table_sql = CONCAT(create_table_sql, 'col_', i, ' VARCHAR(255)');
        IF i < num_cols THEN
            SET create_table_sql = CONCAT(create_table_sql, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;
    SET create_table_sql = CONCAT(create_table_sql, ')');

    SET @create_sql = create_table_sql;
    PREPARE stmt FROM @create_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

   
    SET i = 1;
    SET col_list = '';
    WHILE i <= num_cols DO
        SET col_list = CONCAT(col_list, 'col_', i);
        IF i < num_cols THEN
            SET col_list = CONCAT(col_list, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;

    
    SET j = 1;
    WHILE j <= num_rows DO
        SET i = 1;
        SET val_list = '';
        WHILE i <= num_cols DO
            SET val_list = CONCAT(val_list, '''', SUBSTRING(MD5(RAND()), 1, 8), '''');
            IF i < num_cols THEN
                SET val_list = CONCAT(val_list, ', ');
            END IF;
            SET i = i + 1;
        END WHILE;

        SET @insert_sql = CONCAT('INSERT INTO ', table_name, ' (', col_list, ') VALUES (', val_list, ')');
        PREPARE stmt FROM @insert_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET j = j + 1;
    END WHILE;

  
    IF num_rows > 0 THEN
        SET @insert_sql = CONCAT('INSERT INTO ', table_name, ' (', col_list, ') SELECT ', col_list, ' FROM ', table_name, ' LIMIT 1');
        PREPARE stmt FROM @insert_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;

  
    SELECT CONCAT('Table ', table_name, ' created with ', num_rows, ' rows (plus 1 duplicate) and ', num_cols, ' columns.') AS Status;

END$$

DELIMITER ;

# Req3 

-- Duplicates in Feed1
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       COUNT(*) AS dup_count
FROM Feed1
GROUP BY col_1, col_2, col_3, col_4, col_5,
         col_6, col_7, col_8, col_9, col_10
HAVING COUNT(*) > 1;


-- Duplicates in Feed2
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       col_11, col_12, col_13, col_14, col_15,
       COUNT(*) AS dup_count
FROM Feed2
GROUP BY col_1, col_2, col_3, col_4, col_5,
         col_6, col_7, col_8, col_9, col_10,
         col_11, col_12, col_13, col_14, col_15
HAVING COUNT(*) > 1;


-- Duplicates in Feed3
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       col_11, col_12, col_13, col_14, col_15,
       col_16, col_17, col_18, col_19, col_20,
       COUNT(*) AS dup_count
FROM Feed3
GROUP BY col_1, col_2, col_3, col_4, col_5,
         col_6, col_7, col_8, col_9, col_10,
         col_11, col_12, col_13, col_14, col_15,
         col_16, col_17, col_18, col_19, col_20
HAVING COUNT(*) > 1;


#Req 4

-- Duplicates in Feed1
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10
FROM Feed1
GROUP BY col_1, col_2, col_3, col_4, col_5,
         col_6, col_7, col_8, col_9, col_10
HAVING COUNT(*) > 1
INTO OUTFILE '/tmp/Feed1_duplicates.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- Duplicates in Feed2
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       col_11, col_12, col_13, col_14, col_15
FROM Feed2
GROUP BY col_1, col_2, col_3, col_4, col_5,
         col_6, col_7, col_8, col_9, col_10,
         col_11, col_12, col_13, col_14, col_15
HAVING COUNT(*) > 1
INTO OUTFILE '/tmp/Feed2_duplicates.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- Duplicates in Feed3
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       col_11, col_12, col_13, col_14, col_15,
       col_16, col_17, col_18, col_19, col_20
FROM Feed3
GROUP BY col_1, col_2, col_3, col_4, col_5,
         col_6, col_7, col_8, col_9, col_10,
         col_11, col_12, col_13, col_14, col_15,
         col_16, col_17, col_18, col_19, col_20
HAVING COUNT(*) > 1
INTO OUTFILE '/tmp/Feed3_duplicates.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

# Req 5

DROP TABLE IF EXISTS Feed1_with_pk;
CREATE TEMPORARY TABLE Feed1_with_pk (
    pk INT AUTO_INCREMENT PRIMARY KEY,
    col_1 INT, col_2 VARCHAR(255), col_3 VARCHAR(255), col_4 VARCHAR(255), col_5 VARCHAR(255),
    col_6 VARCHAR(255), col_7 VARCHAR(255), col_8 VARCHAR(255), col_9 VARCHAR(255), col_10 VARCHAR(255)
);

INSERT INTO Feed1_with_pk (col_1, col_2, col_3, col_4, col_5,
                           col_6, col_7, col_8, col_9, col_10)
SELECT * FROM Feed1;


DROP TABLE IF EXISTS Feed1_dupes;
CREATE TEMPORARY TABLE Feed1_dupes AS
SELECT pk
FROM (SELECT pk, ROW_NUMBER() OVER (
                PARTITION BY col_1, col_2, col_3, col_4, col_5,
                             col_6, col_7, col_8, col_9, col_10
                ORDER BY pk) AS rn
    FROM Feed1_with_pk
) ranked
WHERE rn > 1;


UPDATE Feed1_with_pk
SET col_1 = pk,
    col_2 = SUBSTRING(MD5(RAND()), 1, 8),
    col_3 = SUBSTRING(MD5(RAND()), 1, 8),
    col_4 = SUBSTRING(MD5(RAND()), 1, 8),
    col_5 = SUBSTRING(MD5(RAND()), 1, 8),
    col_6 = SUBSTRING(MD5(RAND()), 1, 8),
    col_7 = SUBSTRING(MD5(RAND()), 1, 8),
    col_8 = SUBSTRING(MD5(RAND()), 1, 8),
    col_9 = SUBSTRING(MD5(RAND()), 1, 8),
    col_10 = SUBSTRING(MD5(RAND()), 1, 8)
WHERE pk IN (SELECT pk FROM Feed1_dupes);


TRUNCATE TABLE Feed1;
INSERT INTO Feed1 (col_1, col_2, col_3, col_4, col_5,
                   col_6, col_7, col_8, col_9, col_10)
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10
FROM Feed1_with_pk;

DROP TABLE IF EXISTS Feed2_with_pk;
CREATE TEMPORARY TABLE Feed2_with_pk (
    pk INT AUTO_INCREMENT PRIMARY KEY,
    col_1 INT, col_2 VARCHAR(255), col_3 VARCHAR(255), col_4 VARCHAR(255), col_5 VARCHAR(255),
    col_6 VARCHAR(255), col_7 VARCHAR(255), col_8 VARCHAR(255), col_9 VARCHAR(255), col_10 VARCHAR(255),
    col_11 VARCHAR(255), col_12 VARCHAR(255), col_13 VARCHAR(255), col_14 VARCHAR(255), col_15 VARCHAR(255)
);

INSERT INTO Feed2_with_pk
(col_1, col_2, col_3, col_4, col_5,
 col_6, col_7, col_8, col_9, col_10,
 col_11, col_12, col_13, col_14, col_15)
SELECT * FROM Feed2;

DROP TABLE IF EXISTS Feed2_dupes;
CREATE TEMPORARY TABLE Feed2_dupes AS
SELECT pk
FROM (
    SELECT pk,
           ROW_NUMBER() OVER (
                PARTITION BY col_1, col_2, col_3, col_4, col_5,
                             col_6, col_7, col_8, col_9, col_10,
                             col_11, col_12, col_13, col_14, col_15
                ORDER BY pk
           ) AS rn
    FROM Feed2_with_pk
) ranked
WHERE rn > 1;

UPDATE Feed2_with_pk
SET col_1 = pk,
    col_2 = SUBSTRING(MD5(RAND()), 1, 8),
    col_3 = SUBSTRING(MD5(RAND()), 1, 8),
    col_4 = SUBSTRING(MD5(RAND()), 1, 8),
    col_5 = SUBSTRING(MD5(RAND()), 1, 8),
    col_6 = SUBSTRING(MD5(RAND()), 1, 8),
    col_7 = SUBSTRING(MD5(RAND()), 1, 8),
    col_8 = SUBSTRING(MD5(RAND()), 1, 8),
    col_9 = SUBSTRING(MD5(RAND()), 1, 8),
    col_10 = SUBSTRING(MD5(RAND()), 1, 8),
    col_11 = SUBSTRING(MD5(RAND()), 1, 8),
    col_12 = SUBSTRING(MD5(RAND()), 1, 8),
    col_13 = SUBSTRING(MD5(RAND()), 1, 8),
    col_14 = SUBSTRING(MD5(RAND()), 1, 8),
    col_15 = SUBSTRING(MD5(RAND()), 1, 8)
WHERE pk IN (SELECT pk FROM Feed2_dupes);

TRUNCATE TABLE Feed2;
INSERT INTO Feed2
(col_1, col_2, col_3, col_4, col_5,
 col_6, col_7, col_8, col_9, col_10,
 col_11, col_12, col_13, col_14, col_15)
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       col_11, col_12, col_13, col_14, col_15
FROM Feed2_with_pk;


DROP TABLE IF EXISTS Feed3_with_pk;
CREATE TEMPORARY TABLE Feed3_with_pk (
    pk INT AUTO_INCREMENT PRIMARY KEY,
    col_1 INT, col_2 VARCHAR(255), col_3 VARCHAR(255), col_4 VARCHAR(255), col_5 VARCHAR(255),
    col_6 VARCHAR(255), col_7 VARCHAR(255), col_8 VARCHAR(255), col_9 VARCHAR(255), col_10 VARCHAR(255),
    col_11 VARCHAR(255), col_12 VARCHAR(255), col_13 VARCHAR(255), col_14 VARCHAR(255), col_15 VARCHAR(255),
    col_16 VARCHAR(255), col_17 VARCHAR(255), col_18 VARCHAR(255), col_19 VARCHAR(255), col_20 VARCHAR(255)
);

INSERT INTO Feed3_with_pk
(col_1, col_2, col_3, col_4, col_5,
 col_6, col_7, col_8, col_9, col_10,
 col_11, col_12, col_13, col_14, col_15,
 col_16, col_17, col_18, col_19, col_20)
SELECT * FROM Feed3;

DROP TABLE IF EXISTS Feed3_dupes;
CREATE TEMPORARY TABLE Feed3_dupes AS
SELECT pk
FROM (
    SELECT pk,
           ROW_NUMBER() OVER (
                PARTITION BY col_1, col_2, col_3, col_4, col_5,
                             col_6, col_7, col_8, col_9, col_10,
                             col_11, col_12, col_13, col_14, col_15,
                             col_16, col_17, col_18, col_19, col_20
                ORDER BY pk
           ) AS rn
    FROM Feed3_with_pk
) ranked
WHERE rn > 1;

UPDATE Feed3_with_pk
SET col_1 = pk,
    col_2 = SUBSTRING(MD5(RAND()), 1, 8),
    col_3 = SUBSTRING(MD5(RAND()), 1, 8),
    col_4 = SUBSTRING(MD5(RAND()), 1, 8),
    col_5 = SUBSTRING(MD5(RAND()), 1, 8),
    col_6 = SUBSTRING(MD5(RAND()), 1, 8),
    col_7 = SUBSTRING(MD5(RAND()), 1, 8),
    col_8 = SUBSTRING(MD5(RAND()), 1, 8),
    col_9 = SUBSTRING(MD5(RAND()), 1, 8),
    col_10 = SUBSTRING(MD5(RAND()), 1, 8),
    col_11 = SUBSTRING(MD5(RAND()), 1, 8),
    col_12 = SUBSTRING(MD5(RAND()), 1, 8),
    col_13 = SUBSTRING(MD5(RAND()), 1, 8),
    col_14 = SUBSTRING(MD5(RAND()), 1, 8),
    col_15 = SUBSTRING(MD5(RAND()), 1, 8),
    col_16 = SUBSTRING(MD5(RAND()), 1, 8),
    col_17 = SUBSTRING(MD5(RAND()), 1, 8),
    col_18 = SUBSTRING(MD5(RAND()), 1, 8),
    col_19 = SUBSTRING(MD5(RAND()), 1, 8),
    col_20 = SUBSTRING(MD5(RAND()), 1, 8)
WHERE pk IN (SELECT pk FROM Feed3_dupes);

TRUNCATE TABLE Feed3;
INSERT INTO Feed3
(col_1, col_2, col_3, col_4, col_5,
 col_6, col_7, col_8, col_9, col_10,
 col_11, col_12, col_13, col_14, col_15,
 col_16, col_17, col_18, col_19, col_20)
SELECT col_1, col_2, col_3, col_4, col_5,
       col_6, col_7, col_8, col_9, col_10,
       col_11, col_12, col_13, col_14, col_15,
       col_16, col_17, col_18, col_19, col_20
FROM Feed3_with_pk;

#Req 6

-- Check duplicates in Feed1
SELECT COUNT(*) AS duplicate_groups_Feed1
FROM (
    SELECT COUNT(*) 
    FROM Feed1
    GROUP BY col_1, col_2, col_3, col_4, col_5,
             col_6, col_7, col_8, col_9, col_10
    HAVING COUNT(*) > 1
) AS sub;

-- Check duplicates in Feed2
SELECT COUNT(*) AS duplicate_groups_Feed2
FROM (
    SELECT COUNT(*) 
    FROM Feed2
    GROUP BY col_1, col_2, col_3, col_4, col_5,
             col_6, col_7, col_8, col_9, col_10,
             col_11, col_12, col_13, col_14, col_15
    HAVING COUNT(*) > 1
) AS sub;

-- Check duplicates in Feed3
SELECT COUNT(*) AS duplicate_groups_Feed3
FROM (
    SELECT COUNT(*) 
    FROM Feed3
    GROUP BY col_1, col_2, col_3, col_4, col_5,
             col_6, col_7, col_8, col_9, col_10,
             col_11, col_12, col_13, col_14, col_15,
             col_16, col_17, col_18, col_19, col_20
    HAVING COUNT(*) > 1
) AS sub;


#Req 7

-- Compare Feed2 to Feed1 based on first 10 columns
SELECT 
    'Feed2' AS source_table,
    f2.col_1, f2.col_2, f2.col_3, f2.col_4, f2.col_5,
    f2.col_6, f2.col_7, f2.col_8, f2.col_9, f2.col_10,
    CASE WHEN f1.col_1 IS NOT NULL THEN 'Match in Feed1' ELSE 'Not in Feed1' END AS comparison_status
FROM Feed2 f2
LEFT JOIN Feed1 f1
    ON f1.col_1 = f2.col_1
   AND f1.col_2 = f2.col_2
   AND f1.col_3 = f2.col_3
   AND f1.col_4 = f2.col_4
   AND f1.col_5 = f2.col_5
   AND f1.col_6 = f2.col_6
   AND f1.col_7 = f2.col_7
   AND f1.col_8 = f2.col_8
   AND f1.col_9 = f2.col_9
   AND f1.col_10 = f2.col_10
INTO OUTFILE '/tmp/Feed2_vs_Feed1_comparison.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- Compare Feed3 to Feed1 based on first 10 columns
SELECT 
    'Feed3' AS source_table,
    f3.col_1, f3.col_2, f3.col_3, f3.col_4, f3.col_5,
    f3.col_6, f3.col_7, f3.col_8, f3.col_9, f3.col_10,
    CASE WHEN f1.col_1 IS NOT NULL THEN 'Match in Feed1' ELSE 'Not in Feed1' END AS comparison_status
FROM Feed3 f3
LEFT JOIN Feed1 f1
    ON f1.col_1 = f3.col_1
   AND f1.col_2 = f3.col_2
   AND f1.col_3 = f3.col_3
   AND f1.col_4 = f3.col_4
   AND f1.col_5 = f3.col_5
   AND f1.col_6 = f3.col_6
   AND f1.col_7 = f3.col_7
   AND f1.col_8 = f3.col_8
   AND f1.col_9 = f3.col_9
   AND f1.col_10 = f3.col_10
INTO OUTFILE '/tmp/Feed3_vs_Feed1_comparison.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';



# Req-8: Create Test Plan

CREATE TABLE IF NOT EXISTS test_plan (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_type VARCHAR(50),       -- e.g., Functional, Negative, Performance, Boundary
    test_description VARCHAR(255), -- Short description
    test_steps TEXT,             -- Steps to execute
    expected_result TEXT,        -- Expected outcome
    actual_result TEXT,          -- To be filled after execution
    status VARCHAR(20),          -- Pass / Fail / Not Executed
    remarks TEXT                 -- Optional notes
);


-- Step 2: Insert Manual Test Cases

-- 1. Verify Feed Table Creation
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Verify Feed1 table creation with 10 columns',
 'Run procedure: CALL generate_feed("Feed1", 10, 10);',
 'Feed1 table is created with 10 columns and 11 rows (10 + 1 duplicate)');

INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Verify Feed2 table creation with 15 columns',
 'Run procedure: CALL generate_feed("Feed2", 15, 15);',
 'Feed2 table is created with 15 columns and 16 rows (15 + 1 duplicate)');

INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Verify Feed3 table creation with 20 columns',
 'Run procedure: CALL generate_feed("Feed3", 20, 20);',
 'Feed3 table is created with 20 columns and 21 rows (20 + 1 duplicate)');

-- 2. Verify Data Population
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Verify random data population in feeds',
 'Run generate_feed procedure for Feed1, Feed2, Feed3',
 'Tables are populated with the requested number of rows and random string values');

-- 3. Verify Duplicate Detection
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Detect duplicates in Feed1, Feed2, Feed3',
 'Run GROUP BY + HAVING COUNT(*) > 1 queries',
 'Duplicates are detected in each feed (at least one group found)');

-- 4. Verify Duplicate Replacement
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Replace duplicates with new unique values',
 'Run ROW_NUMBER()-based duplicate replacement script for Feed1, Feed2, Feed3',
 'All duplicate rows replaced with unique random values, row count unchanged');

-- 5. Verify Post-Cleanup Uniqueness
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Check for duplicates after replacement',
 'Run GROUP BY + HAVING COUNT(*) > 1',
 'Query returns zero duplicate groups for each feed');

-- 6. Verify Feed Comparison
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Compare Feed2 and Feed3 to Feed1',
 'Run comparison script inserting results into comparison_results',
 'Comparison table correctly marks In source only / In target only');

-- 7. Verify Export
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Functional',
 'Export comparison results to CSV',
 'Run SELECT ... INTO OUTFILE from comparison_results',
 'CSV file created and can be opened in Excel');

-- 8. Negative / Boundary Tests
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Negative',
 'Insert invalid data into feeds',
 'Try inserting NULLs or oversized values into Feed tables',
 'Database rejects invalid rows with errors');

INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Boundary',
 'Generate feeds with 0 rows or 0 columns',
 'Run CALL generate_feed("FeedX", 0, 10) and CALL generate_feed("FeedX", 10, 0)',
 'Procedure should fail gracefully without creating table');

-- 9. Performance Test
INSERT INTO test_plan (test_type, test_description, test_steps, expected_result) VALUES
('Performance',
 'Test scalability with large feed size',
 'Run CALL generate_feed("FeedBig", 50, 100000);',
 'FeedBig created successfully with 100k rows and 50 columns, no timeout');


SELECT * FROM test_plan ORDER BY test_id;
 
 
 #Req9
 


# Req-9: Create Test Plan Table

CREATE TABLE IF NOT EXISTS test_plan (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_type VARCHAR(50),
    test_description TEXT,
    test_steps TEXT,
    expected_result TEXT,
    actual_result TEXT DEFAULT 'Not Executed',
    status VARCHAR(20) DEFAULT 'Not Executed',
    remarks TEXT
);


DELIMITER $$

CREATE PROCEDURE run_feed_tests()
BEGIN
    DECLARE total_rows INT DEFAULT 0;


    #Test 1: Verify Feed1 table exists and has 10 columns
   
    SELECT COUNT(*) INTO total_rows
    FROM information_schema.columns
    WHERE table_schema = DATABASE() AND table_name = 'Feed1';

    IF total_rows = 10 THEN
        UPDATE test_plan
        SET actual_result = 'Feed1 table exists with 10 columns',
            status = 'Pass'
        WHERE test_id = 1;
    ELSE
        UPDATE test_plan
        SET actual_result = 'Feed1 table missing or incorrect columns',
            status = 'Fail'
        WHERE test_id = 1;
    END IF;

   
    -- Test 2: Verify Feed1 has data
    
    SELECT COUNT(*) INTO total_rows FROM Feed1;

    IF total_rows > 0 THEN
        UPDATE test_plan
        SET actual_result = CONCAT('Feed1 populated with ', total_rows, ' rows'),
            status = 'Pass'
        WHERE test_id = 2;
    ELSE
        UPDATE test_plan
        SET actual_result = 'Feed1 has no data',
            status = 'Fail'
        WHERE test_id = 2;
    END IF;

    
    -- Test 3: Verify duplicates removed from Feed1
  
    SELECT COUNT(*) INTO total_rows
    FROM (
        SELECT COUNT(*) AS dup_count
        FROM Feed1
        GROUP BY col_1, col_2, col_3, col_4, col_5,
                 col_6, col_7, col_8, col_9, col_10
        HAVING COUNT(*) > 1
    ) AS dup;

    IF total_rows = 0 THEN
        UPDATE test_plan
        SET actual_result = 'No duplicates in Feed1',
            status = 'Pass'
        WHERE test_id = 3;
    ELSE
        UPDATE test_plan
        SET actual_result = CONCAT(total_rows, ' duplicate groups found in Feed1'),
            status = 'Fail'
        WHERE test_id = 3;
    END IF;

    
    -- Test 4: Compare Feed2 with Feed1
    
    SELECT COUNT(*) INTO total_rows
    FROM Feed2 f2
    LEFT JOIN Feed1 f1
         ON f1.col_1=f2.col_1 AND f1.col_2=f2.col_2
        AND f1.col_3=f2.col_3 AND f1.col_4=f2.col_4
        AND f1.col_5=f2.col_5 AND f1.col_6=f2.col_6
        AND f1.col_7=f2.col_7 AND f1.col_8=f2.col_8
        AND f1.col_9=f2.col_9 AND f1.col_10=f2.col_10
    WHERE f1.col_1 IS NULL;

    IF total_rows = 0 THEN
        UPDATE test_plan
        SET actual_result = 'All Feed2 rows match Feed1',
            status = 'Pass'
        WHERE test_id = 4;
    ELSE
        UPDATE test_plan
        SET actual_result = CONCAT(total_rows, ' Feed2 rows not in Feed1'),
            status = 'Fail'
        WHERE test_id = 4;
    END IF;

END$$
DELIMITER ;



CALL run_feed_tests();

SELECT test_id, test_type, test_description, actual_result, status
FROM test_plan
ORDER BY test_id;




