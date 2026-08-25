local t = {}
t.__index = t
local _ = require(script.Parent.message)

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p0 do
		t_1[v.descriptor.fullName] = v
	end
	return setmetatable({ _types = t_1 }, t)
end

function t:findMessage(p1)
	return self._types[p1]
end

function t:register(p2)
	self._types[p2.descriptor.fullName] = p2
end

return { TypeRegistry = t, default = t.new({}) }