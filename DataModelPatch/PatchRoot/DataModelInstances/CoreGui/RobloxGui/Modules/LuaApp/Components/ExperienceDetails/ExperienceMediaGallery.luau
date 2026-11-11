local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local TModule = require(CorePackages.Packages.t)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local DeviceType = RobloxAppEnumsModule.DeviceType
local UiMode = RobloxAppEnumsModule.UiMode
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local GameMediaImageType = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameMediaImageType
local UseSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local VideoPlaybackCoordinator = require(CorePackages.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator
local AppBloxModule = require(CorePackages.Workspace.Packages.AppBlox)
local MediaGalleryPreview = AppBloxModule.MediaGalleryPreview
local MediaGalleryCarousel = AppBloxModule.MediaGalleryCarousel
local MediaGalleryFullScreen = AppBloxModule.MediaGalleryFullScreen
local CrossFadeAnimatedView = AppBloxModule.CrossFadeAnimatedView
local MediaGalleryExpandableView = AppBloxModule.MediaGalleryExpandableView
local CalcMediaGallerySizesFromWidthFunction = AppBloxModule.calcMediaGallerySizesFromWidth
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OpenYouTubeVideoModule = require(Modules.LuaApp.Thunks.OpenYouTubeVideo)
local OpenYouTubeVideoEventFunction = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.openYouTubeVideoEvent
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local OnNavigateBackWrapper = require(CorePackages.Workspace.Packages.SduiSharedUtilities).OnNavigateBackWrapper
local MediaGallerySnappingModule = require(Modules.LuaApp.Components.ExperienceDetails.MediaGallerySnapping)
local MediaGallerySnappingFullModule = require(Modules.LuaApp.Components.ExperienceDetails.MediaGallerySnappingFull)
local MediaGalleryVideoItemModule = require(Modules.LuaApp.Components.ExperienceDetails.MediaGalleryVideoItem)
local ConsoleVideoFocusBindingModule = require(Modules.LuaApp.Components.ExperienceDetails.ConsoleVideoFocusBinding)
local UseSelectedGameMediaEntriesModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useSelectedGameMediaEntries)
local UseMediaGalleryVideoAnalytics = require(CorePackages.Workspace.Packages.MediaGallery).useMediaGalleryVideoAnalytics
local FFlagExperienceDetailsTextUseTokensModule = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)
local FFlagEDPMediaAddLocalization10ftModule = require(script.Parent.Flags.FFlagEDPMediaAddLocalization10ft)
local GetFFlagConsoleApplyTokenizationEdpFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp
local FFlagLuaAppDesktopMediaGalleryTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry
local FFlagLuaAppEdpMediaGalleryRedesign = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesign
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpMediaGalleryFullScreen = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpMediaGalleryHeightJitterFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryHeightJitterFix
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppEdpConsoleMediaGalleryVideoMute = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideoMute
local ExperienceMediaGallery = RoactModule.PureComponent:extend("ExperienceMediaGallery")
ExperienceMediaGallery.validateProps = TModule.interface({
	universeId = TModule.string,
	startIndex = if FFlagLuaAppEdpMediaGalleryFullScreen then TModule.optional(TModule.number) else nil,
	isFullscreen = TModule.optional(TModule.boolean),
	fullscreenShowIndex = TModule.optional(TModule.integer),
	onPreviewActivated = TModule.optional(TModule.callback),
	onThumbnailActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry then TModule.optional(TModule.callback) else nil,
	deviceType = TModule.optional(TModule.string),
	tokens = TModule.optional(TModule.table),
	showYouTubeVideoFirst = TModule.optional(TModule.boolean),
	onSwipe = TModule.optional(TModule.callback),
	onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then TModule.optional(TModule.callback) else nil,
	initialWidth = if FFlagLuaAppEdpMediaGalleryHeightJitterFix then TModule.optional(TModule.number) else nil,
	isOccluded = if FFlagLuaAppEdpMediaGalleryFullScreen and (FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryVideoPreview) then TModule.optional(TModule.boolean) else nil,
	uiMode = TModule.optional(TModule.string),
	isFullscreenState = TModule.optional(TModule.boolean),
	onSelectionGained = TModule.optional(TModule.callback),
	mediaGalleryGainFocused = TModule.optional(TModule.callback),
	expandableAreaHeightOffset = TModule.optional(TModule.number),
	nextIndex = TModule.optional(TModule.number),
	isCrossFade = TModule.optional(TModule.boolean),
	currentIndex = TModule.optional(TModule.number),
	setCurrentIndex = TModule.optional(TModule.callback),
	setCrossFade = TModule.optional(TModule.callback),
	toggleMuteSignal = if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then TModule.optional(TModule.table) else nil,
	videoPlaybackCoordinator = if FFlagLuaAppEdpConsoleMediaGalleryVideo then TModule.optional(TModule.table) else nil,
	exitFullscreen = TModule.optional(TModule.callback),
	selectedGameMediaEntries = TModule.optional(TModule.table),
	videoAnalytics = if FFlagLuaAppEdpMediaGalleryVideoPreview then TModule.optional(TModule.table) else nil,
	placeId = if FFlagLuaAppEdpMediaGalleryFullScreen then TModule.optional(TModule.string) else nil,
	mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then TModule.optional(TModule.boolean) else nil,
	mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then TModule.optional(TModule.boolean) else nil,
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil
})
ExperienceMediaGallery.defaultProps = {
	isFullscreen = false,
	fullscreenShowIndex = 1,
	showYouTubeVideoFirst = true,
	isFullscreenState = false,
	nextIndex = 1,
	expandableAreaHeightOffset = if GetFFlagConsoleApplyTokenizationEdpFunction() then nil else 592
}

