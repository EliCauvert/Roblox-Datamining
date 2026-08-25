local _ = require(script.Parent.Parent.ES7Types)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ _weakMap = setmetatable({}, { __mode = "k" }) }, t)
end

function t:get(p0)
	return self._weakMap[p0]
end

function t:set(p1, p2)
	self._weakMap[p1] = p2
	
	return self
end

function t:has(p3)
	return self._weakMap[p3] ~= nil
end

return t