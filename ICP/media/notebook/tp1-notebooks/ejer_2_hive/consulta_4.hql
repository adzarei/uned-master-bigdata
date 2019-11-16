SELECT gdp.`2015` 
FROM ejer2_hive.TablaExternaGDP gdp 
JOIN ejer2_hive.TablaExternaEscolarizacion esc 
    ON gdp.country_code = esc.country_code 
WHERE esc.`2015`= 8339;