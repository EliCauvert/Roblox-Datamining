local HttpService = game:GetService("HttpService")
local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local ReactModule = require(VirtualEvents.Parent.React)
local ResponsiveModule = require(VirtualEvents.Parent.Responsive)
local CollectionViewsModule = require(VirtualEvents.Parent.CollectionViews)
local SortEventsByStartDateModule = require(VirtualEvents.Common.sortEventsByStartDate)
local UseGetGameTileHeightFunction = require(VirtualEvents.Parent.GameCollections).useGetGameTileHeight
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local UseTextSizeOffsetFunction = require(VirtualEvents.Parent.UIBlox).Core.Style.useTextSizeOffset
local UseDesignTokensFunction = require(VirtualEvents.Parent.Style).useDesignTokens
local FrameBoundsImpressionsTracker = require(VirtualEvents.Parent.Impressions).FrameBoundsImpressionsTracker
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local DiscoveryEventErrorLogger = require(VirtualEvents.Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local EventTileModule = require(script.Parent.EventTile)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local FFlagLuaAppSduiEventDetailsEnabled = require(VirtualEvents.Parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local FFlagLuaAppGameViewTileBackgroundColorOverride = require(VirtualEvents.Parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride

return function(p1)
	-- upvalues: UseTextSizeOffsetFunction (copy), UseDesignTokensFunction (copy), ResponsiveModule (copy), ReactModule (copy), HttpService (copy), FFlagLuaAppGameViewTileBackgroundColorOverride (copy), UseCallbackFunction (copy), EventTileModule (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), UseGetGameTileHeightFunction (copy), UseLocalizationFunction (copy), SortEventsByStartDateModule (copy), DiscoveryEventErrorLogger (copy), UseCollectionImpressionsSignalFunction (copy), UseEffectFunction (copy), CollectionCarousel (copy), FrameBoundsImpressionsTracker (copy)
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: p1 (copy), HttpService (upval)
		return `EventsListCarousel_{p1.universeId}{HttpService:GenerateGUID()}`
	end, { p1.universeId })
	local Surface200 = if FFlagLuaAppGameViewTileBackgroundColorOverride and p1.peekViewFormat then UseDesignTokensResult.Color.Surface.Surface_200 else nil
	local UseCallbackResult = UseCallbackFunction(function(Event, LayoutOrder, Size, _)
		-- upvalues: ReactModule (upval), EventTileModule (upval), p1 (copy), Surface200 (copy), UseMemoResult (copy), IsUsePreferredInputResultMatch (copy), FFlagLuaAppSduiEventDetailsEnabled (upval)
		return ReactModule.createElement(EventTileModule, {
			Event = Event,
			DefaultThumbnail = p1.defaultThumbnail,
			backgroundStyle = Surface200,
			onJoinEvent = p1.onJoinEvent,
			onRsvpChanged = p1.onRsvpChanged,
			onTileActivated = p1.onTileActivated,
			impressionsTag = UseMemoResult,
			layoutOrder = LayoutOrder,
			size = Size,
			disableButtons = IsUsePreferredInputResultMatch,
			suppressRsvpReminderToastBecauseEventDetailsFocused = if FFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil
		}), Event.id
	end, {
		p1.defaultThumbnail, p1.onJoinEvent, p1.onRsvpChanged, p1.onTileActivated,
		if FFlagLuaAppSduiEventDetailsEnabled then p1.suppressRsvpReminderToastBecauseEventDetailsFocused else nil,
		UseMemoResult, IsUsePreferredInputResultMatch,
		if FFlagLuaAppGameViewTileBackgroundColorOverride then Surface200 else nil
	})
	local Event = UseGetGameTileHeightFunction(false, "Event", true, false, false, UseTextSizeOffsetResult, if IsUsePreferredInputResultMatch then 0 else UseDesignTokensResult.Size.Size_700 + UseDesignTokensResult.Size.Size_200)
	local UseLocalizationResult = UseLocalizationFunction({ title = "Feature.VirtualEvents.EventsListTitle" })
	local SortEventsByStartDateModuleResult = SortEventsByStartDateModule(p1.virtualEvents)
	local UseRefResult = ReactModule.useRef({})
	local UseCallbackResult1 = UseCallbackFunction(function(Indexes)
		-- upvalues: SortEventsByStartDateModuleResult (copy), UseRefResult (copy), p1 (copy), DiscoveryEventErrorLogger (upval)
		for _, index in Indexes do
			local SortEventsByStartDateModuleResultEntry = SortEventsByStartDateModuleResult[index]
			
			if SortEventsByStartDateModuleResultEntry == nil then
				DiscoveryEventErrorLogger.reportError("EventsListCarouselNilViewedEvent", `Viewed event at index {index} was nil when sending Event Tile impressions with referral source {p1.referralSource}`, { index = index, referralSource = p1.referralSource })
			elseif not UseRefResult.current[SortEventsByStartDateModuleResultEntry.id] then
				UseRefResult.current[SortEventsByStartDateModuleResultEntry.id] = true
				p1.onEventImpression(SortEventsByStartDateModuleResultEntry)
			end
		end
	end, {
		p1.onEventImpression,
		SortEventsByStartDateModuleResult,
		p1.referralSource
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(os.clock())
	UseEffectFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(os.clock())
	end, { p1.virtualEvents })
	
	return if #p1.virtualEvents == 0 then nil else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ClipsDescendants = not p1.peekViewFormat,
		LayoutOrder = p1.layoutOrder
	}, {
		EventsCarousel = ReactModule.createElement(CollectionCarousel, {
			hideHeaderButton = true,
			fractionalItemAmount = 0.33,
			sideMargin = 0,
			scrollingFrameRef = UseRefResult1,
			title = UseLocalizationResult.title,
			items = SortEventsByStartDateModuleResult,
			renderItem = UseCallbackResult,
			getItemHeight = Event,
			onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
			onChangeCanvasPosition = UseCollectionImpressionsSignalResult2,
			numColumns = if p1.peekViewFormat then 1 else 2,
			columnGap = UseDesignTokensResult.Size.Size_300
		}),
		FrameBoundsImpressionsTracker = ReactModule.createElement(FrameBoundsImpressionsTracker, {
			pageContext = p1.referralSource,
			parentRef = UseRefResult1,
			impressionsTag = UseMemoResult,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
			sendImpressions = UseCallbackResult1,
			dataUpdatedTimestamp = UseStateResult
		})
	})
end