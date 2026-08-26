local parent = script:FindFirstAncestor("PeekView").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useRouteName = require(parent.Navigation).useRouteName
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local peekViewModule = require(script.Parent.PeekView)
local peekViewStateModule = require(script.Parent.PeekViewState)
local peekViewDismissedEventModule = require(script.Parent.analytics.peekViewDismissedEvent)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return function(p1)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), useRouteName (ref), useStyle (ref), reactModule (ref), peekViewStateModule (ref), peekViewDismissedEventModule (ref), cryoModule (ref), peekViewModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var1 = useRoactService(appEventIngestService)
	local var2 = useRouteName()
	local var3 = useStyle()
	local onClosed = p1.onClosed
	local onViewStateChanged = p1.onViewStateChanged
	local var4 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: peekViewStateModule (copy), onClosed (ref), var1 (ref), p1 (ref), peekViewDismissedEventModule (copy), cryoModule (copy), var2 (ref), onViewStateChanged (ref)
		if p2 == peekViewStateModule.Closed then
			if onClosed then
				onClosed()
			end
			if p4.dismissMethod and var1 then
				peekViewDismissedEventModule.logEvent(var1, "PeekView", cryoModule.Dictionary.join(p1.viewChangedEventMeta or {}, p4, { page = var2 }))
			end
		end
		if onViewStateChanged then
			onViewStateChanged(p2, p3)
		end
	end, {
		onClosed,
		onViewStateChanged,
		p1.viewChangedEventMeta,
		var1,
		var2
	})
	local var5, var6 = reactModule.useBinding(0)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(p1.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
	}, {
		PeekViewTopBar = reactModule.createElement("CanvasGroup", {
			Active = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, p1.topBarHeight),
			BackgroundColor3 = var3.Theme.BackgroundDefault.Color,
			BorderColor3 = var3.Tokens.Color.Common.Shimmer.Color3,
			GroupTransparency = var5:map(function(p2)
				return 1 - p2
			end)
		}, { PeekViewTopBarInner = p1.topBarSlot }),
		PeekViewContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			PeekView = reactModule.createElement(peekViewModule, {
				hasScrim = true,
				fullViewContentHeight = p1.fullViewContentHeight,
				briefViewContentHeight = p1.briefViewContentHeight,
				bottomDockedContainerHeight = p1.bottomDockedContainerHeight,
				bottomDockedContainerContent = { PeekViewBottomBar = p1.bottomBarSlot },
				mountAsFullView = p1.mountAsFullView,
				mountAnimation = p1.mountAnimation,
				viewStateChanged = var4,
				briefToFullTransitionPercent = function(p2)
					-- upvalues: var6 (ref), p1 (ref)
					var6(p2)
					
					if p1.transitionPercentCallback then
						p1.transitionPercentCallback(p2)
					end
				end,
				hasSolidDragger = if fFlagProfilePlatformNewProfileHeader then p1.hasSolidDragger else nil,
				scrollingFrameRef = if fFlagSduiExperienceDetailsSupport then p1.scrollingFrameRef else nil
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
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