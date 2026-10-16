local DEV = _G.__DEV__
local Parent = script.Parent
local IsArrayModule = require(Parent.isArray)
local _ = require(Parent.Parent.Parent.ES7Types)

return function(List, ...): number --[[ Line: 23 ]]
	-- upvalues: DEV (copy), IsArrayModule (copy)
	if DEV and not IsArrayModule(List) then
		error(string.format("Array.unshift called on non-array %s", (typeof(List))))
	end
	local Selected: number = select("#", ...)
	
	if Selected > 0 then
		for i = Selected, 1, -1 do
			table.insert(List, 1, (select(i, ...)))
		end
	end
	return #List
end