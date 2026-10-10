return function(p1, p2)
	return if p2 == p1 then false elseif string.find(p2, "#", 1, true) == nil then false else string.find(p2, "[^#%s]") == nil
end