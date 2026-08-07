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

return function(p0) --[[ line: 56 | named "useMediaGalleryFullscreen" ]]
	-- upvalues: reactModule (ref), detailsPageLayoutContext (ref), useOnNavigateBack (ref), isValidIdentifier (ref), isYouTubeVideo (ref), sendMediaGalleryFullscreenEvent (ref), view (ref), ITEM_ASPECT_RATIO (ref), mediaGalleryCarousel (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), sduiFocusTags (ref)
	local var4 = reactModule.useContext(detailsPageLayoutContext)
	local setFullscreenContent = var4.setFullscreenContent
	local setOnExitFullscreenOverlay = var4.setOnExitFullscreenOverlay
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(1)
	local var9 = reactModule.useRef(1)
	local var10 = reactModule.useRef(nil)
	local var11 = useOnNavigateBack(reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: var10 (ref), var9 (ref)
		if var10.current then
			var10.current(var9.current)
		end
	end, {}))
	local var12 = reactModule.useCallback(function(p1, p2) --[[ line: 75 ]]
		-- upvalues: var9 (ref), p0 (ref)
		var9.current = p1
		
		if p0.onFullscreenMediaChanged then
			p0.onFullscreenMediaChanged(p1, p2)
		end
	end, { p0.onFullscreenMediaChanged })
	local var13 = reactModule.useRef(setFullscreenContent)
	var13.current = setFullscreenContent
	local var14 = reactModule.useRef(setOnExitFullscreenOverlay)
	var14.current = setOnExitFullscreenOverlay
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var13 (ref), var14 (ref)
		return function() --[[ line: 88 ]]
			-- upvalues: var13 (copy), var14 (copy)
			if var13.current then
				var13.current(nil)
			end
			if var14.current then
				var14.current(nil)
			end
		end
	end, {})
	local var15 = reactModule.useCallback(function(p3) --[[ line: 99 ]]
		-- upvalues: var10 (ref), var8 (ref), setFullscreenContent (ref), setOnExitFullscreenOverlay (ref), var6 (ref), p0 (ref), isValidIdentifier (copy), isYouTubeVideo (copy), sendMediaGalleryFullscreenEvent (copy)
		var10.current = nil
		var8(p3)
		
		if setFullscreenContent then
			setFullscreenContent(nil)
		end
		if setOnExitFullscreenOverlay then
			setOnExitFullscreenOverlay(nil)
		end
		var6(false)
		local var17 = p0.filteredItems[p3]
		sendMediaGalleryFullscreenEvent(p0.eventIngest, p0.mediaGalleryAnalyticsContext, "mediaGalleryExitFullscreen", p0.placeId, p0.universeId, p3, var17 ~= nil and (isValidIdentifier(var17.videoId) or isYouTubeVideo(var17.assetTypeId)))
	end, {
		setFullscreenContent, setOnExitFullscreenOverlay, p0.filteredItems,
		p0.eventIngest, p0.placeId, p0.universeId, p0.mediaGalleryAnalyticsContext
	})
	local var16 = reactModule.useCallback(function() --[[ line: 132 ]]
		-- upvalues: var10 (ref), var9 (ref)
		if var10.current then
			var10.current(var9.current)
		end
	end, {})
	
	return {
		isFullscreen = var5,
		onFullscreenToggle = reactModule.useCallback(function(p4) --[[ line: 139 ]]
			-- upvalues: p0 (ref), setFullscreenContent (ref), var10 (ref), var15 (ref), var8 (ref), var9 (ref), var6 (ref), setOnExitFullscreenOverlay (ref), var16 (ref), reactModule (copy), view (copy), ITEM_ASPECT_RATIO (copy), mediaGalleryCarousel (copy), var12 (ref), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy), var11 (ref), sduiFocusTags (copy), isValidIdentifier (copy), isYouTubeVideo (copy), sendMediaGalleryFullscreenEvent (copy)
			if p0.fullscreenEnabled == false or not setFullscreenContent then return end
			var10.current = var15
			var8(p4)
			var9.current = p4
			var6(true)
			
			if setOnExitFullscreenOverlay then
				setOnExitFullscreenOverlay(function() --[[ line: 148 ]]
					-- upvalues: var16 (copy)
					return var16
				end)
			end
			local var18, var19 = reactModule.createBinding(UDim2.fromOffset(0, 0))
			setFullscreenContent(reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
			}, {
				NavigateBackFrame = reactModule.createElement("Frame", {
					ref = var11,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					[reactModule.Tag] = sduiFocusTags.SuppressBindings
				}, {
					Content = reactModule.createElement(view, {
						tag = "size-full bg-surface-0",
						onAbsoluteSizeChanged = function(value) --[[ line: 157 ]]
							-- upvalues: ITEM_ASPECT_RATIO (copy), var19 (ref)
							local x = value.AbsoluteSize.X
							local y = value.AbsoluteSize.Y
							local floored = math.floor(y * ITEM_ASPECT_RATIO)
							
							if x < floored then
								floored = x
								y = math.floor(floored / ITEM_ASPECT_RATIO)
							end
							var19(UDim2.fromOffset(floored, y))
						end
					}, {
						MediaGallery = reactModule.createElement(mediaGalleryCarousel, {
							itemPadding = 0,
							isFullscreen = true,
							showGradient = false,
							showPlayButton = true,
							showProgressBar = true,
							items = p0.filteredItems,
							Size = var18,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							startIndex = p4,
							onYouTubeVideoPlay = p0.onYouTubeVideoPlay,
							onFullscreenToggle = var15,
							onMediaChanged = var12,
							videoPlaybackCoordinator = p0.videoPlaybackCoordinator,
							videoAnalytics = p0.videoAnalytics,
							analyticsSourceId = p0.universeId,
							cornerRadius = p0.cornerRadius,
							overlay = p0.overlay
						})
					})
				})
			}))
			local var20 = p0.filteredItems[p4]
			sendMediaGalleryFullscreenEvent(p0.eventIngest, p0.mediaGalleryAnalyticsContext, "mediaGalleryEnterFullscreen", p0.placeId, p0.universeId, p4, var20 ~= nil and (isValidIdentifier(var20.videoId) or isYouTubeVideo(var20.assetTypeId)))
		end, {
			p0.fullscreenEnabled, setFullscreenContent, setOnExitFullscreenOverlay, var16,
			p0.filteredItems, p0.universeId, var15, p0.onYouTubeVideoPlay,
			p0.videoPlaybackCoordinator, p0.videoAnalytics, var12, p0.cornerRadius,
			p0.overlay, p0.eventIngest, p0.placeId, p0.mediaGalleryAnalyticsContext, var11
		}),
		previewStartIndex = math.clamp(var7, 1, math.max(1, #p0.filteredItems))
	}
end