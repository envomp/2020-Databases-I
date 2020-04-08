DELETE FROM Tootaja WHERE tootaja_id IN
(SELECT tootaja_id FROM Tootaja T
WHERE T.tootaja_id NOT IN (SELECT T_.ylemus FROM Tootaja T_ WHERE T_.ylemus IS NOT NULL)
AND T.palk - 100 > (SELECT T__.palk FROM Tootaja T__ WHERE T__.tootaja_id=T.ylemus));

UPDATE Tootaja U
SET U.palk=U.palk-100,U.palga_muutmise_aeg=GETDATE()
WHERE U.tootaja_id IN
(SELECT tootaja_id FROM Tootaja T
WHERE T.tootaja_id IN (SELECT T_.ylemus FROM Tootaja T_ WHERE T_.ylemus IS NOT NULL)
AND T.palk > (SELECT SUM(T_.palk) FROM Tootaja T_ WHERE T_.ylemus=T.tootaja_id));

UPDATE Tootaja U
SET U.palk=U.palk+100,U.palga_muutmise_aeg=GETDATE()
WHERE U.tootaja_id IN
(SELECT A.tootaja_id FROM Tootaja A WHERE A.ylemus IN
(SELECT tootaja_id FROM Tootaja T
WHERE T.tootaja_id IN (SELECT T_.ylemus FROM Tootaja T_ WHERE T_.ylemus IS NOT NULL)
AND T.palk > (SELECT SUM(T_.palk) FROM Tootaja T_ WHERE T_.ylemus=T.tootaja_id)));
