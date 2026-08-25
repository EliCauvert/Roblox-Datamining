local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.children = {}
	t_1.isEndOfWord = false
	t_1.data = p0
	
	return t_1
end

return t