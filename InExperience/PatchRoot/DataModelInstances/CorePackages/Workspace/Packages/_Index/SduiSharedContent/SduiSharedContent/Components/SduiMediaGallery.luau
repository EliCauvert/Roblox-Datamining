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

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), videoPlaybackCoordinator (ref), useFilteredMediaItems (ref), useMediaGalleryVideoAnalytics (ref), openYouTubeVideoWithAgeCheck (ref), openYouTubeVideoEvent (ref), sendMediaGalleryMediaChanged (ref), isYouTubeVideo (ref), useMediaGalleryFullscreenModule (ref), isValidIdentifier (ref), mediaGalleryCarousel (ref)
	local eventIngest = p0.sduiContext.dependencies.eventIngest
	local appPage = p0.sduiContext.appPage
	local universeId = p0.universeId or ""
	local placeId = p0.placeId
	local mediaGalleryAnalyticsContext = p0.mediaGalleryAnalyticsContext or "ExperienceDetailsPage"
	local var6 = reactModule.useMemo(function()
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var7 = useFilteredMediaItems(p0.items, universeId, appPage)
	local var8 = useMediaGalleryVideoAnalytics(universeId, placeId or "", var7)
	local dispatch = p0.sduiContext.dependencies.dispatch
	local var9 = reactModule.useCallback(function(p1)
		-- upvalues: openYouTubeVideoWithAgeCheck (copy), dispatch (ref), openYouTubeVideoEvent (copy), eventIngest (ref), universeId (ref)
		openYouTubeVideoWithAgeCheck(p1.videoHash, p1.videoTitle, dispatch, function()
			-- upvalues: openYouTubeVideoEvent (copy), eventIngest (copy), p1 (ref), universeId (copy)
			openYouTubeVideoEvent(eventIngest, "gameDetailsAccordianImage", p1.videoTitle, p1.videoHash, universeId, "play")
		end)
	end, { eventIngest, universeId, dispatch })
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var7 (ref), sendMediaGalleryMediaChanged (copy), eventIngest (ref), mediaGalleryAnalyticsContext (ref), universeId (ref), isYouTubeVideo (copy), placeId (ref)
		local var16 = var7[p2]
		
		if var16 then
			sendMediaGalleryMediaChanged(eventIngest, mediaGalleryAnalyticsContext, var16, universeId, p3, isYouTubeVideo(var16.assetTypeId), placeId)
			
			return
		end
	end, {
		var7,
		eventIngest,
		universeId,
		placeId,
		mediaGalleryAnalyticsContext
	})
	local var11 = useMediaGalleryFullscreenModule({
		fullscreenEnabled = p0.fullscreenEnabled,
		filteredItems = var7,
		universeId = universeId,
		placeId = placeId,
		mediaGalleryAnalyticsContext = mediaGalleryAnalyticsContext,
		eventIngest = eventIngest,
		onYouTubeVideoPlay = var9,
		onFullscreenMediaChanged = reactModule.useCallback(function(p4, p5)
			-- upvalues: var7 (ref), sendMediaGalleryMediaChanged (copy), eventIngest (ref), universeId (ref), placeId (ref)
			local var17 = var7[p4]
			
			if var17 then
				sendMediaGalleryMediaChanged(eventIngest, "MediaGallerySnappingFull", var17, universeId, p5, nil, placeId)
				
				return
			end
		end, { var7, eventIngest, universeId, placeId }),
		videoPlaybackCoordinator = var6,
		videoAnalytics = var8,
		cornerRadius = p0.cornerRadius,
		overlay = p0.overlay
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), p0 (ref), isValidIdentifier (copy), placeId (ref)
		if #var7 > 0 then
			return var7
		end
		local fallbackImageId = p0.fallbackImageId
		
		if not fallbackImageId and isValidIdentifier(placeId) then
			fallbackImageId = `rbxthumb://type=GameThumbnail&id={placeId}&w=768&h=432`
		end
		return if fallbackImageId then { { imageId = fallbackImageId } } else var7
	end, { var7, p0.fallbackImageId, placeId })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), isYouTubeVideo (copy), openYouTubeVideoEvent (copy), eventIngest (ref), universeId (ref)
		for i, v in var7 do
			if isYouTubeVideo(v.assetTypeId) and v.videoHash then
				openYouTubeVideoEvent(eventIngest, "gameDetailsAccordianImage", v.videoTitle, v.videoHash, universeId, "view")
				
				return
			end
		end
	end, { eventIngest, var7, universeId })
	local var13 = #var12 == 0
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useCallback(function(p6)
		-- upvalues: var14 (ref), p0 (ref)
		if not var14.current and p0.onFirstMediaResolved then
			var14.current = true
			p0.onFirstMediaResolved(nil, nil, { metadata = { mediaFound = p6 } })
		end
	end, { p0.onFirstMediaResolved })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var14 (ref), p0 (ref), var15 (ref)
		if var13 and not var14.current and p0.onFirstMediaResolved then
			var15(false)
		end
	end, { var13, var15, p0.onFirstMediaResolved })
	
	return if var13 then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = p0.anchorPoint,
		Position = p0.position,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		MediaGallery = reactModule.createElement(mediaGalleryCarousel, {
			items = var12,
			startIndex = var11.previewStartIndex,
			analyticsSourceId = universeId,
			itemPadding = p0.itemPadding,
			aspectRatio = p0.aspectRatio,
			autoAdvanceEnabled = p0.autoAdvanceEnabled ~= false and not var11.isFullscreen,
			autoAdvanceIntervalSeconds = p0.autoAdvanceIntervalSeconds,
			showPageIndicators = p0.showPageIndicators,
			isMediaGalleryOccluded = var11.isFullscreen,
			autoplay = p0.autoplay,
			muted = p0.muted,
			looped = p0.looped,
			showPlayButton = p0.showPlayButton,
			showProgressBar = p0.showProgressBar,
			showGradient = p0.showGradient,
			gradientOverlayHeight = p0.gradientOverlayHeight,
			onYouTubeVideoPlay = var9,
			onFullscreenToggle = var11.onFullscreenToggle,
			onMediaChanged = var10,
			onMediaResolved = var15,
			videoPlaybackCoordinator = var6,
			videoAnalytics = var8,
			cornerRadius = p0.cornerRadius,
			fullscreenEnabled = p0.fullscreenEnabled,
			overlay = p0.overlay,
			Size = UDim2.fromScale(1, 0),
			AnchorPoint = p0.anchorPoint,
			Position = p0.position
		})
	})
end)