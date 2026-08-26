local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local peekViewModule = require(parent.PeekView)
local peekView = peekViewModule.PeekView
local peekViewState = peekViewModule.PeekViewState
local roactUtilsModule = require(parent.RoactUtils)
local view = require(parent.Foundation).View
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagProfilePlatformPeekDraggerContrast = require(parent.SharedFlags).FFlagProfilePlatformPeekDraggerContrast
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local var1 = if fFlagProfilePlatformNewProfileHeader then 0 else 25

return function(p1)
	-- upvalues: useSelector (ref), fFlagProfilePlatformNewProfileHeader (ref), useStyle (ref), reactModule (ref), peekViewState (ref), var1 (ref), fFlagProfilePlatformPeekDraggerContrast (ref), enumsModule (ref), view (ref), peekView (ref)
	local statusBarHeight = p1.statusBarHeight or useSelector(function(p2)
		return p2.TopBar.statusBarHeight
	end)
	local var2 = if fFlagProfilePlatformNewProfileHeader then useStyle() else nil
	local var3 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: peekViewState (copy), p1 (ref)
		if p2 == peekViewState.Closed and p1.onClosed then
			p1.onClosed()
		end
		if p1.onViewStateChanged then
			p1.onViewStateChanged(p2, p3, p4)
		end
	end, { p1.onClosed, p1.onViewStateChanged })
	local var4, var5 = reactModule.useBinding(0)
	
	return reactModule.createElement(view, {
		tag = "position-top-left",
		Size = UDim2.new(p1.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
	}, {
		StatusBarSpace = if fFlagProfilePlatformNewProfileHeader then nil else reactModule.createElement(view, {
			tag = "position-top-left bg-surface-0",
			BorderSizePixel = 0,
			ZIndex = 999,
			Size = UDim2.new(1, 0, 0, statusBarHeight)
		}),
		ProfileContent = reactModule.createElement(view, {
			Size = if fFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 1, -statusBarHeight) else UDim2.new(1, 0, 1, -statusBarHeight + var1),
			Position = if fFlagProfilePlatformNewProfileHeader then UDim2.new(0, 0, 0, statusBarHeight) else UDim2.new(0, 0, 0, statusBarHeight - var1)
		}, {
			PeekView = reactModule.createElement(peekView, {
				hasScrim = true,
				fullViewContentHeight = p1.fullViewContentHeight,
				briefViewContentHeight = if p1.briefViewContentHeight then p1.briefViewContentHeight else UDim.new(0.5, 0),
				bottomDockedContainerHeight = p1.bottomDockedContainerHeight,
				bottomDockedContainerContent = { PeekViewBottomBar = p1.bottomBarSlot },
				mountAsFullView = p1.mountAsFullView,
				mountAnimation = p1.mountAnimation,
				viewStateChanged = var3,
				briefToFullTransitionPercent = function(p2)
					-- upvalues: var5 (ref), p1 (ref)
					var5(p2)
					
					if p1.transitionPercentCallback then
						p1.transitionPercentCallback(p2)
					end
				end,
				hasSolidDragger = if fFlagProfilePlatformNewProfileHeader and p1.profileType == enumsModule.ProfileTypes.User then false else nil,
				draggerImageStyle = if fFlagProfilePlatformNewProfileHeader and (fFlagProfilePlatformPeekDraggerContrast and p1.profileType == enumsModule.ProfileTypes.User) then var2.Tokens.Color.System.Contrast else nil
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p1.contentSlot
			})
		}),
		PeekViewTopBar = if fFlagProfilePlatformNewProfileHeader then reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1000,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, statusBarHeight + 56),
			GroupTransparency = var4:map(function(p2)
				return 1 - p2
			end)
		}, {
			StatusBarBackground = reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, statusBarHeight),
				BackgroundColor3 = var2.Theme.BackgroundDefault.Color
			}),
			TopBarSlotContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, statusBarHeight),
				Size = UDim2.new(1, 0, 0, 56)
			}, { TopBar = p1.topBarSlot })
		}) else nil,
		TransparentTopBarOverlay = if fFlagProfilePlatformNewProfileHeader then nil else reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 1000,
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, statusBarHeight),
			GroupTransparency = var4:map(function(p2)
				return 1 - p2
			end)
		}, { TopBar = p1.topBarSlot })
	})
end