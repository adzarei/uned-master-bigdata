
-- Borramos las vistas si existen.
DROP VIEW IF EXISTS ejer2_hive.VistaTablaExternaGDP;
DROP VIEW IF EXISTS ejer2_hive.VistaTablaExternaEscolarizacion;
DROP VIEW IF EXISTS ejer2_hive.VistaTablaInternaGDP;
DROP VIEW IF EXISTS ejer2_hive.VistaTablaInternaEscolarizacion;


-- Creamos las 4 vistas.
CREATE VIEW ejer2_hive.VistaTablaExternaGDP AS    
        SELECT country_name as name, country_code as code, 
            CASE
                WHEN COALESCE(`2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`) IS NOT NULL THEN
                    (COALESCE(`2000`,0) + COALESCE(`2001`,0) + COALESCE(`2002`,0) + COALESCE(`2003`,0) + COALESCE(`2004`,0) + 
                     COALESCE(`2005`,0) + COALESCE(`2006`,0) + COALESCE(`2007`,0) + COALESCE(`2008`,0) + COALESCE(`2009`,0)) / 
                        (CASE WHEN `2000` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2001` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2002` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2003` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2004` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2005` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2006` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2007` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2008` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2009` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_1,
            CASE
                WHEN COALESCE(`2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`) IS NOT NULL THEN
                    (COALESCE(`2010`,0) + COALESCE(`2011`,0) + COALESCE(`2012`,0) + COALESCE(`2013`,0) + COALESCE(`2014`,0) + 
                     COALESCE(`2015`,0) + COALESCE(`2016`,0)) / 
                        (CASE WHEN `2010` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2011` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2012` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2013` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2014` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2015` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2016` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_2
            FROM ejer2_hive.TablaExternaGDP;

CREATE VIEW ejer2_hive.VistaTablaExternaEscolarizacion AS    
        SELECT country_name as name, country_code as code, 
            CASE
                WHEN COALESCE(`2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`) IS NOT NULL THEN
                    (COALESCE(`2000`,0) + COALESCE(`2001`,0) + COALESCE(`2002`,0) + COALESCE(`2003`,0) + COALESCE(`2004`,0) + 
                     COALESCE(`2005`,0) + COALESCE(`2006`,0) + COALESCE(`2007`,0) + COALESCE(`2008`,0) + COALESCE(`2009`,0)) / 
                        (CASE WHEN `2000` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2001` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2002` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2003` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2004` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2005` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2006` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2007` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2008` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2009` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_1,
            CASE
                WHEN COALESCE(`2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`) IS NOT NULL THEN
                    (COALESCE(`2010`,0) + COALESCE(`2011`,0) + COALESCE(`2012`,0) + COALESCE(`2013`,0) + COALESCE(`2014`,0) + 
                     COALESCE(`2015`,0) + COALESCE(`2016`,0)) / 
                        (CASE WHEN `2010` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2011` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2012` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2013` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2014` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2015` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2016` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_2
            FROM ejer2_hive.TablaExternaEscolarizacion;

            
CREATE VIEW ejer2_hive.VistaTablaInternaGDP AS    
        SELECT country_name as name, country_code as code, 
            CASE
                WHEN COALESCE(`2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`) IS NOT NULL THEN
                    (COALESCE(`2000`,0) + COALESCE(`2001`,0) + COALESCE(`2002`,0) + COALESCE(`2003`,0) + COALESCE(`2004`,0) + 
                     COALESCE(`2005`,0) + COALESCE(`2006`,0) + COALESCE(`2007`,0) + COALESCE(`2008`,0) + COALESCE(`2009`,0)) / 
                        (CASE WHEN `2000` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2001` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2002` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2003` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2004` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2005` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2006` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2007` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2008` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2009` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_1,
            CASE
                WHEN COALESCE(`2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`) IS NOT NULL THEN
                    (COALESCE(`2010`,0) + COALESCE(`2011`,0) + COALESCE(`2012`,0) + COALESCE(`2013`,0) + COALESCE(`2014`,0) + 
                     COALESCE(`2015`,0) + COALESCE(`2016`,0)) / 
                        (CASE WHEN `2010` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2011` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2012` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2013` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2014` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2015` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2016` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_2
            FROM ejer2_hive.TablaInternaGDP;
    
    
    
    CREATE VIEW ejer2_hive.VistaTablaInternaEscolarizacion AS    
        SELECT country_name as name, country_code as code, 
            CASE
                WHEN COALESCE(`2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`) IS NOT NULL THEN
                    (COALESCE(`2000`,0) + COALESCE(`2001`,0) + COALESCE(`2002`,0) + COALESCE(`2003`,0) + COALESCE(`2004`,0) + 
                     COALESCE(`2005`,0) + COALESCE(`2006`,0) + COALESCE(`2007`,0) + COALESCE(`2008`,0) + COALESCE(`2009`,0)) / 
                        (CASE WHEN `2000` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2001` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2002` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2003` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2004` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2005` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2006` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2007` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2008` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2009` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_1,
            CASE
                WHEN COALESCE(`2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`) IS NOT NULL THEN
                    (COALESCE(`2010`,0) + COALESCE(`2011`,0) + COALESCE(`2012`,0) + COALESCE(`2013`,0) + COALESCE(`2014`,0) + 
                     COALESCE(`2015`,0) + COALESCE(`2016`,0)) / 
                        (CASE WHEN `2010` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2011` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2012` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2013` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2014` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2015` IS NULL THEN 0 ELSE 1 END +
                         CASE WHEN `2016` IS NULL THEN 0 ELSE 1 END)
                ELSE 0
            END as avg_country_2
            FROM ejer2_hive.TablaInternaEscolarizacion;
    