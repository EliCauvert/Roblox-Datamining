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
local FlagsModule = require(Foundation.Utility.Flags)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.ControlState)
local UseToggleVariantsModule = require(script.Parent.useToggleVariants)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.InputLabelSize)
local config = { frequency = 4 }
local config1 = {
	Selectable = true,
	testId = "--foundation-toggle",
	size = InputSizeModule.Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}
local config2 = { colorMode = require(Foundation.Enums.ColorMode).Color }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTokensModule (copy), UseToggleVariantsModule (copy), UseUncontrolledStateModule (copy), FlagsModule (copy), InputSizeModule (copy), ReactModule (copy), OtterModule (copy), config (copy), InternalInputModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), PresentationContextModule (copy), config2 (copy), KnobModule (copy), BuilderIconsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseToggleVariantsModuleResult = UseToggleVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size)
	local UseUncontrolledStateModuleResult, UseUncontrolledStateModuleResult2 = UseUncontrolledStateModule(WithDefaultsModuleResult.isChecked, WithDefaultsModuleResult.onActivated)
	local Medium = if FlagsModule.FoundationToggleVisualUpdate and p1.size == InputSizeModule.Large then InputSizeModule.Medium else WithDefaultsModuleResult.size
	local NoFoundationToggleVisualUpdate = not FlagsModule.FoundationToggleVisualUpdate
	local v1: number = if UseUncontrolledStateModuleResult then 1 else 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(v1)
	local UseRefResult = ReactModule.useRef(nil)
	local MapResult = UseBindingResult:map(function(Alpha)
		-- upvalues: UseToggleVariantsModuleResult (copy)
		return UseToggleVariantsModuleResult.knob.offPosition:Lerp(UseToggleVariantsModuleResult.knob.onPosition, Alpha)
	end)
	ReactModule.useEffect(function()
		-- upvalues: OtterModule (upval), v1 (copy), UseRefResult (copy), UseBindingResult2 (copy)
		local SingleMotor = OtterModule.createSingleMotor(v1)
		UseRefResult.current = SingleMotor
		SingleMotor:start()
		SingleMotor:onStep(function(p2)
			-- upvalues: UseBindingResult2 (upval)
			UseBindingResult2(p2)
		end)
		
		return function()
			-- upvalues: SingleMotor (copy)
			SingleMotor:destroy()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseUncontrolledStateModuleResult (copy), UseRefResult (copy), OtterModule (upval), config (upval)
		local v2: number = if UseUncontrolledStateModuleResult then 1 else 0
		
		if UseRefResult.current then
			UseRefResult.current:setGoal(OtterModule.spring(v2, config))
		end
	end, { UseUncontrolledStateModuleResult })
	
	return ReactModule.createElement(InternalInputModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isChecked = UseUncontrolledStateModuleResult,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		onActivated = UseUncontrolledStateModuleResult2,
		label = {
			text = WithDefaultsModuleResult.label,
			position = ConstantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[WithDefaultsModuleResult.placement]
		},
		customVariantProps = UseToggleVariantsModuleResult.input,
		size = WithDefaultsModuleResult.size,
		Selectable = WithDefaultsModuleResult.Selectable,
		NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
		NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
		NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
		NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight,
		ref = Ref
	}), ReactModule.createElement(PresentationContextModule.Provider, { value = config2 }, {
		Knob = if FlagsModule.FoundationToggleVisualUpdate then ReactModule.createElement(KnobModule, {
			size = Medium,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = MapResult,
			hasShadow = NoFoundationToggleVisualUpdate,
			icon = if UseUncontrolledStateModuleResult then {
				name = BuilderIconsModule.Icon.Check,
				variant = BuilderIconsModule.IconVariant.Regular
			} else nil,
			testId = `{WithDefaultsModuleResult.testId}--knob`
		}) else ReactModule.createElement(KnobModule, {
			size = Medium,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = MapResult,
			testId = `{WithDefaultsModuleResult.testId}--knob`
		})
	}))
end))