local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local _ = require(Foundation.Components.Types)
local BlendColorsModule = require(Foundation.Utility.blendColors)
local GetStateLayerStyleModule = require(Foundation.Components.Interactable.getStateLayerStyle)
local GetStatusIndicatorMaskWidthModule = require(Foundation.Components.StatusIndicator.getStatusIndicatorMaskWidth)
local GetStatusIndicatorSizeModule = require(Foundation.Components.StatusIndicator.getStatusIndicatorSize)
local JoinBindablesModule = require(Foundation.Utility.joinBindables)
local UseIconButtonIndicatorVariantsModule = require(script.Parent.useIconButtonIndicatorVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local _ = require(Foundation.Enums.ControlState)
local IconButtonIndicatorTypeModule = require(Foundation.Enums.IconButtonIndicatorType)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.StateLayerMode)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensModule (copy), ButtonVariantModule (copy), IconButtonIndicatorTypeModule (copy), InputSizeModule (copy), UseIconButtonIndicatorVariantsModule (copy), GetStatusIndicatorSizeModule (copy), GetStatusIndicatorMaskWidthModule (copy), ReactModule (copy), JoinBindablesModule (copy), BlendColorsModule (copy), GetStateLayerStyleModule (copy), StatusIndicatorModule (copy), StatusIndicatorVariantModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Indicator = p1.indicator
	local IsNotButtonVariantMatch = p1.buttonVariant ~= ButtonVariantModule.Utility
	local IsButtonVariantMatch = if Indicator.isOverMedia == nil then p1.buttonVariant == ButtonVariantModule.OverMedia else Indicator.isOverMedia
	local Type = Indicator.type or IconButtonIndicatorTypeModule.Activity
	local Value = if Type == IconButtonIndicatorTypeModule.Activity and (p1.buttonSize == InputSizeModule.Medium or p1.buttonSize == InputSizeModule.Large) then Indicator.value else nil
	local UseIconButtonIndicatorVariantsModuleResult = UseIconButtonIndicatorVariantsModule(UseTokensModuleResult, p1.buttonSize, IsNotButtonVariantMatch, p1.isCircular, Type, Value ~= nil, IsButtonVariantMatch)
	local Rounded = math.round(UseIconButtonIndicatorVariantsModuleResult.offset)
	local NewStatusIndicatorSizeModule = GetStatusIndicatorSizeModule(UseTokensModuleResult, UseIconButtonIndicatorVariantsModuleResult.size, Value ~= nil) / 2 + GetStatusIndicatorMaskWidthModule(UseTokensModuleResult)
	local Smallest = math.min(p1.buttonRadius, p1.buttonHalfSize)
	local NewButtonHalfSize = (p1.buttonHalfSize - Smallest) * 1.4142135623730951 + Smallest
	local IsNewButtonHalfSizeAbove: boolean = Rounded + NewStatusIndicatorSizeModule <= p1.buttonHalfSize and NewButtonHalfSize >= Rounded * 1.4142135623730951 + NewStatusIndicatorSizeModule
	local ControlState = if IsNotButtonVariantMatch or not IsNewButtonHalfSizeAbove then nil else p1.controlState
	local Mask = if IsButtonVariantMatch then nil else Indicator.mask or UseTokensModuleResult.Color.Surface.Surface_0
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Mask (copy), ControlState (copy), JoinBindablesModule (upval), p1 (copy), BlendColorsModule (upval), GetStateLayerStyleModule (upval), UseTokensModuleResult (copy)
		return if Mask == nil or ControlState == nil then Mask else JoinBindablesModule({
			mask = Mask,
			state = ControlState,
			mode = p1.stateLayerMode
		}, function(p2)
			-- upvalues: BlendColorsModule (upval), GetStateLayerStyleModule (upval), UseTokensModuleResult (upval)
			return BlendColorsModule(p2.mask, GetStateLayerStyleModule(UseTokensModuleResult, p2.mode, p2.state))
		end)
	end, {
		UseTokensModuleResult,
		Mask,
		ControlState,
		p1.stateLayerMode
	})
	local _Vector2 = Vector2.new(0.5, 0.5)
	local _UDim2 = UDim2.new(0.5, Rounded, 0.5, Rounded * UseIconButtonIndicatorVariantsModuleResult.verticalDirection)
	local IndicatorName: string = `{p1.testId}--indicator`
	
	return if Value == nil then ReactModule.createElement(StatusIndicatorModule, {
		ZIndex = 2,
		variant = StatusIndicatorVariantModule.Emphasis,
		size = UseIconButtonIndicatorVariantsModuleResult.size,
		mask = UseMemoResult,
		AnchorPoint = _Vector2,
		Position = _UDim2,
		testId = IndicatorName
	}) else ReactModule.createElement(StatusIndicatorModule, {
		ZIndex = 2,
		value = Value,
		max = Indicator.max,
		variant = StatusIndicatorVariantModule.Emphasis,
		size = UseIconButtonIndicatorVariantsModuleResult.size,
		mask = UseMemoResult,
		AnchorPoint = _Vector2,
		Position = _UDim2,
		testId = IndicatorName
	})
end)