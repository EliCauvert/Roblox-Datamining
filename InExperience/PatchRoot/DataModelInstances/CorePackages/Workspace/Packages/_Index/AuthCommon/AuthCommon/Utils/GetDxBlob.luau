return function(p1)
	return if p1 == nil or p1.errors == nil or (not p1.errors[1] or not p1.errors[1].fieldData) then "" else p1.errors[1].fieldData
end