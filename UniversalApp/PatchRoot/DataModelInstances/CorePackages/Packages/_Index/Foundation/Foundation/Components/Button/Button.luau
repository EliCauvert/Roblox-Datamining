local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local motionModule = require(parent.Motion)
local useMotion = motionModule.useMotion
local animatePresence = motionModule.AnimatePresence
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local inputSizeModule = require(foundation.Enums.InputSize)
local spinnerModule = require(script.Parent.Spinner)
local endAlignedIconsModule = require(script.Parent.endAlignedIcons)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local controlStateModule = require(foundation.Enums.ControlState)
local buttonIconModule = require(script.Parent.ButtonIcon)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useButtonMotionStatesModule = require(script.Parent.useButtonMotionStates)
local useButtonVariantsModule = require(script.Parent.useButtonVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local t = {
	[buttonVariantModule.Link] = {
		format = "<u>%s</u>",
		controlState = { controlStateModule.Hover, controlStateModule.Pressed }
	}
}

local function onProgressChange(p0) --[[ line: 52 ]]
	-- upvalues: constantsModule (ref)
	return NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(math.max(0, p0 - 0.0001), 0),
		NumberSequenceKeypoint.new(math.min(1, p0 + 0.0001), constantsModule.DISABLED_TRANSPARENCY),
		NumberSequenceKeypoint.new(1, constantsModule.DISABLED_TRANSPARENCY)
	})
end

local function _(p1, p2) --[[ line: 61 | named "getTransparency" ]]
	return p2:map(function(p3) --[[ line: 65 ]]
		-- upvalues: p1 (ref)
		return if p1 == nil then p3 else p1 + (1 - p1) * p3
	end)
end

local t_1 = {
	isDisabled = false,
	isLoading = false,
	inputDelay = 0,
	testId = "--foundation-button",
	variant = buttonVariantModule.Standard,
	size = inputSizeModule.Medium,
	width = UDim.new(0, 0)
}

