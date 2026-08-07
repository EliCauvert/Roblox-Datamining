local getNumericalApplicationIdModule = require(script.Parent.getNumericalApplicationId)

local function _(p0, p1) --[[ line: 9 | named "getRolloutEnabledForUser" ]]
	-- upvalues: getNumericalApplicationIdModule (ref)
	local var1 = p0()
	local var2 = getNumericalApplicationIdModule(p1)
	
	return if var2 == nil then var1 >= 100 else var2 % 100 + 1 <= var1
end

return function(p2, p3) --[[ line: 28 ]]
	-- upvalues: getNumericalApplicationIdModule (ref)
	local var5
	local var3 = p2()
	local var4 = getNumericalApplicationIdModule(p3)
	
	if var4 == nil then
		var5 = var3 >= 100
		var5 = nil
	else
		var5 = var4 % 100 + 1 <= var3
	end
	return function() --[[ line: 34 ]]
		-- upvalues: var5 (ref)
		return var5
	end
end