function ExperienceMediaGallery.init(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), VideoPlaybackCoordinator (copy), CalcMediaGallerySizesFromWidthFunction (copy), MemoizeFunction (copy), CryoModule (copy), GameMediaImageType (copy), UiMode (copy), OpenYouTubeVideoEventFunction (copy)
	p1.containerHeight, p1.updateContainerHeight = RoactModule.createBinding(0)
	p1.containerSize = p1.containerHeight:map(function(YOffset): UDim2
		return UDim2.new(1, 0, 0, YOffset)
	end)
	
	if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then
		p1.state = { isFocusedItemVideo = false }
	end
	p1.mediaGalleryVideoPreviewEnabled = if FFlagLuaAppEdpMediaGalleryVideoPreview then not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp or p1.props.mediaGalleryVideoPreviewEnabledIxp else nil
	p1.videoPlaybackCoordinator = if FFlagLuaAppEdpConsoleMediaGalleryVideo and p1.props.videoPlaybackCoordinator then p1.props.videoPlaybackCoordinator elseif FFlagLuaAppEdpMediaGalleryVideoPreview and p1.mediaGalleryVideoPreviewEnabled then VideoPlaybackCoordinator.new() else nil
	
	function p1.onResize(Frame)
		-- upvalues: CalcMediaGallerySizesFromWidthFunction (upval), p1 (copy)
		local Offset = CalcMediaGallerySizesFromWidthFunction(Frame.AbsoluteSize.X, 5).contentSize.Y.Offset
		
		if Offset ~= p1.containerHeight:getValue() then
			p1.updateContainerHeight(Offset)
		end
	end
	
	p1.getItemsFromEntries = MemoizeFunction(function(p2)
		-- upvalues: CryoModule (upval), GameMediaImageType (upval), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), p1 (copy)
		return CryoModule.List.map(p2, function(p3)
			-- upvalues: GameMediaImageType (upval), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), p1 (upval)
			return {
				imageId = p3.imageId,
				isYouTubeVideo = p3.mediaType == GameMediaImageType.YouTubeVideo,
				videoId = if FFlagLuaAppEdpMediaGalleryVideoPreview and p1.mediaGalleryVideoPreviewEnabled then p3.videoId else nil
			}
		end)
	end)
	
	function p1.performOpenYouTubeVideo(SelectedGameMediaEntry, p2)
		-- upvalues: p1 (copy)
		local GuiService = p1.props.guiService
		local OpenYouTubeVideoFunction: (any, any, any, any, any, any, any) -> () = p1.props.openYouTubeVideo
		local EventIngest = p1.props.eventIngest
		local UniverseId = p1.props.universeId
		local YouTubeVideoHash = SelectedGameMediaEntry.youTubeVideoHash
		local YouTubeVideoTitle = SelectedGameMediaEntry.youTubeVideoTitle
		
		if YouTubeVideoHash and #YouTubeVideoHash > 0 and YouTubeVideoTitle and #YouTubeVideoTitle > 0 then
			OpenYouTubeVideoFunction(GuiService, YouTubeVideoHash, YouTubeVideoTitle, p2, EventIngest, UniverseId, "play")
		end
	end
	
	function p1.openYouTubeVideoItem(p2)
		-- upvalues: p1 (copy)
		local OpenLeaveRobloxAlertUIBloxFunction: (any) -> () = p1.props.openLeaveRobloxAlertUIBlox
		local SelectedGameMediaEntry = p1.props.selectedGameMediaEntries[p2]
		
		local function v59()
			-- upvalues: p1 (upval), SelectedGameMediaEntry (copy)
			p1.performOpenYouTubeVideo(SelectedGameMediaEntry, "gameDetailsAccordianImage")
		end
		
		if p1.props.showYouTubeAgeAlert then
			OpenLeaveRobloxAlertUIBloxFunction(v59)
			
			return
		else
			p1.performOpenYouTubeVideo(SelectedGameMediaEntry, "gameDetailsAccordianImage")
		end
	end
	
	if p1.props.uiMode == UiMode.TenFoot then
		p1.getConsoleItemsFromEntries = MemoizeFunction(function(p2)
			-- upvalues: CryoModule (upval), GameMediaImageType (upval)
			return CryoModule.List.filter(p2, function(p3): boolean
				-- upvalues: GameMediaImageType (upval)
				return p3.mediaType ~= GameMediaImageType.YouTubeVideo
			end)
		end)
	end
	function p1.logMediaItemsContainYouTubeVideo(p2)
		-- upvalues: p1 (copy), UiMode (upval), CryoModule (upval), GameMediaImageType (upval), OpenYouTubeVideoEventFunction (upval)
		local EventIngest = p1.props.eventIngest
		local UniverseId = p1.props.universeId
		local IsUiModeMatch = p1.props.uiMode == UiMode.TenFoot
		local FilterResultEntry = CryoModule.List.filter(if IsUiModeMatch then {} else p1.props.selectedGameMediaEntries, function(p3): boolean
			-- upvalues: GameMediaImageType (upval)
			return p3.mediaType == GameMediaImageType.YouTubeVideo
		end)[1]
		
		if FilterResultEntry then
			OpenYouTubeVideoEventFunction(EventIngest, p2, FilterResultEntry.youTubeVideoTitle, FilterResultEntry.youTubeVideoHash, UniverseId, "view")
		end
	end
	
	if not p1.props.isFullScreen then
		p1.logMediaItemsContainYouTubeVideo("gameDetailsAccordianImage")
	end
