return function(p1)
	return if p1 ~= nil then if p1 ~= "" then if p1 ~= -1 then typeof(p1) == "table" and next(p1) == nil else true else true else true
end