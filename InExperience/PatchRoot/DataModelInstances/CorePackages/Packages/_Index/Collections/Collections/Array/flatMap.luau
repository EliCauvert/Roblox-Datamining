local dEV = _G.__DEV__
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local flatModule = require(parent.flat)
local mapModule = require(parent.map)
local _ = require(parent_1.ES7Types)

return function(p0, p1, p2) --[[ line: 25 | named "flatMap" ]]
	-- upvalues: dEV (ref), flatModule (ref), mapModule (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.flatMap called on %s", typeof(p0)))
		end
		if typeof(p1) ~= "function" then
			error("callback is not a function")
		end
	end
	return flatModule(mapModule(p0, p1, p2))
end