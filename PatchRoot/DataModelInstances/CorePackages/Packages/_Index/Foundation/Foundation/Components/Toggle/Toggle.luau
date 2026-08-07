-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

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
local flagsModule = require(foundation.Utility.Flags)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Enums.ControlState)
local useToggleVariantsModule = require(script.Parent.useToggleVariants)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputLabelSize)
local t = { frequency = 4 }
local t_1 = {
	Selectable = true,
	testId = "--foundation-toggle",
	size = inputSizeModule.Medium,
	placement = require(foundation.Enums.InputPlacement).Start
}
local t_2 = { colorNamespace = colorNamespaceModule.Color }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 66 | named "Toggle" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useToggleVariantsModule (ref), useUncontrolledStateModule (ref), flagsModule (ref), inputSizeModule (ref), reactModule (ref), otterModule (ref), t (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), presentationContextModule (ref), t_2 (ref), knobModule (ref), builderIconsModule (ref)
	local var19 = withDefaultsModule(p0, t_1)
	local var20 = useToggleVariantsModule(useTokensModule(), var19.size)
	local var21, var22 = useUncontrolledStateModule(var19.isChecked, var19.onActivated)
	local var23 = if flagsModule.FoundationToggleVisualUpdate then if p0.size == inputSizeModule.Large then inputSizeModule.Medium else var19.size else var19.size
	local var24 = if flagsModule.FoundationToggleVisualUpdate then false else true
	local var25 = if var21 then 1 else 0
	local var26, var27 = reactModule.useBinding(var25)
	local var28 = reactModule.useRef(nil)
	local var29 = var26:map(function(p2) --[[ line: 82 ]]
		-- upvalues: var20 (ref)
		return var20.knob.offPosition:Lerp(var20.knob.onPosition, p2)
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
		-- upvalues: var21 (ref), var28 (ref), otterModule (copy), t (copy)
		local var31 = if var21 then 1 else 0
		
		if var28.current then
			var28.current:setGoal(otterModule.spring(var31, t))
		end
	end, { var21 })
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var19, {
		isChecked = var21,
		isDisabled = var19.isDisabled,
		onActivated = var22,
		label = {
			text = var19.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var19.placement]
		},
		customVariantProps = var20.input,
		size = var19.size,
		Selectable = var19.Selectable,
		NextSelectionUp = var19.NextSelectionUp,
		NextSelectionDown = var19.NextSelectionDown,
		NextSelectionLeft = var19.NextSelectionLeft,
		NextSelectionRight = var19.NextSelectionRight,
		ref = p1
	}), reactModule.createElement(presentationContextModule.Provider, { value = t_2 }, {
		Knob = if flagsModule.FoundationToggleVisualUpdate then reactModule.createElement(knobModule, {
			size = var23,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = var29,
			hasShadow = var24,
			icon = if var21 then {
				name = builderIconsModule.Icon.Check,
				variant = builderIconsModule.IconVariant.Regular
			} else nil,
			testId = `{var19.testId}--knob`
		}) else reactModule.createElement(knobModule, {
			size = var23,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = var29,
			testId = `{var19.testId}--knob`
		})
	}))
end))