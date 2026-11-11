local GuiService = game:GetService("GuiService")
local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local CryoModule = require(Parent.Cryo)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ParseBooleanStringFunction = require(Parent.DiscoveryUtils).parseBooleanString
local _ = require(Parent.GameCollections)
local GameCollectionGrid = require(Parent.GameCollections).GameCollectionGrid
local GameCollectionItemBuilder = require(Parent.GameCollections).GameCollectionItemBuilder
local GameCollectionItemTypes = require(Parent.GameCollections).GameCollectionItemTypes
local PlaceholderGameGrid = require(Parent.GameCollections).PlaceholderGameGrid
local CollectionViewsModule = require(Parent.CollectionViews)
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local _ = require(Parent.GameTile)
local GetGameTileCollectionItemSizeFunction = require(Parent.GameTile).getGameTileCollectionItemSize
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local GetSduiFeedStoreFunction = require(Parent.ServerDrivenUi).getSduiFeedStore
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ShowMoreClickEventFunction = require(Parent.DiscoveryAnalytics).Events.showMoreClickEvent
local Modules = DiscoveryMonolith.Modules
local UseUpdateFeedItemRenderedRowsModule = require(Modules.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows)
local UseGridFlexFeedItemBoundsModule = require(Modules.Personalization.OmniFeed.useGridFlexFeedItemBounds)
local OmniFeedPropsModule = require(Modules.Personalization.OmniFeed.OmniFeedProps)
local FoundationModule = require(Parent.Foundation)
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local IconName = FoundationModule.Enums.IconName
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntGameGridFlexFeedItemTileNumPerFeed = SharedFlagsModule.FIntGameGridFlexFeedItemTileNumPerFeed
local FIntLuaAppDelayImpressionsMaxUpdates = SharedFlagsModule.FIntLuaAppDelayImpressionsMaxUpdates
local FFlagLuaAppRfySignalApportioning = require(Parent.SharedFlags).FFlagLuaAppRfySignalApportioning
local FFlagLuaAppRfySignalApportioningIxp = require(Parent.SharedFlags).FFlagLuaAppRfySignalApportioningIxp
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppFixHomeGridPlaceholderFlowIssues = require(Parent.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues
local LuaAppAddPlaceholderRecoveryCounter = game:DefineFastFlag("LuaAppAddPlaceholderRecoveryCounter", false)
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppAddRequestIdToRfySignalApportioning = require(Parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppRfyRevealRows = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRows
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppSortHeaderAnchorTag = SharedFlagsModule.FFlagLuaAppSortHeaderAnchorTag
local LuaAppUpdateRevealMoreButtonUi = game:DefineFastFlag("LuaAppUpdateRevealMoreButtonUi", false)
local LuaAppGameGridRevealMoreButtonGapPx = game:DefineFastInt("LuaAppGameGridRevealMoreButtonGapPx", 12)
local FFlagLuaAppRfyRevealRowsFocusFix = require(Parent.SharedFlags).FFlagLuaAppRfyRevealRowsFocusFix
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING
local t = {}
local Flag = not FFlagLuaAppRfySignalApportioning and nil
local Flag1 = not FFlagLuaAppRfySignalApportioning and nil
local Callback: ((any) -> any)? = nil
local Callback1: ((any, any, any) -> boolean)? = nil

if FFlagLuaAppRfyRevealRows then
	Callback = function(TopicLayout)
		local TopicLayout1 = if type(TopicLayout) == "number" then TopicLayout else tonumber(TopicLayout)
		
		if TopicLayout1 then
			local Floored = math.floor(TopicLayout1)
			
			return if Floored == TopicLayout1 and Floored > 0 then Floored else nil
		else
			return nil
		end
	end
	
	Callback1 = function(List, SortIndex, TopicId): boolean
		-- upvalues: OmniFeedTypes (copy)
		local v1 = nil
		
		for i, value in List do
			if value.treatmentType == OmniFeedTypes.HomeGameGrid and value.topicId == TopicId then
				v1 = i
			end
		end
		return v1 == SortIndex
	end
end
return function(p1)
	-- upvalues: OmniFeedPropsModule (copy), OmniFeedConstants (copy), ParseBooleanStringFunction (copy), FFlagLuaAppRfySignalApportioningIxp (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppRfyRevealRows (copy), Callback (ref), FFlagLuaAppSortHeaderAnchorTag (copy), FFlagLuaAppRfySignalApportioning (copy), FFlagLuaAppCompositionAlways (copy), AppPage (copy), GetGameTileCollectionItemSizeFunction (copy), CollectionViewsModule (copy), GetSduiFeedStoreFunction (copy), ReactModule (copy), SignalsReactModule (copy), FFlagLuaAppRfyRevealRowsFocusFix (copy), ReactFocusNavigationModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), TopicContentsReducer (copy), Callback1 (ref), DiscoveryEventErrorLogger (copy), FIntGameGridFlexFeedItemTileNumPerFeed (copy), UseGridFlexFeedItemBoundsModule (copy), t (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), SignalsModule (copy), CryoModule (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), GameCollectionItemTypes (copy), GameCollectionItemBuilder (copy), GuiService (copy), ShowMoreClickEventFunction (copy), UseUpdateFeedItemRenderedRowsModule (copy), FFlagLuaAppFixHomeGridPlaceholderFlowIssues (copy), Flag (ref), Default (copy), LoggingProtocolModule (copy), LuaAppAddPlaceholderRecoveryCounter (copy), Flag1 (ref), GameCollectionGrid (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy), FFlagLuaAppHomeTouchAutoplay (copy), LuaAppGameGridRevealMoreButtonGapPx (copy), LuaAppUpdateRevealMoreButtonUi (copy), FoundationModule (copy), IconName (copy), ChipSize (copy), ChipVariant (copy), PlaceholderGameGrid (copy)
	local VerticalScrollingFrameRef = p1[OmniFeedPropsModule.key].verticalScrollingFrameRef
	local UseGridTiles: boolean? = nil
	local TopicLayout = nil
	local ComponentType = nil
	local TopicLayout1 = nil
	local GameTileLayoutType = "Narrow"
	local ShouldHideTileMetadata = nil
	local ShouldHideTileTitle = nil
	local ContainedTile = nil
	local EnableExplicitFeedback = nil
	local Enabled = nil
	local TopicLayout2 = nil
	local EnableSponsoredFeedback = nil
	local v1 = nil
	local IsSponsoredRatingFooterAllowed = nil
	local v2 = nil
	local VisibleRowsPerReveal = nil
	local TopicLayout3 = nil
	
	if p1.topicLayoutData then
		ComponentType = p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
		
		if ComponentType then
			if ComponentType == OmniFeedConstants.ComponentTypeDataKeys.EventTile then
				GameTileLayoutType = "Event"
			elseif ComponentType == OmniFeedConstants.ComponentTypeDataKeys.GridTile then
				GameTileLayoutType = "Wide"
			end
			UseGridTiles = GameTileLayoutType == "Wide" or GameTileLayoutType == "Event"
		end
		TopicLayout = p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PlayerCountStyle]
		TopicLayout1 = p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PlayButtonStyle]
		ShouldHideTileMetadata = ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideTileMetadata])
		ShouldHideTileTitle = ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideTileTitle])
		ContainedTile = ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ContainedTile])
		EnableExplicitFeedback = ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableExplicitFeedback])
		Enabled = if FFlagLuaAppRfySignalApportioningIxp then ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableSignalApportioning]) else nil
		TopicLayout2 = if FFlagLuaAppEnableWhyThisAdModal then p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SponsoredUserCohort] else nil
		EnableSponsoredFeedback = ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableSponsoredFeedback])
		v1 = if FFlagLuaAppEnableSponsoredReportAd then ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableReportAd]) else nil
		IsSponsoredRatingFooterAllowed = ParseBooleanStringFunction(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.IsSponsoredRatingFooterAllowed])
		
		if FFlagLuaAppRfyRevealRows then
			v2 = Callback(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.InitialVisibleRows])
			VisibleRowsPerReveal = Callback(p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.VisibleRowsPerReveal])
		end
		if FFlagLuaAppSortHeaderAnchorTag then
			TopicLayout3 = p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SortHeaderAnchorTag]
		end
	end
	local IsTrue: boolean? = nil
	
	if p1.topicLayoutData then
		local TopicLayout4 = p1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.IsSponsoredFooterAllowed]
		IsTrue = TopicLayout4 ~= nil and TopicLayout4 == "true"
	end
	local NoFFlagLuaAppRfySignalApportioningIxp = FFlagLuaAppRfySignalApportioning and (not FFlagLuaAppRfySignalApportioningIxp or Enabled)
	local AppPage1 = p1[OmniFeedPropsModule.key].appPage
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedPropsModule.key].appCompositionEnabled
	assert(AppPage1 == AppPage.Home, "component only supports the Home Page")
	local FeedItemStartRow = p1[OmniFeedPropsModule.key].feedItemStartRow
	local TopicId = p1.topicId
	local FeedItemPosition = p1[OmniFeedPropsModule.key].feedItemPosition
	local SortIndex = p1.sortIndex
	local TopicName = p1.topicName or ""
	local NumberOfRows: number = p1.numberOfRows
	local SduiContext = if FFlagLuaAppRfySignalApportioning then p1[OmniFeedPropsModule.key].sduiContext else nil
	local GameTileCollectionItemSize = GetGameTileCollectionItemSizeFunction(GameTileLayoutType)
	local UseCollectionLayoutResult = CollectionViewsModule.useCollectionLayout(GameTileCollectionItemSize)
	local SduiFeedStore = if FFlagLuaAppRfySignalApportioning then GetSduiFeedStoreFunction(AppPage1) else nil
	local ItemsPerRow = nil
	local v3 = nil
	
	if not FFlagLuaAppCompositionAlways then
		if FFlagLuaAppRfySignalApportioning then
			ItemsPerRow = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
				-- upvalues: SduiContext (copy), GameTileCollectionItemSize (copy)
				return SduiContext.getPageLayoutConfig(GameTileCollectionItemSize)(p2).numColumns
			end, {
				GameTileCollectionItemSize,
				SduiContext.getPageLayoutConfig
			})))
		else
			ItemsPerRow, v93 = ReactModule.useState(1)
		end
	end
	if AppCompositionEnabled then
		ItemsPerRow = UseCollectionLayoutResult.itemsPerRow
	end
	local v4: number? = nil
	local Callback2 = nil
	local v5 = nil
	local UseRefResult = nil
	local UseMostRecentFocusBehaviorResult = nil
	local Callback3 = nil
	
	if FFlagLuaAppRfyRevealRows then
		v4, Callback2 = ReactModule.useState(v2)
		
		if FFlagLuaAppRfyRevealRowsFocusFix then
			UseRefResult = ReactModule.useRef(nil)
			UseMostRecentFocusBehaviorResult = ReactFocusNavigationModule.useMostRecentFocusBehavior(UseRefResult)
			Callback3 = ReactFocusNavigationModule.useFocusGuiObject()
		end
		ReactModule.useEffect(function()
			-- upvalues: Callback2 (ref), v2 (ref)
			Callback2(v2)
		end, {
			v2,
			p1.topicId,
			p1.sortIndex,
			p1.recommendationsRequestId
		})
		v5 = UseLocalizationFunction({ showMoreButtonText = "CommonUI.Controls.Action.ShowMore" })
	end
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: TopicContentsReducer (upval)
		return p2.Personalization[TopicContentsReducer.key]
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: AppPage1 (copy)
		local OmniRecommendation = p2.OmniRecommendations[AppPage1]
		
		return if OmniRecommendation then OmniRecommendation.sorts else {}
	end)
	local v6: boolean? = nil
	local v7 = nil
	
	if FFlagLuaAppRfyRevealRows then
		v6 = v2 ~= nil and VisibleRowsPerReveal ~= nil
		v7 = if v6 then Callback1(UseSelectorResult2, p1.sortIndex, p1.topicId) else nil
		ReactModule.useEffect(function()
			-- upvalues: v6 (ref), v7 (ref), DiscoveryEventErrorLogger (upval), p1 (copy)
			if v6 and not v7 then
				DiscoveryEventErrorLogger.reportError("HomeGameGridRevealRowsConfiguredBeforeLastGrid", "Reveal row fields are only supported on the last HomeGameGrid sort for the topic", { topicId = p1.topicId, sortIndex = p1.sortIndex })
			end
		end, { v6, v7, p1.topicId, p1.sortIndex })
	end
	local NumberOfRows1: number = if NumberOfRows and NumberOfRows > 0 then NumberOfRows else math.floor(FIntGameGridFlexFeedItemTileNumPerFeed / ItemsPerRow)
	local UseGridFlexFeedItemBoundsModuleResult = if FFlagLuaAppRfySignalApportioning and not FFlagLuaAppRfySignalApportioningIxp then nil else UseGridFlexFeedItemBoundsModule(p1.topicId, FeedItemPosition, ItemsPerRow, NumberOfRows1, UseSelectorResult1 and UseSelectorResult1[TopicId] and UseSelectorResult1[TopicId].entries or t)
	local UseSignalStateResult = nil
	
	if FFlagLuaAppRfySignalApportioning then
		local NumberOfRows1_1: number = NumberOfRows1 or 99999
		
		if NumberOfRows1_1 == -1 then
			NumberOfRows1_1 = 99999
		end
		ReactModule.useEffect(function()
			-- upvalues: ItemsPerRow (ref), NumberOfRows1_1 (ref), SduiFeedStore (copy), p1 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval)
			SduiFeedStore.updateApportioningCapacity(p1.topicId, p1.sortIndex, ItemsPerRow * NumberOfRows1_1, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p1.recommendationsRequestId else nil)
		end, {
			ItemsPerRow, NumberOfRows1_1, p1.topicId, p1.sortIndex, SduiFeedStore,
			if FFlagLuaAppAddRequestIdToRfySignalApportioning then p1.recommendationsRequestId else nil
		})
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), SduiFeedStore (copy), p1 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), DiscoveryEventErrorLogger (upval), CryoModule (upval)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: SduiFeedStore (upval), p1 (upval), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), DiscoveryEventErrorLogger (upval), CryoModule (upval)
				local v8 = SduiFeedStore.getApportionedItems(p1.topicId, p1.sortIndex, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p1.recommendationsRequestId else nil)(p2)
				
				if not v8 then
					return nil
				end
				local v9 = SduiFeedStore.getSingleGridApportioningMetadata(p1.topicId, p1.sortIndex, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p1.recommendationsRequestId else nil)(p2)
				local StartingItemIndex = v9 and v9.startingItemIndex
				
				if not StartingItemIndex and #v8 > 0 then
					DiscoveryEventErrorLogger.reportError("HomeGameGridRenderingWithMissingStartingItemIndex", "Starting item index not found in apportioning data for topicId {props.topicId} and sortIndex {props.sortIndex}, defaulting to 1", { topicId = p1.topicId, sortIndex = p1.sortIndex })
				end
				local JoinResults = {}
				
				for i, value in v8 do
					table.insert(JoinResults, (CryoModule.Dictionary.join(value, { topicContentsIndex = (StartingItemIndex or 1) + i - 1 })))
				end
				return JoinResults
			end)
		end, {
			SduiFeedStore,
			p1.topicId,
			p1.sortIndex,
			if FFlagLuaAppAddRequestIdToRfySignalApportioning then p1.recommendationsRequestId else nil
		})))
	end
	local UseMemoResult = if FFlagLuaAppRfySignalApportioning and not FFlagLuaAppRfySignalApportioningIxp then nil else ReactModule.useMemo(function()
		-- upvalues: TopicId (copy), UseSelectorResult1 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), UseGridFlexFeedItemBoundsModuleResult (copy), ItemsPerRow (ref), CryoModule (upval)
		local UseSelectorResultEntry = TopicId and (UseSelectorResult1 and UseSelectorResult1[TopicId]) or nil
		local Entries = UseSelectorResultEntry and UseSelectorResultEntry.entries or {}
		
		if UseSelectorResultEntry and UseSelectorResultEntry.hasMoreRows then
			warn(`HomeGameGridFlexFeedItem may need to fetch more metadata for topicId {TopicId}`)
		end
		if FFlagLuaAppEnableNxMRoduxApportioning then
			local Layout = UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.layout
			
			if not Layout then
				return {}
			end
			local JoinResults1 = {}
			local FirstIndex1 = UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.firstIndex or 1
			local Count = 0
			
			for i = 1, #Layout do
				local LayoutEntry = Layout[i]
				
				if LayoutEntry then
					for i1 = 1, ItemsPerRow do
						local LayoutEntry1: number = LayoutEntry[i1]
						
						if LayoutEntry1 and LayoutEntry1 > 0 then
							local Entry = Entries[LayoutEntry1]
							
							if Entry then
								JoinResults1[LayoutEntry1] = CryoModule.Dictionary.join(Entry, { topicContentsIndex = FirstIndex1 + Count })
							end
							Count += 1
						end
					end
				end
			end
			return JoinResults1
		else
			local JoinResults = {}
			local FirstIndex = UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.firstIndex or 1
			local EntryIndices = UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.entryIndices
			
			if EntryIndices then
				for i2, entryIndice in ipairs(EntryIndices) do
					local Entry = Entries[entryIndice]
					
					if Entry then
						table.insert(JoinResults, CryoModule.Dictionary.join(Entry, { topicContentsIndex = FirstIndex + i2 - 1 }))
					end
				end
			end
			return JoinResults
		end
	end, {
		TopicId,
		UseSelectorResult1,
		UseSelectorResult2,
		UseGridFlexFeedItemBoundsModuleResult,
		if FFlagLuaAppEnableNxMRoduxApportioning then ItemsPerRow else nil
	})
	local UseSignalStateResult1 = if NoFFlagLuaAppRfySignalApportioningIxp then UseSignalStateResult else UseMemoResult
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), GameCollectionItemTypes (upval), GameCollectionItemBuilder (upval), ItemsPerRow (ref), AppPage1 (copy), SortIndex (copy), TopicId (copy), NoFFlagLuaAppRfySignalApportioningIxp (copy), UseGridFlexFeedItemBoundsModuleResult (copy)
		if not UseSignalStateResult1 then
			return UseSignalStateResult1
		end
		local t = {}
		local TwoByOneTiles = {}
		
		if not FFlagLuaAppEnableNxMRoduxApportioning then
			for i, value in UseSignalStateResult1 do
				if value.componentType == GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile then
					t[i] = {
						colSpan = 2,
						rowSpan = 1,
						alignmentType = value.alignmentType,
						minRowPadding = tonumber(value.minRowPadding) or 0
					}
					TwoByOneTiles[i] = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
				end
			end
		end
		return GameCollectionItemBuilder.BuildCollectionEntries(UseSignalStateResult1, ItemsPerRow, if FFlagLuaAppEnableNxMRoduxApportioning then nil else t, if FFlagLuaAppEnableNxMRoduxApportioning then nil else TwoByOneTiles, nil, AppPage1, SortIndex, TopicId, FFlagLuaAppEnableNxMRoduxApportioning and not NoFFlagLuaAppRfySignalApportioningIxp and (UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.layout) or nil)
	end, {
		UseSignalStateResult1, ItemsPerRow, AppPage1, SortIndex, TopicId,
		if FFlagLuaAppEnableNxMRoduxApportioning then NoFFlagLuaAppRfySignalApportioningIxp else nil,
		if FFlagLuaAppEnableNxMRoduxApportioning and not NoFFlagLuaAppRfySignalApportioningIxp then UseGridFlexFeedItemBoundsModuleResult else nil
	})
	local CountLayout = if NoFFlagLuaAppRfySignalApportioningIxp and UseMemoResult1 then if FFlagLuaAppEnableNxMRoduxApportioning and (not NoFFlagLuaAppRfySignalApportioningIxp and UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.layout) then #UseGridFlexFeedItemBoundsModuleResult.layout else math.ceil(#UseMemoResult1 / ItemsPerRow) elseif NoFFlagLuaAppRfySignalApportioningIxp or not UseGridFlexFeedItemBoundsModuleResult then nil elseif FFlagLuaAppEnableNxMRoduxApportioning and (not NoFFlagLuaAppRfySignalApportioningIxp and UseGridFlexFeedItemBoundsModuleResult and UseGridFlexFeedItemBoundsModuleResult.layout) then #UseGridFlexFeedItemBoundsModuleResult.layout else math.ceil(#UseMemoResult1 / ItemsPerRow)
	local v8: boolean? = nil
	local Smallest = nil
	local v9: boolean? = nil
	local OnActivated = nil
	
	if FFlagLuaAppRfyRevealRows then
		v8 = v6 and (v7 and (CountLayout ~= nil and v4 ~= nil))
		Smallest = if v8 then math.min(v4, CountLayout) else CountLayout
		v9 = v8 and Smallest < CountLayout
		OnActivated = ReactModule.useCallback(function()
			-- upvalues: v4 (ref), CountLayout (ref), VisibleRowsPerReveal (ref), DiscoveryEventErrorLogger (upval), p1 (copy), FFlagLuaAppRfyRevealRowsFocusFix (upval), GuiService (upval), UseRefResult (ref), Callback3 (ref), Callback2 (ref), ShowMoreClickEventFunction (upval), AppPage1 (copy)
			if v4 == nil or CountLayout == nil or VisibleRowsPerReveal == nil then
				DiscoveryEventErrorLogger.reportError("HomeGameGridRevealMoreMissingRowData", "Unable to reveal more HomeGameGrid rows because row data was missing", {
					topicId = p1.topicId,
					sortIndex = p1.sortIndex,
					hasVisibleRows = v4 ~= nil,
					hasActualNumberOfRows = CountLayout ~= nil,
					hasVisibleRowsPerReveal = VisibleRowsPerReveal ~= nil
				})
				
				return
			end
			local PreviousVisibleRows = v4
			local Smallest = math.min(v4 + VisibleRowsPerReveal, CountLayout)
			
			if FFlagLuaAppRfyRevealRowsFocusFix and GuiService.SelectedCoreObject ~= nil then
				local Current = UseRefResult.current
				
				if Current and Callback3 then
					Callback3(Current)
				end
			end
			Callback2(Smallest)
			ShowMoreClickEventFunction(AppPage1, {
				topicId = p1.topicId,
				sortIndex = p1.sortIndex,
				previousVisibleRows = PreviousVisibleRows,
				newVisibleRows = Smallest,
				totalNumberOfRows = CountLayout,
				visibleRowsPerReveal = VisibleRowsPerReveal
			})
		end, {
			v4, CountLayout, VisibleRowsPerReveal, p1.topicId, p1.sortIndex, AppPage1,
			if FFlagLuaAppRfyRevealRowsFocusFix then Callback3 else nil
		})
	end
	UseUpdateFeedItemRenderedRowsModule(AppPage1, nil, FeedItemPosition, if FFlagLuaAppFixHomeGridPlaceholderFlowIssues then (if FFlagLuaAppRfyRevealRows then Smallest else CountLayout) or -1 elseif FFlagLuaAppRfyRevealRows then Smallest else CountLayout)
	
	if NoFFlagLuaAppRfySignalApportioningIxp and not UseMemoResult1 or #UseMemoResult1 <= 0 then
		if NoFFlagLuaAppRfySignalApportioningIxp and UseMemoResult1 == nil or not NoFFlagLuaAppRfySignalApportioningIxp and UseGridFlexFeedItemBoundsModuleResult == nil then
			if FFlagLuaAppRfySignalApportioning and not Flag1 then
				Default:logRobloxTelemetryCounter({
					eventName = "HomeGameGridReturnedPlaceholder",
					backends = { LoggingProtocolModule.TelemetryBackends.Counter }
				}, 1, {
					experimentTreatment = if Enabled == true then "signal_apportioning_treatment" elseif Enabled == false then "control" else "not_in_experiment"
				})
				Flag1 = true
			end
			return (ReactModule.createElement(PlaceholderGameGrid, {
				gridSupportAllowed = true,
				isHoverSupportEnabled = true,
				title = TopicName,
				onItemsPerRowChanged = if AppCompositionEnabled then nil else v3,
				appCompositionEnabled = AppCompositionEnabled,
				useGridTiles = UseGridTiles,
				componentType = ComponentType,
				gameTileLayoutType = GameTileLayoutType,
				numRows = NumberOfRows1,
				sideMargin = if AppCompositionEnabled then nil elseif UseSelectorResult == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING,
				verticalScrollingFrameRef = VerticalScrollingFrameRef,
				shouldHideTileMetadata = ShouldHideTileMetadata,
				shouldHideTileTitle = ShouldHideTileTitle,
				containedTile = ContainedTile
			}))
		else
			if FFlagLuaAppRfySignalApportioning and not Flag then
				Default:logRobloxTelemetryCounter({
					eventName = "HomeGameGridReturnedNil",
					backends = { LoggingProtocolModule.TelemetryBackends.Counter }
				}, 1, {
					experimentTreatment = if Enabled == true then "signal_apportioning_treatment" elseif Enabled == false then "control" else "not_in_experiment"
				})
				Flag = true
			end
			return nil
		end
	else
		if FFlagLuaAppRfySignalApportioning and Flag then
			Default:logRobloxTelemetryCounter({
				eventName = "HomeGameGridReturnedGridAfterNil",
				backends = { LoggingProtocolModule.TelemetryBackends.Counter }
			}, 1, {
				experimentTreatment = if Enabled == true then "signal_apportioning_treatment" elseif Enabled == false then "control" else "not_in_experiment"
			})
			Flag = false
		end
		if LuaAppAddPlaceholderRecoveryCounter and Flag1 then
			Default:logRobloxTelemetryCounter({
				eventName = "HomeGameGridReturnedGridAfterPlaceholder",
				backends = { LoggingProtocolModule.TelemetryBackends.Counter }
			}, 1, {
				experimentTreatment = if Enabled == true then "signal_apportioning_treatment" elseif Enabled == false then "control" else "not_in_experiment"
			})
			Flag1 = false
		end
		local Element = ReactModule.createElement(GameCollectionGrid, {
			entries = UseMemoResult1,
			title = TopicName,
			friendFooterEnabled = true,
			sortIndex = SortIndex,
			gameSortId = TopicId,
			pageContext = AppPage1,
			onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1[OmniFeedPropsModule.key].onTileImageLoaded else nil,
			scrollViewPositionChangedSignal = p1[OmniFeedPropsModule.key].scrollViewPositionChangedSignal,
			onItemsPerRowChanged = if AppCompositionEnabled then nil else v3,
			useGridTiles = UseGridTiles,
			playerCountStyle = TopicLayout,
			isSponsoredFooterAllowed = IsTrue,
			componentType = ComponentType,
			gameTileLayoutType = GameTileLayoutType,
			gridSupportAllowed = true,
			isHoverSupportEnabled = true,
			verticalScrollingFrameRef = VerticalScrollingFrameRef,
			gridContainerRef = if FFlagLuaAppRfyRevealRowsFocusFix then UseMostRecentFocusBehaviorResult else nil,
			startRow = FeedItemStartRow,
			LayoutOrder = if FFlagLuaAppRfyRevealRows and v8 then 1 else nil,
			ZIndex = if FFlagLuaAppRfyRevealRows and v8 then 2 else nil,
			maxNumRows = if FFlagLuaAppRfyRevealRows and v8 then Smallest elseif NumberOfRows and NumberOfRows > 0 then NumberOfRows else nil,
			playButtonStyle = TopicLayout1,
			sideMargin = if AppCompositionEnabled then nil elseif UseSelectorResult == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING,
			appCompositionEnabled = AppCompositionEnabled,
			shouldHideTileMetadata = ShouldHideTileMetadata,
			shouldHideTileTitle = ShouldHideTileTitle,
			containedTile = ContainedTile,
			numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
			selectionOrderBase = p1[OmniFeedPropsModule.key].selectionOrderBase,
			enableExplicitFeedback = EnableExplicitFeedback,
			sponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then TopicLayout2 else nil,
			enableSponsoredFeedback = EnableSponsoredFeedback,
			enableReportAd = if FFlagLuaAppEnableSponsoredReportAd then v1 else nil,
			isSponsoredRatingFooterAllowed = IsSponsoredRatingFooterAllowed,
			videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1[OmniFeedPropsModule.key].videoPlaybackContext else nil,
			headerTag = if FFlagLuaAppSortHeaderAnchorTag then TopicLayout3 else nil
		})
		
		return if FFlagLuaAppRfyRevealRows and v8 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, LuaAppGameGridRevealMoreButtonGapPx)
			}),
			GameGrid = Element,
			RevealMoreButton = if v9 then if LuaAppUpdateRevealMoreButtonUi then ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-xsmall size-full-0 auto-y",
				LayoutOrder = 2,
				ZIndex = 1
			}, {
				LeadingLine = ReactModule.createElement(FoundationModule.View, { tag = "grow", LayoutOrder = 1 }, {
					Divider = ReactModule.createElement(FoundationModule.Divider)
				}),
				ButtonOutline = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy stroke-default radius-circle",
					LayoutOrder = 2
				}, {
					Chip = ReactModule.createElement(FoundationModule.Chip, {
						text = v5.showMoreButtonText,
						trailing = IconName.ChevronLargeDown,
						size = ChipSize.Large,
						variant = ChipVariant.Utility,
						onActivated = OnActivated
					})
				}),
				TrailingLine = ReactModule.createElement(FoundationModule.View, { tag = "grow", LayoutOrder = 3 }, {
					Divider = ReactModule.createElement(FoundationModule.Divider)
				})
			}) else ReactModule.createElement(FoundationModule.Chip, {
				LayoutOrder = 2,
				ZIndex = 1,
				text = v5.showMoreButtonText,
				trailing = IconName.ChevronLargeDown,
				size = ChipSize.Large,
				onActivated = OnActivated
			}) else nil
		}) else Element
	end
end