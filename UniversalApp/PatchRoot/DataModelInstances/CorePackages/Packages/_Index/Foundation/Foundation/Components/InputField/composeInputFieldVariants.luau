local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local _ = require(foundation.Enums.Radius)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local getInputVariantsFactoryModule = require(script.Parent.getInputVariantsFactory)
local _ = require(foundation.Providers.Style.Tokens)

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 22 | named "composeInputFieldVariants" ]]
	-- upvalues: getInputVariantsFactoryModule (ref), inputVariantModule (ref), composeStyleVariantModule (ref)
	local var4 = getInputVariantsFactoryModule(p0)
	local var5 = var4.variants[p2 or inputVariantModule.Standard]
	
	return composeStyleVariantModule(var4.common, var4.sizes[p1], if p2 ~= inputVariantModule.Utility then {} else var5, if p3 then var4.radius[p3] else var4.defaultRadius[p1], if p5 ~= nil then {} else var4.hoverState[p5], if p4 ~= nil then {} else var4.focusedState[p4], if p6 ~= nil then {} else var4.errorState[p6], if p2 == inputVariantModule.Utility then var5 else {})
end