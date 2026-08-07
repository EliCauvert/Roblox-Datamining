local t = {}

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: t (ref)
	if t[p0] then
		return
	end
	t[p0] = true
	p1()
end