end

function ExperienceMediaGallery.didUpdate(p1, p2, _)
	-- upvalues: CryoModule (copy)
	if not p1.props.isFullScreen and not CryoModule.List.equals(p2.selectedGameMediaEntries, p1.props.selectedGameMediaEntries) then
		p1.logMediaItemsContainYouTubeVideo("gameDetailsAccordianImage")
	end
end

function ExperienceMediaGallery.renderWithLocalization(p1, p2)
	-- upvalues: UiMode (copy)
	local SelectedGameMediaEntries = p1.props.selectedGameMediaEntries
	local ConsoleItemsFromEntries = if p1.props.uiMode == UiMode.TenFoot then p1.getConsoleItemsFromEntries(SelectedGameMediaEntries) else p1.getItemsFromEntries(SelectedGameMediaEntries)
	
	return if #ConsoleItemsFromEntries <= 0 then nil else p1.props.isFullscreen and p1:renderFullscreen(ConsoleItemsFromEntries) or p1:renderPreview(ConsoleItemsFromEntries, p2)
end

function ExperienceMediaGallery.render(p1)
	-- upvalues: FFlagEDPMediaAddLocalization10ftModule (copy), WithLocalizationFunction (copy)
	return if FFlagEDPMediaAddLocalization10ftModule then WithLocalizationFunction({ titleText = "Feature.GameDetails.Heading.Media" })(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithLocalization(p2)
	end) else p1:renderWithLocalization()
