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

return function(p0) --[[ line: 49 | named "PeekViewWithTopBar" ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), useRouteName (ref), useStyle (ref), reactModule (ref), peekViewStateModule (ref), peekViewDismissedEventModule (ref), cryoModule (ref), peekViewModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var5 = useRoactService(appEventIngestService)
	local var6 = useRouteName()
	local var7 = useStyle()
	local onClosed = p0.onClosed
	local onViewStateChanged = p0.onViewStateChanged
	local var8 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 56 ]]
		-- upvalues: peekViewStateModule (copy), onClosed (ref), var5 (ref), p0 (ref), peekViewDismissedEventModule (copy), cryoModule (copy), var6 (ref), onViewStateChanged (ref)
		if p1 == peekViewStateModule.Closed then
			if onClosed then
				onClosed()
			end
			if p3.dismissMethod and var5 then
				peekViewDismissedEventModule.logEvent(var5, "PeekView", cryoModule.Dictionary.join(p0.viewChangedEventMeta or {}, p3, { page = var6 }))
			end
		end
		if onViewStateChanged then
			onViewStateChanged(p1, p2)
		end
	end, {
		onClosed,
		onViewStateChanged,
		p0.viewChangedEventMeta,
		var5,
		var6
	})
	local var9, var10 = reactModule.useBinding(0)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(p0.viewWidth or UDim.new(1, 0), UDim.new(1, 0))
	}, {
		PeekViewTopBar = reactModule.createElement("CanvasGroup", {
			Active = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, p0.topBarHeight),
			BackgroundColor3 = var7.Theme.BackgroundDefault.Color,
			BorderColor3 = var7.Tokens.Color.Common.Shimmer.Color3,
			GroupTransparency = var9:map(function(p4) --[[ line: 102 ]]
				return 1 - p4
			end)
		}, { PeekViewTopBarInner = p0.topBarSlot }),
		PeekViewContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			PeekView = reactModule.createElement(peekViewModule, {
				hasScrim = true,
				fullViewContentHeight = p0.fullViewContentHeight,
				briefViewContentHeight = p0.briefViewContentHeight,
				bottomDockedContainerHeight = p0.bottomDockedContainerHeight,
				bottomDockedContainerContent = { PeekViewBottomBar = p0.bottomBarSlot },
				mountAsFullView = p0.mountAsFullView,
				mountAnimation = p0.mountAnimation,
				viewStateChanged = var8,
				briefToFullTransitionPercent = function(p5) --[[ line: 81 ]]
					-- upvalues: var10 (ref), p0 (ref)
					var10(p5)
					
					if p0.transitionPercentCallback then
						p0.transitionPercentCallback(p5)
					end
				end,
				hasSolidDragger = if fFlagProfilePlatformNewProfileHeader then p0.hasSolidDragger else nil,
				scrollingFrameRef = if fFlagSduiExperienceDetailsSupport then p0.scrollingFrameRef else nil
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Content = p0.contentSlot
			})
		})
	})
end