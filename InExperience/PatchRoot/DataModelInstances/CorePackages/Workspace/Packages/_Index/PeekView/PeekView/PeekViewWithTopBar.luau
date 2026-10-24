local Parent = script:FindFirstAncestor("PeekView").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseRouteNameFunction = require(Parent.Navigation).useRouteName
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local PeekViewModule = require(script.Parent.PeekView)
local PeekViewStateModule = require(script.Parent.PeekViewState)
local PeekViewDismissedEventModule = require(script.Parent.analytics.peekViewDismissedEvent)
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagFixOverlayTopInsetForDeviceSafeInsets = require(Parent.SharedFlags).FFlagFixOverlayTopInsetForDeviceSafeInsets
local ShouldUseDeviceSafeInsets = require(Parent.Display).shouldUseDeviceSafeInsets
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), UseRouteNameFunction (copy), UseStyleFunction (copy), ReactModule (copy), PeekViewStateModule (copy), PeekViewDismissedEventModule (copy), CryoModule (copy), FFlagFixOverlayTopInsetForDeviceSafeInsets (copy), ShouldUseDeviceSafeInsets (copy), UseDeviceInsetsFunction (copy), PeekViewModule (copy), FFlagProfilePlatformNewProfileHeader (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRouteNameResult = UseRouteNameFunction()
	local UseStyleResult = UseStyleFunction()
	local OnClosedFunction = p1.onClosed
	local OnViewStateChangedFunction = p1.onViewStateChanged
	local UseResult = ReactModule.useCallback(function(Closed, p2, p3)
		-- upvalues: PeekViewStateModule (upval), OnClosedFunction (copy), UseRoactServiceResult (copy), p1 (copy), PeekViewDismissedEventModule (upval), CryoModule (upval), UseRouteNameResult (copy), OnViewStateChangedFunction (copy)
		if Closed == PeekViewStateModule.Closed then
			if OnClosedFunction then
				OnClosedFunction()
			end
			if p3.dismissMethod and UseRoactServiceResult then
				PeekViewDismissedEventModule.logEvent(UseRoactServiceResult, "PeekView", CryoModule.Dictionary.join(p1.viewChangedEventMeta or {}, p3, { page = UseRouteNameResult }))
			end
		end
		if OnViewStateChangedFunction then
			OnViewStateChangedFunction(Closed, p2)
		end
	end, {
		OnClosedFunction,
		OnViewStateChangedFunction,
		p1.viewChangedEventMeta,
		UseRoactServiceResult,
		UseRouteNameResult
	})
	local Top = if FFlagFixOverlayTopInsetForDeviceSafeInsets and ShouldUseDeviceSafeInsets then UseDeviceInsetsFunction().top else 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(p1.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
	}, {
		PeekViewTopBar = ReactModule.createElement("CanvasGroup", {
			Active = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 0, -Top),
			Size = UDim2.new(1, 0, 0, p1.topBarHeight + Top),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BorderColor3 = UseStyleResult.Tokens.Color.Common.Shimmer.Color3,
			GroupTransparency = UseBindingResult:map(function(p2: number): number
				return 1 - p2
			end)
		}, {
			PeekViewTopBarInner = if Top > 0 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0, Top),
				Size = UDim2.new(1, 0, 0, p1.topBarHeight)
			}, { TopBarSlot = p1.topBarSlot }) else p1.topBarSlot
		}),
		PeekViewContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			PeekView = ReactModule.createElement(PeekViewModule, {
				hasScrim = true,
				fullViewContentHeight = p1.fullViewContentHeight,
				briefViewContentHeight = p1.briefViewContentHeight,
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
				hasSolidDragger = if FFlagProfilePlatformNewProfileHeader then p1.hasSolidDragger else nil,
				scrollingFrameRef = p1.scrollingFrameRef
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p1.contentSlot
			})
		})
	})
end