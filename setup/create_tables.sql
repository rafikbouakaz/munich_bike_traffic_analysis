
-- Create schema & tables adapted to the Munich dataset CSVs
-- Date: 2025-11-05
-- Author: Rafik Bouakaz 

DROP TABLE IF EXISTS rad_15min;
DROP TABLE IF EXISTS rad_tage;
DROP TABLE IF EXISTS radzaehlstellen;

-- Stations metadata: original CSV columns:
-- zaehlstelle, zaehlstelle_lang, latitude, longitude, richtung_1, richtung_2, besonderheiten
-- this table gives the detailed information about the installed sensors (wheel counting points)
CREATE TABLE radzaehlstellen (
  zaehlstelle TEXT PRIMARY KEY,
  zaehlstelle_lang TEXT,
  latitude NUMERIC(9,6),
  longitude NUMERIC(9,6),
  richtung_1 TEXT,
  richtung_2 TEXT,
  besonderheiten TEXT
);


-- Daily aggregated data: rad_tage CSV:
-- datum,uhrzeit_start,uhrzeit_ende,zaehlstelle,richtung_1,richtung_2,gesamt,min-temp,max-temp,niederschlag,bewoelkung,sonnenstunden
-- this table gives informations about (weather,bike_counts,date)
CREATE TABLE rad_tage (
  datum DATE,
  uhrzeit_start TIME,
  uhrzeit_ende TIME,
  zaehlstelle TEXT,
  richtung_1 INT,
  richtung_2 INT,
  gesamt INT,
  min_temp NUMERIC(5,2),
  max_temp NUMERIC(5,2),
  niederschlag NUMERIC(6,2),
  bewoelkung INT,
  sonnenstunden NUMERIC(5,2),
  CONSTRAINT fk_rad_tage_station FOREIGN KEY (zaehlstelle) REFERENCES radzaehlstellen(zaehlstelle)
);

-- 15-minute interval data: rad_15min CSV:
-- datum,uhrzeit_start,uhrzeit_ende,zaehlstelle,richtung_1,richtung_2,gesamt
CREATE TABLE rad_15min (
  datum DATE,
  uhrzeit_start TIME,
  uhrzeit_ende TIME,
  zaehlstelle TEXT,
  richtung_1 INT,
  richtung_2 INT,
  gesamt INT,
  CONSTRAINT fk_15min_station FOREIGN KEY (zaehlstelle) REFERENCES radzaehlstellen(zaehlstelle)
);

