local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SendMediaGalleryMediaChangedFunction = DiscoveryAnalyticsModule.Events.sendMediaGalleryMediaChanged
local OpenYouTubeVideoEventFunction = DiscoveryAnalyticsModule.Events.openYouTubeVideoEvent
local MediaGalleryModule = require(Parent.MediaGallery)
local MediaGalleryCarousel = MediaGalleryModule.MediaGalleryCarousel
local IsValidIdentifierFunction = MediaGalleryModule.isValidIdentifier
local IsYouTubeVideoFunction = MediaGalleryModule.isYouTubeVideo
local OpenYouTubeVideoWithAgeCheckFunction = MediaGalleryModule.openYouTubeVideoWithAgeCheck
local UseFilteredMediaItemsFunction = MediaGalleryModule.useFilteredMediaItems
local UseMediaGalleryVideoAnalyticsFunction = MediaGalleryModule.useMediaGalleryVideoAnalytics
local UseMediaGalleryFullscreenModule = require(script.Parent.useMediaGalleryFullscreen)
local FFlagLuaAppEdpMomentVideo = require(Parent.SharedFlags).FFlagLuaAppEdpMomentVideo

return ReactModule.memo(function(p1) --[[ Line: 79 | Named "SduiMediaGallery" ]]
	-- upvalues: ReactModule (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppEdpMomentVideo (copy), GetSduiComponentWrapperFunction (copy), UseFilteredMediaItemsFunction (copy), UseMediaGalleryVideoAnalyticsFunction (copy), OpenYouTubeVideoWithAgeCheckFunction (copy), OpenYouTubeVideoEventFunction (copy), SendMediaGalleryMediaChangedFunction (copy), IsYouTubeVideoFunction (copy), UseMediaGalleryFullscreenModule (copy), IsValidIdentifierFunction (copy), MediaGalleryCarousel (copy)
	local EventIngest = p1.sduiContext.dependencies.eventIngest
	local UniverseId = p1.universeId or ""
	local PlaceId = p1.placeId
	local MediaGalleryAnalyticsContext = p1.mediaGalleryAnalyticsContext or "ExperienceDetailsPage"
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 86 ]]
		-- upvalues: VideoPlaybackCoordinator (upval)
		return VideoPlaybackCoordinator.new()
	end, {})
	local UseMemoResult1 = if FFlagLuaAppEdpMomentVideo then ReactModule.useMemo(function() --[[ Line: 92 ]]
		-- upvalues: p1 (copy), ReactModule (upval), GetSduiComponentWrapperFunction (upval)
		local Buffer = table.create(#p1.items)
		
		for i, item in p1.items do
			local AttributionComponentConfig = item.attributionComponentConfig
			
			if AttributionComponentConfig == nil then
				Buffer[i] = item
			else
				local Copy = table.clone(item)
				Copy.attributionComponent = ReactModule.createElement(GetSduiComponentWrapperFunction(AttributionComponentConfig), {
					debugName = "SduiMediaGallery.AttributionComponent",
					componentConfig = AttributionComponentConfig,
					sduiContext = p1.sduiContext
				})
				Buffer[i] = Copy
			end
		end
		return Buffer
	end, { p1.items, p1.sduiContext }) else nil
	local UseFilteredMediaItemsResult = UseFilteredMediaItemsFunction(if FFlagLuaAppEdpMomentVideo then UseMemoResult1 else p1.items, UniverseId, p1.sduiContext.appPage)
	local UseMediaGalleryVideoAnalyticsResult = UseMediaGalleryVideoAnalyticsFunction(UniverseId, PlaceId or "", UseFilteredMediaItemsResult)
	local Dispatch = p1.sduiContext.dependencies.dispatch
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 121 ]]
		-- upvalues: OpenYouTubeVideoWithAgeCheckFunction (upval), Dispatch (copy), OpenYouTubeVideoEventFunction (upval), EventIngest (copy), UniverseId (copy)
		OpenYouTubeVideoWithAgeCheckFunction(p2.videoHash, p2.videoTitle, Dispatch, function() --[[ Line: 122 ]]
			-- upvalues: OpenYouTubeVideoEventFunction (upval), EventIngest (upval), p2 (copy), UniverseId (upval)
			OpenYouTubeVideoEventFunction(EventIngest, "gameDetailsAccordianImage", p2.videoTitle, p2.videoHash, UniverseId, "play")
		end)
	end, { EventIngest, UniverseId, Dispatch })
	local UseResult1 = ReactModule.useCallback(function(p2, p3) --[[ Line: 134 ]]
		-- upvalues: UseFilteredMediaItemsResult (copy), SendMediaGalleryMediaChangedFunction (upval), EventIngest (copy), MediaGalleryAnalyticsContext (copy), UniverseId (copy), IsYouTubeVideoFunction (upval), PlaceId (copy)
		local UseFilteredMediaItemsResultEntry = UseFilteredMediaItemsResult[p2]
		
		if UseFilteredMediaItemsResultEntry then
			SendMediaGalleryMediaChangedFunction(EventIngest, MediaGalleryAnalyticsContext, UseFilteredMediaItemsResultEntry, UniverseId, p3, IsYouTubeVideoFunction(UseFilteredMediaItemsResultEntry.assetTypeId), PlaceId)
			
			return
		end
	end, {
		UseFilteredMediaItemsResult,
		EventIngest,
		UniverseId,
		PlaceId,
		MediaGalleryAnalyticsContext
	})
	local UseMediaGalleryFullscreenModuleResult = UseMediaGalleryFullscreenModule({
		fullscreenEnabled = p1.fullscreenEnabled,
		filteredItems = UseFilteredMediaItemsResult,
		universeId = UniverseId,
		placeId = PlaceId,
		mediaGalleryAnalyticsContext = MediaGalleryAnalyticsContext,
		eventIngest = EventIngest,
		onYouTubeVideoPlay = UseResult,
		onFullscreenMediaChanged = ReactModule.useCallback(function(p2, p3) --[[ Line: 150 ]]
			-- upvalues: UseFilteredMediaItemsResult (copy), SendMediaGalleryMediaChangedFunction (upval), EventIngest (copy), UniverseId (copy), PlaceId (copy)
			local UseFilteredMediaItemsResultEntry = UseFilteredMediaItemsResult[p2]
			
			if UseFilteredMediaItemsResultEntry then
				SendMediaGalleryMediaChangedFunction(EventIngest, "MediaGallerySnappingFull", UseFilteredMediaItemsResultEntry, UniverseId, p3, nil, PlaceId)
				
				return
			end
		end, {
			UseFilteredMediaItemsResult,
			EventIngest,
			UniverseId,
			PlaceId
		}),
		videoPlaybackCoordinator = UseMemoResult,
		videoAnalytics = UseMediaGalleryVideoAnalyticsResult,
		cornerRadius = p1.cornerRadius,
		overlay = p1.overlay
	})
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 181 ]]
		-- upvalues: UseFilteredMediaItemsResult (copy), p1 (copy), IsValidIdentifierFunction (upval), PlaceId (copy)
		if #UseFilteredMediaItemsResult > 0 then
			return UseFilteredMediaItemsResult
		end
		local FallbackImageId = p1.fallbackImageId
		
		if not FallbackImageId and IsValidIdentifierFunction(PlaceId) then
			FallbackImageId = `rbxthumb://type=GameThumbnail&id={PlaceId}&w=768&h=432`
		end
		return if FallbackImageId then { { imageId = FallbackImageId } } else UseFilteredMediaItemsResult
	end, { UseFilteredMediaItemsResult, p1.fallbackImageId, PlaceId })
	ReactModule.useEffect(function() --[[ Line: 195 ]]
		-- upvalues: UseFilteredMediaItemsResult (copy), IsYouTubeVideoFunction (upval), OpenYouTubeVideoEventFunction (upval), EventIngest (copy), UniverseId (copy)
		for _, value in UseFilteredMediaItemsResult do
			if IsYouTubeVideoFunction(value.assetTypeId) and value.videoHash then
				OpenYouTubeVideoEventFunction(EventIngest, "gameDetailsAccordianImage", value.videoTitle, value.videoHash, UniverseId, "view")
				break
			end
		end
	end, { EventIngest, UseFilteredMediaItemsResult, UniverseId })
	local v1 = #UseMemoResult2 == 0
	local UseRefResult = ReactModule.useRef(false)
	local UseResult2 = ReactModule.useCallback(function(MediaFound) --[[ Line: 214 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		if not UseRefResult.current and p1.onFirstMediaResolved then
			UseRefResult.current = true
			p1.onFirstMediaResolved(nil, nil, { metadata = { mediaFound = MediaFound } })
		end
	end, { p1.onFirstMediaResolved })
	ReactModule.useEffect(function() --[[ Line: 221 ]]
		-- upvalues: v1 (copy), UseRefResult (copy), p1 (copy), UseResult2 (copy)
		if v1 and not UseRefResult.current and p1.onFirstMediaResolved then
			UseResult2(false)
		end
	end, { v1, UseResult2, p1.onFirstMediaResolved })
	
	return if v1 then nil else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		MediaGallery = ReactModule.createElement(MediaGalleryCarousel, {
			items = UseMemoResult2,
			startIndex = UseMediaGalleryFullscreenModuleResult.previewStartIndex,
			analyticsSourceId = UniverseId,
			itemPadding = p1.itemPadding,
			aspectRatio = p1.aspectRatio,
			autoAdvanceEnabled = p1.autoAdvanceEnabled ~= false and not UseMediaGalleryFullscreenModuleResult.isFullscreen,
			autoAdvanceIntervalSeconds = p1.autoAdvanceIntervalSeconds,
			showPageIndicators = p1.showPageIndicators,
			isMediaGalleryOccluded = UseMediaGalleryFullscreenModuleResult.isFullscreen,
			autoplay = p1.autoplay,
			muted = p1.muted,
			looped = p1.looped,
			showPlayButton = p1.showPlayButton,
			showProgressBar = p1.showProgressBar,
			showGradient = p1.showGradient,
			gradientOverlayHeight = p1.gradientOverlayHeight,
			onYouTubeVideoPlay = UseResult,
			onFullscreenToggle = UseMediaGalleryFullscreenModuleResult.onFullscreenToggle,
			onMediaChanged = UseResult1,
			onMediaResolved = UseResult2,
			videoPlaybackCoordinator = UseMemoResult,
			videoAnalytics = UseMediaGalleryVideoAnalyticsResult,
			cornerRadius = p1.cornerRadius,
			fullscreenEnabled = p1.fullscreenEnabled,
			overlay = p1.overlay,
			Size = UDim2.fromScale(1, 0),
			AnchorPoint = p1.anchorPoint,
			Position = p1.position
		})
	})
end)