local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local scrollView = foundationModule.ScrollView
local t = {
	ScrollingDirection = Enum.ScrollingDirection.Y,
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(0, 0),
	scrollBarVisibility = foundationModule.Enums.Visibility.Auto
}

local function renderScrollView(p0) --[[ line: 40 ]]
	-- upvalues: reactModule (ref), scrollView (ref), t (ref), view (ref)
	return reactModule.createElement(scrollView, {
		tag = "grow size-full-0",
		LayoutOrder = p0.scrollLayoutOrder,
		scroll = t,
		onAbsoluteCanvasSizeChanged = p0.onAbsoluteCanvasSizeChanged,
		onAbsoluteWindowSizeChanged = p0.onAbsoluteWindowSizeChanged
	}, {
		Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y padding-bottom-xlarge" }, p0.contentChildren)
	})
end

local function _(p1) --[[ line: 54 | named "hasVerticalScrollOverflow" ]]
	return p1.AbsoluteWindowSize.Y + 1 < p1.AbsoluteCanvasSize.Y
end

return function(p2) --[[ line: 58 | named "ScrollSection" ]]
	-- upvalues: reactModule (ref), divider (ref), view (ref), renderScrollView (ref)
	local pinHeader = p2.pinHeader
	local useInternalScroll = p2.useInternalScroll
	local children = p2.children
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function(p3) --[[ line: 65 ]]
		-- upvalues: var5 (ref)
		var5(p3.AbsoluteWindowSize.Y + 1 < p3.AbsoluteCanvasSize.Y)
	end, {})
	local var7 = reactModule.useCallback(function(p4) --[[ line: 69 ]]
		-- upvalues: var6 (ref)
		var6(p4)
	end, { var6 })
	local var8 = reactModule.useCallback(function(p5) --[[ line: 73 ]]
		-- upvalues: var6 (ref)
		var6(p5)
	end, { var6 })
	local var9 = if var4 then reactModule.createElement(divider, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 1) }) else nil
	local var10 = if p2.header then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, p2.header) else nil
	local t = {
		onAbsoluteCanvasSizeChanged = var7,
		onAbsoluteWindowSizeChanged = var8
	}
	local var12 = pinHeader and var10 ~= nil
	local _ = nil
	local var13 = if useInternalScroll then if var12 then {
		Header = var10,
		ScrollContent = renderScrollView({
			scrollLayoutOrder = 2,
			contentChildren = children or {},
			onAbsoluteCanvasSizeChanged = t.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = t.onAbsoluteWindowSizeChanged
		})
	} else {
		ScrollContent = renderScrollView({
			scrollLayoutOrder = 1,
			contentChildren = {
				Header = var10,
				Body = if children then reactModule.createElement(reactModule.Fragment, nil, children) else nil
			},
			onAbsoluteCanvasSizeChanged = t.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = t.onAbsoluteWindowSizeChanged
		})
	} else {
		StaticContent = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y padding-bottom-xlarge",
			LayoutOrder = if var12 then 2 else 1
		}, {
			Header = if var12 or not var10 then nil else var10,
			Body = if children then reactModule.createElement(reactModule.Fragment, nil, children) else nil
		})
	}
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = {
			["col size-full-0 padding-top-xlarge"] = true,
			grow = useInternalScroll,
			["auto-y"] = not useInternalScroll
		},
		LayoutOrder = p2.layoutOrder
	}, {
		Inner = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["col gap-small size-full-0"] = true,
				grow = useInternalScroll,
				["auto-y"] = not useInternalScroll
			}
		}, if useInternalScroll or not var12 then var13 else { Header = var10, StaticContent = var13.StaticContent }),
		ScrollAffordanceDivider = if useInternalScroll then var9 else nil
	})
end