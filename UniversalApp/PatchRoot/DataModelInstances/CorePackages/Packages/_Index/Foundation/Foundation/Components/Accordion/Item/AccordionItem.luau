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
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Providers.Style.Tokens)
local useAccordionItemVariantsModule = require(script.Parent.Parent.useAccordionItemVariants)
local t = { hasDivider = true, isExpanded = false }

local function _(p0) --[[ line: 61 | named "getCommonEaseConfig" ]]
	return {
		easingStyle = p0.Ease.StandardOut,
		duration = p0.Time.Time_300
	}
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 68 | named "AccordionItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), reactModule (ref), reactOtterModule (ref), useAccordionModule (ref), useAccordionItemVariantsModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref), icon (ref), dividerModule (ref)
	local var15 = withDefaultsModule(p1, t)
	local var16 = useTokensModule()
	local reducedMotion = usePreferencesModule().reducedMotion
	local var17 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: var16 (ref)
		return {
			easingStyle = var16.Ease.StandardOut,
			duration = var16.Time.Time_300
		}
	end, { var16 })
	local var18, var19 = reactModule.useState(var15.isExpanded)
	local var20 = reactModule.useRef(false)
	local var21, var22 = reactOtterModule.useAnimatedBinding(0)
	local var23, var24 = reactOtterModule.useAnimatedBinding(0, function() --[[ line: 81 ]]
		-- upvalues: var20 (ref), var19 (ref)
		if var20.current then
			var19(false)
			var20.current = false
		end
	end)
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: reducedMotion (ref), var24 (ref), reactOtterModule (copy), var22 (ref), var19 (ref), var20 (ref), var17 (ref)
		if reducedMotion then
			var24(reactOtterModule.instant(0))
			var22(reactOtterModule.instant(0))
			var19(false)
			var20.current = false
			
			return
		end
		var20.current = true
		var24(reactOtterModule.ease(0, var17))
		var22(reactOtterModule.ease(0, var17))
	end, { reducedMotion, var17 })
	local var27 = reactModule.useCallback(function() --[[ line: 102 ]]
		-- upvalues: var25 (ref), var18 (ref), reducedMotion (ref), var24 (ref), reactOtterModule (copy), var17 (ref)
		if var25 and var25.current and var18 then
			if reducedMotion then
				var24(reactOtterModule.instant(var25.current.AbsoluteSize.Y))
				
				return
			end
			var24(reactOtterModule.ease(var25.current.AbsoluteSize.Y, var17))
		end
	end, { var25, var18, reducedMotion, var17 })
	reactModule.useEffect(function() --[[ line: 112 ]]
		-- upvalues: var18 (ref), var15 (ref), var26 (ref), var19 (ref)
		if var18 and not var15.isExpanded then
			var26()
			
			return
		end
		var19(var15.isExpanded)
	end, { var15.isExpanded })
	reactModule.useEffect(function() --[[ line: 120 ]]
		-- upvalues: var18 (ref), reducedMotion (ref), var22 (ref), reactOtterModule (copy), var17 (ref)
		if var18 then
			if reducedMotion then
				var22(reactOtterModule.instant(-180))
				
				return
			end
			var22(reactOtterModule.ease(-180, var17))
		end
	end, { var18, reducedMotion, var17 })
	local var28 = useAccordionModule()
	local onAccordionItemActivated = var28.onAccordionItemActivated
	local var29 = useAccordionItemVariantsModule(var16, var28.itemSize, false)
	local var30 = if var15.onActivated then var15.onActivated elseif onAccordionItemActivated then onAccordionItemActivated(var15.id, var18) else reactModule.useCallback(function() --[[ line: 135 ]]
		-- upvalues: var18 (ref), var26 (ref), var19 (ref)
		if var18 then
			var26()
			
			return
		end
		var19(true)
	end, { var18 })
	var15.testId = `{var28.testId}--item-{var15.id}`
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, {
		tag = var29.container.tag,
		AutomaticSize = Enum.AutomaticSize.Y,
		stateLayer = var29.container.stateLayer,
		ref = p2
	}), {
		Header = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var29.header.tag,
			onActivated = var30,
			testId = `{var15.testId}--header`
		}, {
			LeadingIcon = if var15.leadingIcon then reactModule.createElement(iconModule, {
				LayoutOrder = 1,
				name = if type(var15.leadingIcon) == "table" then var15.leadingIcon.name else var15.leadingIcon,
				variant = if type(var15.leadingIcon) == "table" then var15.leadingIcon.variant else nil,
				style = var29.icon.style,
				size = var29.icon.size,
				testId = `{var15.testId}--leading-icon`
			}) else nil,
			Title = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = var15.text,
				tag = var29.text.tag,
				testId = `{var15.testId}--title`
			}),
			CollapseIcon = reactModule.createElement(viewModule, { tag = "auto-xy", LayoutOrder = 3 }, {
				Icon = reactModule.createElement(iconModule, {
					name = icon.ChevronLargeDown,
					Rotation = var21,
					style = var29.icon.style,
					size = var29.icon.size,
					testId = `{var15.testId}--collapse-icon`
				})
			})
		}),
		Content = if var18 then reactModule.createElement(viewModule, {
			tag = "col",
			LayoutOrder = 2,
			ClipsDescendants = true,
			testId = `{var15.testId}--content`,
			Size = if var23 then var23:map(function(p3) --[[ line: 201 ]]
				return UDim2.new(1, 0, 0, p3)
			end) else nil
		}, {
			AnimatedContainer = reactModule.createElement(viewModule, {
				tag = var29.content.tag,
				ref = var25,
				onAbsoluteSizeChanged = var27,
				flexItem = { FlexMode = Enum.UIFlexMode.None },
				testId = `{var15.testId}--animated-content`
			}, { var15.children })
		}) else nil,
		Divider = if var15.hasDivider then reactModule.createElement(dividerModule, { LayoutOrder = 3, testId = `{var15.testId}--divider` }) else nil
	})
end))