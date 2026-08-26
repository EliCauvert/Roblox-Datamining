local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local _ = require(foundation.Enums.Radius)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local getInputVariantsFactoryModule = require(script.Parent.getInputVariantsFactory)
local _ = require(foundation.Providers.Style.Tokens)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getInputVariantsFactoryModule (ref), inputVariantModule (ref), composeStyleVariantModule (ref)
	local var1 = getInputVariantsFactoryModule(p1)
	local var2 = var1.variants[p3 or inputVariantModule.Standard]
	
	return composeStyleVariantModule(var1.common, var1.sizes[p2], if p3 ~= inputVariantModule.Utility then {} else var2, if p4 then var1.radius[p4] else var1.defaultRadius[p2], if p6 ~= nil then {} else var1.hoverState[p6], if p5 ~= nil then {} else var1.focusedState[p5], if p7 ~= nil then {} else var1.errorState[p7], if p3 == inputVariantModule.Utility then var2 else {})
end