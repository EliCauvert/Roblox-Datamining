return function(p1)
	return if p1 == nil then nil elseif p1 ~= "true" then if p1 ~= "True" then p1 == "1" else true else true
end