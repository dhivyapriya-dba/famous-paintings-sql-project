======list of tables in this project;

The dataset used in this project is Famous Paintings Dataset, sourced from Kaggle.
You can download the dataset from the following link:
 
link:https://www.kaggle.com/datasets/mexwell/famous-paintings
=============================
SELECT * FROM museum_hours;
select * from artist;
select * from canvas_size;
select * from image_link;
select * from museum;
select * from product_size;
select * from work ;
select * from subject;
use painting;

===========================================================================CREATE Trigger======================

Trigger: After a new record is inserted into the WORK table (when a new painting is added), the trigger will 
automatically insert relevant information into an audit_log table.

---------------create audit_log_table
CREATE TABLE painting_audit_log (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    work_id INT,
    artist_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(255)
);

---------create a trigger for inserting records


CREATE TRIGGER after_painting_insert
AFTER INSERT ON work
FOR EACH ROW
BEGIN
    INSERT INTO painting_audit_log (work_id, artist_id, action)
    VALUES (NEW.work_id, NEW.artist_id, 'Painting Added');
END //

DELIMITER ;


=========================================================================creating stored procedure============================

CREATE PROCEDURE getTotalPaintings(IN museum_Id INT)
BEGIN
    SELECT m.name AS Museum_Name, COUNT(w.work_id) AS Total_Paintings
    FROM museum m
    JOIN work w ON m.museum_id = w.museum_id   -- Join condition to link museum and work
    WHERE m.museum_id = museum_Id              -- Filter by the provided museum ID
    GROUP BY m.museum_id, m.name;
END //

DELIMITER ;

