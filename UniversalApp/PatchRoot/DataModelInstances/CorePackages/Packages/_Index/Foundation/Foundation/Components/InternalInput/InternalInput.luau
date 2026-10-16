local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local UseMotionFunction = require(Parent.Motion).useMotion
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local InputLabelModule = require(Components.InputLabel)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local InputHintModule = require(script.Parent.InputHint)
local UseInputMotionStatesModule = require(script.Parent.useInputMotionStates)
local UseInputVariantsModule = require(script.Parent.useInputVariants)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Providers.Style.Tokens)
local config = {
	Selectable = true,
	testId = "--foundation-internal-input",
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 81 | Named "InternalInput" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseInputVariantsModule (copy), ReactModule (copy), UseInputMotionStatesModule (copy), UseMotionFunction (copy), ConstantsModule (copy), StateLayerAffordanceModule (copy), ViewModule (copy), WithCommonPropsModule (copy), DashModule (copy), InputLabelModule (copy), GetInputTextSizeModule (copy), InputHintModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Text = WithDefaultsModuleResult.label.text
	local Position = WithDefaultsModuleResult.label.position or Enum.HorizontalAlignment.Right
	local HasText: boolean = if typeof(Text) == "string" then #Text > 0 else Text ~= nil
	local UseTokensModuleResult = UseTokensModule()
	local IsChecked = WithDefaultsModuleResult.isChecked or WithDefaultsModuleResult.isIndeterminate
	local UseInputVariantsModuleResult = UseInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, Position)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 93 ]]
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
	local UseInputMotionStatesModuleResult = UseInputMotionStatesModule(UseTokensModuleResult, WithDefaultsModuleResult.customVariantProps.colors)
	local UseMotionResult, UseMotionResult2 = UseMotionFunction(UseInputMotionStatesModuleResult.Default)
	ReactModule.useEffect(function() --[[ Line: 105 ]]
		-- upvalues: IsChecked (copy), UseMotionResult2 (copy), UseInputMotionStatesModuleResult (copy)
		if IsChecked then
			UseMotionResult2(UseInputMotionStatesModuleResult.Checked)
			
			return
		else
			UseMotionResult2(UseInputMotionStatesModuleResult.Default)
		end
	end, { IsChecked, UseInputMotionStatesModuleResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 113 ]]
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
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		selection = if HasText then { Selectable = false } else Selection,
		cursor = if HasText then nil else UseMemoResult,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		ref = Ref
	}
	local Thickness = if WithDefaultsModuleResult.customVariantProps.stroke and WithDefaultsModuleResult.customVariantProps.stroke.thickness ~= nil then WithDefaultsModuleResult.customVariantProps.stroke.thickness else UseInputVariantsModuleResult.input.stroke.thickness
	local config2 = {
		tag = WithDefaultsModuleResult.customVariantProps.tag,
		Size = WithDefaultsModuleResult.customVariantProps.size - UDim2.fromOffset(Thickness, Thickness),
		backgroundStyle = UseMotionResult.backgroundStyle,
		onActivated = UseResult,
		stateLayer = ReactModule.useMemo(function() --[[ Line: 144 ]]
			-- upvalues: StateLayerAffordanceModule (upval)
			return {
				inset = nil,
				mode = nil,
				affordance = StateLayerAffordanceModule.None
			}
		end, {}),
		stroke = {
			Color = UseMotionResult.strokeStyle:map(function(p2) --[[ Line: 156 ]]
				return p2.Color3
			end),
			Transparency = UseMotionResult.strokeStyle:map(function(p2) --[[ Line: 159 ]]
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
	
	if HasText then
		local Element = if typeof(Text) == "string" then ReactModule.createElement(InputLabelModule, {
			Text = Text,
			textStyle = UseMotionResult.labelStyle,
			size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
			testId = `{WithDefaultsModuleResult.testId}--label`
		}) else Text
		
		return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, DashModule.union({
			tag = UseInputVariantsModuleResult.container.tag,
			padding = {
				top = UseInputVariantsModuleResult.container.padding,
				bottom = UseInputVariantsModuleResult.container.padding,
				left = if Position == Enum.HorizontalAlignment.Right then UseInputVariantsModuleResult.container.padding else nil,
				right = if Position == Enum.HorizontalAlignment.Left then UseInputVariantsModuleResult.container.padding else nil
			}
		}, config1)), {
			Input = ReactModule.createElement(ViewModule, config2, WithDefaultsModuleResult.children),
			InputLabel = if WithDefaultsModuleResult.label.hint == nil or WithDefaultsModuleResult.label.hint == "" then Element else ReactModule.createElement(ViewModule, { tag = "col gap-xxsmall auto-xy" }, {
				InputLabel = Element,
				Hint = ReactModule.createElement(InputHintModule, {
					LayoutOrder = 2,
					text = WithDefaultsModuleResult.label.hint,
					size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
					testId = `{WithDefaultsModuleResult.testId}--hint`
				})
			})
		})
	else
		return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, DashModule.union(config1, config2)), WithDefaultsModuleResult.children)
	end
end))