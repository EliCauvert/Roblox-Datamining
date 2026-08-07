local httpService = game:GetService("HttpService")
local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local responsiveModule = require(virtualEvents.Parent.Responsive)
local collectionViewsModule = require(virtualEvents.Parent.CollectionViews)
local sortEventsByStartDateModule = require(virtualEvents.Common.sortEventsByStartDate)
local useGetGameTileHeight = require(virtualEvents.Parent.GameCollections).useGetGameTileHeight
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local useTextSizeOffset = require(virtualEvents.Parent.UIBlox).Core.Style.useTextSizeOffset
local useDesignTokens = require(virtualEvents.Parent.Style).useDesignTokens
local frameBoundsImpressionsTracker = require(virtualEvents.Parent.Impressions).FrameBoundsImpressionsTracker
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useCollectionImpressionsSignal = collectionViewsModule.useCollectionImpressionsSignal
local flaggedMutedError = require(virtualEvents.Parent.Loggers).flaggedMutedError
local discoveryEventErrorLogger = require(virtualEvents.Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local eventTileModule = require(script.Parent.EventTile)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local fFlagLuaAppEventsListImpressionToEventError = require(virtualEvents.Parent.SharedFlags).FFlagLuaAppEventsListImpressionToEventError
local fFlagLuaAppSduiEventDetailsEnabled = require(virtualEvents.Parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local fFlagLuaAppGameViewTileBackgroundColorOverride = require(virtualEvents.Parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride

return function(p0) --[[ line: 54 ]]
	-- upvalues: useTextSizeOffset (ref), useDesignTokens (ref), responsiveModule (ref), reactModule (ref), httpService (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), useCallback (ref), eventTileModule (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), useGetGameTileHeight (ref), useLocalization (ref), sortEventsByStartDateModule (ref), fFlagLuaAppEventsListImpressionToEventError (ref), discoveryEventErrorLogger (ref), flaggedMutedError (ref), useCollectionImpressionsSignal (ref), useEffect (ref), collectionCarousel (ref), frameBoundsImpressionsTracker (ref)
	local var7 = useTextSizeOffset()
	local var8 = useDesignTokens()
	local var9 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var10 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: p0 (ref), httpService (copy)
		return `EventsListCarousel_{p0.universeId}{httpService:GenerateGUID()}`
	end, { p0.universeId })
	local var11 = if fFlagLuaAppGameViewTileBackgroundColorOverride and p0.peekViewFormat then var8.Color.Surface.Surface_200 else nil
	local var12 = useCallback(function(p1, p2, p3, _) --[[ line: 71 ]]
		-- upvalues: reactModule (copy), eventTileModule (copy), p0 (ref), var11 (ref), var10 (ref), var9 (ref), fFlagLuaAppSduiEventDetailsEnabled (copy)
		return reactModule.createElement(eventTileModule, {
			Event = p1,
			DefaultThumbnail = p0.defaultThumbnail,
			backgroundStyle = var11,
			onJoinEvent = p0.onJoinEvent,
			onRsvpChanged = p0.onRsvpChanged,
			onTileActivated = p0.onTileActivated,
			impressionsTag = var10,
			layoutOrder = p2,
			size = p3,
			disableButtons = var9,
			suppressRsvpReminderToastBecauseEventDetailsFocused = if fFlagLuaAppSduiEventDetailsEnabled then p0.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
		}), p1.id
	end, {
		p0.defaultThumbnail, p0.onJoinEvent, p0.onRsvpChanged, p0.onTileActivated,
		if fFlagLuaAppSduiEventDetailsEnabled then p0.suppressRsvpReminderToastBecauseEventDetailsFocused else nil,
		var10, var9,
		if fFlagLuaAppGameViewTileBackgroundColorOverride then var11 else nil
	})
	local var13 = useGetGameTileHeight(false, "Event", true, false, false, var7, if not var9 then var8.Size.Size_700 + var8.Size.Size_200 else 0)
	local var14 = useLocalization({ title = "Feature.VirtualEvents.EventsListTitle" })
	local var15 = sortEventsByStartDateModule(p0.virtualEvents)
	local var16 = reactModule.useRef({})
	local var17 = useCallback(function(p4) --[[ line: 120 ]]
		-- upvalues: var15 (ref), var16 (ref), p0 (ref), fFlagLuaAppEventsListImpressionToEventError (copy), discoveryEventErrorLogger (copy), flaggedMutedError (copy)
		for i, v in p4 do
			local var23 = var15[v]
			
			if var23 == nil then
				if fFlagLuaAppEventsListImpressionToEventError then
					discoveryEventErrorLogger.reportError("EventsListCarouselNilViewedEvent", `Viewed event at index {v} was nil when sending Event Tile impressions with referral source {p0.referralSource}`, { index = v, referralSource = p0.referralSource })
				else
					flaggedMutedError("EventsListCarouselNilViewedEvent", `Viewed event at index ${v} was nil when sending Event Tile impressions with referral source ${p0.referralSource}`)
				end
			elseif not var16.current[var23.id] then
				var16.current[var23.id] = true
				p0.onEventImpression(var23)
			end
		end
	end, { p0.onEventImpression, var15, p0.referralSource })
	local var18 = reactModule.useRef(nil)
	local var19, var20 = useCollectionImpressionsSignal()
	local var21, var22 = reactModule.useState(os.clock())
	useEffect(function() --[[ line: 158 ]]
		-- upvalues: var22 (ref)
		var22(os.clock())
	end, { p0.virtualEvents })
	
	return if #p0.virtualEvents == 0 then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ClipsDescendants = not p0.peekViewFormat,
		LayoutOrder = p0.layoutOrder
	}, {
		EventsCarousel = reactModule.createElement(collectionCarousel, {
			hideHeaderButton = true,
			fractionalItemAmount = 0.33,
			sideMargin = 0,
			scrollingFrameRef = var18,
			title = var14.title,
			items = var15,
			renderItem = var12,
			getItemHeight = var13,
			onViewableItemsChanged = var20,
			onChangeCanvasPosition = var20,
			numColumns = if p0.peekViewFormat then 1 else 2,
			columnGap = var8.Size.Size_300
		}),
		FrameBoundsImpressionsTracker = reactModule.createElement(frameBoundsImpressionsTracker, {
			pageContext = p0.referralSource,
			parentRef = var18,
			impressionsTag = var10,
			scrollViewPositionChangedSignal = var19,
			sendImpressions = var17,
			dataUpdatedTimestamp = var21
		})
	})
end