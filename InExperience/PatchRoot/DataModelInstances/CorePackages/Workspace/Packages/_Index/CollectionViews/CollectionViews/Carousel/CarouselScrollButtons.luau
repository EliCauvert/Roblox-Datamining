local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local controlState = foundationModule.Enums.ControlState
local iconSize = foundationModule.Enums.IconSize
local icon = foundationModule.Icon
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ScrollButton(p0) --[[ line: 41 ]]
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), view (ref), icon (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "size-1000 radius-circle bg-over-media-100",
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position,
		Visible = p0.Visible,
		onStateChanged = reactModule.useCallback(function(p1) --[[ line: 43 ]]
			-- upvalues: controlState (copy), p0 (ref)
			if p1 == controlState.Hover or p1 == controlState.Pressed then
				if p0.onScrollButtonEnter then
					p0.onScrollButtonEnter()
					
					return
				end
			elseif p0.onScrollButtonLeave then
				p0.onScrollButtonLeave()
			end
		end, { p0.onScrollButtonEnter, p0.onScrollButtonLeave }),
		onActivated = p0.onActivated
	}, {
		Icon = reactModule.createElement(icon, {
			name = p0.icon,
			size = iconSize.Large,
			style = useTokens().Color.Content.Emphasis,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	})
end

return function(p2) --[[ line: 73 | named "CarouselScrollButtons" ]]
	-- upvalues: reactModule (ref), reactIsModule (ref), ScrollButton (ref)
	local buttonOffsetFromEdge = p2.buttonOffsetFromEdge or 0
	local var5, var6 = reactModule.useState(false)
	local _ = nil
	local _ = nil
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p2.AnchorPoint,
		Position = p2.Position,
		Size = p2.Size,
		ZIndex = p2.ZIndex or 10,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.MouseEnter] = reactModule.useCallback(function() --[[ line: 100 ]]
			-- upvalues: var6 (ref)
			var6(true)
		end, {}),
		[reactModule.Event.MouseLeave] = reactModule.useCallback(function() --[[ line: 103 ]]
			-- upvalues: var6 (ref)
			var6(false)
		end, {})
	}, {
		LeftScrollButton = reactModule.createElement(ScrollButton, {
			icon = "chevron-large-left",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, buttonOffsetFromEdge, 0.5, 0),
			Visible = if reactIsModule.isBinding(p2.leftScrollingEnabled) then p2.leftScrollingEnabled:map(function(p3) --[[ line: 81 ]]
				-- upvalues: var5 (ref)
				return var5 and p3
			end) else var5 and p2.leftScrollingEnabled,
			onScrollButtonEnter = p2.onScrollButtonEnter,
			onScrollButtonLeave = p2.onScrollButtonLeave,
			onActivated = p2.handleScrollLeft
		}),
		RightScrollButton = reactModule.createElement(ScrollButton, {
			icon = "chevron-large-right",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -buttonOffsetFromEdge, 0.5, 0),
			Visible = if reactIsModule.isBinding(p2.rightScrollingEnabled) then p2.rightScrollingEnabled:map(function(p4) --[[ line: 92 ]]
				-- upvalues: var5 (ref)
				return var5 and p4
			end) else var5 and p2.rightScrollingEnabled,
			onScrollButtonEnter = p2.onScrollButtonEnter,
			onScrollButtonLeave = p2.onScrollButtonLeave,
			onActivated = p2.handleScrollRight
		})
	})
end