local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

return function(p1, ...)
	-- upvalues: isArrayModule (ref), dEV (ref)
	local cloned
	local _ = nil
	local var1 = 0
	
	if isArrayModule(p1) then
		cloned = table.clone(p1)
		var1 = #p1
	else
		var1 += 1
		cloned = { [var1] = p1 }
	end
	local var2
	for i_1 = 1, select("#", ...) do
		var2 = select(i_1, ...)
		local var3 = typeof(var2)
		
		if var2 == nil then
			continue
		end
		if var3 ~= "table" then
			var1 += 1
			cloned[var1] = var2
			continue
		end
		if dEV and not isArrayModule(var2) then
			error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`")
		end
		for i = 1, #var2 do
			var1 += 1
			cloned[var1] = var2[i]
		end
	end
	return cloned
end