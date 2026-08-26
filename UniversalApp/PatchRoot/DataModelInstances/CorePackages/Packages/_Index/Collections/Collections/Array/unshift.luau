local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

return function(p1, ...)
	-- upvalues: dEV (ref), isArrayModule (ref)
	if dEV and not isArrayModule(p1) then
		error(string.format("Array.unshift called on non-array %s", typeof(p1)))
	end
	local var1 = select("#", ...)
	
	if var1 > 0 then
		for i = var1, 1, -1 do
			table.insert(p1, 1, select(i, ...))
		end
	end
	return #p1
end