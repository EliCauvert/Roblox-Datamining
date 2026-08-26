local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local controlState = foundationModule.Enums.ControlState
local iconSize = foundationModule.Enums.IconSize
local icon = foundationModule.Icon
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ScrollButton(p1)
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), view (ref), icon (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "size-1000 radius-circle bg-over-media-100",
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Visible = p1.Visible,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: controlState (copy), p1 (ref)
			if p2 == controlState.Hover or p2 == controlState.Pressed then
				if p1.onScrollButtonEnter then
					p1.onScrollButtonEnter()
					
					return
				end
			elseif p1.onScrollButtonLeave then
				p1.onScrollButtonLeave()
			end
		end, { p1.onScrollButtonEnter, p1.onScrollButtonLeave }),
		onActivated = p1.onActivated
	}, {
		Icon = reactModule.createElement(icon, {
			name = p1.icon,
			size = iconSize.Large,
			style = useTokens().Color.Content.Emphasis,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), reactIsModule (ref), ScrollButton (ref)
	local buttonOffsetFromEdge = p1.buttonOffsetFromEdge or 0
	local var1, var2 = reactModule.useState(false)
	local _ = nil
	local _ = nil
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Size = p1.Size,
		ZIndex = p1.ZIndex or 10,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.MouseEnter] = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(true)
		end, {}),
		[reactModule.Event.MouseLeave] = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(false)
		end, {})
	}, {
		LeftScrollButton = reactModule.createElement(ScrollButton, {
			icon = "chevron-large-left",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, buttonOffsetFromEdge, 0.5, 0),
			Visible = if reactIsModule.isBinding(p1.leftScrollingEnabled) then p1.leftScrollingEnabled:map(function(p2)
				-- upvalues: var1 (ref)
				return var1 and p2
			end) else var1 and p1.leftScrollingEnabled,
			onScrollButtonEnter = p1.onScrollButtonEnter,
			onScrollButtonLeave = p1.onScrollButtonLeave,
			onActivated = p1.handleScrollLeft
		}),
		RightScrollButton = reactModule.createElement(ScrollButton, {
			icon = "chevron-large-right",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -buttonOffsetFromEdge, 0.5, 0),
			Visible = if reactIsModule.isBinding(p1.rightScrollingEnabled) then p1.rightScrollingEnabled:map(function(p2)
				-- upvalues: var1 (ref)
				return var1 and p2
			end) else var1 and p1.rightScrollingEnabled,
			onScrollButtonEnter = p1.onScrollButtonEnter,
			onScrollButtonLeave = p1.onScrollButtonLeave,
			onActivated = p1.handleScrollRight
		})
	})
end