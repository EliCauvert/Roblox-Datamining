local CorePackages = game:GetService("CorePackages")
local Url = require(CorePackages.Workspace.Packages.Http).Url
local Functional = require(CorePackages.Workspace.Packages.AppCommonLib).Functional
local AccordionView = require(CorePackages.Packages.UIBlox).AccordionView
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local GameMediaImageType = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameMediaImageType
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local MediaAccordionExpandedFunction = Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaAccordionExpanded
local MediaAccordionCollapsedFunction = Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaAccordionCollapsed
local ApiFetchGameMedia = Modules.LuaApp.Thunks.Games.ApiFetchGameMedia
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules1.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local OpenYouTubeVideoModule = require(Modules1.LuaApp.Thunks.OpenYouTubeVideo)
local OpenYouTubeVideoEventFunction = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.openYouTubeVideoEvent
local GameMediaItemModule = require(Modules1.LuaApp.Components.Games.GameMediaItem)
local LoadableImageModule = require(Modules1.LuaApp.Components.LoadableImage)
local GenericIconButtonModule = require(Modules1.LuaApp.Components.GenericIconButton)
local WithThemeDEPRECATEDModule = require(Modules1.LuaApp.withTheme_DEPRECATED)
local FFlagMediaAccordionAndFullTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagMediaAccordionAndFullTelemetry
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents

local function processMediaEntry(p1, p2)
	-- upvalues: GameMediaImageType (copy)
	local Text = nil
	if p1.assetTypeId == GameMediaImageType.YouTubeVideo then
		if not p2 then
			return nil
		end
		Text = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", p1.videoHash)
	else
		Text = "http://www.roblox.com/asset/?id=" .. tostring(p1.imageId)
	end
	return {
		mediaType = p1.assetTypeId,
		imageId = Text,
		videoTitle = p1.videoTitle,
		videoHash = p1.videoHash
	}
end

local function _(p1)
	-- upvalues: GameMediaImageType (copy), Url (copy)
	return {
		mediaType = GameMediaImageType.Image,
		imageId = Url:getPlaceDefaultThumbnailUrl(p1, 768, 432)
	}
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1, p2, p3, Done, p4)
	-- upvalues: RetrievalStatus (copy), GameMediaImageType (copy), Url (copy), processMediaEntry (copy)
	if not p1 then
		return if Done == RetrievalStatus.Done then {
			[1] = {
				mediaType = GameMediaImageType.Image,
				imageId = Url:getPlaceDefaultThumbnailUrl(p3, 768, 432)
			}
		} else {}
	end
	local List = {}
	
	for _, value in ipairs({ unpack(p1, 1, p2) }) do
		local ProcessMediaEntryResult = processMediaEntry(value, p4)
		
		if ProcessMediaEntryResult then
			table.insert(List, ProcessMediaEntryResult)
		end
	end
	return List
end)
local GameMediaAccordionView = RoactModule.PureComponent:extend("GameMediaAccordionView")

