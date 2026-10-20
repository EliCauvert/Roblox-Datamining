local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local UIBloxModule = require(Parent.UIBlox)
local ResponsiveGrid = UIBloxModule.App.Container.Grid.ResponsiveGrid
local ResponsiveLayoutProvider = UIBloxModule.Core.Layout.Responsive.ResponsiveLayoutProvider
local GameTileModule = require(Parent.GameTile)
local GameTileConstants = GameTileModule.GameTileConstants
local GameTileLayoutType = GameTileModule.GameTileTypes.GameTileLayoutType
local GameTileViewConfig = GameTileModule.GameTileViewConfig
local AppGameTile = GameTileModule.AppGameTile
local GetTileBadgeByPositionConfigFromEntryFunction = GameTileModule.getTileBadgeByPositionConfigFromEntry
local LayoutConfig = require(Parent.RobloxAppEnums).LayoutConfig
local UseResponsiveLayoutFunction = UIBloxModule.Core.Layout.Responsive.useResponsiveLayout
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseGameCollectionLayoutParamsFunction = require(Parent.GameCollections).useGameCollectionLayoutParams
local UseCollectionLayoutFunction = require(Parent.CollectionViews).useCollectionLayout
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local AppFeaturedGameTileTwoByTwoModule = require(DiscoveryMonolith.Modules.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagSduiEdpPrefetchPlayability = SharedFlagsModule.FFlagSduiEdpPrefetchPlayability
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local LuaAppFixGameGridTableNilRelativeHeight = game:DefineFastFlag("LuaAppFixGameGridTableNilRelativeHeight", false)

local function getCellSpan(p1): number
	return if p1.featured then 2 else 1
end

return function(Frame)
	-- upvalues: LayoutConfig (copy), UseTokensFunction (copy), ReactModule (copy), LuauPolyfillModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), OpenGameDetailsFunction (copy), UseTextSizeOffsetFunction (copy), UseResponsiveLayoutFunction (copy), FFlagLuaAppCompositionAlways (copy), UseCollectionLayoutFunction (copy), GameTileModule (copy), GameTileLayoutType (copy), UseGameCollectionLayoutParamsFunction (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), UseDesignTokensFunction (copy), GameTileConstants (copy), GameTileViewConfig (copy), LuaAppFixGameGridTableNilRelativeHeight (copy), DiscoveryEventErrorLogger (copy), AppFeaturedGameTileTwoByTwoModule (copy), AppGameTile (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), UseSelectorFunction (copy), ResponsiveGrid (copy), getCellSpan (copy), ResponsiveLayoutProvider (copy)
	local GridTile = if Frame.useGridTiles then LayoutConfig.Kind.Experiences.GridTile else LayoutConfig.Kind.Experiences.WithFooter
	local UseTokensResult = UseTokensFunction()
	local Entries = Frame.entries or {}
	local GameEmphasis = Frame.gameEmphasis or false
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: LuauPolyfillModule (upval), Entries (copy), GameEmphasis (copy)
		return LuauPolyfillModule.Array.map(Entries, function(p1, Index)
			-- upvalues: LuauPolyfillModule (upval), GameEmphasis (upval)
			return LuauPolyfillModule.Object.assign({ index = Index, featured = Index == 1 and GameEmphasis }, p1)
		end)
	end, { Entries, GameEmphasis })
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactServiceFunction(RoactNetworking) else nil
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy), FFlagSduiEdpPrefetchPlayability (upval), FFlagLuaAppSduiEdpEnabled (upval), UseRoactServiceResult (ref)
		UseDispatchResult(OpenGameDetailsFunction(p1, UseNavigationResult, p2, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil))
	end, {
		UseNavigationResult,
		if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil
	})
	local WindowSize = Frame.windowSize or Vector2.one
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Source = Frame.source
	local ReferralSource = Frame.referralSource
	local HideGameStats = Frame.hideGameStats
	local NoUseHoverTile = Frame.useHoverTile == nil or Frame.useHoverTile
	local ReportGameDetailOpened = Frame.reportGameDetailOpened
	local ReportExperienceLaunched = Frame.reportExperienceLaunched
	local ShowFriendActivity = Frame.showFriendActivity or false
	local RelativeHeight = UseResponsiveLayoutFunction("relativeHeight", GridTile)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or Frame.appCompositionEnabled
	local UseCollectionLayoutResult = UseCollectionLayoutFunction(GameTileModule.getGameTileCollectionItemSize(Frame.gameTileLayoutType or GameTileLayoutType.Narrow))
	local EnableCollectionLayout = Frame.enableCollectionLayout or FFlagLuaAppCompositionAlways1
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseGameCollectionLayoutParamsResult = UseGameCollectionLayoutParamsFunction(Frame.gameTileLayoutType or GameTileLayoutType.Narrow, UseStateResult, false)
	local UseRefResult = ReactModule.useRef(1)
	local Columns = UseResponsiveLayoutFunction("columns", GridTile)
	local ItemsPerRow = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.itemsPerRow elseif EnableCollectionLayout then UseGameCollectionLayoutParamsResult.numColumns else Columns
	local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.XSmall)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), ItemsPerRow (copy), Frame (copy)
		if UseRefResult.current ~= ItemsPerRow then
			UseRefResult.current = ItemsPerRow
			
			if Frame.onItemsPerRowChanged then
				Frame.onItemsPerRowChanged(ItemsPerRow)
			end
		end
	end, { ItemsPerRow, UseRefResult, Frame.onItemsPerRowChanged })
	local UseDesignTokensResult = UseDesignTokensFunction()
	local FooterHeight = GameTileViewConfig.getFooterHeight(UseDesignTokensResult, true, false, false, UseTextSizeOffsetResult, nil, GameTileConstants.TileTextLines[Frame.gameTileLayoutType or GameTileLayoutType.Narrow].titleTextLines, UseTokensResult, true)
	
	if LuaAppFixGameGridTableNilRelativeHeight and (RelativeHeight == nil or RelativeHeight.Scale == nil) then
		DiscoveryEventErrorLogger.reportError("GameGridTable_NilRelativeHeight", "relativeHeight is nil", {
			rowKind = tostring(GridTile),
			relativeHeightType = typeof(RelativeHeight),
			relativeHeightValue = tostring(RelativeHeight),
			responsiveLayoutColumns = tostring(Columns),
			useGridTiles = tostring(Frame.useGridTiles or false),
			enableCollectionLayout = tostring(Frame.enableCollectionLayout or false),
			gameTileLayoutType = tostring(Frame.gameTileLayoutType or "nil")
		})
	else
		RelativeHeight = UDim.new(RelativeHeight.Scale, FooterHeight)
	end
	local UseResult1 = ReactModule.useCallback(function(Entry, p1)
		-- upvalues: ReactModule (upval), AppFeaturedGameTileTwoByTwoModule (upval), Source (copy), ReportGameDetailOpened (copy), ReportExperienceLaunched (copy), Frame (copy), AppGameTile (upval), HideGameStats (copy), ReferralSource (copy), ShowFriendActivity (copy), NoUseHoverTile (copy), UseResult (copy), UseTextSizeOffsetResult (copy), UseBreakpointXOrSmallerResult (copy), GetTileBadgeByPositionConfigFromEntryFunction (upval)
		return if Entry.featured then ReactModule.createElement(AppFeaturedGameTileTwoByTwoModule, {
			hasBackground = true,
			hasActionRow = true,
			isDynamic = true,
			entry = Entry,
			index = Entry.realGameEntryIndex or Entry.index,
			source = Source,
			reportGameDetailOpened = ReportGameDetailOpened,
			reportExperienceLaunched = ReportExperienceLaunched,
			impressionsTag = Frame.impressionsTag,
			launchExperienceEventContext = Frame.launchExperienceEventContext
		}) else ReactModule.createElement(AppGameTile, {
			isContained = true,
			entry = Entry,
			index = Entry.realGameEntryIndex or Entry.index,
			source = Source,
			reportGameDetailOpened = ReportGameDetailOpened,
			reportExperienceLaunched = ReportExperienceLaunched,
			hideGameStats = HideGameStats,
			referralSource = ReferralSource,
			rowNum = math.ceil(Entry.index / (p1.columns or 1)),
			showFriendActivity = ShowFriendActivity,
			playerCountStyle = Frame.playerCountStyle,
			isSponsoredFooterAllowed = Frame.isSponsoredFooterAllowed,
			useHoverTile = NoUseHoverTile,
			useGridTile = Frame.useGridTiles,
			friendFooterEnabled = if Frame.useGridTiles then true else nil,
			impressionsTag = Frame.impressionsTag,
			launchExperienceEventContext = Frame.launchExperienceEventContext,
			topicId = Frame.topicId,
			gameTileLayoutType = Frame.gameTileLayoutType,
			navigateToGameDetails = UseResult,
			playButtonStyle = Frame.playButtonStyle,
			textSizeOffset = UseTextSizeOffsetResult,
			isNarrowScreenXSmall = UseBreakpointXOrSmallerResult,
			badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(Entry)
		})
	end, {
		Source, ReferralSource, HideGameStats, ShowFriendActivity,
		ReportGameDetailOpened, ReportExperienceLaunched, Frame.impressionsTag,
		Frame.launchExperienceEventContext, Frame.playerCountStyle, Frame.useGridTiles,
		Frame.isSponsoredFooterAllowed, Frame.playButtonStyle,
		UseBreakpointXOrSmallerResult
	})
	local Y = if Frame.screenSize then Frame.screenSize.Y else WindowSize.Y
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return if p1.ScreenSize then p1.ScreenSize.X else nil
	end)
	local VerticalGutter = UseResponsiveLayoutFunction("verticalGutter", GridTile)
	local VerticalGap = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.verticalGap else VerticalGutter
	local Gutter = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.gutter else UseGameCollectionLayoutParamsResult.columnGap
	local SideMargin = if FFlagLuaAppCompositionAlways1 then 0 else UseGameCollectionLayoutParamsResult.sideMargin
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: EnableCollectionLayout (copy), UseDesignTokensResult (copy), ItemsPerRow (copy), Gutter (copy), SideMargin (copy), VerticalGap (copy), RelativeHeight (ref)
		if not EnableCollectionLayout then
			return nil
		end
		local Layout = UseDesignTokensResult.LuaApps.Layout
		
		if Layout then
			local Tiles = Layout.tiles
			
			return {
				columns = ItemsPerRow,
				gutter = Gutter,
				margin = SideMargin,
				verticalGutter = VerticalGap,
				relativeHeight = RelativeHeight,
				hoverTileTopOffset = Tiles.hover.topOffset,
				hoverTileBottomOffset = Tiles.hover.bottomOffset,
				hoverTileHorizontalOffset = Tiles.hover.horizontalOffset,
				scrollableMaxTilesPerRow = Layout.grid.default.scrollableMaxTilesPerRow
			}
		else
			return nil
		end
	end, {
		EnableCollectionLayout, UseDesignTokensResult.LuaApps.Layout, ItemsPerRow,
		Gutter, SideMargin, VerticalGap, RelativeHeight
	})
	local Element = ReactModule.createElement(ResponsiveGrid, {
		enableDeferredRefPropEvents = true,
		ref = UseStateResult2,
		kind = GridTile,
		data = UseMemoResult,
		renderItem = UseResult1,
		layoutOrder = Frame.LayoutOrder,
		getCellColspan = getCellSpan,
		getCellRowspan = getCellSpan,
		relativeHeight = RelativeHeight,
		absoluteWindowTop = -Y,
		absoluteWindowHeight = Y * 3
	})
	
	if EnableCollectionLayout then
		Element = ReactModule.createElement(ResponsiveLayoutProvider, { width = UseSelectorResult, config = UseMemoResult1 }, { ResponsiveGrid = Element })
	end
	return Element
end