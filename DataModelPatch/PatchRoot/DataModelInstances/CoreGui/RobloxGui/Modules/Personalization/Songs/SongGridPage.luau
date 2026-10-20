local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseResponsiveLayoutFunction = UIBloxModule.Core.Layout.Responsive.useResponsiveLayout
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local PersonalizationTopBarModule = require(Modules.Personalization.PersonalizationTopBar)
local RefreshScrollingFrameModule = require(Modules.LuaApp.Components.RefreshScrollingFrame)
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local TopicInfosReducer = require(CorePackages.Workspace.Packages.TopicInfosRodux).TopicInfosReducer
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local GameCollectionsModule = require(CorePackages.Workspace.Packages.GameCollections)
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local CollectionGrid = require(CorePackages.Workspace.Packages.CollectionViews).CollectionGrid
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local ScreenSizeImpressionsTracker = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsTracker
local SendItemImpressions = require(CorePackages.Workspace.Packages.UnifiedLogging).SendItemImpressions
local SendItemActionEvent = require(CorePackages.Workspace.Packages.UnifiedLogging).SendItemActionEvent
local ContentType = require(CorePackages.Workspace.Packages.UnifiedLogging).ContentType
local SongTile = require(CorePackages.Workspace.Packages.SongTile).SongTile
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FlaggedMutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).flaggedMutedError
local GameTileConstants = require(CorePackages.Workspace.Packages.GameTile).GameTileConstants
local GAMEGRIDCHILDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING
local WithFooter = RobloxAppEnumsModule.LayoutConfig.Kind.Experiences.WithFooter
local SongList = RobloxAppEnumsModule.AppPage.SongList

