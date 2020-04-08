SELECT T1.varustaja_nr AS varustaja_1, T2.varustaja_nr AS varustaja_2 FROM
(SELECT varustaja_nr, SUM(power) as total FROM
(SELECT varustaja_nr, 2 ^ osa_nr AS power FROM VarustajaOsad) as v
GROUP BY varustaja_nr) T1,
(SELECT varustaja_nr, SUM(power) as total FROM
(SELECT varustaja_nr, 2 ^ osa_nr AS power FROM VarustajaOsad) as vnp
GROUP BY varustaja_nr) T2
WHERE T1.total=T2.total AND T1.varustaja_nr < T2.varustaja_nr;