local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local LayoutConfig = require(CorePackages.Workspace.Packages.RobloxAppEnums).LayoutConfig
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseResponsiveLayoutFunction = UIBloxModule.Core.Layout.Responsive.useResponsiveLayout
local CarouselGenericSquareTile = require(CorePackages.Workspace.Packages.SocialCommon).Components.CarouselGenericSquareTile
local UseRouteNameFunction = require(CorePackages.Workspace.Packages.Navigation).useRouteName
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CarouselWidgetModule = require(Modules.LuaApp.Components.Generic.CarouselWidget)
local JoinYourFriendsTileModule = require(Modules.Personalization.OmniFeed.JoinYourFriendsTile)
local ConstantsModule = require(Modules.LuaApp.Constants)
local UseNavigateFromAddFriendsModule = require(Modules.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends)
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING
local GAMECAROUSELCHILDPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_CHILD_PADDING

local function onImpressionsDetected(p1, p2, Tiles, AppPage)
	-- upvalues: JoinYourFriendsTileModule (copy), ConstantsModule (copy)
	if not p1 or #p1 == 0 then return end
	local List = {}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	
	for i = 1, #p1 do
		local v1 = p1[i]
		local Tile = Tiles[v1]
		
		if Tile then
			if Tile.type == JoinYourFriendsTileModule then
				table.insert(List, Tile.props.friendUserId)
				table.insert(List1, Tile.props.universeId)
				table.insert(List2, Tile.props.rootPlaceId)
				table.insert(List3, v1)
			else
				table.insert(List1, "Other")
				table.insert(List3, v1)
			end
		end
	end
	p2:sendEventDeferred(AppPage, ConstantsModule.ImpressionsEvents.JoinYourFriends, {
		coplayIds = table.concat(List, ","),
		contentIds = table.concat(List1, ","),
		rootPlaceIds = table.concat(List2, ","),
		positions = table.concat(List3, ",")
	})
end

local function _(p3, p4)
	p4:sendEventDeferred(p3, "joinYourFriendProfileViewOpen", { friendId = "FIND_FRIENDS" })
end

local function createFindFriendsTile(LayoutOrder, Size, LabelText, TextFont, OnActivated)
	-- upvalues: ReactModule (copy), CarouselGenericSquareTile (copy), Images (copy)
	return ReactModule.createElement(CarouselGenericSquareTile, {
		borderThickness = 1,
		impressionsTag = "JYF_TILE_IMPRESSION",
		LayoutOrder = LayoutOrder,
		tileSize = Size.Y,
		icon = Images["icons/graphic/findfriends_large"],
		labelText = LabelText,
		onActivated = OnActivated,
		styleProps = {
			containFooterInTileSize = true,
			font = TextFont,
			textXAlignment = Enum.TextXAlignment.Left
		}
	})
end

local function getTilesForData(Entries, Size, p3)
	-- upvalues: ReactModule (copy), GAMECAROUSELCHILDPADDING (copy), createFindFriendsTile (copy), JoinYourFriendsTileModule (copy)
	local Tiles = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, GAMECAROUSELCHILDPADDING),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	local LayoutOrder = 0
	
	if p3 then
		LayoutOrder += 1
		Tiles[LayoutOrder] = createFindFriendsTile(LayoutOrder, Size, p3.tileText, p3.textFont, p3.onActivated)
	end
	for i = 1, #Entries do
		local Entry = Entries[i]
		
		for i1 = 1, #Entry.coplayUsers do
			LayoutOrder += 1
			Tiles[LayoutOrder] = ReactModule.createElement(JoinYourFriendsTileModule, {
				impressionsTag = "JYF_TILE_IMPRESSION",
				LayoutOrder = LayoutOrder,
				size = Size,
				friendUserId = tostring(Entry.coplayUsers[i1].userId),
				thumbnailAssetId = tostring(Entry.thumbnailAssetId),
				experienceName = Entry.name,
				rootPlaceId = Entry.rootPlaceId,
				universeId = Entry.contentId
			})
		end
	end
	return { tiles = Tiles, tileCount = LayoutOrder }
end

