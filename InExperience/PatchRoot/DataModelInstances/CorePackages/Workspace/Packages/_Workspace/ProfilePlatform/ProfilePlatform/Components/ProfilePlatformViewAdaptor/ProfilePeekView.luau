local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local PeekViewModule = require(Parent.PeekView)
local PeekView = PeekViewModule.PeekView
local PeekViewState = PeekViewModule.PeekViewState
local View = require(Parent.Foundation).View
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagProfilePlatformPeekDraggerContrast = require(Parent.SharedFlags).FFlagProfilePlatformPeekDraggerContrast
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local v1: number = if FFlagProfilePlatformNewProfileHeader then 0 else 25

return function(p1)
	-- upvalues: UseSelectorFunction (copy), FFlagProfilePlatformNewProfileHeader (copy), UseStyleFunction (copy), ReactModule (copy), PeekViewState (copy), v1 (copy), FFlagProfilePlatformPeekDraggerContrast (copy), EnumsModule (copy), View (copy), PeekView (copy)
	local StatusBarHeight = p1.statusBarHeight or UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end)
	local UseStyleResult = if FFlagProfilePlatformNewProfileHeader then UseStyleFunction() else nil
	local UseResult = ReactModule.useCallback(function(Closed, p2, p3)
		-- upvalues: PeekViewState (upval), p1 (copy)
		if Closed == PeekViewState.Closed and p1.onClosed then
			p1.onClosed()
		end
		if p1.onViewStateChanged then
			p1.onViewStateChanged(Closed, p2, p3)
		end
	end, { p1.onClosed, p1.onViewStateChanged })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local IsProfileTypeMatch: boolean = FFlagProfilePlatformNewProfileHeader and (FFlagProfilePlatformPeekDraggerContrast and p1.profileType == EnumsModule.ProfileTypes.User)
	
	return ReactModule.createElement(View, {
		tag = "position-top-left",
		Size = UDim2.new(p1.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
	}, {
		StatusBarSpace = if FFlagProfilePlatformNewProfileHeader then nil else ReactModule.createElement(View, {
			tag = "position-top-left bg-surface-0",
			BorderSizePixel = 0,
			ZIndex = 999,
			Size = UDim2.new(1, 0, 0, StatusBarHeight)
		}),
		ProfileContent = ReactModule.createElement(View, {
			Size = if FFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 1, -StatusBarHeight) else UDim2.new(1, 0, 1, -StatusBarHeight + v1),
			Position = if FFlagProfilePlatformNewProfileHeader then UDim2.new(0, 0, 0, StatusBarHeight) else UDim2.new(0, 0, 0, StatusBarHeight - v1)
		}, {
			PeekView = ReactModule.createElement(PeekView, {
				hasScrim = true,
				fullViewContentHeight = p1.fullViewContentHeight,
				briefViewContentHeight = if p1.briefViewContentHeight then p1.briefViewContentHeight else UDim.new(0.5, 0),
				bottomDockedContainerHeight = p1.bottomDockedContainerHeight,
				bottomDockedContainerContent = { PeekViewBottomBar = p1.bottomBarSlot },
				mountAsFullView = p1.mountAsFullView,
				mountAnimation = p1.mountAnimation,
				viewStateChanged = UseResult,
				briefToFullTransitionPercent = function(p2)
					-- upvalues: UseBindingResult2 (copy), p1 (copy)
					UseBindingResult2(p2)
					
					if p1.transitionPercentCallback then
						p1.transitionPercentCallback(p2)
					end
				end,
				hasSolidDragger = (not FFlagProfilePlatformNewProfileHeader or p1.profileType ~= EnumsModule.ProfileTypes.User) and nil,
				draggerImageStyle = if IsProfileTypeMatch then UseStyleResult.Tokens.Color.System.Contrast else nil
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p1.contentSlot
			})
		}),
		PeekViewTopBar = if FFlagProfilePlatformNewProfileHeader then ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1000,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, StatusBarHeight + 56),
			GroupTransparency = UseBindingResult:map(function(p2: number): number
				return 1 - p2
			end)
		}, {
			StatusBarBackground = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, StatusBarHeight),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
			}),
			TopBarSlotContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, StatusBarHeight),
				Size = UDim2.new(1, 0, 0, 56)
			}, { TopBar = p1.topBarSlot })
		}) else nil,
		TransparentTopBarOverlay = if FFlagProfilePlatformNewProfileHeader then nil else ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 1000,
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, StatusBarHeight),
			GroupTransparency = UseBindingResult:map(function(p2: number): number
				return 1 - p2
			end)
		}, { TopBar = p1.topBarSlot })
	})
end