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

local function renderScrollView(p1)
	-- upvalues: reactModule (ref), scrollView (ref), t (ref), view (ref)
	return reactModule.createElement(scrollView, {
		tag = "grow size-full-0",
		LayoutOrder = p1.scrollLayoutOrder,
		scroll = t,
		onAbsoluteCanvasSizeChanged = p1.onAbsoluteCanvasSizeChanged,
		onAbsoluteWindowSizeChanged = p1.onAbsoluteWindowSizeChanged
	}, {
		Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y padding-bottom-xlarge" }, p1.contentChildren)
	})
end

local function _(p1)
	return p1.AbsoluteWindowSize.Y + 1 < p1.AbsoluteCanvasSize.Y
end

return function(p1)
	-- upvalues: reactModule (ref), divider (ref), view (ref), renderScrollView (ref)
	local pinHeader = p1.pinHeader
	local useInternalScroll = p1.useInternalScroll
	local children = p1.children
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteWindowSize.Y + 1 < p2.AbsoluteCanvasSize.Y)
	end, {})
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2)
	end, { var3 })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2)
	end, { var3 })
	local var6 = if var1 then reactModule.createElement(divider, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 1) }) else nil
	local var7 = if p1.header then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, p1.header) else nil
	local t = {
		onAbsoluteCanvasSizeChanged = var4,
		onAbsoluteWindowSizeChanged = var5
	}
	local var8 = pinHeader and var7 ~= nil
	local _ = nil
	local var9 = if useInternalScroll then if var8 then {
		Header = var7,
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
				Header = var7,
				Body = if children then reactModule.createElement(reactModule.Fragment, nil, children) else nil
			},
			onAbsoluteCanvasSizeChanged = t.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = t.onAbsoluteWindowSizeChanged
		})
	} else {
		StaticContent = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y padding-bottom-xlarge",
			LayoutOrder = if var8 then 2 else 1
		}, {
			Header = if var8 or not var7 then nil else var7,
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
		LayoutOrder = p1.layoutOrder
	}, {
		Inner = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["col gap-small size-full-0"] = true,
				grow = useInternalScroll,
				["auto-y"] = not useInternalScroll
			}
		}, if useInternalScroll or not var8 then var9 else { Header = var7, StaticContent = var9.StaticContent }),
		ScrollAffordanceDivider = if useInternalScroll then var6 else nil
	})
end