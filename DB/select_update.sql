SELECT a.name maker, m.name model FROM models m INNER JOIN auto a ON m.auto_id = a.id;