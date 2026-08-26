local t = {}
t.__index = t
local _ = require(script.Parent.message)

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p1 do
		t_1[v.descriptor.fullName] = v
	end
	return setmetatable({ _types = t_1 }, t)
end

function t:findMessage(p2)
	return self._types[p2]
end

function t:register(p2)
	self._types[p2.descriptor.fullName] = p2
end

return { TypeRegistry = t, default = t.new({}) }