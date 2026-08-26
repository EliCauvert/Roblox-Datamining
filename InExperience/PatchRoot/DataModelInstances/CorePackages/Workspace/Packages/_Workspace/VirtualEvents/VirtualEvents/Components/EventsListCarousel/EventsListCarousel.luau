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
local discoveryEventErrorLogger = require(virtualEvents.Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local eventTileModule = require(script.Parent.EventTile)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local fFlagLuaAppSduiEventDetailsEnabled = require(virtualEvents.Parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local fFlagLuaAppGameViewTileBackgroundColorOverride = require(virtualEvents.Parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride

return function(p1)
	-- upvalues: useTextSizeOffset (ref), useDesignTokens (ref), responsiveModule (ref), reactModule (ref), httpService (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), useCallback (ref), eventTileModule (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), useGetGameTileHeight (ref), useLocalization (ref), sortEventsByStartDateModule (ref), discoveryEventErrorLogger (ref), useCollectionImpressionsSignal (ref), useEffect (ref), collectionCarousel (ref), frameBoundsImpressionsTracker (ref)
	local var1 = useTextSizeOffset()
	local var2 = useDesignTokens()
	local var3 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), httpService (copy)
		return `EventsListCarousel_{p1.universeId}{httpService:GenerateGUID()}`
	end, { p1.universeId })
	local var5 = if fFlagLuaAppGameViewTileBackgroundColorOverride and p1.peekViewFormat then var2.Color.Surface.Surface_200 else nil
	local var6 = useCallback(function(p2, p3, p4, _)
		-- upvalues: reactModule (copy), eventTileModule (copy), p1 (ref), var5 (ref), var4 (ref), var3 (ref), fFlagLuaAppSduiEventDetailsEnabled (copy)
		return reactModule.createElement(eventTileModule, {
			Event = p2,
			DefaultThumbnail = p1.defaultThumbnail,
			backgroundStyle = var5,
			onJoinEvent = p1.onJoinEvent,
			onRsvpChanged = p1.onRsvpChanged,
			onTileActivated = p1.onTileActivated,
			impressionsTag = var4,
			layoutOrder = p3,
			size = p4,
			disableButtons = var3,
			suppressRsvpReminderToastBecauseEventDetailsFocused = if fFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
		}), p2.id
	end, {
		p1.defaultThumbnail, p1.onJoinEvent, p1.onRsvpChanged, p1.onTileActivated,
		if fFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil,
		var4, var3,
		if fFlagLuaAppGameViewTileBackgroundColorOverride then var5 else nil
	})
	local var7 = useGetGameTileHeight(false, "Event", true, false, false, var1, if not var3 then var2.Size.Size_700 + var2.Size.Size_200 else 0)
	local var8 = useLocalization({ title = "Feature.VirtualEvents.EventsListTitle" })
	local var9 = sortEventsByStartDateModule(p1.virtualEvents)
	local var10 = reactModule.useRef({})
	local var11 = useCallback(function(p2)
		-- upvalues: var9 (ref), var10 (ref), p1 (ref), discoveryEventErrorLogger (copy)
		for i, v in p2 do
			local var12 = var9[v]
			
			if var12 == nil then
				discoveryEventErrorLogger.reportError("EventsListCarouselNilViewedEvent", `Viewed event at index {v} was nil when sending Event Tile impressions with referral source {p1.referralSource}`, { index = v, referralSource = p1.referralSource })
			elseif not var10.current[var12.id] then
				var10.current[var12.id] = true
				p1.onEventImpression(var12)
			end
		end
	end, { p1.onEventImpression, var9, p1.referralSource })
	local var13 = reactModule.useRef(nil)
	local var14, var15 = useCollectionImpressionsSignal()
	local var16, var17 = reactModule.useState(os.clock())
	useEffect(function()
		-- upvalues: var17 (ref)
		var17(os.clock())
	end, { p1.virtualEvents })
	
	return if #p1.virtualEvents == 0 then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ClipsDescendants = not p1.peekViewFormat,
		LayoutOrder = p1.layoutOrder
	}, {
		EventsCarousel = reactModule.createElement(collectionCarousel, {
			hideHeaderButton = true,
			fractionalItemAmount = 0.33,
			sideMargin = 0,
			scrollingFrameRef = var13,
			title = var8.title,
			items = var9,
			renderItem = var6,
			getItemHeight = var7,
			onViewableItemsChanged = var15,
			onChangeCanvasPosition = var15,
			numColumns = if p1.peekViewFormat then 1 else 2,
			columnGap = var2.Size.Size_300
		}),
		FrameBoundsImpressionsTracker = reactModule.createElement(frameBoundsImpressionsTracker, {
			pageContext = p1.referralSource,
			parentRef = var13,
			impressionsTag = var4,
			scrollViewPositionChangedSignal = var14,
			sendImpressions = var11,
			dataUpdatedTimestamp = var16
		})
	})
end