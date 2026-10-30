local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local DetailsPageLayoutContext = require(Parent.AppBlox).DetailsPageLayout.DetailsPageLayoutContext
local SendMediaGalleryFullscreenEventFunction = require(Parent.DiscoveryAnalytics).Events.sendMediaGalleryFullscreenEvent
local _ = require(Parent.VideoUtils)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFocusTags = SduiSharedUtilitiesModule.SduiFocusTags
local UseOnNavigateBackFunction = SduiSharedUtilitiesModule.useOnNavigateBack
local MediaGalleryModule = require(Parent.MediaGallery)
local MediaGalleryCarousel = MediaGalleryModule.MediaGalleryCarousel
local IsValidIdentifierFunction = MediaGalleryModule.isValidIdentifier
local IsYouTubeVideoFunction = MediaGalleryModule.isYouTubeVideo
local ITEMASPECTRATIO = MediaGalleryModule.MediaGalleryConstants.ITEM_ASPECT_RATIO

return function(p1)
	-- upvalues: ReactModule (copy), DetailsPageLayoutContext (copy), UseOnNavigateBackFunction (copy), IsValidIdentifierFunction (copy), IsYouTubeVideoFunction (copy), SendMediaGalleryFullscreenEventFunction (copy), View (copy), ITEMASPECTRATIO (copy), MediaGalleryCarousel (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), SduiFocusTags (copy)
	local UseContextResult = ReactModule.useContext(DetailsPageLayoutContext)
	local SetFullscreenContentFunction = UseContextResult.setFullscreenContent
	local SetOnExitFullscreenOverlayFunction = UseContextResult.setOnExitFullscreenOverlay
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1)
	local UseRefResult = ReactModule.useRef(1)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseOnNavigateBackResult = UseOnNavigateBackFunction((ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		if UseRefResult1.current then
			UseRefResult1.current(UseRefResult.current)
		end
	end, {})))
	local UseResult = ReactModule.useCallback(function(Current, p2)
		-- upvalues: UseRefResult (copy), p1 (copy)
		UseRefResult.current = Current
		
		if p1.onFullscreenMediaChanged then
			p1.onFullscreenMediaChanged(Current, p2)
		end
	end, { p1.onFullscreenMediaChanged })
	local UseRefResult2 = ReactModule.useRef(SetFullscreenContentFunction)
	UseRefResult2.current = SetFullscreenContentFunction
	local UseRefResult3 = ReactModule.useRef(SetOnExitFullscreenOverlayFunction)
	UseRefResult3.current = SetOnExitFullscreenOverlayFunction
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy)
		return function()
			-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval)
			if UseRefResult2.current then
				UseRefResult2.current(nil)
			end
			if UseRefResult3.current then
				UseRefResult3.current(nil)
			end
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult1 (copy), UseStateResult2_1 (copy), SetFullscreenContentFunction (copy), SetOnExitFullscreenOverlayFunction (copy), UseStateResult2 (copy), p1 (copy), IsValidIdentifierFunction (upval), IsYouTubeVideoFunction (upval), SendMediaGalleryFullscreenEventFunction (upval)
		UseRefResult1.current = nil
		UseStateResult2_1(p2)
		
		if SetFullscreenContentFunction then
			SetFullscreenContentFunction(nil)
		end
		if SetOnExitFullscreenOverlayFunction then
			SetOnExitFullscreenOverlayFunction(nil)
		end
		UseStateResult2(false)
		local FilteredItem = p1.filteredItems[p2]
		SendMediaGalleryFullscreenEventFunction(p1.eventIngest, p1.mediaGalleryAnalyticsContext, "mediaGalleryExitFullscreen", p1.placeId, p1.universeId, p2, FilteredItem ~= nil and (IsValidIdentifierFunction(FilteredItem.videoId) or IsYouTubeVideoFunction(FilteredItem.assetTypeId)))
	end, {
		SetFullscreenContentFunction, SetOnExitFullscreenOverlayFunction,
		p1.filteredItems, p1.eventIngest, p1.placeId, p1.universeId,
		p1.mediaGalleryAnalyticsContext
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		if UseRefResult1.current then
			UseRefResult1.current(UseRefResult.current)
		end
	end, {})
	
	return {
		isFullscreen = UseStateResult,
		onFullscreenToggle = ReactModule.useCallback(function(Current)
			-- upvalues: p1 (copy), SetFullscreenContentFunction (copy), UseRefResult1 (copy), UseResult1 (copy), UseStateResult2_1 (copy), UseRefResult (copy), UseStateResult2 (copy), SetOnExitFullscreenOverlayFunction (copy), UseResult2 (copy), ReactModule (upval), View (upval), ITEMASPECTRATIO (upval), MediaGalleryCarousel (upval), UseResult (copy), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), UseOnNavigateBackResult (copy), SduiFocusTags (upval), IsValidIdentifierFunction (upval), IsYouTubeVideoFunction (upval), SendMediaGalleryFullscreenEventFunction (upval)
			if p1.fullscreenEnabled == false or not SetFullscreenContentFunction then return end
			UseRefResult1.current = UseResult1
			UseStateResult2_1(Current)
			UseRefResult.current = Current
			UseStateResult2(true)
			
			if SetOnExitFullscreenOverlayFunction then
				SetOnExitFullscreenOverlayFunction(function()
					-- upvalues: UseResult2 (upval)
					return UseResult2
				end)
			end
			local Binding, Binding2 = ReactModule.createBinding(UDim2.fromOffset(0, 0))
			SetFullscreenContentFunction(ReactModule.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
			}, {
				NavigateBackFrame = ReactModule.createElement("Frame", {
					ref = UseOnNavigateBackResult,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					[ReactModule.Tag] = SduiFocusTags.SuppressBindings
				}, {
					Content = ReactModule.createElement(View, {
						tag = "size-full bg-surface-0",
						onAbsoluteSizeChanged = function(Frame: Frame)
							-- upvalues: ITEMASPECTRATIO (upval), Binding2 (copy)
							local X = Frame.AbsoluteSize.X
							local Y = Frame.AbsoluteSize.Y
							local Floored = math.floor(Y * ITEMASPECTRATIO)
							
							if X < Floored then
								Floored = X
								Y = math.floor(Floored / ITEMASPECTRATIO)
							end
							Binding2(UDim2.fromOffset(Floored, Y))
						end
					}, {
						MediaGallery = ReactModule.createElement(MediaGalleryCarousel, {
							itemPadding = 0,
							isFullscreen = true,
							showGradient = false,
							showPlayButton = true,
							showProgressBar = true,
							items = p1.filteredItems,
							Size = Binding,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							startIndex = Current,
							onYouTubeVideoPlay = p1.onYouTubeVideoPlay,
							onFullscreenToggle = UseResult1,
							onMediaChanged = UseResult,
							videoPlaybackCoordinator = p1.videoPlaybackCoordinator,
							videoAnalytics = p1.videoAnalytics,
							analyticsSourceId = p1.universeId,
							cornerRadius = p1.cornerRadius,
							overlay = p1.overlay
						})
					})
				})
			}))
			local FilteredItem = p1.filteredItems[Current]
			SendMediaGalleryFullscreenEventFunction(p1.eventIngest, p1.mediaGalleryAnalyticsContext, "mediaGalleryEnterFullscreen", p1.placeId, p1.universeId, Current, FilteredItem ~= nil and (IsValidIdentifierFunction(FilteredItem.videoId) or IsYouTubeVideoFunction(FilteredItem.assetTypeId)))
		end, {
			p1.fullscreenEnabled, SetFullscreenContentFunction,
			SetOnExitFullscreenOverlayFunction, UseResult2, p1.filteredItems,
			p1.universeId, UseResult1, p1.onYouTubeVideoPlay, p1.videoPlaybackCoordinator,
			p1.videoAnalytics, UseResult, p1.cornerRadius, p1.overlay, p1.eventIngest,
			p1.placeId, p1.mediaGalleryAnalyticsContext, UseOnNavigateBackResult
		}),
		previewStartIndex = math.clamp(UseStateResult1, 1, (math.max(1, #p1.filteredItems)))
	}
end