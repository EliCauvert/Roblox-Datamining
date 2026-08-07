local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local peekViewModule = require(parent.PeekView)
local peekViewState = peekViewModule.PeekViewState
local peekView = peekViewModule.PeekView
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p0) --[[ line: 25 ]]
	-- upvalues: useStyle (ref), reactModule (ref), peekViewState (ref), peekView (ref)
	local var3 = useStyle()
	local var4, var5 = reactModule.useState(0)
	local var6 = reactModule.useCallback(function(p1) --[[ line: 29 ]]
		-- upvalues: var5 (ref)
		var5(p1)
	end, {})
	local var7 = reactModule.useCallback(function(p2, _) --[[ line: 33 ]]
		-- upvalues: p0 (ref), peekViewState (copy)
		local onPeekViewClosed = p0.onPeekViewClosed
		
		if p2 == peekViewState.Closed and onPeekViewClosed then
			onPeekViewClosed()
		end
	end, { p0.onPeekViewClosed })
	local uDim2 = UDim2.new(0, p0.viewWidth, 1, 0)
	local topBarHeight = p0.topBarHeight
	local var9 = var4 > 0.95
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 0),
		Size = uDim2
	}, {
		PeekViewTopBar = if var9 then p0.renderTopBar() else nil,
		PeekViewTopBarEffectHolder = if var4 > 0 and not var9 then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = var3.Theme.BackgroundDefault.Color,
			BackgroundTransparency = 1 - var4
		}) else nil,
		PeekViewContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -topBarHeight + 6),
			Position = UDim2.new(0, 0, 0, topBarHeight - 6)
		}, {
			PeekView = reactModule.createElement(peekView, {
				bottomDockedContainerHeight = 0,
				briefViewContentHeight = p0.briefViewContentHeight,
				mountAsFullView = p0.mountAsFullView,
				viewStateChanged = var7,
				briefToFullTransitionPercent = var6
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p0.renderContent()
			})
		})
	})
end