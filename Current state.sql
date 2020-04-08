SELECT tellimus_id, klient_id, kohaletoimetamise_aadress,
iif(täitmise_aeg IS NOT NULL, täitmise_aeg, iif(tühistamise_aeg IS NOT NULL, tühistamise_aeg, iif(kinnitamise_aeg IS NOT NULL, kinnitamise_aeg, iif(esitamise_aeg IS NOT NULL, esitamise_aeg, loomise_aeg)))) AS seisundi_saamise_aeg,
iif(täitmise_aeg IS NOT NULL, 'täidetud', iif(tühistamise_aeg IS NOT NULL, 'tühistatud', iif(kinnitamise_aeg IS NOT NULL, 'kinnitatud', iif(esitamise_aeg IS NOT NULL, 'esitatud', 'loodud')))) AS hetkeseisund
FROM Tellimus;