return reactModule.memo(reactModule.forwardRef(function(p4, p5) --[[ line: 100 | named "Button" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), reactModule (ref), controlStateModule (ref), reactOtterModule (ref), endAlignedIconsModule (ref), useTokensModule (ref), usePresentationContext (ref), useButtonVariantsModule (ref), useButtonMotionStatesModule (ref), constantsModule (ref), useMotion (ref), t (ref), viewModule (ref), withCommonPropsModule (ref), flagsModule (ref), fillBehaviorModule (ref), animatePresence (ref), spinnerModule (ref), buttonIconModule (ref), textModule (ref), onProgressChange (ref)
	local var43
	local var23 = withDefaultsModule(p4, t_1)
	local inputDelay = var23.inputDelay
	local var24, var25 = reactModule.useBinding(controlStateModule.Initialize)
	local var26, var27 = reactModule.useState(inputDelay > 0)
	local var28, var29 = reactOtterModule.useAnimatedBinding(0, function() --[[ line: 106 ]]
		-- upvalues: var27 (ref)
		var27(false)
	end)
	local icon = var23.icon and endAlignedIconsModule[var23.icon]
	reactModule.useEffect(function() --[[ line: 112 ]]
		-- upvalues: var26 (ref), var29 (ref), reactOtterModule (copy)
		if var26 == false then
			var29(reactOtterModule.instant(0))
		end
	end, { var26 })
	reactModule.useEffect(function() --[[ line: 118 ]]
		-- upvalues: var26 (ref), var27 (ref), inputDelay (ref), var29 (ref), reactOtterModule (copy)
		if var26 then
			var27(false)
		end
		if inputDelay > 0 then
			var27(true)
			var29(reactOtterModule.ease(1, {
				duration = inputDelay,
				easingStyle = Enum.EasingStyle.Quad
			}))
		end
	end, { inputDelay })
	local var31 = useTokensModule()
	local var32 = usePresentationContext()
	local var33 = useButtonVariantsModule(var31, var23.size, var23.variant, if var32 then var32.colorNamespace else nil)
	local var34 = useButtonMotionStatesModule(var33.content.style.Transparency, constantsModule.DISABLED_TRANSPARENCY)
	local var35, var36 = useMotion(var34.Default)
	local var37, var38 = useMotion(var34.Default)
	reactModule.useEffect(function() --[[ line: 147 ]]
		-- upvalues: var23 (ref), var38 (ref), var34 (ref)
		if var23.isLoading then
			var38(var34.Loading)
			
			return
		end
		var38(var34.Default)
	end, { var23.isLoading })
	reactModule.useEffect(function() --[[ line: 155 ]]
		-- upvalues: var23 (ref), var36 (ref), var34 (ref)
		if var23.isDisabled then
			var36(var34.Disabled)
			
			return
		end
		var36(var34.Default)
	end, { var23.isDisabled })
	local var39 = reactModule.useMemo(function() --[[ line: 163 ]]
		-- upvalues: var33 (ref), var31 (ref)
		return {
			radius = UDim.new(0, var33.container.radius),
			offset = var31.Size.Size_200,
			borderWidth = var31.Stroke.Thicker
		}
	end, { var31, var33.container.radius })
	local var40 = var23.text and var23.text ~= ""
	local var41 = reactModule.useCallback(function(p6) --[[ line: 173 ]]
		-- upvalues: t (copy), var23 (ref), var40 (ref)
		local variant = t[var23.variant]
		
		return if var40 and variant and table.find(variant.controlState, p6) then variant.format:format(var23.text) else var23.text
	end, { var23.text, var23.variant, var40 })
	local createElement = reactModule.createElement
	local t_2 = {
		AutomaticSize = if flagsModule.FoundationButtonFillBehaviorEqualSize and var23.fillBehavior == fillBehaviorModule.Fill or (var23.width.Scale ~= 0 or var23.width.Offset ~= 0) then nil else Enum.AutomaticSize.X,
		cornerRadius = UDim.new(0, var33.container.radius)
	}
	
	if var33.container.style then
		local transparency = var33.container.style.Transparency
		var43 = var35.transparency:map(function(p8) --[[ line: 65 ]]
			-- upvalues: transparency (ref)
			return if transparency == nil then p8 else transparency + (1 - transparency) * p8
		end):map(function(p7) --[[ line: 194 ]]
			-- upvalues: var33 (ref)
			return { Color3 = var33.container.style.Color3, Transparency = p7 }
		end)
	else
		var43 = nil
	end
	local t_3
	t_2.backgroundStyle = var43
	t_2.flexItem = if var23.fillBehavior then {
		FlexMode = if var23.fillBehavior == fillBehaviorModule.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
	} else nil
	
	if var33.container.stroke then
		t_3 = { Color = var33.container.stroke.Color }
		local transparency = var33.container.stroke.Transparency
		t_3.Transparency = var35.transparency:map(function(p9) --[[ line: 65 ]]
			-- upvalues: transparency (ref)
			return if transparency == nil then p9 else transparency + (1 - transparency) * p9
		end)
	else
		t_3 = nil
	end
	t_2.stroke = t_3
	t_2.Size = UDim2.new(if var23.fillBehavior == fillBehaviorModule.Fill then 1 else var23.width.Scale, if var23.fillBehavior == fillBehaviorModule.Fill then 0 else var23.width.Offset, 0, var33.container.height)
	t_2.selection = {
		Selectable = if var23.isDisabled then false else var23.Selectable,
		NextSelectionUp = var23.NextSelectionUp,
		NextSelectionDown = var23.NextSelectionDown,
		NextSelectionLeft = var23.NextSelectionLeft,
		NextSelectionRight = var23.NextSelectionRight
	}
	t_2.cursor = var39
	t_2.onActivated = var23.onActivated
	t_2.onStateChanged = var25
	t_2.isDisabled = var23.isDisabled or (var23.isLoading or var26)
	t_2.stateLayer = var33.container.stateLayer
	t_2.tag = var33.container.tag
	t_2.ref = p5
	
	return createElement(viewModule, withCommonPropsModule(var23, t_2), {
		Loading = if var23.isLoading then reactModule.createElement("Folder", {}, {
			PresenceWrapper = reactModule.createElement(animatePresence, {}, {
				Spinner = reactModule.createElement(spinnerModule, {
					Size = var33.icon.size - (if flagsModule.FoundationUsePath2DSpinner then UDim2.fromOffset(var31.Padding.XSmall, var31.Padding.XSmall) else UDim2.fromOffset(0, 0)),
					style = var35.transparency:map(function(p10) --[[ line: 248 ]]
						-- upvalues: var33 (ref)
						return { Color3 = var33.content.style.Color3, Transparency = p10 }
					end),
					testId = `{var23.testId}--spinner`
				})
			})
		}) else nil,
		IconWrapper = if var23.icon then reactModule.createElement(viewModule, {
			Size = if var23.icon then var33.icon.size else nil,
			LayoutOrder = if var23.icon then if icon then 3 else 1 else nil,
			testId = if var23.icon then `{var23.testId}--icon-wrapper` else nil
		}, {
			Icon = reactModule.createElement(buttonIconModule, {
				icon = var23.icon,
				isLoading = var23.isLoading,
				variant = var23.variant,
				size = var23.size,
				disabledTransparencyBinding = var35.transparency,
				textTransparencyBinding = var37.textTransparency,
				testId = var23.testId
			})
		}) else nil,
		Text = if var40 then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var24:map(var41),
			RichText = t[var23.variant] == nil,
			tag = var33.text.tag,
			textStyle = reactModule.joinBindings({ var35.transparency, var37.textTransparency }):map(function(p11) --[[ line: 286 ]]
				-- upvalues: var33 (ref)
				return {
					Color3 = var33.content.style.Color3,
					Transparency = p11[2] + p11[1]
				}
			end),
			testId = `{var23.testId}--text`
		}) else nil,
		Gradient = if var26 then reactModule.createElement("UIGradient", { Transparency = var28:map(onProgressChange) }) else nil
	})
end))