return function(p0)
	return if p0 ~= nil then if p0 ~= "" then if p0 ~= -1 then typeof(p0) == "table" and next(p0) == nil else true else true else true
end