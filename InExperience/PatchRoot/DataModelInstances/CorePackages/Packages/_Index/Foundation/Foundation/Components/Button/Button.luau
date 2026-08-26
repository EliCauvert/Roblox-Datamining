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

local function onProgressChange(p1)
	-- upvalues: constantsModule (ref)
	return NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(math.max(0, p1 - 0.0001), 0),
		NumberSequenceKeypoint.new(math.min(1, p1 + 0.0001), constantsModule.DISABLED_TRANSPARENCY),
		NumberSequenceKeypoint.new(1, constantsModule.DISABLED_TRANSPARENCY)
	})
end

local function _(p1, p2)
	return p2:map(function(p3)
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), reactModule (ref), controlStateModule (ref), reactOtterModule (ref), endAlignedIconsModule (ref), useTokensModule (ref), usePresentationContext (ref), useButtonVariantsModule (ref), useButtonMotionStatesModule (ref), constantsModule (ref), useMotion (ref), t (ref), viewModule (ref), withCommonPropsModule (ref), fillBehaviorModule (ref), animatePresence (ref), spinnerModule (ref), flagsModule (ref), buttonIconModule (ref), textModule (ref), onProgressChange (ref)
	local var1
	local var2 = withDefaultsModule(p1, t_1)
	local inputDelay = var2.inputDelay
	local var3, var4 = reactModule.useBinding(controlStateModule.Initialize)
	local var5, var6 = reactModule.useState(inputDelay > 0)
	local var7, var8 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: var6 (ref)
		var6(false)
	end)
	local icon = var2.icon and endAlignedIconsModule[var2.icon]
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var8 (ref), reactOtterModule (copy)
		if var5 == false then
			var8(reactOtterModule.instant(0))
		end
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref), inputDelay (ref), var8 (ref), reactOtterModule (copy)
		if var5 then
			var6(false)
		end
		if inputDelay > 0 then
			var6(true)
			var8(reactOtterModule.ease(1, {
				duration = inputDelay,
				easingStyle = Enum.EasingStyle.Quad
			}))
		end
	end, { inputDelay })
	local var9 = useTokensModule()
	local var10 = usePresentationContext()
	local var11 = useButtonVariantsModule(var9, var2.size, var2.variant, if var10 then var10.colorNamespace else nil)
	local var12 = useButtonMotionStatesModule(var11.content.style.Transparency, constantsModule.DISABLED_TRANSPARENCY)
	local var13, var14 = useMotion(var12.Default)
	local var15, var16 = useMotion(var12.Default)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var16 (ref), var12 (ref)
		if var2.isLoading then
			var16(var12.Loading)
			
			return
		end
		var16(var12.Default)
	end, { var2.isLoading })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var14 (ref), var12 (ref)
		if var2.isDisabled then
			var14(var12.Disabled)
			
			return
		end
		var14(var12.Default)
	end, { var2.isDisabled })
	local var17 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), var9 (ref)
		return {
			radius = UDim.new(0, var11.container.radius),
			offset = var9.Size.Size_200,
			borderWidth = var9.Stroke.Thicker
		}
	end, { var9, var11.container.radius })
	local var18 = var2.text and var2.text ~= ""
	local var19 = reactModule.useCallback(function(p3)
		-- upvalues: t (copy), var2 (ref), var18 (ref)
		local variant = t[var2.variant]
		
		return if var18 and variant and table.find(variant.controlState, p3) then variant.format:format(var2.text) else var2.text
	end, { var2.text, var2.variant, var18 })
	local createElement = reactModule.createElement
	local t_2 = {
		AutomaticSize = if var2.width.Scale == 0 and var2.width.Offset == 0 then Enum.AutomaticSize.X else nil,
		cornerRadius = UDim.new(0, var11.container.radius)
	}
	
	if var11.container.style then
		local transparency = var11.container.style.Transparency
		var1 = var13.transparency:map(function(p3)
			-- upvalues: transparency (ref)
			return if transparency == nil then p3 else transparency + (1 - transparency) * p3
		end):map(function(p3)
			-- upvalues: var11 (ref)
			return { Color3 = var11.container.style.Color3, Transparency = p3 }
		end)
	else
		var1 = nil
	end
	local t_3
	t_2.backgroundStyle = var1
	t_2.flexItem = if var2.fillBehavior then {
		FlexMode = if var2.fillBehavior == fillBehaviorModule.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
	} else nil
	
	if var11.container.stroke then
		t_3 = { Color = var11.container.stroke.Color }
		local transparency = var11.container.stroke.Transparency
		t_3.Transparency = var13.transparency:map(function(p3)
			-- upvalues: transparency (ref)
			return if transparency == nil then p3 else transparency + (1 - transparency) * p3
		end)
	else
		t_3 = nil
	end
	t_2.stroke = t_3
	t_2.Size = UDim2.new(if var2.fillBehavior == fillBehaviorModule.Fill then 1 else var2.width.Scale, if var2.fillBehavior == fillBehaviorModule.Fill then 0 else var2.width.Offset, 0, var11.container.height)
	t_2.selection = {
		Selectable = if var2.isDisabled then false else var2.Selectable,
		NextSelectionUp = var2.NextSelectionUp,
		NextSelectionDown = var2.NextSelectionDown,
		NextSelectionLeft = var2.NextSelectionLeft,
		NextSelectionRight = var2.NextSelectionRight
	}
	t_2.cursor = var17
	t_2.onActivated = var2.onActivated
	t_2.onStateChanged = var4
	t_2.isDisabled = var2.isDisabled or (var2.isLoading or var5)
	t_2.stateLayer = var11.container.stateLayer
	t_2.tag = var11.container.tag
	t_2.ref = p2
	
	return createElement(viewModule, withCommonPropsModule(var2, t_2), {
		Loading = if var2.isLoading then reactModule.createElement("Folder", {}, {
			PresenceWrapper = reactModule.createElement(animatePresence, {}, {
				Spinner = reactModule.createElement(spinnerModule, {
					Size = var11.icon.size - (if flagsModule.FoundationUsePath2DSpinner then UDim2.fromOffset(var9.Padding.XSmall, var9.Padding.XSmall) else UDim2.fromOffset(0, 0)),
					style = var13.transparency:map(function(p3)
						-- upvalues: var11 (ref)
						return { Color3 = var11.content.style.Color3, Transparency = p3 }
					end),
					testId = `{var2.testId}--spinner`
				})
			})
		}) else nil,
		IconWrapper = if var2.icon then reactModule.createElement(viewModule, {
			Size = if var2.icon then var11.icon.size else nil,
			LayoutOrder = if var2.icon then if icon then 3 else 1 else nil,
			testId = if var2.icon then `{var2.testId}--icon-wrapper` else nil
		}, {
			Icon = reactModule.createElement(buttonIconModule, {
				icon = var2.icon,
				isLoading = var2.isLoading,
				variant = var2.variant,
				size = var2.size,
				disabledTransparencyBinding = var13.transparency,
				textTransparencyBinding = var15.textTransparency,
				testId = var2.testId
			})
		}) else nil,
		Text = if var18 then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var3:map(var19),
			RichText = t[var2.variant] == nil,
			tag = var11.text.tag,
			textStyle = reactModule.joinBindings({ var13.transparency, var15.textTransparency }):map(function(p3)
				-- upvalues: var11 (ref)
				return {
					Color3 = var11.content.style.Color3,
					Transparency = p3[2] + p3[1]
				}
			end),
			testId = `{var2.testId}--text`
		}) else nil,
		Gradient = if var5 then reactModule.createElement("UIGradient", { Transparency = var7:map(onProgressChange) }) else nil
	})
end))