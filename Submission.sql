SELECT S.challenger, S.problem, submission_time, solution, score FROM
(SELECT challenger, problem, MAX(score) as arv_ FROM Submission
GROUP BY challenger, problem) AS Temp
LEFT JOIN Submission S
ON Temp.challenger=S.challenger AND Temp.problem=S.problem
WHERE score = arv_
ORDER BY score;