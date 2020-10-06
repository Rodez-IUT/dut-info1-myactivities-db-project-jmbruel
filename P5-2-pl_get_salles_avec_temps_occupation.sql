CREATE OR REPLACE FUNCTION gds.pl_get_salles_avec_temps_occupation(curs refcursor) 
RETURNS refcursor AS $$
	BEGIN
		OPEN curs FOR
			SELECT nom, tps_occupation 
			FROM gds.salle salle, gds.pl_calcule_temps_occupation(salle.nom) tps_occupation
			ORDER BY tps_occupation DESC, nom;
		RETURN curs;
	END;
$$ LANGUAGE plpgsql;

-- BEGIN;
select gds.pl_get_salles_avec_temps_occupation('curs_salles');
FETCH ALL IN curs_salles;
-- COMMIT;