/* Implementing updates
   1 Update developer - Update Charlie's primary phone number to 333-444-5555 */
UPDATE phones
	SET phone = '333-444-5555'
    WHERE person_id = 34
		AND phones.primary = 1;
        
/* 2 Update widget - Update the relative order of widget head 345 on the page so that it's new order is 3.
	Note that the other widget's order needs to update as well */        
UPDATE widgets
	SET widgets.order = 3
    WHERE id = 345;
    
UPDATE widgets
	SET widgets.order = widgets.order - 1
    WHERE page_id = 345
		AND id <> 345;
        
/* 3 Update page - Append 'CNET -' to the beginning of all CNET's page titles */
UPDATE pages
	SET title = CONCAT('CNET - ', title)
	WHERE website_id = 567;

/* 4 Update roles - Swap Charlie's and Bob's role in CNET's Home page */
UPDATE page_roles
	SET developer_id = CASE
		WHEN developer_id = 23 THEN 34
        WHEN developer_id = 34 THEN 23
        END
	WHERE developer_id IN (23, 34)
		AND page_id = 123;

