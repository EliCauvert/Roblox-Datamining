local DEV = _G.__DEV__
local Parent = script.Parent
local IsArrayModule = require(Parent.isArray)
local _ = require(Parent.Parent.Parent.ES7Types)

local function flat(List, p1)
	-- upvalues: DEV (copy), IsArrayModule (copy), flat (copy)
	if DEV then
		if typeof(List) ~= "table" then
			error(string.format("Array.flat called on %s", (typeof(List))))
		end
		if p1 ~= nil and typeof(p1) ~= "number" then
			error("depth is not a number or nil")
		end
	end
	local P1 = p1 or 1
	local List1 = {}
	
	for _, value in List do
		if not IsArrayModule(value) then
			table.insert(List1, value)
			continue
		end
		local FlatResult = if P1 > 1 then flat(value, P1 - 1) else value
		for _, value1 in FlatResult do
			table.insert(List1, value1)
		end
	end
	return List1
end

return flat