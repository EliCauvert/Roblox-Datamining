local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local overflowScrollContainerModule = require(foundation.Components.OverflowScrollContainer)
local tabItemModule = require(script.Parent.TabItem)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useAnimatedHighlightModule = require(foundation.Utility.useAnimatedHighlight)
local overflowScrollContainerModule_1 = require(script.Parent.OverflowScrollContainer)
local t = {
	testId = "--foundation-tabs",
	ZIndex = 1,
	fillBehavior = fillBehaviorModule.Fill,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(value, p0)
	-- upvalues: useTokensModule (ref), withDefaultsModule (ref), t (ref), reactModule (ref), dashModule (ref), fillBehaviorModule (ref), flagsModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), overflowScrollContainerModule_1 (ref), inputSizeModule (ref), tabItemModule (ref)
	local var15 = useTokensModule()
	local var16 = withDefaultsModule(value, t)
	local var17, var18 = reactModule.useState(var16.defaultActiveTabId or dashModule.get(var16, { 1, "id" }))
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var16 (ref), var18 (ref)
		if var16.onActivated then
			var16.onActivated(p1)
		end
		var18(p1)
	end)
	local var20 = var16.fillBehavior == fillBehaviorModule.Fill
	local activeTabId = var16.activeTabId or var17
	local var22 = dashModule.find(var16.tabs, function(p2)
		-- upvalues: activeTabId (ref)
		return p2.id == activeTabId
	end)
	local var23 = reactModule.useRef(nil)
	local var24 = nil
	local _ = nil
	local var25 = nil
	
	if flagsModule.FoundationUnifiedScrimScrolling then
		local var26, var27 = reactModule.useBinding(0)
		var24 = var26
		local var28 = var27
		var25 = reactModule.useCallback(function(p3)
			-- upvalues: var28 (write)
			var28(p3.AbsoluteSize.X)
		end, {})
	end
	local var45
	local _ = nil
	local var29 = reactModule.useRef({})
	local var30 = reactModule.useMemo(function()
		-- upvalues: var29 (ref), var16 (ref), reactModule (copy)
		local current = var29.current
		
		for i, v in var16.tabs do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var16.tabs })
	local var31 = useAnimatedHighlightModule(activeTabId, p0 or var23, var30, var16.size, var16.fillBehavior)
	local highlightPosition = var31.highlightPosition
	local highlightWidth = var31.highlightWidth
	local activeItemHeight = var31.activeItemHeight
	local var32 = if flagsModule.FoundationFixTabsFitBorderWidth then var16.size else nil
	local createElement = reactModule.createElement
	local var33 = withCommonPropsModule(var16, {
		tag = if flagsModule.FoundationUnifiedScrimScrolling then "auto-y no-clip" else "auto-y clip",
		Size = UDim2.fromScale(1, 0),
		sizeConstraint = if flagsModule.FoundationUnifiedScrimScrolling and not var20 then {
			MaxSize = var24:map(function(p4)
				return Vector2.new(p4, 1e999)
			end)
		} else nil
	})
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "col auto-y",
		ref = p0 or var23,
		Size = UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var37 = viewModule
	local t_4 = {
		LayoutOrder = 1,
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		testId = `{var16.testId}--wrapper`
	}
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local var40 = if flagsModule.FoundationUnifiedScrimScrolling then overflowScrollContainerModule else overflowScrollContainerModule_1
	local var41 = if flagsModule.FoundationUnifiedScrimScrolling then {
		LayoutOrder = 1,
		size = var16.size,
		scrimBottomInset = var15.Stroke.Thick,
		testId = `{var16.testId}--scroll-container`
	} else {
		LayoutOrder = 1,
		size = var16.size,
		testId = `{var16.testId}--scroll-container`
	}
	local t_6 = {}
	local createElement_4 = reactModule.createElement
	local t_7 = {
		onAbsoluteSizeChanged = if flagsModule.FoundationUnifiedScrimScrolling then var25 else nil
	}
	local t_8 = { ["row flex-y-fill auto-xy"] = true }
	
	if flagsModule.FoundationFixTabsFitBorderWidth then
		var45 = not var20
		
		if var45 then
			var45 = true
			
			if var32 ~= inputSizeModule.Small then
				var45 = var32 == inputSizeModule.XSmall
				var45 = nil
			end
		end
	else
		var45 = not var20
	end
	t_8["gap-large"] = var45
	t_7.tag = t_8
	t_7.Size = if var20 then UDim2.fromScale(1, 0) else nil
	t_7.testId = `{var16.testId}--list`
	t_6.TabList = createElement_4(viewModule, t_7, dashModule.map(var16.tabs, function(p5, p6)
		-- upvalues: reactModule (copy), tabItemModule (copy), activeTabId (ref), var19 (ref), var16 (ref), var30 (write)
		return reactModule.createElement(tabItemModule, {
			id = p5.id,
			text = p5.text,
			indicator = p5.indicator,
			key = tostring(p5.id),
			icon = p5.icon,
			isActive = p5.id == activeTabId,
			onActivated = var19,
			LayoutOrder = p6,
			fillBehavior = var16.fillBehavior,
			size = var16.size,
			isDisabled = p5.isDisabled,
			testId = `{var16.testId}--item-{p5.id}`,
			ref = var30[p5.id]
		})
	end))
	t_5.ScrollContainer = createElement_3(var40, var41, t_6)
	t_5.Border = reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		AnchorPoint = Vector2.new(0, 1),
		Size = UDim2.new(1, 0, 0, var15.Stroke.Thick),
		Position = UDim2.fromScale(0, 1),
		backgroundStyle = var15.Color.Stroke.Default,
		testId = `{var16.testId}--border`
	})
	t_3.Wrapper = createElement_2(var37, t_4, t_5)
	t_3.Content = if var22 and var22.content then reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		testId = `{var16.testId}--content`
	}, var22.content) else nil
	t_1.Tabs = createElement_1(viewModule, t_2, t_3)
	t_1.AnimatedBorder = reactModule.createElement(viewModule, {
		LayoutOrder = 0,
		ZIndex = var16.ZIndex + 1,
		Size = highlightWidth:map(function(p7)
			-- upvalues: var15 (ref)
			return UDim2.fromOffset(p7, var15.Stroke.Thick)
		end),
		AnchorPoint = if flagsModule.FoundationFixTabsBorderPosition then Vector2.new(0, 1) else nil,
		Position = reactModule.joinBindings({ highlightPosition, activeItemHeight }):map(function(p8)
			-- upvalues: flagsModule (copy), var15 (ref)
			local var46 = p8[2]
			
			return UDim2.fromOffset(p8[1], if flagsModule.FoundationFixTabsBorderPosition then var46 else var46 - var15.Stroke.Thick)
		end),
		backgroundStyle = var15.Color.System.Contrast,
		testId = `{var16.testId}--animated-border`
	})
	
	return createElement(viewModule, var33, t_1)
end))