end

function ExperienceMediaGallery.renderPreview(p1, Items, p2)
	-- upvalues: FFlagLuaAppEdpMediaGalleryRedesign (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), DeviceType (copy), RoactModule (copy), MediaGalleryCarousel (copy), MediaGallerySnappingModule (copy), FFlagLuaAppEdpMediaGalleryHeightJitterFix (copy), UiMode (copy), CursorKind (copy), GetFFlagConsoleApplyTokenizationEdpFunction (copy), WithStyleFunction (copy), FFlagEDPMediaAddLocalization10ftModule (copy), FFlagExperienceDetailsTextUseTokensModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (copy), OnNavigateBackWrapper (copy), ConsoleVideoFocusBindingModule (copy), MediaGalleryExpandableView (copy), CryoModule (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), MediaGalleryPreview (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy)
	local NoFFlagLuaAppEdpMediaGalleryRedesignIxp = if FFlagLuaAppEdpMediaGalleryRedesign then not FFlagLuaAppEdpMediaGalleryRedesignIxp or p1.props.mediaGalleryRedesignEnabledIxp else nil
	
	if p1.props.deviceType == DeviceType.Tablet and (not FFlagLuaAppEdpMediaGalleryRedesign or not NoFFlagLuaAppEdpMediaGalleryRedesignIxp) then
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 100),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			[RoactModule.Change.AbsoluteSize] = p1.onResize
		}, {
			MediaGalleryCarousel = RoactModule.createElement(MediaGalleryCarousel, {
				items = Items,
				onPreviewActivated = p1.props.onPreviewActivated,
				onVideoPlayActivated = p1.openYouTubeVideoItem
			})
		})
	elseif p1.props.deviceType == DeviceType.Phone and (not FFlagLuaAppEdpMediaGalleryRedesign or not NoFFlagLuaAppEdpMediaGalleryRedesignIxp) then
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			MediaGallerySnapping = RoactModule.createElement(MediaGallerySnappingModule, {
				itemPadding = 8,
				showCounter = false,
				items = Items,
				initialWidth = if FFlagLuaAppEdpMediaGalleryHeightJitterFix then p1.props.initialWidth else nil,
				borderRadius = UDim.new(0, 8),
				onSwipe = p1.props.onSwipe,
				onVideoPlayActivated = p1.openYouTubeVideoItem
			})
		})
	elseif p1.props.uiMode == UiMode.TenFoot then
		local Invisible = nil
		Invisible = if p1.props.isFullscreenState then CursorKind.Invisible else CursorKind.RoundedRect
		local ExpandableAreaHeightOffset = if GetFFlagConsoleApplyTokenizationEdpFunction() and p1.props.tokens then p1.props.tokens.expandableAreaHeightOffset else p1.props.expandableAreaHeightOffset
		
		return WithStyleFunction(function(p3)
			-- upvalues: Items (copy), FFlagEDPMediaAddLocalization10ftModule (upval), p2 (copy), p1 (copy), Invisible (ref), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval), ExpandableAreaHeightOffset (copy), RoactModule (upval), OnNavigateBackWrapper (upval), ConsoleVideoFocusBindingModule (upval), MediaGalleryExpandableView (upval), CryoModule (upval)
			local config = {
				groupTransparency = 0,
				items = Items,
				titleText = if FFlagEDPMediaAddLocalization10ftModule and p2 then p2.titleText else nil,
				showCursor = not p1.props.isFullscreenState,
				selectionCursor = Invisible,
				styleProps = if FFlagExperienceDetailsTextUseTokensModule then {
					titleFont = if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.HeadingSmall else p3.Tokens.Semantic.Typography.Header
				} else nil,
				exitFullscreen = if p1.props.isFullscreenState then p1.props.exitFullscreen else function() end,
				onActivated = p1.props.onPreviewActivated,
				onSelectionGained = function(p4)
					-- upvalues: Items (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), p1 (upval), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval)
					local Part = ""
					local VideoId = nil
					local ImageId = nil
					
					if Items[p4] then
						Part = string.split(Items[p4].imageId, "=")[2]
						VideoId = if FFlagLuaAppEdpConsoleMediaGalleryVideo then Items[p4].videoId else nil
						ImageId = if FFlagLuaAppEdpConsoleMediaGalleryVideo then Items[p4].imageId else nil
					end
					p1.props.onSelectionGained(p4, Part, if FFlagLuaAppEdpConsoleMediaGalleryVideo then VideoId else nil, if FFlagLuaAppEdpConsoleMediaGalleryVideo then ImageId else nil)
					
					if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then
						local HasVideoId = VideoId ~= nil
						
						if p1.state.isFocusedItemVideo ~= HasVideoId then
							p1:setState({ isFocusedItemVideo = HasVideoId })
						end
					end
				end,
				mediaGalleryGainFocused = p1.props.mediaGalleryGainFocused,
				expandableAreaHeightOffset = ExpandableAreaHeightOffset,
				animationConfig = if p1.props.tokens then p1.props.tokens.animationConfig else nil
			}
			
			return if FFlagLuaAppEdpConsoleMediaGalleryVideo and FFlagLuaAppEdpConsoleMediaGalleryVideoMute then RoactModule.createElement(OnNavigateBackWrapper, { onNavigateBack = p1.props.exitFullscreen }, RoactModule.createElement(ConsoleVideoFocusBindingModule, {
				toggleMuteSignal = p1.props.toggleMuteSignal,
				enabled = p1.state.isFocusedItemVideo,
				render = function(RootRef)
					-- upvalues: RoactModule (upval), MediaGalleryExpandableView (upval), CryoModule (upval), config (copy)
					return RoactModule.createElement(MediaGalleryExpandableView, CryoModule.Dictionary.union(config, { rootRef = RootRef }))
				end
			})) else RoactModule.createElement(OnNavigateBackWrapper, { onNavigateBack = p1.props.exitFullscreen }, RoactModule.createElement(MediaGalleryExpandableView, config))
		end)
	elseif FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then
		local Invisible = RoactModule
		Invisible = Invisible.createElement
		Invisible = Invisible("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			MediaGallery = RoactModule.createElement(MediaGallerySnappingModule, {
				itemPadding = 0,
				clipsNonCurrentItems = true,
				showCounter = false,
				items = Items,
				initialWidth = if FFlagLuaAppEdpMediaGalleryHeightJitterFix then p1.props.initialWidth else nil,
				startIndex = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.props.startIndex else nil,
				borderRadius = UDim.new(0, 8),
				onSwipe = p1.props.onSwipe,
				onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p1.props.onMediaGalleryMediaChanged else nil,
				onFullscreenToggleButtonActivated = if FFlagLuaAppEdpMediaGalleryFullScreen then p1.props.onPreviewActivated else nil,
				isOccluded = if FFlagLuaAppEdpMediaGalleryFullScreen and (FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryVideoPreview) then p1.props.isOccluded else nil,
				onVideoPlayActivated = p1.openYouTubeVideoItem,
				videoPlaybackCoordinator = if FFlagLuaAppEdpMediaGalleryVideoPreview and p1.mediaGalleryVideoPreviewEnabled then p1.videoPlaybackCoordinator else nil,
				videoAnalytics = if FFlagLuaAppEdpMediaGalleryVideoPreview then p1.props.videoAnalytics else nil,
				universeId = if FFlagLuaAppEdpMediaGalleryVideoPreview then p1.props.universeId else nil,
				mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.props.mediaGalleryRedesignEnabledIxp else nil,
				mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.props.mediaGalleryVideoPreviewEnabledIxp else nil
			})
		})
		
		return Invisible
	else
		local Invisible = RoactModule
		Invisible = Invisible.createElement
		Invisible = Invisible("Frame", {
			Size = p1.containerSize,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[RoactModule.Change.AbsoluteSize] = p1.onResize
		}, {
			MediaGalleryPreview = RoactModule.createElement(MediaGalleryPreview, {
				numberOfThumbnails = 5,
				fullWidth = true,
				items = Items,
				onPreviewActivated = p1.props.onPreviewActivated,
				onThumbnailActivated = if FFlagLuaAppDesktopMediaGalleryTelemetry then p1.props.onThumbnailActivated else nil,
				onVideoPlayActivated = p1.openYouTubeVideoItem
			})
		})
		
		return Invisible
	end
