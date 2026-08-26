local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local videoPlaybackCoordinator = require(parent.VideoUtils).VideoPlaybackCoordinator
local _ = require(parent.SduiCoreSystem)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sendMediaGalleryMediaChanged = discoveryAnalyticsModule.Events.sendMediaGalleryMediaChanged
local openYouTubeVideoEvent = discoveryAnalyticsModule.Events.openYouTubeVideoEvent
local mediaGalleryModule = require(parent.MediaGallery)
local mediaGalleryCarousel = mediaGalleryModule.MediaGalleryCarousel
local isValidIdentifier = mediaGalleryModule.isValidIdentifier
local isYouTubeVideo = mediaGalleryModule.isYouTubeVideo
local openYouTubeVideoWithAgeCheck = mediaGalleryModule.openYouTubeVideoWithAgeCheck
local useFilteredMediaItems = mediaGalleryModule.useFilteredMediaItems
local useMediaGalleryVideoAnalytics = mediaGalleryModule.useMediaGalleryVideoAnalytics
local useMediaGalleryFullscreenModule = require(script.Parent.useMediaGalleryFullscreen)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), videoPlaybackCoordinator (ref), useFilteredMediaItems (ref), useMediaGalleryVideoAnalytics (ref), openYouTubeVideoWithAgeCheck (ref), openYouTubeVideoEvent (ref), sendMediaGalleryMediaChanged (ref), isYouTubeVideo (ref), useMediaGalleryFullscreenModule (ref), isValidIdentifier (ref), mediaGalleryCarousel (ref)
	local eventIngest = p1.sduiContext.dependencies.eventIngest
	local appPage = p1.sduiContext.appPage
	local universeId = p1.universeId or ""
	local placeId = p1.placeId
	local mediaGalleryAnalyticsContext = p1.mediaGalleryAnalyticsContext or "ExperienceDetailsPage"
	local var1 = reactModule.useMemo(function()
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var2 = useFilteredMediaItems(p1.items, universeId, appPage)
	local var3 = useMediaGalleryVideoAnalytics(universeId, placeId or "", var2)
	local dispatch = p1.sduiContext.dependencies.dispatch
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: openYouTubeVideoWithAgeCheck (copy), dispatch (ref), openYouTubeVideoEvent (copy), eventIngest (ref), universeId (ref)
		openYouTubeVideoWithAgeCheck(p2.videoHash, p2.videoTitle, dispatch, function()
			-- upvalues: openYouTubeVideoEvent (copy), eventIngest (copy), p2 (ref), universeId (copy)
			openYouTubeVideoEvent(eventIngest, "gameDetailsAccordianImage", p2.videoTitle, p2.videoHash, universeId, "play")
		end)
	end, { eventIngest, universeId, dispatch })
	local var5 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), sendMediaGalleryMediaChanged (copy), eventIngest (ref), mediaGalleryAnalyticsContext (ref), universeId (ref), isYouTubeVideo (copy), placeId (ref)
		local var6 = var2[p2]
		
		if var6 then
			sendMediaGalleryMediaChanged(eventIngest, mediaGalleryAnalyticsContext, var6, universeId, p3, isYouTubeVideo(var6.assetTypeId), placeId)
			
			return
		end
	end, {
		var2,
		eventIngest,
		universeId,
		placeId,
		mediaGalleryAnalyticsContext
	})
	local var6 = useMediaGalleryFullscreenModule({
		fullscreenEnabled = p1.fullscreenEnabled,
		filteredItems = var2,
		universeId = universeId,
		placeId = placeId,
		mediaGalleryAnalyticsContext = mediaGalleryAnalyticsContext,
		eventIngest = eventIngest,
		onYouTubeVideoPlay = var4,
		onFullscreenMediaChanged = reactModule.useCallback(function(p2, p3)
			-- upvalues: var2 (ref), sendMediaGalleryMediaChanged (copy), eventIngest (ref), universeId (ref), placeId (ref)
			local var7 = var2[p2]
			
			if var7 then
				sendMediaGalleryMediaChanged(eventIngest, "MediaGallerySnappingFull", var7, universeId, p3, nil, placeId)
				
				return
			end
		end, { var2, eventIngest, universeId, placeId }),
		videoPlaybackCoordinator = var1,
		videoAnalytics = var3,
		cornerRadius = p1.cornerRadius,
		overlay = p1.overlay
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), isValidIdentifier (copy), placeId (ref)
		if #var2 > 0 then
			return var2
		end
		local fallbackImageId = p1.fallbackImageId
		
		if not fallbackImageId and isValidIdentifier(placeId) then
			fallbackImageId = `rbxthumb://type=GameThumbnail&id={placeId}&w=768&h=432`
		end
		return if fallbackImageId then { { imageId = fallbackImageId } } else var2
	end, { var2, p1.fallbackImageId, placeId })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), isYouTubeVideo (copy), openYouTubeVideoEvent (copy), eventIngest (ref), universeId (ref)
		for i, v in var2 do
			if isYouTubeVideo(v.assetTypeId) and v.videoHash then
				openYouTubeVideoEvent(eventIngest, "gameDetailsAccordianImage", v.videoTitle, v.videoHash, universeId, "view")
				
				return
			end
		end
	end, { eventIngest, var2, universeId })
	local var8 = #var7 == 0
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), p1 (ref)
		if not var9.current and p1.onFirstMediaResolved then
			var9.current = true
			p1.onFirstMediaResolved(nil, nil, { metadata = { mediaFound = p2 } })
		end
	end, { p1.onFirstMediaResolved })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), p1 (ref), var10 (ref)
		if var8 and not var9.current and p1.onFirstMediaResolved then
			var10(false)
		end
	end, { var8, var10, p1.onFirstMediaResolved })
	
	return if var8 then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		MediaGallery = reactModule.createElement(mediaGalleryCarousel, {
			items = var7,
			startIndex = var6.previewStartIndex,
			analyticsSourceId = universeId,
			itemPadding = p1.itemPadding,
			aspectRatio = p1.aspectRatio,
			autoAdvanceEnabled = p1.autoAdvanceEnabled ~= false and not var6.isFullscreen,
			autoAdvanceIntervalSeconds = p1.autoAdvanceIntervalSeconds,
			showPageIndicators = p1.showPageIndicators,
			isMediaGalleryOccluded = var6.isFullscreen,
			autoplay = p1.autoplay,
			muted = p1.muted,
			looped = p1.looped,
			showPlayButton = p1.showPlayButton,
			showProgressBar = p1.showProgressBar,
			showGradient = p1.showGradient,
			gradientOverlayHeight = p1.gradientOverlayHeight,
			onYouTubeVideoPlay = var4,
			onFullscreenToggle = var6.onFullscreenToggle,
			onMediaChanged = var5,
			onMediaResolved = var10,
			videoPlaybackCoordinator = var1,
			videoAnalytics = var3,
			cornerRadius = p1.cornerRadius,
			fullscreenEnabled = p1.fullscreenEnabled,
			overlay = p1.overlay,
			Size = UDim2.fromScale(1, 0),
			AnchorPoint = p1.anchorPoint,
			Position = p1.position
		})
	})
end)