SELECT Schueler.* FROM Schueler
WHERE Schueler.Status IN (2)
AND Schueler.Geloescht='-'
AND Schueler.ASDJahrgang IN ('06','07','08','09','10','EF')
AND EXISTS (SELECT slad.ID FROM SchuelerLernabschnittsdaten AS slad
	INNER JOIN SchuelerLeistungsdaten AS sld ON sld.Abschnitt_ID=slad.ID
	WHERE slad.Schueler_ID=Schueler.ID
	AND slad.Jahr=(SELECT sch.Schuljahr FROM EigeneSchule AS sch)
	AND slad.Abschnitt=(SELECT sch.SchuljahrAbschnitt FROM EigeneSchule AS sch) 
	AND slad.WechselNr=999 
	AND slad.Hochrechnung=0
	AND sld.Warnung='+'
	AND sld.Warndatum IS NULL)
