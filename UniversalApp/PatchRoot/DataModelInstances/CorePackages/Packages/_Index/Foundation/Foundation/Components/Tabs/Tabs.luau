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

return reactModule.memo(reactModule.forwardRef(function(value, p1)
	-- upvalues: useTokensModule (ref), withDefaultsModule (ref), t (ref), reactModule (ref), dashModule (ref), fillBehaviorModule (ref), flagsModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), overflowScrollContainerModule_1 (ref), inputSizeModule (ref), tabItemModule (ref)
	local var1 = useTokensModule()
	local var2 = withDefaultsModule(value, t)
	local var3, var4 = reactModule.useState(var2.defaultActiveTabId or dashModule.get(var2, { 1, "id" }))
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref), var4 (ref)
		if var2.onActivated then
			var2.onActivated(p1)
		end
		var4(p1)
	end)
	local var6 = var2.fillBehavior == fillBehaviorModule.Fill
	local activeTabId = var2.activeTabId or var3
	local var7 = dashModule.find(var2.tabs, function(p1)
		-- upvalues: activeTabId (ref)
		return p1.id == activeTabId
	end)
	local var8 = reactModule.useRef(nil)
	local var9 = nil
	local _ = nil
	local var10 = nil
	
	if flagsModule.FoundationUnifiedScrimScrolling then
		local var11, var12 = reactModule.useBinding(0)
		var9 = var11
		local var13 = var12
		var10 = reactModule.useCallback(function(p1)
			-- upvalues: var13 (write)
			var13(p1.AbsoluteSize.X)
		end, {})
	end
	local var14
	local _ = nil
	local var15 = reactModule.useRef({})
	local var16 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), var2 (ref), reactModule (copy)
		local current = var15.current
		
		for i, v in var2.tabs do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var2.tabs })
	local var1 = useAnimatedHighlightModule(activeTabId, p1 or var8, var16, var2.size, var2.fillBehavior)
	local highlightPosition = var1.highlightPosition
	local highlightWidth = var1.highlightWidth
	local activeItemHeight = var1.activeItemHeight
	local var2 = if flagsModule.FoundationFixTabsFitBorderWidth then var2.size else nil
	local createElement = reactModule.createElement
	local var3 = withCommonPropsModule(var2, {
		tag = if flagsModule.FoundationUnifiedScrimScrolling then "auto-y no-clip" else "auto-y clip",
		Size = UDim2.fromScale(1, 0),
		sizeConstraint = if flagsModule.FoundationUnifiedScrimScrolling and not var6 then {
			MaxSize = var9:map(function(p1)
				return Vector2.new(p1, 1e999)
			end)
		} else nil
	})
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "col auto-y",
		ref = p1 or var8,
		Size = UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var4 = viewModule
	local t_4 = {
		LayoutOrder = 1,
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		testId = `{var2.testId}--wrapper`
	}
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local var5 = if flagsModule.FoundationUnifiedScrimScrolling then overflowScrollContainerModule else overflowScrollContainerModule_1
	local var6 = if flagsModule.FoundationUnifiedScrimScrolling then {
		LayoutOrder = 1,
		size = var2.size,
		scrimBottomInset = var1.Stroke.Thick,
		testId = `{var2.testId}--scroll-container`
	} else {
		LayoutOrder = 1,
		size = var2.size,
		testId = `{var2.testId}--scroll-container`
	}
	local t_6 = {}
	local createElement_4 = reactModule.createElement
	local t_7 = {
		onAbsoluteSizeChanged = if flagsModule.FoundationUnifiedScrimScrolling then var10 else nil
	}
	local t_8 = { ["row flex-y-fill auto-xy"] = true }
	
	if flagsModule.FoundationFixTabsFitBorderWidth then
		var14 = not var6
		
		if var14 then
			var14 = true
			
			if var2 ~= inputSizeModule.Small then
				var14 = var2 == inputSizeModule.XSmall
				var14 = nil
			end
		end
	else
		var14 = not var6
	end
	t_8["gap-large"] = var14
	t_7.tag = t_8
	t_7.Size = if var6 then UDim2.fromScale(1, 0) else nil
	t_7.testId = `{var2.testId}--list`
	t_6.TabList = createElement_4(viewModule, t_7, dashModule.map(var2.tabs, function(p1, p2)
		-- upvalues: reactModule (copy), tabItemModule (copy), activeTabId (ref), var5 (ref), var2 (ref), var16 (write)
		return reactModule.createElement(tabItemModule, {
			id = p1.id,
			text = p1.text,
			indicator = p1.indicator,
			key = tostring(p1.id),
			icon = p1.icon,
			isActive = p1.id == activeTabId,
			onActivated = var5,
			LayoutOrder = p2,
			fillBehavior = var2.fillBehavior,
			size = var2.size,
			isDisabled = p1.isDisabled,
			testId = `{var2.testId}--item-{p5.id}`,
			ref = var16[p1.id]
		})
	end))
	t_5.ScrollContainer = createElement_3(var5, var6, t_6)
	t_5.Border = reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		AnchorPoint = Vector2.new(0, 1),
		Size = UDim2.new(1, 0, 0, var1.Stroke.Thick),
		Position = UDim2.fromScale(0, 1),
		backgroundStyle = var1.Color.Stroke.Default,
		testId = `{var2.testId}--border`
	})
	t_3.Wrapper = createElement_2(var4, t_4, t_5)
	t_3.Content = if var7 and var7.content then reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		testId = `{var2.testId}--content`
	}, var7.content) else nil
	t_1.Tabs = createElement_1(viewModule, t_2, t_3)
	t_1.AnimatedBorder = reactModule.createElement(viewModule, {
		LayoutOrder = 0,
		ZIndex = var2.ZIndex + 1,
		Size = highlightWidth:map(function(p1)
			-- upvalues: var1 (ref)
			return UDim2.fromOffset(p1, var1.Stroke.Thick)
		end),
		AnchorPoint = if flagsModule.FoundationFixTabsBorderPosition then Vector2.new(0, 1) else nil,
		Position = reactModule.joinBindings({ highlightPosition, activeItemHeight }):map(function(p1)
			-- upvalues: flagsModule (copy), var1 (ref)
			local var1 = p1[2]
			
			return UDim2.fromOffset(p1[1], if flagsModule.FoundationFixTabsBorderPosition then var1 else var1 - var1.Stroke.Thick)
		end),
		backgroundStyle = var1.Color.System.Contrast,
		testId = `{var2.testId}--animated-border`
	})
	
	return createElement(viewModule, var3, t_1)
end))