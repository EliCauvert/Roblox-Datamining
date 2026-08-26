local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

return function(p1)
	-- upvalues: dEV (ref), isArrayModule (ref)
	if dEV and not isArrayModule(p1) then
		error(string.format("Array.shift called on non-array %s", typeof(p1)))
	end
	return if #p1 > 0 then table.remove(p1, 1) else nil
end