end

function ExperienceMediaGallery.renderFullscreen(p1, Items)
	-- upvalues: WithStyleFunction (copy), UiMode (copy), RoactModule (copy), CrossFadeAnimatedView (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), MediaGalleryVideoItemModule (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (copy), FFlagLuaAppEdpMediaGalleryRedesign (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), MediaGallerySnappingFullModule (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), MediaGalleryFullScreen (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), UiMode (upval), RoactModule (upval), CrossFadeAnimatedView (upval), Items (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), MediaGalleryVideoItemModule (upval), FFlagLuaAppEdpConsoleMediaGalleryVideoMute (upval), FFlagLuaAppEdpMediaGalleryRedesign (upval), FFlagLuaAppEdpMediaGalleryRedesignIxp (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), MediaGallerySnappingFullModule (upval), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (upval), MediaGalleryFullScreen (upval)
		if p1.props.uiMode == UiMode.TenFoot then
			local Element = RoactModule.createElement(CrossFadeAnimatedView, {
				overlayTransparency = 1,
				items = Items,
				crossAnim = {
					currentIndex = p1.props.currentIndex,
					nextIndex = p1.props.nextIndex,
					setCurrentIndex = p1.props.setCurrentIndex,
					isCrossFade = p1.props.isCrossFade,
					setCrossFade = p1.props.setCrossFade
				}
			})
			
			if FFlagLuaAppEdpConsoleMediaGalleryVideo then
				local Item = Items and Items[p1.props.currentIndex]
				local Item1 = Items and Items[p1.props.nextIndex]
				local Inverted: boolean = Item ~= nil and (Item.videoId ~= nil and not (p1.props.isCrossFade and (Item1 ~= nil and Item1.videoId == nil)))
				
				return RoactModule.createFragment({
					CrossFade = Element,
					Video = if Inverted then RoactModule.createElement(MediaGalleryVideoItemModule, {
						cornerRadius = 0,
						ZIndex = 2,
						isFullscreen = true,
						video = Item.videoId,
						thumbnail = Item.imageId,
						Size = UDim2.fromScale(1, 1),
						itemIndex = p1.props.currentIndex,
						videoAnalytics = p1.props.videoAnalytics,
						universeId = p1.props.universeId,
						hideMuteButton = not FFlagLuaAppEdpConsoleMediaGalleryVideoMute or nil,
						toggleMuteSignal = if FFlagLuaAppEdpConsoleMediaGalleryVideoMute then p1.props.toggleMuteSignal else nil,
						videoPlaybackCoordinator = p1.videoPlaybackCoordinator
					}) else nil
				})
			else
				return Element
			end
		elseif FFlagLuaAppEdpMediaGalleryRedesign and ((not FFlagLuaAppEdpMediaGalleryRedesignIxp or p1.props.mediaGalleryRedesignEnabledIxp) and FFlagLuaAppEdpMediaGalleryFullScreen) then
			return RoactModule.createElement(MediaGallerySnappingFullModule, {
				items = Items,
				universeId = p1.props.universeId,
				rootPlaceId = p1.props.placeId,
				startIndex = p1.props.startIndex,
				exitFullscreen = p1.props.exitFullscreen,
				onVideoPlayActivated = p1.openYouTubeVideoItem,
				videoPlaybackCoordinator = if FFlagLuaAppEdpMediaGalleryVideoPreview then p1.videoPlaybackCoordinator else nil,
				videoAnalytics = if FFlagLuaAppEdpMediaGalleryVideoPreview then p1.props.videoAnalytics else nil,
				mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.props.mediaGalleryRedesignEnabledIxp else nil,
				mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.props.mediaGalleryVideoPreviewEnabledIxp else nil
			})
		else
			local Theme = p2.Theme
			
			return (RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Theme.BackgroundMuted.Color,
				BackgroundTransparency = Theme.BackgroundMuted.Transparency
			}, {
				Fullscreen = RoactModule.createElement(MediaGalleryFullScreen, {
					items = Items,
					showIndex = p1.props.fullscreenShowIndex,
					onVideoPlayActivated = p1.openYouTubeVideoItem
				})
			}))
		end
	end)
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	return { showYouTubeAgeAlert = p1.getShowYouTubeAgeAlert() }
end)((RoactServices.connect({
	guiService = AppGuiService,
	eventIngest = AppEventIngestService
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: OpenCentralOverlayForLeaveRobloxAlertModule (copy), OpenYouTubeVideoModule (copy)
	return {
		openLeaveRobloxAlertUIBlox = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			return Callback(OpenCentralOverlayForLeaveRobloxAlertModule(p1))
		end,
		openYouTubeVideo = function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), OpenYouTubeVideoModule (upval)
			return Callback((OpenYouTubeVideoModule(p1, p2, p3, p4, p5, p6, p7)))
		end
	}
end)(ExperienceMediaGallery)))))

