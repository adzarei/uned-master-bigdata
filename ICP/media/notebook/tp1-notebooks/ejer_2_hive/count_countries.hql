
-- Ambas queries deben dar lo mismo: 264
SELECT count(country_code)  FROM ejer2_hive.TablaInternaEscolarizacion;
SELECT count(distinct country_code)  FROM ejer2_hive.TablaInternaEscolarizacion;

-- Ambas queries deben dar lo mismo: 264
SELECT count(country_code)  FROM ejer2_hive.TablaInternaGDP;
SELECT count(distinct country_code)  FROM ejer2_hive.TablaInternaGDP;
