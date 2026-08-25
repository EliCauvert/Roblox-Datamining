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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: flagsModule (ref), useInputGroupDefaultsModule (ref), t_1 (ref), withDefaultsModule (ref), useTokensModule (ref), useToggleVariantsModule (ref), useUncontrolledStateModule (ref), inputSizeModule (ref), reactModule (ref), otterModule (ref), t (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), presentationContextModule (ref), t_2 (ref), knobModule (ref), builderIconsModule (ref)
	local var1 = if flagsModule.FoundationInputGroup then useInputGroupDefaultsModule(p1, t_1) else withDefaultsModule(p1, t_1)
	local var2 = useToggleVariantsModule(useTokensModule(), var1.size)
	local var3, var4 = useUncontrolledStateModule(var1.isChecked, var1.onActivated)
	local var5 = if var1.size == inputSizeModule.Large then inputSizeModule.Medium else var1.size
	local var6 = if var3 then 1 else 0
	local var7, var8 = reactModule.useBinding(var6)
	local var9 = reactModule.useRef(nil)
	local var10 = var7:map(function(p1)
		-- upvalues: var2 (ref)
		return var2.knob.offPosition:Lerp(var2.knob.onPosition, p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: otterModule (copy), var6 (ref), var9 (ref), var8 (ref)
		local var1 = otterModule.createSingleMotor(var6)
		var9.current = var1
		var1:start()
		var1:onStep(function(p1)
			-- upvalues: var8 (copy)
			var8(p1)
		end)
		
		return function()
			-- upvalues: var1 (ref)
			var1:destroy()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var9 (ref), otterModule (copy), t (copy)
		local var1 = if var3 then 1 else 0
		
		if var9.current then
			var9.current:setGoal(otterModule.spring(var1, t))
		end
	end, { var3 })
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var1, {
		isChecked = var3,
		isDisabled = var1.isDisabled,
		onActivated = var4,
		label = {
			text = var1.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var1.placement],
			hint = if flagsModule.FoundationToggleBetaUpdate then var1.hint else nil
		},
		customVariantProps = var2.input,
		size = var1.size,
		Selectable = var1.Selectable,
		NextSelectionUp = var1.NextSelectionUp,
		NextSelectionDown = var1.NextSelectionDown,
		NextSelectionLeft = var1.NextSelectionLeft,
		NextSelectionRight = var1.NextSelectionRight,
		ref = p2
	}), reactModule.createElement(presentationContextModule.Provider, { value = t_2 }, {
		Knob = reactModule.createElement(knobModule, {
			hasShadow = false,
			size = var5,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = var10,
			icon = if var3 then {
				name = builderIconsModule.Icon.Check,
				variant = builderIconsModule.IconVariant.Regular
			} else nil,
			testId = `{var1.testId}--knob`
		})
	}))
end))