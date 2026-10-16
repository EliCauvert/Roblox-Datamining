local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local Components = Foundation.Components
local InternalInputModule = require(Components.InternalInput)
local KnobModule = require(Components.Knob)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local _ = require(Components.Types)
local UseUncontrolledStateModule = require(Components.InternalInput.useUncontrolledState)
local BuilderIconsModule = require(Parent.BuilderIcons)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local _ = require(Foundation.Enums.ControlState)
local UseToggleVariantsModule = require(script.Parent.useToggleVariants)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.InputLabelSize)
local UseInputGroupDefaultsModule = require(Components.InternalInputGroup.useInputGroupDefaults)
local config = { frequency = 4 }
local config1 = {
	Selectable = true,
	testId = "--foundation-toggle",
	size = InputSizeModule.Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}
local config2 = {
	colorNamespace = require(Foundation.Enums.ColorNamespace).Color
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 68 | Named "Toggle" ]]
	-- upvalues: UseInputGroupDefaultsModule (copy), config1 (copy), UseTokensModule (copy), UseToggleVariantsModule (copy), UseUncontrolledStateModule (copy), InputSizeModule (copy), ReactModule (copy), OtterModule (copy), config (copy), InternalInputModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), PresentationContextModule (copy), config2 (copy), KnobModule (copy), BuilderIconsModule (copy)
	local UseInputGroupDefaultsModuleResult = UseInputGroupDefaultsModule(p1, config1)
	local UseToggleVariantsModuleResult = UseToggleVariantsModule(UseTokensModule(), UseInputGroupDefaultsModuleResult.size)
	local UseUncontrolledStateModuleResult, UseUncontrolledStateModuleResult2 = UseUncontrolledStateModule(UseInputGroupDefaultsModuleResult.isChecked, UseInputGroupDefaultsModuleResult.onActivated)
	local Medium = if UseInputGroupDefaultsModuleResult.size == InputSizeModule.Large then InputSizeModule.Medium else UseInputGroupDefaultsModuleResult.size
	local v1: number = if UseUncontrolledStateModuleResult then 1 else 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(v1)
	local UseRefResult = ReactModule.useRef(nil)
	local MapResult = UseBindingResult:map(function(Alpha) --[[ Line: 81 ]]
		-- upvalues: UseToggleVariantsModuleResult (copy)
		return UseToggleVariantsModuleResult.knob.offPosition:Lerp(UseToggleVariantsModuleResult.knob.onPosition, Alpha)
	end)
	ReactModule.useEffect(function() --[[ Line: 85 ]]
		-- upvalues: OtterModule (upval), v1 (copy), UseRefResult (copy), UseBindingResult2 (copy)
		local SingleMotor = OtterModule.createSingleMotor(v1)
		UseRefResult.current = SingleMotor
		SingleMotor:start()
		SingleMotor:onStep(function(p2) --[[ Line: 90 ]]
			-- upvalues: UseBindingResult2 (upval)
			UseBindingResult2(p2)
		end)
		
		return function() --[[ Line: 94 ]]
			-- upvalues: SingleMotor (copy)
			SingleMotor:destroy()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 99 ]]
		-- upvalues: UseUncontrolledStateModuleResult (copy), UseRefResult (copy), OtterModule (upval), config (upval)
		local v2: number = if UseUncontrolledStateModuleResult then 1 else 0
		
		if UseRefResult.current then
			UseRefResult.current:setGoal(OtterModule.spring(v2, config))
		end
	end, { UseUncontrolledStateModuleResult })
	
	return ReactModule.createElement(InternalInputModule, WithCommonPropsModule(UseInputGroupDefaultsModuleResult, {
		isChecked = UseUncontrolledStateModuleResult,
		isDisabled = UseInputGroupDefaultsModuleResult.isDisabled,
		onActivated = UseUncontrolledStateModuleResult2,
		label = {
			text = UseInputGroupDefaultsModuleResult.label,
			position = ConstantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[UseInputGroupDefaultsModuleResult.placement],
			hint = UseInputGroupDefaultsModuleResult.hint
		},
		customVariantProps = UseToggleVariantsModuleResult.input,
		size = UseInputGroupDefaultsModuleResult.size,
		Selectable = UseInputGroupDefaultsModuleResult.Selectable,
		NextSelectionUp = UseInputGroupDefaultsModuleResult.NextSelectionUp,
		NextSelectionDown = UseInputGroupDefaultsModuleResult.NextSelectionDown,
		NextSelectionLeft = UseInputGroupDefaultsModuleResult.NextSelectionLeft,
		NextSelectionRight = UseInputGroupDefaultsModuleResult.NextSelectionRight,
		ref = Ref
	}), ReactModule.createElement(PresentationContextModule.Provider, { value = config2 }, {
		Knob = ReactModule.createElement(KnobModule, {
			hasShadow = false,
			size = Medium,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = MapResult,
			icon = if UseUncontrolledStateModuleResult then {
				name = BuilderIconsModule.Icon.Check,
				variant = BuilderIconsModule.IconVariant.Regular
			} else nil,
			testId = `{UseInputGroupDefaultsModuleResult.testId}--knob`
		})
	}))
end))