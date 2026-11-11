local GetNumericalApplicationIdModule = require(script.Parent.getNumericalApplicationId)

local function _(Callback, p1): boolean
	-- upvalues: GetNumericalApplicationIdModule (copy)
	local CallbackResult: number = Callback()
	local NumericalApplicationIdModule: number = GetNumericalApplicationIdModule(p1)
	
	return if NumericalApplicationIdModule == nil then CallbackResult >= 100 else NumericalApplicationIdModule % 100 + 1 <= CallbackResult
end

return function(Callback, p1)
	-- upvalues: GetNumericalApplicationIdModule (copy)
	local CallbackResult: number = Callback()
	local NumericalApplicationIdModule: number = GetNumericalApplicationIdModule(p1)
	local IsCallbackResultAbove: boolean = if NumericalApplicationIdModule == nil then CallbackResult >= 100 else NumericalApplicationIdModule % 100 + 1 <= CallbackResult
	
	return function()
		-- upvalues: IsCallbackResultAbove (copy)
		return IsCallbackResultAbove
	end
end