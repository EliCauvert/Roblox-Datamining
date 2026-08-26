local t = {}

return function(p1, p2)
	-- upvalues: t (ref)
	if t[p1] then
		return
	end
	t[p1] = true
	p2()
end