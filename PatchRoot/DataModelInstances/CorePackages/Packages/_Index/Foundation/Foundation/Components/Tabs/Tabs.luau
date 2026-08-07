-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:09 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local tabItemModule = require(script.Parent.TabItem)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useAnimatedHighlightModule = require(foundation.Utility.useAnimatedHighlight)
local overflowScrollContainerModule = require(script.Parent.OverflowScrollContainer)
local t = {
	testId = "--foundation-tabs",
	ZIndex = 1,
	fillBehavior = fillBehaviorModule.Fill,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(value, p0) --[[ line: 45 | named "Tabs" ]]
	-- upvalues: useTokensModule (ref), withDefaultsModule (ref), t (ref), reactModule (ref), dashModule (ref), fillBehaviorModule (ref), flagsModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), inputSizeModule (ref), tabItemModule (ref)
	local var14 = useTokensModule()
	local var15 = withDefaultsModule(value, t)
	local var16, var17 = reactModule.useState(var15.defaultActiveTabId or dashModule.get(var15, { 1, "id" }))
	local var18 = reactModule.useCallback(function(p1) --[[ line: 51 ]]
		-- upvalues: var15 (ref), var17 (ref)
		if var15.onActivated then
			var15.onActivated(p1)
		end
		var17(p1)
	end)
	local var19 = var15.fillBehavior == fillBehaviorModule.Fill
	local activeTabId = var15.activeTabId or var16
	local var21 = dashModule.find(var15.tabs, function(p2) --[[ line: 60 ]]
		-- upvalues: activeTabId (ref)
		return p2.id == activeTabId
	end)
	local var22 = reactModule.useRef(nil)
	local var23 = nil
	local _ = nil
	local var24 = nil
	
	if flagsModule.FoundationFixTabsFitBorderWidth then
		local var25, var26 = reactModule.useBinding(0)
		var23 = var25
		local var27 = var26
		var24 = reactModule.useCallback(function(p3) --[[ line: 70 ]]
			-- upvalues: var27 (write)
			var27(p3.AbsoluteSize.X)
		end, {})
	end
	local t_7
	local _ = nil
	local var28 = reactModule.useRef({})
	local var29 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var28 (ref), var15 (ref), reactModule (copy)
		local current = var28.current
		
		for i, v in var15.tabs do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var15.tabs })
	local var30 = useAnimatedHighlightModule(activeTabId, p0 or var22, var29, var15.size, var15.fillBehavior)
	local highlightPosition = var30.highlightPosition
	local highlightWidth = var30.highlightWidth
	local activeItemHeight = var30.activeItemHeight
	local var31 = if flagsModule.FoundationFixTabsFitBorderWidth then reactModule.useMemo(function() --[[ line: 102 ]]
		-- upvalues: var19 (ref)
		return {
			outer = { clip = true, ["auto-xy"] = not var19, ["auto-y"] = var19 },
			tabs = { col = true, ["auto-xy"] = not var19, ["auto-y"] = var19 },
			wrapper = { ["auto-xy"] = not var19, ["auto-y"] = var19 }
		}
	end, { var19 }) else nil
	local var32 = if flagsModule.FoundationFixTabsFitBorderWidth then var15.size else nil
	local createElement = reactModule.createElement
	local var33 = withCommonPropsModule(var15, if flagsModule.FoundationTabsInlineSizeFull then {
		tag = if flagsModule.FoundationFixTabsFitBorderWidth then var31.outer else "auto-y clip",
		Size = if flagsModule.FoundationFixTabsFitBorderWidth then if var19 then UDim2.fromScale(1, 0) else nil else UDim2.fromScale(1, 0)
	} else { tag = "size-full-0 auto-y clip" })
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var35 = if flagsModule.FoundationTabsInlineSizeFull then {
		ref = p0 or var22,
		tag = if flagsModule.FoundationFixTabsFitBorderWidth then var31.tabs else "col auto-y",
		Size = if flagsModule.FoundationFixTabsFitBorderWidth then if var19 then UDim2.fromScale(1, 0) else nil else UDim2.fromScale(1, 0)
	} else { tag = "col size-full-0 auto-y", ref = p0 or var22 }
	local t_2 = {}
	local createElement_2 = reactModule.createElement
	local var37 = viewModule
	local var38 = if flagsModule.FoundationTabsInlineSizeFull then {
		LayoutOrder = 1,
		tag = if flagsModule.FoundationFixTabsFitBorderWidth then var31.wrapper else "auto-y",
		Size = if flagsModule.FoundationFixTabsFitBorderWidth then if var19 then UDim2.fromScale(1, 0) else nil else UDim2.fromScale(1, 0),
		testId = `{var15.testId}--wrapper`
	} else {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y",
		testId = `{var15.testId}--wrapper`
	}
	local t_3 = {}
	local createElement_3 = reactModule.createElement
	local t_4 = {
		LayoutOrder = 1,
		size = var15.size,
		fillBehavior = if flagsModule.FoundationFixTabsFitBorderWidth then if var19 then nil else var15.fillBehavior else nil,
		fitWidth = if flagsModule.FoundationFixTabsFitBorderWidth then if var19 then nil else var23 else nil,
		testId = `{var15.testId}--scroll-container`
	}
	local t_5 = {}
	local createElement_4 = reactModule.createElement
	local t_6 = {
		onAbsoluteSizeChanged = if flagsModule.FoundationFixTabsFitBorderWidth then var24 else nil
	}
	
	if flagsModule.FoundationTabsInlineSizeFull then
		local var45
		t_7 = { ["row flex-y-fill auto-xy"] = true }
		
		if flagsModule.FoundationFixTabsFitBorderWidth then
			var45 = not var19
			
			if var45 then
				var45 = true
				
				if var32 ~= inputSizeModule.Small then
					var45 = var32 == inputSizeModule.XSmall
					var45 = nil
				end
			end
		else
			var45 = not var19
		end
		t_7["gap-large"] = var45
	else
		local var44
		t_7 = { ["row flex-y-fill auto-xy"] = true }
		
		if flagsModule.FoundationFixTabsFitBorderWidth then
			var44 = not var19
			
			if var44 then
				var44 = true
				
				if var32 ~= inputSizeModule.Small then
					var44 = var32 == inputSizeModule.XSmall
					var44 = nil
				end
			end
		else
			var44 = not var19
		end
		t_7["gap-large"] = var44
		t_7["size-full-0"] = var19
	end
	t_6.tag = t_7
	t_6.Size = if flagsModule.FoundationTabsInlineSizeFull and var19 then UDim2.fromScale(1, 0) else nil
	t_6.testId = `{var15.testId}--list`
	t_5.TabList = createElement_4(viewModule, t_6, dashModule.map(var15.tabs, function(p4, p5) --[[ line: 211 ]]
		-- upvalues: reactModule (copy), tabItemModule (copy), activeTabId (ref), var18 (ref), var15 (ref), var29 (write)
		return reactModule.createElement(tabItemModule, {
			id = p4.id,
			text = p4.text,
			indicator = p4.indicator,
			key = tostring(p4.id),
			icon = p4.icon,
			isActive = p4.id == activeTabId,
			onActivated = var18,
			LayoutOrder = p5,
			fillBehavior = var15.fillBehavior,
			size = var15.size,
			isDisabled = p4.isDisabled,
			testId = `{var15.testId}--item-{p4.id}`,
			ref = var29[p4.id]
		})
	end))
	t_3.ScrollContainer = createElement_3(overflowScrollContainerModule, t_4, t_5)
	t_3.Border = reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		AnchorPoint = Vector2.new(0, 1),
		Size = if flagsModule.FoundationFixTabsFitBorderWidth then if var19 then UDim2.new(1, 0, 0, var14.Stroke.Thick) else var23:map(function(p6) --[[ line: 236 ]]
			-- upvalues: var14 (ref)
			return UDim2.fromOffset(p6, var14.Stroke.Thick)
		end) else UDim2.new(1, 0, 0, var14.Stroke.Thick),
		Position = UDim2.fromScale(0, 1),
		backgroundStyle = var14.Color.Stroke.Default,
		testId = `{var15.testId}--border`
	})
	t_2.Wrapper = createElement_2(var37, var38, t_3)
	t_2.Content = if var21 and var21.content then reactModule.createElement(viewModule, if flagsModule.FoundationTabsInlineSizeFull then {
		LayoutOrder = 2,
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		testId = `{var15.testId}--content`
	} else {
		LayoutOrder = 2,
		tag = "size-full-0 auto-y",
		testId = `{var15.testId}--content`
	}, var21.content) else nil
	t_1.Tabs = createElement_1(viewModule, var35, t_2)
	t_1.AnimatedBorder = reactModule.createElement(viewModule, {
		LayoutOrder = 0,
		ZIndex = var15.ZIndex + 1,
		Size = highlightWidth:map(function(p7) --[[ line: 269 ]]
			-- upvalues: var14 (ref)
			return UDim2.fromOffset(p7, var14.Stroke.Thick)
		end),
		Position = reactModule.joinBindings({ highlightPosition, activeItemHeight }):map(function(p8) --[[ line: 272 ]]
			-- upvalues: var14 (ref)
			return UDim2.fromOffset(p8[1], p8[2] - var14.Stroke.Thick)
		end),
		backgroundStyle = var14.Color.System.Contrast,
		testId = `{var15.testId}--animated-border`
	})
	
	return createElement(viewModule, var33, t_1)
end))