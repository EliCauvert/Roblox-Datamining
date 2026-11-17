local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local _ = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), StatusIndicatorModule (copy), StatusIndicatorVariantModule (copy), ViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Value = p1.indicator and p1.indicator.value
	local Element = if Value == nil then if p1.indicator == nil then nil else ReactModule.createElement(StatusIndicatorModule, {
		variant = StatusIndicatorVariantModule.Emphasis,
		mask = p1.mask,
		testId = p1.testId
	}) else ReactModule.createElement(StatusIndicatorModule, {
		max = 99,
		value = Value,
		variant = StatusIndicatorVariantModule.Emphasis,
		size = p1.size,
		mask = p1.mask,
		testId = p1.testId
	})
	
	return if Element == nil then nil else ReactModule.createElement(ViewModule, {
		tag = "auto-xy",
		GroupTransparency = p1.transparency,
		padding = if p1.mask == nil then nil else UseTokensModuleResult.Stroke.Thicker
	}, { Badge = Element })
end