local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local constantsModule = require(foundation.Constants)
local components = foundation.Components
local internalInputModule = require(components.InternalInput)
local knobModule = require(components.Knob)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local _ = require(components.Types)
local useUncontrolledStateModule = require(components.InternalInput.useUncontrolledState)
local builderIconsModule = require(parent.BuilderIcons)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Enums.ControlState)
local useToggleVariantsModule = require(script.Parent.useToggleVariants)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputLabelSize)
local inputPlacementModule = require(foundation.Enums.InputPlacement)
local flagsModule = require(foundation.Utility.Flags)
local useInputGroupDefaultsModule = require(components.InternalInputGroup.useInputGroupDefaults)
local t = { frequency = 4 }
local t_1 = {
	Selectable = true,
	testId = "--foundation-toggle",
	size = inputSizeModule.Medium,
	placement = inputPlacementModule.Start
}
local t_2 = { colorNamespace = colorNamespaceModule.Color }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 70 | named "Toggle" ]]
	-- upvalues: flagsModule (ref), useInputGroupDefaultsModule (ref), t_1 (ref), withDefaultsModule (ref), useTokensModule (ref), useToggleVariantsModule (ref), useUncontrolledStateModule (ref), inputSizeModule (ref), reactModule (ref), otterModule (ref), t (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), presentationContextModule (ref), t_2 (ref), knobModule (ref), builderIconsModule (ref)
	local var21 = if flagsModule.FoundationInputGroup then useInputGroupDefaultsModule(p0, t_1) else withDefaultsModule(p0, t_1)
	local var22 = useToggleVariantsModule(useTokensModule(), var21.size)
	local var23, var24 = useUncontrolledStateModule(var21.isChecked, var21.onActivated)
	local var25 = if var21.size == inputSizeModule.Large then inputSizeModule.Medium else var21.size
	local var26 = if var23 then 1 else 0
	local var27, var28 = reactModule.useBinding(var26)
	local var29 = reactModule.useRef(nil)
	local var30 = var27:map(function(p2) --[[ line: 85 ]]
		-- upvalues: var22 (ref)
		return var22.knob.offPosition:Lerp(var22.knob.onPosition, p2)
	end)
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: otterModule (copy), var26 (ref), var29 (ref), var28 (ref)
		local var31 = otterModule.createSingleMotor(var26)
		var29.current = var31
		var31:start()
		var31:onStep(function(p3) --[[ line: 94 ]]
			-- upvalues: var28 (copy)
			var28(p3)
		end)
		
		return function() --[[ line: 98 ]]
			-- upvalues: var31 (ref)
			var31:destroy()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: var23 (ref), var29 (ref), otterModule (copy), t (copy)
		local var32 = if var23 then 1 else 0
		
		if var29.current then
			var29.current:setGoal(otterModule.spring(var32, t))
		end
	end, { var23 })
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var21, {
		isChecked = var23,
		isDisabled = var21.isDisabled,
		onActivated = var24,
		label = {
			text = var21.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var21.placement],
			hint = if flagsModule.FoundationToggleBetaUpdate then var21.hint else nil
		},
		customVariantProps = var22.input,
		size = var21.size,
		Selectable = var21.Selectable,
		NextSelectionUp = var21.NextSelectionUp,
		NextSelectionDown = var21.NextSelectionDown,
		NextSelectionLeft = var21.NextSelectionLeft,
		NextSelectionRight = var21.NextSelectionRight,
		ref = p1
	}), reactModule.createElement(presentationContextModule.Provider, { value = t_2 }, {
		Knob = reactModule.createElement(knobModule, {
			hasShadow = false,
			size = var25,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = var30,
			icon = if var23 then {
				name = builderIconsModule.Icon.Check,
				variant = builderIconsModule.IconVariant.Regular
			} else nil,
			testId = `{var21.testId}--knob`
		})
	}))
end))