function GameMediaAccordionView.init(p5)
	-- upvalues: LoadableImageModule (copy), Functional (copy), GameMediaImageType (copy), OpenYouTubeVideoEventFunction (copy), RetrievalStatus (copy), FFlagMediaAccordionAndFullTelemetry (copy), MediaAccordionExpandedFunction (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), MediaAccordionCollapsedFunction (copy)
	p5.isMounted = false
	p5.state = {
		firstImageLoaded = LoadableImageModule.isLoaded(p5.props.firstImageId)
	}
	
	function p5.performOpenYouTubeVideo(p6, p7)
		-- upvalues: p5 (copy)
		local GuiService = p5.props.guiService
		local OpenYouTubeVideoFunction: (any, any, any, any, any, any, any) -> () = p5.props.openYouTubeVideo
		local EventIngest = p5.props.eventIngest
		local UniverseId = p5.props.universeId
		local VideoHash = p6.videoHash
		local VideoTitle = p6.videoTitle
		
		if VideoHash and #VideoHash > 0 and VideoTitle and #VideoTitle > 0 then
			OpenYouTubeVideoFunction(GuiService, VideoHash, VideoTitle, p7, EventIngest, UniverseId, "play")
		end
	end
	
	function p5.logMediaItemsContainVideo(p6)
		-- upvalues: p5 (copy), Functional (upval), GameMediaImageType (upval), OpenYouTubeVideoEventFunction (upval)
		local EventIngest = p5.props.eventIngest
		local UniverseId = p5.props.universeId
		local FilterResultEntry = Functional.Filter(p5.props.gameMediaEntries or {}, function(p7): boolean
			-- upvalues: GameMediaImageType (upval)
			return p7.mediaType == GameMediaImageType.YouTubeVideo
		end)[1]
		
		if FilterResultEntry then
			OpenYouTubeVideoEventFunction(EventIngest, p6, FilterResultEntry.videoTitle, FilterResultEntry.videoHash, UniverseId, "view")
		end
	end
	
	function p5.openItem(p6)
		-- upvalues: GameMediaImageType (upval), p5 (copy)
		if p6.mediaType == GameMediaImageType.YouTubeVideo then
			local OpenLeaveRobloxAlertUIBloxFunction: (any) -> () = p5.props.openLeaveRobloxAlertUIBlox
			
			local function v38()
				-- upvalues: p5 (upval), p6 (copy)
				p5.performOpenYouTubeVideo(p6, "gameDetailsAccordianImage")
			end
			
			if p5.props.showYouTubeAgeAlert then
				OpenLeaveRobloxAlertUIBloxFunction(v38)
				
				return
			end
			p5.performOpenYouTubeVideo(p6, "gameDetailsAccordianImage")
		end
	end
	
	function p5.onImageLoaded(p6)
		-- upvalues: p5 (copy)
		if p6 == 1 and p5.state.firstImageLoaded == false and p5.isMounted then
			p5:setState({ firstImageLoaded = true })
		end
	end
	
	if p5.props.gameMediaFetchingStatus == RetrievalStatus.Done then
		p5.logMediaItemsContainVideo("gameDetailsAccordianImage")
	end
	if FFlagMediaAccordionAndFullTelemetry then
		function p5.onAccordionExpanded()
			-- upvalues: p5 (copy), MediaAccordionExpandedFunction (upval), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
			if p5.props.placeId then
				MediaAccordionExpandedFunction(p5.props.eventIngest, "GameMediaAccordionView", p5.props.placeId, if FFlagLuaAppAddUniverseIdToGameDetailsEvents then { universeId = p5.props.universeId } else nil)
			end
		end
		
		function p5.onAccordionCollapsed()
			-- upvalues: p5 (copy), MediaAccordionCollapsedFunction (upval), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
			if p5.props.placeId then
				MediaAccordionCollapsedFunction(p5.props.eventIngest, "GameMediaAccordionView", p5.props.placeId, if FFlagLuaAppAddUniverseIdToGameDetailsEvents then { universeId = p5.props.universeId } else nil)
			end
		end
	end
end

function GameMediaAccordionView.renderItem(p5, DefaultEntry, ImageTransparency, AnimationSettings)
	-- upvalues: RoactModule (copy), GameMediaItemModule (copy), GameMediaImageType (copy), Functional (copy)
	local GameMediaAccordion = p5.props.appTheme.GameMediaAccordion
	
	return RoactModule.createElement(GameMediaItemModule, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = GameMediaAccordion.Item.BackgroundColor,
		BackgroundTransparency = GameMediaAccordion.Item.BackgroundTransparency,
		Image = DefaultEntry.imageId,
		ImageTransparency = ImageTransparency,
		isVideo = DefaultEntry.mediaType == GameMediaImageType.YouTubeVideo,
		videoIconColor = GameMediaAccordion.VideoIconColor,
		animationSettings = AnimationSettings,
		onImageLoaded = function()
			-- upvalues: Functional (upval), p5 (copy), DefaultEntry (copy)
			p5.onImageLoaded((Functional.Find(p5.props.gameMediaEntries, DefaultEntry)))
		end,
		onActivated = function()
			-- upvalues: p5 (copy), DefaultEntry (copy)
			p5.openItem(DefaultEntry)
		end
	})
end

