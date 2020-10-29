/* Implementing deletes
   1 Delete developer - Delete Alice's primary address */
DELETE FROM addresses
	WHERE person_id = 12
		AND addresses.primary = 1;
        
/* 2 Delete widget - Remove the last widget in the Contact page. The last widget is the one with the highest value in the order field */
DELETE FROM widgets
	WHERE page_id = 345
	ORDER BY widgets.order DESC
    LIMIT 1;
    
/* 3 Delete page - Remove the last updated page in Wikipedia */
DELETE FROM pages
	WHERE website_id = 345
    ORDER by updated desc
    LIMIT 1;
    
/* 4 Delete website - Remove the CNET website, as well as all related roles and privileges relating devlopers to the website and pages */
DELETE FROM websites
	WHERE id = 567