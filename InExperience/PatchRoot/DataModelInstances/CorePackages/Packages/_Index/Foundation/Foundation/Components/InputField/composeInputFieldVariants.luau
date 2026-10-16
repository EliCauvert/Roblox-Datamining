local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.InputSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local _ = require(Foundation.Enums.Radius)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local GetInputVariantsFactoryModule = require(script.Parent.getInputVariantsFactory)
local _ = require(Foundation.Providers.Style.Tokens)

return function(p1, p2, Utility, p3, p4, p5, p6) --[[ Line: 22 | Named "composeInputFieldVariants" ]]
	-- upvalues: GetInputVariantsFactoryModule (copy), InputVariantModule (copy), ComposeStyleVariantModule (copy)
	local InputVariantsFactoryModule = GetInputVariantsFactoryModule(p1)
	local Variant = InputVariantsFactoryModule.variants[Utility or InputVariantModule.Standard]
	
	return ComposeStyleVariantModule(InputVariantsFactoryModule.common, InputVariantsFactoryModule.sizes[p2], if Utility == InputVariantModule.Utility then {} else Variant, if p3 then InputVariantsFactoryModule.radius[p3] else InputVariantsFactoryModule.defaultRadius[p2], if p5 == nil then {} else InputVariantsFactoryModule.hoverState[p5], if p4 == nil then {} else InputVariantsFactoryModule.focusedState[p4], if p6 == nil then {} else InputVariantsFactoryModule.errorState[p6], if Utility == InputVariantModule.Utility then Variant else {})
end