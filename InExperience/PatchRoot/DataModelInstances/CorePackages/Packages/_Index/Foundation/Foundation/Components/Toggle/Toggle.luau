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
local t = { frequency = 4 }
local t_1 = {
	Selectable = true,
	testId = "--foundation-toggle",
	size = inputSizeModule.Medium,
	placement = inputPlacementModule.Start
}
local t_2 = { colorNamespace = colorNamespaceModule.Color }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 69 | named "Toggle" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useToggleVariantsModule (ref), useUncontrolledStateModule (ref), inputSizeModule (ref), reactModule (ref), otterModule (ref), t (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), flagsModule (ref), presentationContextModule (ref), t_2 (ref), knobModule (ref), builderIconsModule (ref)
	local var20 = withDefaultsModule(p0, t_1)
	local var21 = useToggleVariantsModule(useTokensModule(), var20.size)
	local var22, var23 = useUncontrolledStateModule(var20.isChecked, var20.onActivated)
	local var24 = if p0.size == inputSizeModule.Large then inputSizeModule.Medium else var20.size
	local var25 = if var22 then 1 else 0
	local var26, var27 = reactModule.useBinding(var25)
	local var28 = reactModule.useRef(nil)
	local var29 = var26:map(function(p2) --[[ line: 82 ]]
		-- upvalues: var21 (ref)
		return var21.knob.offPosition:Lerp(var21.knob.onPosition, p2)
	end)
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: otterModule (copy), var25 (ref), var28 (ref), var27 (ref)
		local var30 = otterModule.createSingleMotor(var25)
		var28.current = var30
		var30:start()
		var30:onStep(function(p3) --[[ line: 91 ]]
			-- upvalues: var27 (copy)
			var27(p3)
		end)
		
		return function() --[[ line: 95 ]]
			-- upvalues: var30 (ref)
			var30:destroy()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 100 ]]
		-- upvalues: var22 (ref), var28 (ref), otterModule (copy), t (copy)
		local var31 = if var22 then 1 else 0
		
		if var28.current then
			var28.current:setGoal(otterModule.spring(var31, t))
		end
	end, { var22 })
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var20, {
		isChecked = var22,
		isDisabled = var20.isDisabled,
		onActivated = var23,
		label = {
			text = var20.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var20.placement],
			hint = if flagsModule.FoundationToggleBetaUpdate then var20.hint else nil
		},
		customVariantProps = var21.input,
		size = var20.size,
		Selectable = var20.Selectable,
		NextSelectionUp = var20.NextSelectionUp,
		NextSelectionDown = var20.NextSelectionDown,
		NextSelectionLeft = var20.NextSelectionLeft,
		NextSelectionRight = var20.NextSelectionRight,
		ref = p1
	}), reactModule.createElement(presentationContextModule.Provider, { value = t_2 }, {
		Knob = reactModule.createElement(knobModule, {
			hasShadow = false,
			size = var24,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = var29,
			icon = if var22 then {
				name = builderIconsModule.Icon.Check,
				variant = builderIconsModule.IconVariant.Regular
			} else nil,
			testId = `{var20.testId}--knob`
		})
	}))
end))