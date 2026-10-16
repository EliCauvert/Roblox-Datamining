local _ = require(script.Parent.Parent.ES7Types)
local WeakMapModule = {}
WeakMapModule.__index = WeakMapModule

function WeakMapModule.new() --[[ Line: 37 ]]
	-- upvalues: WeakMapModule (copy)
	return (setmetatable({ _weakMap = setmetatable({}, { __mode = "k" }) }, WeakMapModule))
end

function WeakMapModule:get(p1) --[[ Line: 42 ]]
	return self._weakMap[p1]
end

function WeakMapModule:set(p1, p2) --[[ Line: 46 ]]
	self._weakMap[p1] = p2
	
	return self
end

function WeakMapModule:has(p1): boolean --[[ Line: 51 ]]
	return self._weakMap[p1] ~= nil
end

return WeakMapModule