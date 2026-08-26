local dEV = _G.__DEV__
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local flatModule = require(parent.flat)
local mapModule = require(parent.map)
local _ = require(parent_1.ES7Types)

return function(p1, p2, p3)
	-- upvalues: dEV (ref), flatModule (ref), mapModule (ref)
	if dEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.flatMap called on %s", typeof(p1)))
		end
		if typeof(p2) ~= "function" then
			error("callback is not a function")
		end
	end
	return flatModule(mapModule(p1, p2, p3))
end