local t = { week = true }

return function(p1)
	-- upvalues: t (ref)
	return if p1 == nil then false else t[string.lower(p1)] == true
end