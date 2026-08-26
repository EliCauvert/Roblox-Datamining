local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local detailsPageLayoutContext = require(parent.AppBlox).DetailsPageLayout.DetailsPageLayoutContext
local sendMediaGalleryFullscreenEvent = require(parent.DiscoveryAnalytics).Events.sendMediaGalleryFullscreenEvent
local _ = require(parent.VideoUtils)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiFocusTags = sduiSharedUtilitiesModule.SduiFocusTags
local useOnNavigateBack = sduiSharedUtilitiesModule.useOnNavigateBack
local mediaGalleryModule = require(parent.MediaGallery)
local mediaGalleryCarousel = mediaGalleryModule.MediaGalleryCarousel
local mediaGalleryConstants = mediaGalleryModule.MediaGalleryConstants
local isValidIdentifier = mediaGalleryModule.isValidIdentifier
local isYouTubeVideo = mediaGalleryModule.isYouTubeVideo
local ITEM_ASPECT_RATIO = mediaGalleryConstants.ITEM_ASPECT_RATIO

return function(p1)
	-- upvalues: reactModule (ref), detailsPageLayoutContext (ref), useOnNavigateBack (ref), isValidIdentifier (ref), isYouTubeVideo (ref), sendMediaGalleryFullscreenEvent (ref), view (ref), ITEM_ASPECT_RATIO (ref), mediaGalleryCarousel (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), sduiFocusTags (ref)
	local var1 = reactModule.useContext(detailsPageLayoutContext)
	local setFullscreenContent = var1.setFullscreenContent
	local setOnExitFullscreenOverlay = var1.setOnExitFullscreenOverlay
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(1)
	local var6 = reactModule.useRef(1)
	local var7 = reactModule.useRef(nil)
	local var8 = useOnNavigateBack(reactModule.useCallback(function()
		-- upvalues: var7 (ref), var6 (ref)
		if var7.current then
			var7.current(var6.current)
		end
	end, {}))
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var6 (ref), p1 (ref)
		var6.current = p2
		
		if p1.onFullscreenMediaChanged then
			p1.onFullscreenMediaChanged(p2, p3)
		end
	end, { p1.onFullscreenMediaChanged })
	local var10 = reactModule.useRef(setFullscreenContent)
	var10.current = setFullscreenContent
	local var11 = reactModule.useRef(setOnExitFullscreenOverlay)
	var11.current = setOnExitFullscreenOverlay
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var11 (ref)
		return function()
			-- upvalues: var10 (copy), var11 (copy)
			if var10.current then
				var10.current(nil)
			end
			if var11.current then
				var11.current(nil)
			end
		end
	end, {})
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var5 (ref), setFullscreenContent (ref), setOnExitFullscreenOverlay (ref), var3 (ref), p1 (ref), isValidIdentifier (copy), isYouTubeVideo (copy), sendMediaGalleryFullscreenEvent (copy)
		var7.current = nil
		var5(p2)
		
		if setFullscreenContent then
			setFullscreenContent(nil)
		end
		if setOnExitFullscreenOverlay then
			setOnExitFullscreenOverlay(nil)
		end
		var3(false)
		local var13 = p1.filteredItems[p2]
		sendMediaGalleryFullscreenEvent(p1.eventIngest, p1.mediaGalleryAnalyticsContext, "mediaGalleryExitFullscreen", p1.placeId, p1.universeId, p2, var13 ~= nil and (isValidIdentifier(var13.videoId) or isYouTubeVideo(var13.assetTypeId)))
	end, {
		setFullscreenContent, setOnExitFullscreenOverlay, p1.filteredItems,
		p1.eventIngest, p1.placeId, p1.universeId, p1.mediaGalleryAnalyticsContext
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var6 (ref)
		if var7.current then
			var7.current(var6.current)
		end
	end, {})
	
	return {
		isFullscreen = var2,
		onFullscreenToggle = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), setFullscreenContent (ref), var7 (ref), var12 (ref), var5 (ref), var6 (ref), var3 (ref), setOnExitFullscreenOverlay (ref), var13 (ref), reactModule (copy), view (copy), ITEM_ASPECT_RATIO (copy), mediaGalleryCarousel (copy), var9 (ref), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy), var8 (ref), sduiFocusTags (copy), isValidIdentifier (copy), isYouTubeVideo (copy), sendMediaGalleryFullscreenEvent (copy)
			if p1.fullscreenEnabled == false or not setFullscreenContent then return end
			var7.current = var12
			var5(p2)
			var6.current = p2
			var3(true)
			
			if setOnExitFullscreenOverlay then
				setOnExitFullscreenOverlay(function()
					-- upvalues: var13 (copy)
					return var13
				end)
			end
			local var14, var15 = reactModule.createBinding(UDim2.fromOffset(0, 0))
			setFullscreenContent(reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
			}, {
				NavigateBackFrame = reactModule.createElement("Frame", {
					ref = var8,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					[reactModule.Tag] = sduiFocusTags.SuppressBindings
				}, {
					Content = reactModule.createElement(view, {
						tag = "size-full bg-surface-0",
						onAbsoluteSizeChanged = function(value)
							-- upvalues: ITEM_ASPECT_RATIO (copy), var15 (ref)
							local x = value.AbsoluteSize.X
							local y = value.AbsoluteSize.Y
							local floored = math.floor(y * ITEM_ASPECT_RATIO)
							
							if x < floored then
								floored = x
								y = math.floor(floored / ITEM_ASPECT_RATIO)
							end
							var15(UDim2.fromOffset(floored, y))
						end
					}, {
						MediaGallery = reactModule.createElement(mediaGalleryCarousel, {
							itemPadding = 0,
							isFullscreen = true,
							showGradient = false,
							showPlayButton = true,
							showProgressBar = true,
							items = p1.filteredItems,
							Size = var14,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							startIndex = p2,
							onYouTubeVideoPlay = p1.onYouTubeVideoPlay,
							onFullscreenToggle = var12,
							onMediaChanged = var9,
							videoPlaybackCoordinator = p1.videoPlaybackCoordinator,
							videoAnalytics = p1.videoAnalytics,
							analyticsSourceId = p1.universeId,
							cornerRadius = p1.cornerRadius,
							overlay = p1.overlay
						})
					})
				})
			}))
			local var16 = p1.filteredItems[p2]
			sendMediaGalleryFullscreenEvent(p1.eventIngest, p1.mediaGalleryAnalyticsContext, "mediaGalleryEnterFullscreen", p1.placeId, p1.universeId, p2, var16 ~= nil and (isValidIdentifier(var16.videoId) or isYouTubeVideo(var16.assetTypeId)))
		end, {
			p1.fullscreenEnabled, setFullscreenContent, setOnExitFullscreenOverlay, var13,
			p1.filteredItems, p1.universeId, var12, p1.onYouTubeVideoPlay,
			p1.videoPlaybackCoordinator, p1.videoAnalytics, var9, p1.cornerRadius,
			p1.overlay, p1.eventIngest, p1.placeId, p1.mediaGalleryAnalyticsContext, var8
		}),
		previewStartIndex = math.clamp(var4, 1, math.max(1, #p1.filteredItems))
	}
end