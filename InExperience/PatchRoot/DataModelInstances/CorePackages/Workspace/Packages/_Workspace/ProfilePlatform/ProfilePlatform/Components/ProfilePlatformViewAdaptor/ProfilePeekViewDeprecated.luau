local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local peekViewModule = require(parent.PeekView)
local peekViewState = peekViewModule.PeekViewState
local peekView = peekViewModule.PeekView
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), peekViewState (ref), peekView (ref)
	local var1 = useStyle()
	local var2, var3 = reactModule.useState(0)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2)
	end, {})
	local var5 = reactModule.useCallback(function(p2, _)
		-- upvalues: p1 (ref), peekViewState (copy)
		local onPeekViewClosed = p1.onPeekViewClosed
		
		if p2 == peekViewState.Closed and onPeekViewClosed then
			onPeekViewClosed()
		end
	end, { p1.onPeekViewClosed })
	local uDim2 = UDim2.new(0, p1.viewWidth, 1, 0)
	local topBarHeight = p1.topBarHeight
	local var6 = var2 > 0.95
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 0),
		Size = uDim2
	}, {
		PeekViewTopBar = if var6 then p1.renderTopBar() else nil,
		PeekViewTopBarEffectHolder = if var2 > 0 and not var6 then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, topBarHeight),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
			BackgroundTransparency = 1 - var2
		}) else nil,
		PeekViewContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -topBarHeight + 6),
			Position = UDim2.new(0, 0, 0, topBarHeight - 6)
		}, {
			PeekView = reactModule.createElement(peekView, {
				bottomDockedContainerHeight = 0,
				briefViewContentHeight = p1.briefViewContentHeight,
				mountAsFullView = p1.mountAsFullView,
				viewStateChanged = var5,
				briefToFullTransitionPercent = var4
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p1.renderContent()
			})
		})
	})
end