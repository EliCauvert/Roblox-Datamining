local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local ScrollView = FoundationModule.ScrollView
local Scroll = {
	ScrollingDirection = Enum.ScrollingDirection.Y,
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(0, 0),
	scrollBarVisibility = FoundationModule.Enums.Visibility.Auto
}

local function renderScrollView(p1) --[[ Line: 40 ]]
	-- upvalues: ReactModule (copy), ScrollView (copy), Scroll (copy), View (copy)
	return ReactModule.createElement(ScrollView, {
		tag = "grow size-full-0",
		LayoutOrder = p1.scrollLayoutOrder,
		scroll = Scroll,
		selection = { Selectable = false },
		onAbsoluteCanvasSizeChanged = p1.onAbsoluteCanvasSizeChanged,
		onAbsoluteWindowSizeChanged = p1.onAbsoluteWindowSizeChanged
	}, {
		Content = ReactModule.createElement(View, { tag = "col size-full-0 auto-y padding-bottom-xlarge" }, p1.contentChildren)
	})
end

local function _(ScrollFrame): boolean --[[ Line: 55 | Named "hasVerticalScrollOverflow" ]]
	return ScrollFrame.AbsoluteWindowSize.Y + 1 < ScrollFrame.AbsoluteCanvasSize.Y
end

return function(p1) --[[ Line: 59 | Named "ScrollSection" ]]
	-- upvalues: ReactModule (copy), Divider (copy), View (copy), renderScrollView (copy)
	local PinHeader = p1.pinHeader
	local UseInternalScroll = p1.useInternalScroll
	local Children = p1.children
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 66 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(ScrollFrame.AbsoluteWindowSize.Y + 1 < ScrollFrame.AbsoluteCanvasSize.Y)
	end, {})
	local Element = if UseStateResult then ReactModule.createElement(Divider, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 1) }) else nil
	local Element1 = if p1.header then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 1 }, p1.header) else nil
	local config = {
		onAbsoluteCanvasSizeChanged = ReactModule.useCallback(function(p2) --[[ Line: 70 ]]
			-- upvalues: UseResult (copy)
			UseResult(p2)
		end, { UseResult }),
		onAbsoluteWindowSizeChanged = ReactModule.useCallback(function(p2) --[[ Line: 74 ]]
			-- upvalues: UseResult (copy)
			UseResult(p2)
		end, { UseResult })
	}
	local HasElement: boolean = PinHeader and Element1 ~= nil
	local Config = if UseInternalScroll then if HasElement then {
		Header = Element1,
		ScrollContent = renderScrollView({
			scrollLayoutOrder = 2,
			contentChildren = Children or {},
			onAbsoluteCanvasSizeChanged = config.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = config.onAbsoluteWindowSizeChanged
		})
	} else {
		ScrollContent = renderScrollView({
			scrollLayoutOrder = 1,
			contentChildren = {
				Header = Element1,
				Body = if Children then ReactModule.createElement(ReactModule.Fragment, nil, Children) else nil
			},
			onAbsoluteCanvasSizeChanged = config.onAbsoluteCanvasSizeChanged,
			onAbsoluteWindowSizeChanged = config.onAbsoluteWindowSizeChanged
		})
	} else {
		StaticContent = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y padding-bottom-xlarge",
			LayoutOrder = if HasElement then 2 else 1
		}, {
			Header = if HasElement or not Element1 then nil else Element1,
			Body = if Children then ReactModule.createElement(ReactModule.Fragment, nil, Children) else nil
		})
	}
	
	return ReactModule.createElement(View, {
		tag = {
			["col size-full-0 padding-top-xlarge"] = true,
			grow = UseInternalScroll,
			["auto-y"] = not UseInternalScroll
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Inner = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["col gap-small size-full-0"] = true,
				grow = UseInternalScroll,
				["auto-y"] = not UseInternalScroll
			}
		}, if UseInternalScroll or not HasElement then Config else { Header = Element1, StaticContent = Config.StaticContent }),
		ScrollAffordanceDivider = if UseInternalScroll then Element else nil
	})
end