return function()
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), Signal (copy), UsePreferredInputFunction (copy), UseRoactServiceFunction (copy), RoactAnalytics (copy), AppEventIngestService (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), UseNavigationPropsFunction (copy), TopicInfosReducer (copy), TopicContentsReducer (copy), UseScreenSizeFunction (copy), DiscoveryUtilsModule (copy), GridMetrics (copy), GAMEGRIDCHILDPADDING (copy), UseTextSizeOffsetFunction (copy), UseResponsiveLayoutFunction (copy), WithFooter (copy), ResponsiveModule (copy), UseGetGameTileHeightFunction (copy), GameTileConstants (copy), UseGameCollectionLayoutParamsFunction (copy), SendItemImpressions (copy), SongList (copy), ContentType (copy), FlaggedMutedErrorFunction (copy), SendItemActionEvent (copy), SongTile (copy), PersonalizationTopBarModule (copy), RefreshScrollingFrameModule (copy), DiscoveryTypesModule (copy), CollectionGrid (copy), ScreenSizeImpressionsTracker (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(Signal.new())
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseLocalizationResult = UseLocalizationFunction({ chartsTitle = "CommonUI.Features.Label.Charts" })
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.TopBar.topBarHeight or 0
	end)
	local SortId = UseNavigationPropsFunction(function(SortId)
		return { sortId = SortId }
	end).sortId
	local SongListPageName: string = `SongListPage_{SortId}`
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: TopicInfosReducer (upval), SortId (copy)
		return p1.Personalization[TopicInfosReducer.key][SortId]
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: TopicContentsReducer (upval), SortId (copy)
		return p1.Personalization[TopicContentsReducer.key][SortId]
	end)
	local Entries = UseSelectorResult2 and UseSelectorResult2.entries or {}
	local UseScreenSizeResult = UseScreenSizeFunction()
	local X = UseScreenSizeResult and UseScreenSizeResult.X or 0
	local PageSideMargin: number = DiscoveryUtilsModule.getPageSideMargin(X)
	local UseStateResult3 = UseStateResult or UseScreenSizeResult
	local _Vector2 = Vector2.new(Vector2.new(X - 2 * PageSideMargin, UseScreenSizeResult.Y).X, UseStateResult3 and UseStateResult3.Y or 0)
	local ItemWidth = GridMetrics.getSmallMetrics(_Vector2.X, GAMEGRIDCHILDPADDING).itemWidth
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Columns = UseResponsiveLayoutFunction("columns", WithFooter)
	local Gutter = UseResponsiveLayoutFunction("gutter", WithFooter) or GAMEGRIDCHILDPADDING
	local VerticalGutter = UseResponsiveLayoutFunction("verticalGutter", WithFooter) or Gutter
	local Floored = math.floor((_Vector2.X + Gutter) / (ItemWidth + Gutter))
	local IsUsePreferredInputResultMatch = UsePreferredInputResult == ResponsiveModule.Input.Pointer
	local Narrow = UseGetGameTileHeightFunction(IsUsePreferredInputResultMatch, "Narrow", IsUsePreferredInputResultMatch, false, false, UseTextSizeOffsetResult, nil, GameTileConstants.TileTextLines.Narrow.titleTextLines)
	local Narrow1 = UseGameCollectionLayoutParamsFunction("Narrow", UseStateResult1, false, {
		columnGap = Gutter,
		numColumns = Columns or Floored,
		sideMargin = PageSideMargin
	})
	local UseResult = ReactModule.useCallback(function(Id, p1)
		-- upvalues: Entries (copy), FlaggedMutedErrorFunction (upval), Narrow1 (copy), SendItemActionEvent (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), SongList (upval), SortId (copy), ContentType (upval)
		if not Entries then
			FlaggedMutedErrorFunction("SongGridPageMissingEntries", "entries is nil for handleSongClick")
			
			return
		end
		if Narrow1.numColumns <= 0 then
			warn("numColumns should not be 0 or nil when calculating row number")
			
			return
		else
			SendItemActionEvent.sendFromItemCollection(UseRoactServiceResult1, UseRoactServiceResult, { id = Id }, math.ceil(p1 / Narrow1.numColumns), p1, SongList, 1, SortId, #Entries, ContentType.Song, "OpenSongDetails")
		end
	end, {
		UseRoactServiceResult1,
		UseRoactServiceResult,
		SortId,
		Entries
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, {
		TopBar = ReactModule.createElement(PersonalizationTopBarModule, { titleText = UseLocalizationResult.chartsTitle }),
		ScrollingFrame = ReactModule.createElement(RefreshScrollingFrameModule, {
			createEndOfScrollElement = true,
			Position = UDim2.new(0, 0, 0, UseSelectorResult),
			Size = UDim2.new(1, 0, 1, -UseSelectorResult),
			BackgroundTransparency = UseDesignTokensResult.LuaApps.SeeAll.BackgroundTransparency,
			onAbsoluteSizeChangedCallback = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				if Frame then
					UseStateResult2(Frame.AbsoluteSize)
				end
			end,
			onCanvasPositionChangedCallback = function()
				-- upvalues: UseRefResult1 (copy)
				UseRefResult1.current:fire()
			end,
			ref = UseRefResult
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING)
			}),
			CollectionGrid = ReactModule.createElement(CollectionGrid, {
				hideHeaderButton = true,
				columnGap = Narrow1.columnGap,
				containerRef = UseStateResult2_1,
				getItemHeight = Narrow,
				items = Entries,
				numColumns = Narrow1.numColumns,
				renderItem = ReactModule.useCallback(function(p1, LayoutOrder, Size)
					-- upvalues: ReactModule (upval), SongTile (upval), IsUsePreferredInputResultMatch (copy), SongListPageName (copy), UsePreferredInputResult (copy), ResponsiveModule (upval), UseResult (copy)
					return ReactModule.createElement(SongTile, {
						contentId = p1.contentId,
						hasBackground = IsUsePreferredInputResultMatch,
						hasOutline = IsUsePreferredInputResultMatch,
						impressionsTag = SongListPageName,
						layoutOrder = LayoutOrder,
						size = Size,
						useLargerFooterFont = UsePreferredInputResult == ResponsiveModule.Input.Pointer,
						reportTileOpened = function()
							-- upvalues: UseResult (upval), p1 (copy), LayoutOrder (copy)
							UseResult(p1.contentId, LayoutOrder)
						end,
						isContained = IsUsePreferredInputResultMatch
					}), "SongTile"
				end, {
					UsePreferredInputResult,
					SongListPageName,
					UseResult,
					IsUsePreferredInputResultMatch
				}),
				sideMargin = Narrow1.sideMargin,
				title = UseSelectorResult1 and UseSelectorResult1.displayName or "",
				verticalPadding = VerticalGutter,
				verticalScrollingFrameRef = UseRefResult
			}),
			SeeAllImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsTracker, {
				impressionsTag = SongListPageName,
				pageContext = SongList,
				parentRef = UseRefResult,
				scrollViewPositionChangedSignal = UseRefResult1.current,
				sendImpressions = ReactModule.useCallback(function(p1)
					-- upvalues: UseSelectorResult1 (copy), Entries (copy), SendItemImpressions (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), Narrow1 (copy), SongList (upval), ContentType (upval)
					if not UseSelectorResult1 then return end
					if not Entries then return end
					local List = {}
					
					for _, entry in ipairs(Entries) do
						table.insert(List, { id = entry.contentId })
					end
					SendItemImpressions.sendFromItemCollection(UseRoactServiceResult1, UseRoactServiceResult, p1, List, Narrow1.numColumns, SongList, 1, ContentType.Song, #List, nil, UseSelectorResult1.name)
				end, {
					UseRoactServiceResult1,
					UseRoactServiceResult,
					Entries,
					Narrow1.numColumns,
					UseSelectorResult1
				})
			})
		})
	})
end