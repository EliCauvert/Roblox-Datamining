local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local icon = builderIconsModule.Icon
local dividerModule = require(foundation.Components.Divider)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useAccordionModule = require(script.Parent.Parent.useAccordion)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local inputPlacementModule = require(foundation.Enums.InputPlacement)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Providers.Style.Tokens)
local flagsModule = require(foundation.Utility.Flags)
local useAccordionItemVariantsModule = require(script.Parent.Parent.useAccordionItemVariants)
local t = { hasDivider = true, isExpanded = false }

local function _(p1)
	return {
		easingStyle = p1.Ease.StandardOut,
		duration = p1.Time.Time_300
	}
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), reactModule (ref), reactOtterModule (ref), useAccordionModule (ref), useAccordionItemVariantsModule (ref), inputPlacementModule (ref), textModule (ref), viewModule (ref), withCommonPropsModule (ref), flagsModule (ref), iconModule (ref), icon (ref), dividerModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local reducedMotion = usePreferencesModule().reducedMotion
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return {
			easingStyle = var2.Ease.StandardOut,
			duration = var2.Time.Time_300
		}
	end, { var2 })
	local var4, var5 = reactModule.useState(var1.isExpanded)
	local var6 = reactModule.useRef(false)
	local var7, var8 = reactOtterModule.useAnimatedBinding(0)
	local var9, var10 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: var6 (ref), var5 (ref)
		if var6.current then
			var5(false)
			var6.current = false
		end
	end)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useCallback(function()
		-- upvalues: reducedMotion (ref), var10 (ref), reactOtterModule (copy), var8 (ref), var5 (ref), var6 (ref), var3 (ref)
		if reducedMotion then
			var10(reactOtterModule.instant(0))
			var8(reactOtterModule.instant(0))
			var5(false)
			var6.current = false
			
			return
		end
		var6.current = true
		var10(reactOtterModule.ease(0, var3))
		var8(reactOtterModule.ease(0, var3))
	end, { reducedMotion, var3 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var4 (ref), reducedMotion (ref), var10 (ref), reactOtterModule (copy), var3 (ref)
		if var11 and var11.current and var4 then
			if reducedMotion then
				var10(reactOtterModule.instant(var11.current.AbsoluteSize.Y))
				
				return
			end
			var10(reactOtterModule.ease(var11.current.AbsoluteSize.Y, var3))
		end
	end, { var11, var4, reducedMotion, var3 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var1 (ref), var12 (ref), var5 (ref)
		if var4 and not var1.isExpanded then
			var12()
			
			return
		end
		var5(var1.isExpanded)
	end, { var1.isExpanded })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), reducedMotion (ref), var8 (ref), reactOtterModule (copy), var3 (ref)
		if var4 then
			if reducedMotion then
				var8(reactOtterModule.instant(-180))
				
				return
			end
			var8(reactOtterModule.ease(-180, var3))
		end
	end, { var4, reducedMotion, var3 })
	local var14 = useAccordionModule()
	local onAccordionItemActivated = var14.onAccordionItemActivated
	local var15 = useAccordionItemVariantsModule(var2, var14.itemSize, var14.isContained)
	local var16 = var14.chevronPosition == inputPlacementModule.Start
	local var17 = if var16 then 3 else 1
	local var18 = if var16 then 1 else 3
	local var19 = if var1.onActivated then var1.onActivated elseif onAccordionItemActivated then onAccordionItemActivated(var1.id, var4) else reactModule.useCallback(function()
		-- upvalues: var4 (ref), var12 (ref), var5 (ref)
		if var4 then
			var12()
			
			return
		end
		var5(true)
	end, { var4 })
	var1.testId = `{var14.testId}--item-{var17.id}`
	local var20 = var1.description ~= nil
	local var21 = reactModule.createElement(textModule, {
		LayoutOrder = 2,
		Text = var1.text,
		tag = {
			[var15.text.tag] = true,
			grow = not var20,
			["size-full-0"] = var20
		},
		testId = `{var1.testId}--title`
	})
	local var22 = if var1.icon then var1.icon else var1.leadingIcon
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var15.container.tag,
		AutomaticSize = Enum.AutomaticSize.Y,
		stateLayer = var15.container.stateLayer,
		ref = p2
	}), {
		Header = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var15.header.tag,
			AutomaticSize = if var20 then Enum.AutomaticSize.Y else nil,
			onActivated = var19,
			testId = `{var1.testId}--header`
		}, {
			Icon = if flagsModule.FoundationAccordionBeta then if var22 then reactModule.createElement(iconModule, {
				LayoutOrder = var17,
				name = if type(var22) == "table" then var22.name else var22,
				variant = if type(var22) == "table" then var22.variant else nil,
				style = var15.icon.style,
				size = var15.icon.size,
				testId = `{var1.testId}--leading-icon`
			}) else nil else nil,
			LeadingIcon = if flagsModule.FoundationAccordionBeta then nil elseif var22 then reactModule.createElement(iconModule, {
				LayoutOrder = var17,
				name = if type(var22) == "table" then var22.name else var22,
				variant = if type(var22) == "table" then var22.variant else nil,
				style = var15.icon.style,
				size = var15.icon.size,
				testId = `{var1.testId}--leading-icon`
			}) else nil,
			Title = if not var20 then var21 else nil,
			TextContainer = if var20 then reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = var15.textContainer.tag,
				testId = `{var1.testId}--text-container`
			}, {
				Title = var21,
				Description = reactModule.createElement(textModule, {
					LayoutOrder = 3,
					TextWrapped = false,
					Text = var1.description,
					TextTruncate = Enum.TextTruncate.AtEnd,
					tag = var15.description.tag,
					testId = `{var1.testId}--description`
				})
			}) else nil,
			CollapseIcon = reactModule.createElement(viewModule, {
				tag = "auto-xy",
				LayoutOrder = var18,
				testId = `{var1.testId}--collapse-icon-container`
			}, {
				Icon = reactModule.createElement(iconModule, {
					name = icon.ChevronLargeDown,
					Rotation = var7,
					style = var15.icon.style,
					size = var15.icon.size,
					testId = `{var1.testId}--collapse-icon`
				})
			})
		}),
		Content = if var4 then reactModule.createElement(viewModule, {
			tag = "col",
			LayoutOrder = 2,
			ClipsDescendants = true,
			testId = `{var1.testId}--content`,
			Size = if var9 then var9:map(function(p3)
				return UDim2.new(1, 0, 0, p3)
			end) else nil
		}, {
			AnimatedContainer = reactModule.createElement(viewModule, {
				tag = var15.content.tag,
				ref = var11,
				onAbsoluteSizeChanged = var13,
				flexItem = { FlexMode = Enum.UIFlexMode.None },
				testId = `{var1.testId}--animated-content`
			}, { var1.children })
		}) else nil,
		Divider = if var1.hasDivider then reactModule.createElement(dividerModule, { LayoutOrder = 3, testId = `{var1.testId}--divider` }) else nil
	})
end))