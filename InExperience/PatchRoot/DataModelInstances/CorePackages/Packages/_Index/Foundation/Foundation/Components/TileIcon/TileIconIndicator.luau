local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetStatusIndicatorSizeModule = require(Foundation.Components.StatusIndicator.getStatusIndicatorSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local _Vector2 = Vector2.new(0.8885729807284855, 0.1853398044750813)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensModule (copy), StatusIndicatorSizeModule (copy), FlagsModule (copy), GetStatusIndicatorSizeModule (copy), ReactModule (copy), ViewModule (copy), _Vector2 (copy), StatusIndicatorModule (copy), StatusIndicatorVariantModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Indicator = p1.indicator
	local HasValue = Indicator.value ~= nil
	local Medium = if HasValue then if p1.isCompact then StatusIndicatorSizeModule.Medium else StatusIndicatorSizeModule.Large else StatusIndicatorSizeModule.Small
	local StatusIndicatorSizeModule1: number = GetStatusIndicatorSizeModule(UseTokensModuleResult, if HasValue and not FlagsModule.FoundationStatusIndicatorDesignUpdate then StatusIndicatorSizeModule.Medium else Medium, HasValue)
	local Mask = Indicator.mask or UseTokensModuleResult.Color.Surface.Surface_0
	local IndicatorName: string = `{p1.testId}--status-indicator`
	
	return ReactModule.createElement(ViewModule, {
		tag = "auto-x",
		ZIndex = 3,
		Size = UDim2.fromOffset(0, StatusIndicatorSizeModule1),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(_Vector2.X, StatusIndicatorSizeModule1 / 2, _Vector2.Y, 0)
	}, {
		Indicator = if Indicator.value == nil then ReactModule.createElement(StatusIndicatorModule, {
			variant = Indicator.variant or StatusIndicatorVariantModule.Emphasis,
			size = Medium,
			mask = Mask,
			testId = IndicatorName
		}) else ReactModule.createElement(StatusIndicatorModule, {
			value = Indicator.value,
			max = Indicator.max,
			variant = Indicator.variant or StatusIndicatorVariantModule.Emphasis,
			size = Medium,
			mask = Mask,
			testId = IndicatorName
		})
	})
end)