function GameMediaAccordionView.render(p5)
	-- upvalues: RoactModule (copy), AccordionView (copy), GenericIconButtonModule (copy), FFlagMediaAccordionAndFullTelemetry (copy)
	local GameMediaAccordion = p5.props.appTheme.GameMediaAccordion
	local GameMediaEntries = p5.props.gameMediaEntries
	local LayoutOrder = p5.props.LayoutOrder
	local Width: number = p5.props.width
	local Loaded = p5.state.firstImageLoaded and GameMediaAccordion.FakeItem.Loaded or GameMediaAccordion.FakeItem.Loading
	
	return if #GameMediaEntries > 0 then RoactModule.createElement(AccordionView, {
		collapseButtonSize = 44,
		maxItemsInCompactView = 3,
		items = GameMediaEntries,
		itemWidth = Width,
		itemHeight = Width * 0.5611940298507463,
		renderItem = function(...)
			-- upvalues: p5 (copy)
			return p5:renderItem(...)
		end,
		placeholderColor = Loaded.Color,
		placeholderBaseTransparency = Loaded.BaseTransparency,
		renderCollapseButton = function(OnActivated)
			-- upvalues: RoactModule (upval), GenericIconButtonModule (upval)
			return RoactModule.createElement(GenericIconButtonModule, {
				iconImage = "LuaApp/icons/GameDetails/collapse",
				withNewThemeProvider = true,
				Size = UDim2.new(1, 0, 1, 0),
				iconSize = UDim2.new(0, 36, 0, 36),
				onActivated = OnActivated
			})
		end,
		LayoutOrder = LayoutOrder,
		onExpand = if FFlagMediaAccordionAndFullTelemetry then p5.onAccordionExpanded else nil,
		onCollapse = if FFlagMediaAccordionAndFullTelemetry then p5.onAccordionCollapsed else nil
	}) else nil
end

function GameMediaAccordionView.didUpdate(p5, p6, _)
	-- upvalues: LoadableImageModule (copy), RetrievalStatus (copy)
	if p6.firstImageId ~= p5.props.firstImageId then
		local IsLoaded = LoadableImageModule.isLoaded(p5.props.firstImageId)
		
		if IsLoaded ~= p5.state.firstImageLoaded then
			p5:setState({ firstImageLoaded = IsLoaded })
		end
	end
	if p6.gameMediaFetchingStatus ~= RetrievalStatus.Done and p5.props.gameMediaFetchingStatus == RetrievalStatus.Done then
		p5.logMediaItemsContainVideo("gameDetailsAccordianImage")
	end
end

function GameMediaAccordionView.didMount(p5)
	p5.isMounted = true
end

function GameMediaAccordionView.willUnmount(p5)
	p5.isMounted = false
end

return (RoactAppPolicy.connect(function(p5, _)
	return {
		showYouTubeAgeAlert = p5.getShowYouTubeAgeAlert(),
		showVideoThumbnails = p5.getShowVideoThumbnails()
	}
end)((RoactServices.connect({
	guiService = AppGuiService,
	eventIngest = AppEventIngestService
})((RoactRoduxModule.connect(function(p5, p6)
	-- upvalues: ApiFetchGameMedia (copy), MemoizeResult (copy), RoactModule (copy)
	local FetchingStatus = ApiFetchGameMedia.GetFetchingStatus(p5, p6.universeId)
	local MemoizeResultResult = MemoizeResult(p5.GameMedia[p6.universeId], 10, p6.placeId, FetchingStatus, p6.showVideoThumbnails)
	
	return {
		gameMediaEntries = MemoizeResultResult,
		gameMediaFetchingStatus = FetchingStatus,
		firstImageId = if MemoizeResultResult == nil or MemoizeResultResult[1] == nil then RoactModule.None else MemoizeResultResult[1].imageId
	}
end, function(Callback)
	-- upvalues: OpenCentralOverlayForLeaveRobloxAlertModule (copy), OpenYouTubeVideoModule (copy)
	return {
		openLeaveRobloxAlertUIBlox = function(p5)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			Callback(OpenCentralOverlayForLeaveRobloxAlertModule(p5))
		end,
		openYouTubeVideo = function(p5, p6, p7, p8, p9, p10, p11)
			-- upvalues: Callback (copy), OpenYouTubeVideoModule (upval)
			return Callback(OpenYouTubeVideoModule(p5, p6, p7, p8, p9, p10, p11))
		end
	}
end)((WithThemeDEPRECATEDModule(GameMediaAccordionView))))))))