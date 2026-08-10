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
local var5 = if fFlagProfilePlatformNewProfileHeader then 0 else 25

return function(p0) --[[ line: 40 | named "ProfilePeekView" ]]
	-- upvalues: useSelector (ref), fFlagProfilePlatformNewProfileHeader (ref), useStyle (ref), reactModule (ref), peekViewState (ref), var5 (ref), fFlagProfilePlatformPeekDraggerContrast (ref), enumsModule (ref), view (ref), peekView (ref)
	local statusBarHeight = p0.statusBarHeight or useSelector(function(p1) --[[ line: 42 ]]
		return p1.TopBar.statusBarHeight
	end)
	local var7 = if fFlagProfilePlatformNewProfileHeader then useStyle() else nil
	local var8 = reactModule.useCallback(function(p2, p3, p4) --[[ line: 47 ]]
		-- upvalues: peekViewState (copy), p0 (ref)
		if p2 == peekViewState.Closed and p0.onClosed then
			p0.onClosed()
		end
		if p0.onViewStateChanged then
			p0.onViewStateChanged(p2, p3, p4)
		end
	end, { p0.onClosed, p0.onViewStateChanged })
	local var9, var10 = reactModule.useBinding(0)
	
	return reactModule.createElement(view, {
		tag = "position-top-left",
		Size = UDim2.new(p0.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
	}, {
		StatusBarSpace = if fFlagProfilePlatformNewProfileHeader then nil else reactModule.createElement(view, {
			tag = "position-top-left bg-surface-0",
			BorderSizePixel = 0,
			ZIndex = 999,
			Size = UDim2.new(1, 0, 0, statusBarHeight)
		}),
		ProfileContent = reactModule.createElement(view, {
			Size = if fFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 1, -statusBarHeight) else UDim2.new(1, 0, 1, -statusBarHeight + var5),
			Position = if fFlagProfilePlatformNewProfileHeader then UDim2.new(0, 0, 0, statusBarHeight) else UDim2.new(0, 0, 0, statusBarHeight - var5)
		}, {
			PeekView = reactModule.createElement(peekView, {
				hasScrim = true,
				fullViewContentHeight = p0.fullViewContentHeight,
				briefViewContentHeight = if p0.briefViewContentHeight then p0.briefViewContentHeight else UDim.new(0.5, 0),
				bottomDockedContainerHeight = p0.bottomDockedContainerHeight,
				bottomDockedContainerContent = { PeekViewBottomBar = p0.bottomBarSlot },
				mountAsFullView = p0.mountAsFullView,
				mountAnimation = p0.mountAnimation,
				viewStateChanged = var8,
				briefToFullTransitionPercent = function(p5) --[[ line: 60 ]]
					-- upvalues: var10 (ref), p0 (ref)
					var10(p5)
					
					if p0.transitionPercentCallback then
						p0.transitionPercentCallback(p5)
					end
				end,
				hasSolidDragger = if fFlagProfilePlatformNewProfileHeader and p0.profileType == enumsModule.ProfileTypes.User then false else nil,
				draggerImageStyle = if fFlagProfilePlatformNewProfileHeader and (fFlagProfilePlatformPeekDraggerContrast and p0.profileType == enumsModule.ProfileTypes.User) then var7.Tokens.Color.System.Contrast else nil
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p0.contentSlot
			})
		}),
		PeekViewTopBar = if fFlagProfilePlatformNewProfileHeader then reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1000,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, statusBarHeight + 56),
			GroupTransparency = var9:map(function(p6) --[[ line: 131 ]]
				return 1 - p6
			end)
		}, {
			StatusBarBackground = reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, statusBarHeight),
				BackgroundColor3 = var7.Theme.BackgroundDefault.Color
			}),
			TopBarSlotContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, statusBarHeight),
				Size = UDim2.new(1, 0, 0, 56)
			}, { TopBar = p0.topBarSlot })
		}) else nil,
		TransparentTopBarOverlay = if fFlagProfilePlatformNewProfileHeader then nil else reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 1000,
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, statusBarHeight),
			GroupTransparency = var9:map(function(p7) --[[ line: 160 ]]
				return 1 - p7
			end)
		}, { TopBar = p0.topBarSlot })
	})
end