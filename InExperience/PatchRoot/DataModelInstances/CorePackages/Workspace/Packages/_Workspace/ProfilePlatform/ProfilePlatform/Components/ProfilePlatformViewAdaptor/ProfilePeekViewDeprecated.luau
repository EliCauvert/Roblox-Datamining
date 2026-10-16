local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local PeekViewModule = require(Parent.PeekView)
local PeekViewState = PeekViewModule.PeekViewState
local PeekView = PeekViewModule.PeekView
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle

return function(p1) --[[ Line: 25 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), PeekViewState (copy), PeekView (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local TopBarHeight: number = p1.topBarHeight
	local IsUseStateResultAbove = UseStateResult > 0.95
	local NoIsUseStateResultAbove: boolean = UseStateResult > 0 and not IsUseStateResultAbove
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(0, p1.viewWidth, 1, 0)
	}, {
		PeekViewTopBar = if IsUseStateResultAbove then p1.renderTopBar() else nil,
		PeekViewTopBarEffectHolder = if NoIsUseStateResultAbove then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, TopBarHeight),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = 1 - UseStateResult
		}) else nil,
		PeekViewContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -TopBarHeight + 6),
			Position = UDim2.new(0, 0, 0, TopBarHeight - 6)
		}, {
			PeekView = ReactModule.createElement(PeekView, {
				bottomDockedContainerHeight = 0,
				briefViewContentHeight = p1.briefViewContentHeight,
				mountAsFullView = p1.mountAsFullView,
				viewStateChanged = ReactModule.useCallback(function(Closed, _) --[[ Line: 33 ]]
					-- upvalues: p1 (copy), PeekViewState (upval)
					local OnPeekViewClosedFunction: () -> () = p1.onPeekViewClosed
					
					if Closed == PeekViewState.Closed and OnPeekViewClosedFunction then
						OnPeekViewClosedFunction()
					end
				end, { p1.onPeekViewClosed }),
				briefToFullTransitionPercent = ReactModule.useCallback(function(p2) --[[ Line: 29 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(p2)
				end, {})
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
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