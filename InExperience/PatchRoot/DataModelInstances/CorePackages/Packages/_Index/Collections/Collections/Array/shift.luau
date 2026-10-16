local DEV = _G.__DEV__
local Parent = script.Parent
local IsArrayModule = require(Parent.isArray)
local _ = require(Parent.Parent.Parent.ES7Types)

return function(List) --[[ Line: 23 ]]
	-- upvalues: DEV (copy), IsArrayModule (copy)
	if DEV and not IsArrayModule(List) then
		error(string.format("Array.shift called on non-array %s", (typeof(List))))
	end
	return if #List > 0 then table.remove(List, 1) else nil
end