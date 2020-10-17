/* 1a Retreive all devs */
SELECT p.id, p.firstName, p.lastName FROM persons p, developers d
	WHERE p.id = d.id
		AND d.developerKEY IS NOT NULL;

/* 1b Retrive dev with id = 34 */
SELECT id, firstName, lastName FROM persons
	WHERE persons.id = 34;
    
/* 1c Retrieve devs with role other than owner for Twitter */
SELECT p.id, p.firstName, p.lastName FROM persons p, website_roles wr
	WHERE p.id = wr.developer_id
		AND wr.website_id = 234
        AND wr.role <> 'owner';
        
/* 1d Retrieve devs page reviewers of pages less than 300000 visits */
SELECT p.id, p.firstName, p.lastName FROM persons p, page_roles pr, (SELECT * FROM pages WHERE views < 300000) pg
	WHERE p.id = pr.developer_id
		AND pr.role = 'reviewer'
        AND pr.page_id = pg.id;
        
/* 1e Retrieve writer developer who added heading widget to CNET's home page */
SELECT p.id, p.firstName, p.lastName FROM persons p
	RIGHT JOIN page_roles pr ON p.id = pr.developer_id
	LEFT JOIN page_privileges pp ON pp.developer_id = pr.developer_id
		AND pp.page_id = pr.page_id
    INNER JOIN pages pg ON pr.page_id = pg.id
	LEFT JOIN websites w ON pg.website_id = w.id
    WHERE pp.privileges = 'create'
		AND pg.id = 123;

/* 2a Retrieve website with least amount of visits */
SELECT name FROM websites
	WHERE visits = (SELECT min(visits) FROM websites);
    
/* 2b Retrieve the name of a website whose id is 678 */
SELECT name FROM websites
	WHERE id = 678;
    
/* 2c Retrieve all websites with videos reviewed by bob */
SELECT w.name FROM websites w
	LEFT JOIN pages pg ON pg.website_id = w.id
    LEFT JOIN page_roles pr ON pg.id = pr.page_id
    RIGHT JOIN (SELECT * FROM widgets WHERE dtype = 'youtube') wg ON wg.page_id = pg.id
    WHERE pr.role = 'reviewer'
		AND pr.developer_id = 23;

/* 2d Retrieve all websites where alice is an owner */
SELECT w.name FROM websites w
	LEFT JOIN website_roles wr ON wr.website_id = w.id
    WHERE wr.role = 'owner'
		AND wr.developer_id = 12;
        
/* 2e Retrieve all websites where charlie is an admin and get more than 6000000 visits */
SELECT w.name FROM websites w
	LEFT JOIN website_roles wr ON wr.website_id = w.id
    WHERE wr.role = 'admin'
		AND wr.developer_id = 34
        AND w.visits > 6000000;
        
/* 3a Retrieve the page with the most number of views */
SELECT title FROM pages
	WHERE views = (SELECT max(views) FROM pages);
    
/* 3b Retrieve the title of a page whose id is 234 */
SELECT title FROM pages
	WHERE id = 234;
    
/* 3c Retrieve all pages where alice is an editor */
SELECT pg.title FROM pages pg
	LEFT JOIN page_roles pr ON pr.page_id = pg.id
    WHERE pr.role = 'editor'
		AND pr.developer_id = 12;

/* 3d Retrieve the total number of page views in CNET */
SELECT SUM(views) AS TOTAL_VIEWS FROM pages
	WHERE website_id = 567;
    
/* 3e Retrieve the average number of page views in the Website Wikipedia */
SELECT AVG(views) as AVERAGE_VIEWS FROM pages
	WHERE website_id = 345;
    
/* 4a Retrieve all the widgets in CNET's Home page */
SELECT name FROM widgets
	WHERE page_id = 123;
    
/* 4b Retrieve all youtube widgets in CNN */
SELECT wg.name FROM widgets wg, pages pg
	WHERE wg.dtype = 'youtube'
		AND pg.website_id = 456;

/* 4c Retrieve all image widgets on pages reviewed by Alice */
SELECT wg.name FROM widgets wg
	RIGHT JOIN pages pg ON pg.id = wg.page_id
    LEFT JOIN page_roles pr ON pr.page_id = pg.id
    WHERE wg.dtype = 'image'
		AND pr.developer_id = 12
        AND pr.role = 'reviewer';
        
/* 4d Retrieve how many widgets are in Wikipedia */
SELECT COUNT(wg.id) AS NUM_WIDGETS FROM widgets wg
	LEFT JOIN pages pg ON wg.page_id = pg.id
	WHERE pg.website_id = 345;

/* 5a Retrieve the names of all the websites where Bob has DELETE privileges */
SELECT w.name FROM websites w
	LEFT JOIN website_privileges wp ON w.id = wp.website_id
    WHERE wp.privilege = 'delete'
		AND wp.developer_id = 23;
        
/* 5b Retrieve the names of all the pages where Charlie has CREATE privileges */
SELECT pg.title FROM pages pg
	LEFT JOIN page_privileges pp ON pp.page_id = pg.id
    WHERE pp.privileges = 'create'
		AND pp.developer_id = 34;



