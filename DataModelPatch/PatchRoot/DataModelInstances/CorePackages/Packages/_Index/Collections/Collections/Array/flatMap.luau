local DEV = _G.__DEV__
local Parent = script.Parent
local FlatModule = require(Parent.flat)
local MapModule = require(Parent.map)
local _ = require(Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	-- upvalues: DEV (copy), FlatModule (copy), MapModule (copy)
	if DEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.flatMap called on %s", (typeof(p1))))
		end
		if typeof(p2) ~= "function" then
			error("callback is not a function")
		end
	end
	return FlatModule(MapModule(p1, p2, p3))
end