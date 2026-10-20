local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local FlagsModule = require(Foundation.Utility.Flags)
local UseMotionFunction = require(Parent.Motion).useMotion
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local InputLabelModule = require(Components.InputLabel)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local UseInputMotionStatesModule = require(script.Parent.useInputMotionStates)
local UseInputVariantsModule = require(script.Parent.useInputVariants)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ConstantsModule = require(Foundation.Constants)
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Providers.Style.Tokens)
local config = {
	Selectable = true,
	testId = "--foundation-internal-input",
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseTokensModule (copy), UseInputVariantsModule (copy), UseInputMotionStatesModule (copy), FlagsModule (copy), UseMotionFunction (copy), ControlStateModule (copy), ConstantsModule (copy), StateLayerAffordanceModule (copy), ViewModule (copy), WithCommonPropsModule (copy), DashModule (copy), InputLabelModule (copy), GetInputTextSizeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Text = WithDefaultsModuleResult.label.text
	local Position = WithDefaultsModuleResult.label.position or Enum.HorizontalAlignment.Right
	local HasText: boolean = if typeof(Text) == "string" then #Text > 0 else Text ~= nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTokensModuleResult = UseTokensModule()
	local IsChecked = WithDefaultsModuleResult.isChecked or WithDefaultsModuleResult.isIndeterminate
	local UseInputVariantsModuleResult = UseInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, Position)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseTokensModuleResult (copy)
		return {
			radius = WithDefaultsModuleResult.customVariantProps.cursorRadius or UDim.new(0, 0),
			offset = UseTokensModuleResult.Size.Size_200,
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, {
		UseTokensModuleResult,
		HasText,
		WithDefaultsModuleResult.customVariantProps.cursorRadius
	})
	local UseInputMotionStatesModuleResult = UseInputMotionStatesModule(UseTokensModuleResult, if FlagsModule.FoundationToggleVisualUpdate then WithDefaultsModuleResult.customVariantProps.colors else WithDefaultsModuleResult.customVariantProps.checkedStyle)
	local UseMotionResult, UseMotionResult2 = UseMotionFunction(UseInputMotionStatesModuleResult.Default)
	ReactModule.useEffect(function()
		-- upvalues: IsChecked (copy), UseMotionResult2 (copy), UseInputMotionStatesModuleResult (copy), UseStateResult (copy)
		if IsChecked then
			UseMotionResult2(UseInputMotionStatesModuleResult.Checked)
			
			return
		end
		if UseStateResult then
			UseMotionResult2(UseInputMotionStatesModuleResult.Hover)
			
			return
		else
			UseMotionResult2(UseInputMotionStatesModuleResult.Default)
		end
	end, {
		IsChecked,
		UseStateResult,
		UseInputMotionStatesModuleResult
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		if not WithDefaultsModuleResult.isDisabled then
			WithDefaultsModuleResult.onActivated(not WithDefaultsModuleResult.isChecked)
			
			return
		end
	end, {
		WithDefaultsModuleResult.isDisabled,
		WithDefaultsModuleResult.isChecked,
		WithDefaultsModuleResult.onActivated
	})
	local Selection = {
		Selectable = not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable,
		NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
		NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
		NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
		NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
	}
	local config1 = {
		Active = not WithDefaultsModuleResult.isDisabled,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else 0,
		onActivated = UseResult,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), ControlStateModule (upval)
			UseStateResult2(Hover == ControlStateModule.Hover)
		end, {}),
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		selection = if HasText then { Selectable = false } else Selection,
		cursor = if HasText then nil else UseMemoResult,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		ref = Ref
	}
	local Thickness = if FlagsModule.FoundationToggleVisualUpdate and WithDefaultsModuleResult.customVariantProps.stroke and WithDefaultsModuleResult.customVariantProps.stroke.thickness ~= nil then WithDefaultsModuleResult.customVariantProps.stroke.thickness else UseInputVariantsModuleResult.input.stroke.thickness
	local config2 = {
		tag = WithDefaultsModuleResult.customVariantProps.tag,
		Size = WithDefaultsModuleResult.customVariantProps.size - UDim2.fromOffset(Thickness, Thickness),
		backgroundStyle = UseMotionResult.backgroundStyle,
		onActivated = UseResult,
		stateLayer = { affordance = StateLayerAffordanceModule.Background },
		stroke = {
			Color = UseMotionResult.strokeStyle:map(function(p2)
				return p2.Color3
			end),
			Transparency = UseMotionResult.strokeStyle:map(function(p2)
				-- upvalues: WithDefaultsModuleResult (copy), HasText (copy), ConstantsModule (upval)
				return if WithDefaultsModuleResult.isDisabled and not HasText then ConstantsModule.DISABLED_TRANSPARENCY else p2.Transparency
			end),
			Thickness = Thickness,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		},
		selection = Selection,
		cursor = if HasText then UseMemoResult else nil,
		LayoutOrder = if HasText then if Position == Enum.HorizontalAlignment.Left then 1 else -1 else nil,
		testId = `{WithDefaultsModuleResult.testId}--container`
	}
	
	return if HasText then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, DashModule.union({
		tag = UseInputVariantsModuleResult.container.tag,
		padding = {
			top = UseInputVariantsModuleResult.container.padding,
			bottom = UseInputVariantsModuleResult.container.padding,
			left = if Position == Enum.HorizontalAlignment.Right then UseInputVariantsModuleResult.container.padding else nil,
			right = if Position == Enum.HorizontalAlignment.Left then UseInputVariantsModuleResult.container.padding else nil
		}
	}, config1)), {
		Input = ReactModule.createElement(ViewModule, config2, WithDefaultsModuleResult.children),
		InputLabel = if typeof(Text) == "string" then ReactModule.createElement(InputLabelModule, {
			Text = Text,
			textStyle = UseMotionResult.labelStyle,
			size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
			testId = `{WithDefaultsModuleResult.testId}--label`
		}) else Text
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, DashModule.union(config1, config2)), WithDefaultsModuleResult.children)
end))