return function(p4)
	-- upvalues: UseSelectorFunction (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), ConstantsModule (copy), LayoutConfig (copy), UseResponsiveLayoutFunction (copy), GAMECAROUSELSIDEWIDEPADDING (copy), ReactModule (copy), Signal (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), OmniFeedProps (copy), UseRouteNameFunction (copy), UseLocalizationFunction (copy), GridMetrics (copy), TopicContentsReducer (copy), UseStyleFunction (copy), UseAppPolicyFunction (copy), UseNavigateFromAddFriendsModule (copy), OmniFeedConstants (copy), getTilesForData (copy), GAMECAROUSELCHILDPADDING (copy), CarouselWidgetModule (copy), RetrievalStatus (copy), ScreenSizeImpressionsDetector (copy), onImpressionsDetected (copy)
	local Offset = nil
	local NarrowColumnCount = nil
	if UseSelectorFunction(function(p5)
		return p5.FormFactor
	end) == FormFactor.COMPACT then
		Offset = GAMECAROUSELSIDECOMPACTPADDING
		NarrowColumnCount = ConstantsModule.JoinYourFriendsTile.NarrowColumnCount
	else
		local Gutter = UseResponsiveLayoutFunction("gutter", LayoutConfig.Kind.Experiences.GridTile) or 0
		Offset = if Gutter == 0 then GAMECAROUSELSIDEWIDEPADDING else Gutter
		NarrowColumnCount = ConstantsModule.JoinYourFriendsTile.WideColumnCount
	end
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local AppPage = (p4[OmniFeedProps.key] or {}).appPage
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: UseRefResult (copy)
		UseRefResult.current:fire()
	end)
	local UseRouteNameResult = UseRouteNameFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		carouselTitle = "Feature.Home.Heading.JoinYourFriends",
		findFriendsTile = "Feature.Friends.Action.FindFriends"
	})
	local ItemWidth: number = GridMetrics.getMetricsForFixedColumns(UseSelectorFunction(function(p5)
		return p5.ScreenSize
	end).X - 2 * Offset, Offset, NarrowColumnCount).itemWidth
	local _Vector2 = Vector2.new(ItemWidth, ItemWidth / 1.7777777777777777 + 50)
	local TopicId = p4.topicId
	local UseSelectorResult = UseSelectorFunction(function(p5)
		-- upvalues: TopicId (copy), TopicContentsReducer (upval)
		return if TopicId then p5.Personalization[TopicContentsReducer.key][TopicId] else nil
	end)
	local Entries = UseSelectorResult and UseSelectorResult.entries or {}
	local UseStyleResult = UseStyleFunction()
	local UseNavigateFromAddFriendsModuleResult = UseNavigateFromAddFriendsModule({
		policyIsEnabled = UseAppPolicyFunction(function(p5)
			return p5.getContactImporterEnabled()
		end)
	})
	local Config = if p4.topicLayoutData and p4.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.JYFFindFriendsEnabled] then {
		tileText = UseLocalizationResult.findFriendsTile,
		textFont = UseStyleResult.Font.Header2,
		onActivated = function()
			-- upvalues: UseRouteNameResult (copy), UseRoactServiceResult (copy), UseNavigateFromAddFriendsModuleResult (copy)
			UseRoactServiceResult:sendEventDeferred(UseRouteNameResult, "joinYourFriendProfileViewOpen", { friendId = "FIND_FRIENDS" })
			UseNavigateFromAddFriendsModuleResult()
		end
	} else nil
	local Tiles = {}
	local TileCount = 0
	
	if UseSelectorResult then
		local TilesForData = getTilesForData(Entries, _Vector2, Config)
		Tiles = TilesForData.tiles
		TileCount = TilesForData.tileCount
	end
	local NewTileCount = (TileCount - 1) * (GAMECAROUSELCHILDPADDING + _Vector2.X) + (GAMECAROUSELCHILDPADDING + _Vector2.X / 2)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current:fire()
	end, {})
	
	return if TileCount > 0 then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingBottom = UDim.new(1, 0)
		}),
		TileCarousel = ReactModule.createElement(CarouselWidgetModule, {
			index = 1,
			showSeeAll = false,
			title = UseLocalizationResult.carouselTitle,
			itemWidth = _Vector2.X,
			canvasWidth = NewTileCount,
			carouselHeight = _Vector2.Y,
			itemPadding = GAMECAROUSELCHILDPADDING,
			items = Tiles,
			itemCount = TileCount,
			fetchingStatus = RetrievalStatus.Done,
			onChangeCanvasPosition = UseResult
		}),
		JYFCarouselImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsDetector, {
			impressionsTag = "JYF_TILE_IMPRESSION",
			onRequestImpressionsSignal = UseRefResult.current,
			onImpressionsDetected = function(p5)
				-- upvalues: onImpressionsDetected (upval), UseRoactServiceResult (copy), Tiles (ref), AppPage (copy)
				onImpressionsDetected(p5, UseRoactServiceResult, Tiles, AppPage)
			end
		})
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
end