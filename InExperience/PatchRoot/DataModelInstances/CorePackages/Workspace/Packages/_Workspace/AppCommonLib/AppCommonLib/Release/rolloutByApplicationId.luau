local getNumericalApplicationIdModule = require(script.Parent.getNumericalApplicationId)

local function _(p1, p2)
	-- upvalues: getNumericalApplicationIdModule (ref)
	local var1 = p1()
	local var2 = getNumericalApplicationIdModule(p2)
	
	return if var2 == nil then var1 >= 100 else var2 % 100 + 1 <= var1
end

return function(p1, p2)
	-- upvalues: getNumericalApplicationIdModule (ref)
	local var1
	local var2 = p1()
	local var3 = getNumericalApplicationIdModule(p2)
	
	if var3 == nil then
		var1 = var2 >= 100
		var1 = nil
	else
		var1 = var3 % 100 + 1 <= var2
	end
	return function()
		-- upvalues: var1 (ref)
		return var1
	end
end