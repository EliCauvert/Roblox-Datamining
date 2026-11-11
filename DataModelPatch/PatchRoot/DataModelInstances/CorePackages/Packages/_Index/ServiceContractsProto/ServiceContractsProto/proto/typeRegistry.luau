local Module = {}
Module.__index = Module
local _ = require(script.Parent.message)

function Module.new(List)
	-- upvalues: Module (copy)
	local _types = {}
	
	for _, value in List do
		_types[value.descriptor.fullName] = value
	end
	return (setmetatable({ _types = _types }, Module))
end

function Module:findMessage(p1)
	return self._types[p1]
end

function Module:register(p1)
	self._types[p1.descriptor.fullName] = p1
end

return { TypeRegistry = Module, default = Module.new({}) }