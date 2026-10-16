local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local ControlState = FoundationModule.Enums.ControlState
local IconSize = FoundationModule.Enums.IconSize
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function ScrollButton(Frame) --[[ Line: 41 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ControlState (copy), View (copy), Icon (copy), IconSize (copy)
	return ReactModule.createElement(View, {
		tag = "size-1000 radius-circle bg-over-media-100",
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Visible = Frame.Visible,
		onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 43 ]]
			-- upvalues: ControlState (upval), Frame (copy)
			if Hover == ControlState.Hover or Hover == ControlState.Pressed then
				if Frame.onScrollButtonEnter then
					Frame.onScrollButtonEnter()
					
					return
				end
			elseif Frame.onScrollButtonLeave then
				Frame.onScrollButtonLeave()
			end
		end, { Frame.onScrollButtonEnter, Frame.onScrollButtonLeave }),
		onActivated = Frame.onActivated
	}, {
		Icon = ReactModule.createElement(Icon, {
			name = Frame.icon,
			size = IconSize.Large,
			style = UseTokensFunction().Color.Content.Emphasis,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	})
end

return function(Frame) --[[ Line: 73 | Named "CarouselScrollButtons" ]]
	-- upvalues: ReactModule (copy), ReactIsModule (copy), ScrollButton (copy)
	local ButtonOffsetFromEdge = Frame.buttonOffsetFromEdge or 0
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement("Frame", {
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Size = Frame.Size,
		ZIndex = Frame.ZIndex or 10,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Event.MouseEnter] = ReactModule.useCallback(function() --[[ Line: 100 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {}),
		[ReactModule.Event.MouseLeave] = ReactModule.useCallback(function() --[[ Line: 103 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
	}, {
		LeftScrollButton = ReactModule.createElement(ScrollButton, {
			icon = "chevron-large-left",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, ButtonOffsetFromEdge, 0.5, 0),
			Visible = if ReactIsModule.isBinding(Frame.leftScrollingEnabled) then Frame.leftScrollingEnabled:map(function(p1) --[[ Line: 81 ]]
				-- upvalues: UseStateResult (copy)
				return UseStateResult and p1
			end) else UseStateResult and Frame.leftScrollingEnabled,
			onScrollButtonEnter = Frame.onScrollButtonEnter,
			onScrollButtonLeave = Frame.onScrollButtonLeave,
			onActivated = Frame.handleScrollLeft
		}),
		RightScrollButton = ReactModule.createElement(ScrollButton, {
			icon = "chevron-large-right",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -ButtonOffsetFromEdge, 0.5, 0),
			Visible = if ReactIsModule.isBinding(Frame.rightScrollingEnabled) then Frame.rightScrollingEnabled:map(function(p1) --[[ Line: 92 ]]
				-- upvalues: UseStateResult (copy)
				return UseStateResult and p1
			end) else UseStateResult and Frame.rightScrollingEnabled,
			onScrollButtonEnter = Frame.onScrollButtonEnter,
			onScrollButtonLeave = Frame.onScrollButtonLeave,
			onActivated = Frame.handleScrollRight
		})
	})
end