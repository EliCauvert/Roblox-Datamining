local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.BuilderIcons)
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
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

local function _(p0)
	return {
		easingStyle = p0.Ease.StandardOut,
		duration = p0.Time.Time_300
	}
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), reactModule (ref), reactOtterModule (ref), useAccordionModule (ref), useAccordionItemVariantsModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref), dividerModule (ref)
	local var14 = withDefaultsModule(p1, t)
	local var15 = useTokensModule()
	local reducedMotion = usePreferencesModule().reducedMotion
	local var16 = reactModule.useMemo(function()
		-- upvalues: var15 (ref)
		return {
			easingStyle = var15.Ease.StandardOut,
			duration = var15.Time.Time_300
		}
	end, { var15 })
	local var17, var18 = reactModule.useState(var14.isExpanded)
	local var19 = reactModule.useRef(false)
	local var20, var21 = reactOtterModule.useAnimatedBinding(0)
	local var22, var23 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: var19 (ref), var18 (ref)
		if var19.current then
			var18(false)
			var19.current = false
		end
	end)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useCallback(function()
		-- upvalues: reducedMotion (ref), var23 (ref), reactOtterModule (copy), var21 (ref), var18 (ref), var19 (ref), var16 (ref)
		if reducedMotion then
			var23(reactOtterModule.instant(0))
			var21(reactOtterModule.instant(0))
			var18(false)
			var19.current = false
			
			return
		end
		var19.current = true
		var23(reactOtterModule.ease(0, var16))
		var21(reactOtterModule.ease(0, var16))
	end, { reducedMotion, var16 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), var17 (ref), reducedMotion (ref), var23 (ref), reactOtterModule (copy), var16 (ref)
		if var24 and var24.current and var17 then
			if reducedMotion then
				var23(reactOtterModule.instant(var24.current.AbsoluteSize.Y))
				
				return
			end
			var23(reactOtterModule.ease(var24.current.AbsoluteSize.Y, var16))
		end
	end, { var24, var17, reducedMotion, var16 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var14 (ref), var25 (ref), var18 (ref)
		if var17 and not var14.isExpanded then
			var25()
			
			return
		end
		var18(var14.isExpanded)
	end, { var14.isExpanded })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), reducedMotion (ref), var21 (ref), reactOtterModule (copy), var16 (ref)
		if var17 then
			if reducedMotion then
				var21(reactOtterModule.instant(-180))
				
				return
			end
			var21(reactOtterModule.ease(-180, var16))
		end
	end, { var17, reducedMotion, var16 })
	local var27 = useAccordionModule()
	local onAccordionItemActivated = var27.onAccordionItemActivated
	local var28 = useAccordionItemVariantsModule(var15, var27.itemSize, false)
	local var29 = if var14.onActivated then var14.onActivated elseif onAccordionItemActivated then onAccordionItemActivated(var14.id, var17) else reactModule.useCallback(function()
		-- upvalues: var17 (ref), var25 (ref), var18 (ref)
		if var17 then
			var25()
			
			return
		end
		var18(true)
	end, { var17 })
	var14.testId = `{var27.testId}--item-{var14.id}`
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var14, {
		tag = var28.container.tag,
		AutomaticSize = Enum.AutomaticSize.Y,
		stateLayer = var28.container.stateLayer,
		ref = p2
	}), {
		Header = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var28.header.tag,
			onActivated = var29,
			testId = `{var14.testId}--header`
		}, {
			LeadingIcon = if var14.leadingIcon then reactModule.createElement(iconModule, {
				LayoutOrder = 1,
				name = if type(var14.leadingIcon) == "table" then var14.leadingIcon.name else var14.leadingIcon,
				variant = if type(var14.leadingIcon) == "table" then var14.leadingIcon.variant else nil,
				style = var28.icon.style,
				size = var28.icon.size,
				testId = `{var14.testId}--leading-icon`
			}) else nil,
			Title = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = var14.text,
				tag = var28.text.tag,
				testId = `{var14.testId}--title`
			}),
			CollapseIcon = reactModule.createElement(viewModule, { tag = "auto-xy", LayoutOrder = 3 }, {
				Icon = reactModule.createElement(iconModule, {
					name = "chevron-large-down",
					Rotation = var20,
					style = var28.icon.style,
					size = var28.icon.size,
					testId = `{var14.testId}--collapse-icon`
				})
			})
		}),
		Content = if var17 then reactModule.createElement(viewModule, {
			tag = "col",
			LayoutOrder = 2,
			ClipsDescendants = true,
			testId = `{var14.testId}--content`,
			Size = if var22 then var22:map(function(p3)
				return UDim2.new(1, 0, 0, p3)
			end) else nil
		}, {
			AnimatedContainer = reactModule.createElement(viewModule, {
				tag = var28.content.tag,
				ref = var24,
				onAbsoluteSizeChanged = var26,
				flexItem = { FlexMode = Enum.UIFlexMode.None },
				testId = `{var14.testId}--animated-content`
			}, { var14.children })
		}) else nil,
		Divider = if var14.hasDivider then reactModule.createElement(dividerModule, { LayoutOrder = 3, testId = `{var14.testId}--divider` }) else nil
	})
end))