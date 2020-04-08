SELECT H.hotelli_nr, H.nimi
FROM (
         SELECT H.hotelli_nr, H.nimi
         from Hotell H
                  RIGHT JOIN

              (SELECT hotelli_nr
               FROM (
                        SELECT R.hotelli_nr, Count(Temp.külalise_nr) AS amount
                        FROM Reserveerimine AS R
                                 LEFT JOIN (SELECT K.külalise_nr, COUNT(*)
                                            FROM (SELECT külalise_nr
                                                  FROM (SELECT külalise_nr, COUNT(*) as rep
                                                        FROM Reserveerimine R
                                                        GROUP BY külalise_nr) as Temp2

                                                  WHERE rep = (
                                                      SELECT MAX(rep)
                                                      FROM (
                                                               SELECT külalise_nr, COUNT(*) as rep
                                                               FROM Reserveerimine R
                                                               GROUP BY külalise_nr) as Temp1)) AS K
                                            GROUP BY K.külalise_nr
                        ) AS Temp ON R.külalise_nr = Temp.külalise_nr
                        GROUP BY R.hotelli_nr
                    ) as Visited
               WHERE Visited.amount = 0

               UNION

               (SELECT H.hotelli_nr
                FROM Hotell H
                         LEFT JOIN Reserveerimine R
                                   ON H.hotelli_nr = R.hotelli_nr
                WHERE R.hotelli_nr is NULL
               )) as Temp
              ON H.hotelli_nr = Temp.hotelli_nr
         WHERE Temp.hotelli_nr IS NOT NULL) as hnn
ORDER BY H.hotelli_nr