return function(p1)
	-- upvalues: FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), UseSelector (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameInfosReducer (copy), UseSelectedGameMediaEntriesModule (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), UseMediaGalleryVideoAnalytics (copy), RoactModule (copy), v1 (copy), CryoModule (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy)
	local v2 = if FFlagLuaAppEdpMediaGalleryVideoPreview or FFlagLuaAppEdpMediaGalleryFullScreen then UseSelector(function(p2)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p1 (copy), GameInfosReducer (upval)
		local GameDetailsVEntry = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p1.shouldHydrateLegacyIxp then p2.GameDetailsV2[p1.universeId] else p2.GameDetails[p1.universeId]
		local PersonalizationEntry = p2.Personalization[GameInfosReducer.key][p1.universeId]
		
		return GameDetailsVEntry and GameDetailsVEntry.rootPlaceId or PersonalizationEntry and PersonalizationEntry.placeId
	end) else nil
	local SelectedGameMediaEntries = UseSelectedGameMediaEntriesModule(p1.universeId, if FFlagLuaAppEdpMediaGalleryVideoPreview then v2 else nil, p1.showYouTubeVideoFirst or true, if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.mediaGalleryVideoPreviewEnabledIxp else nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.shouldHydrateLegacyIxp else nil)
	local v3 = if FFlagLuaAppEdpMediaGalleryVideoPreview then UseMediaGalleryVideoAnalytics(p1.universeId, v2, SelectedGameMediaEntries) else nil
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		selectedGameMediaEntries = SelectedGameMediaEntries,
		videoAnalytics = if FFlagLuaAppEdpConsoleMediaGalleryVideo and p1.videoAnalytics then p1.videoAnalytics elseif FFlagLuaAppEdpMediaGalleryVideoPreview then v3 else nil,
		placeId = if FFlagLuaAppEdpMediaGalleryFullScreen then v2 else nil
	}))
end