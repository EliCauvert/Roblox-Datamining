local userInputService = game:GetService("UserInputService")
local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local cursorType = foundationModule.Enums.CursorType
local signal = require(parent.AppCommonLib).Signal
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local useLastInput = responsiveModule.useLastInput
local useIsSpatial = responsiveModule.useIsSpatial
local luaAppEnableVRMediaGalleryScrollButtons = game:DefineFastFlag("LuaAppEnableVRMediaGalleryScrollButtons", false)
local carouselScrollButtons = require(parent.CollectionViews).CarouselScrollButtons
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local roundIconButton = videoUtilsModule.RoundIconButton
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local mediaGalleryPageIndicatorsModule = require(mediaGallery.MediaGalleryPageIndicators)
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)
local _ = require(mediaGallery.MediaGalleryTypes)
local mediaGalleryImageItemModule = require(mediaGallery.MediaGalleryImageItem)
local mediaGalleryVideoItemModule = require(mediaGallery.MediaGalleryVideoItem)
local isYouTubeVideoModule = require(mediaGallery.isYouTubeVideo)
local isValidIdentifierModule = require(mediaGallery.isValidIdentifier)
local useSnapScrollModule = require(mediaGallery.Hooks.useSnapScroll)
local useAutoAdvanceModule = require(mediaGallery.Hooks.useAutoAdvance)
local useTouchDragScrollModule = require(mediaGallery.Hooks.useTouchDragScroll)
local useCarouselGamepadInputModule = require(mediaGallery.Hooks.useCarouselGamepadInput)
local isAudioPlaybackAllowedForDeviceModule = require(mediaGallery.isAudioPlaybackAllowedForDevice)
local SLIDING_WINDOW_SIZE = mediaGalleryConstantsModule.SLIDING_WINDOW_SIZE

local function getVisibleIndices(p0, p1) --[[ line: 49 ]]
	-- upvalues: SLIDING_WINDOW_SIZE (ref)
	local t = {}
	
	for i = 1, SLIDING_WINDOW_SIZE do
		local var20 = p1 + i - math.floor(SLIDING_WINDOW_SIZE / 2) - 1
		
		if var20 >= 1 and var20 <= p0 then
			table.insert(t, var20)
		end
	end
	return t
end

return reactModule.memo(function(p2) --[[ line: 112 | named "MediaGalleryCarousel" ]]
	-- upvalues: useTokens (ref), mediaGalleryConstantsModule (ref), reactModule (ref), isValidIdentifierModule (ref), isYouTubeVideoModule (ref), isAudioPlaybackAllowedForDeviceModule (ref), enableAudioPlaybackInApp (ref), useSnapScrollModule (ref), getVisibleIndices (ref), signal (ref), videoPlaybackCoordinator (ref), useAutoAdvanceModule (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), useLastInput (ref), luaAppEnableVRMediaGalleryScrollButtons (ref), useIsSpatial (ref), useCursor (ref), cursorType (ref), useCarouselGamepadInputModule (ref), useTouchDragScrollModule (ref), fFlagSduiExperienceDetailsSupport (ref), mediaGalleryVideoItemModule (ref), mediaGalleryImageItemModule (ref), userInputService (ref), mediaGalleryPageIndicatorsModule (ref), carouselScrollButtons (ref), roundIconButton (ref)
	local t_2
	local var21 = useTokens()
	local itemPadding = p2.itemPadding or var21.Padding.Medium
	local aspectRatio = p2.aspectRatio or mediaGalleryConstantsModule.ITEM_ASPECT_RATIO
	local cornerRadius = p2.cornerRadius or var21.Radius.Medium
	local itemsCount = #p2.items
	local var26 = reactModule.useMemo(function() --[[ line: 119 ]]
		-- upvalues: p2 (ref), isValidIdentifierModule (copy), isYouTubeVideoModule (copy)
		for i, v in p2.items do
			if isValidIdentifierModule(v.videoId) and not isYouTubeVideoModule(v.assetTypeId) then
				return true
			end
		end
		return false
	end, { p2.items })
	reactModule.useEffect(function() --[[ line: 128 ]]
		-- upvalues: var26 (ref), isAudioPlaybackAllowedForDeviceModule (copy), enableAudioPlaybackInApp (copy)
		if var26 and isAudioPlaybackAllowedForDeviceModule() then
			task.delay(0, enableAudioPlaybackInApp)
		end
	end, { var26 })
	local var27 = useSnapScrollModule({
		itemCount = itemsCount,
		itemPadding = itemPadding,
		springConfig = mediaGalleryConstantsModule.SPRING_CONFIG,
		targetIndex = p2.startIndex,
		onScrollComplete = reactModule.useCallback(function(p3, p4) --[[ line: 134 ]]
			-- upvalues: p2 (ref)
			if p2.onMediaChanged then
				p2.onMediaChanged(p3, p4)
			end
		end, { p2.onMediaChanged })
	})
	local var28 = getVisibleIndices(itemsCount, var27.currentIndex)
	local var29 = reactModule.useMemo(function() --[[ line: 151 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var30 = reactModule.useMemo(function() --[[ line: 154 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var31, var32 = reactModule.useState(true)
	local var33, var34 = reactModule.useState(false)
	local videoPlaybackCoordinator_1 = p2.videoPlaybackCoordinator or reactModule.useMemo(function() --[[ line: 161 ]]
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var36 = useAutoAdvanceModule({
		enabled = p2.autoAdvanceEnabled ~= false,
		intervalSeconds = p2.autoAdvanceIntervalSeconds,
		galleryRef = var27.scrollingFrameRef,
		isMediaGalleryOccluded = p2.isMediaGalleryOccluded,
		isAutoAdvanceTimerSuspended = var33,
		scrollRight = reactModule.useCallback(function() --[[ line: 166 ]]
			-- upvalues: var27 (ref)
			var27.scrollInDirection("Right", true)
		end, { var27.scrollInDirection })
	})
	local var37 = reactModule.useCallback(function(p5, p6) --[[ line: 179 ]]
		-- upvalues: var36 (ref), var27 (ref)
		var36.resetProgress()
		var27.scrollInDirection(p5, p6)
	end, { var36.resetProgress, var27.scrollInDirection })
	local var38 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) then var21.Size.Size_400 else var21.Size.Size_700
	local gradientOverlayHeight = p2.gradientOverlayHeight or var21.Size.Size_200 + var38 + var21.Size.Size_1000
	local var40 = reactModule.useMemo(function() --[[ line: 193 ]]
		-- upvalues: p2 (ref), videoPlaybackCoordinator_1 (ref)
		return {
			videoAnalyticsData = {
				source = p2.analyticsSource or "MediaGallery",
				sourceId = p2.analyticsSourceId or nil
			},
			getPlaybackSessionId = function() --[[ line: 204 ]]
				-- upvalues: videoPlaybackCoordinator_1 (copy)
				return videoPlaybackCoordinator_1.currentPlaybackSessionId
			end
		}
	end, {
		p2.analyticsSource,
		p2.analyticsSourceId,
		videoPlaybackCoordinator_1
	})
	local var41 = if p2.fullscreenEnabled == false then nil else p2.onFullscreenToggle
	local var42 = reactModule.useCallback(function() --[[ line: 212 ]]
		-- upvalues: var41 (ref), var27 (ref)
		if var41 then
			var41(var27.currentIndex)
		end
	end, { var41, var27.currentIndex })
	local var43 = useLastInput()
	local var44 = if luaAppEnableVRMediaGalleryScrollButtons then useIsSpatial() else nil
	local var45 = var43 == responsiveModule.Input.Directional
	local _ = true
	local pointer = responsiveModule.Input.Pointer
	local _ = var43 == pointer and ((if var43 == pointer then luaAppEnableVRMediaGalleryScrollButtons else nil) and var44)
	local var46 = reactModule.useCallback(function() --[[ line: 227 ]]
		-- upvalues: var37 (ref)
		var37("Left")
	end, { var37 })
	local var47 = reactModule.useCallback(function() --[[ line: 231 ]]
		-- upvalues: var37 (ref)
		var37("Right")
	end, { var37 })
	local var48 = useCursor(cursorType.Invisible)
	local var49 = reactModule.useCallback(function() --[[ line: 237 ]]
		-- upvalues: var33 (ref), var29 (ref)
		if var33 then
			var29:fire()
		end
	end, { var33, var29 })
	local var50 = useCarouselGamepadInputModule({
		isFullscreen = p2.isFullscreen,
		isVideoActive = var33,
		isMuted = var31,
		toggleMuteSignal = var30,
		onFullscreenToggle = var42,
		scrollLeft = var46,
		scrollRight = var47
	})
	useTouchDragScrollModule(var27.scrollingFrameRef, var27.scrollInDirection)
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, itemPadding)
		})
	}
	
	for i, v in var28 do
		t_2 = p2.items[v]
		
		if t_2 then
			local var55
			local _ = nil
			
			if isValidIdentifierModule(t_2.videoId) and not isYouTubeVideoModule(t_2.assetTypeId) then
				local t_1 = {
					videoId = t_2.videoId,
					thumbnail = t_2.imageId,
					Size = UDim2.fromScale(1, 1),
					itemIndex = v,
					overlay = t_2.overlay,
					currentIndex = var27.currentIndex,
					videoPlaybackCoordinator = videoPlaybackCoordinator_1,
					toggleVideoPlaybackSignal = var29,
					toggleMuteSignal = var30,
					onVideoEnded = var36.onVideoEnded,
					onVideoProgressChanged = var36.onVideoProgressChanged,
					onMutedChanged = var32,
					setIsVideoActive = var34,
					isFullscreen = p2.isFullscreen,
					isMediaGalleryOccluded = p2.isMediaGalleryOccluded,
					videoAnalytics = p2.videoAnalytics,
					videoAnalyticsContext = var40,
					videoDwellTimeHundredthsSec = p2.videoDwellTimeHundredthsSec,
					videoVisiblePercent = p2.videoVisiblePercent,
					autoplay = p2.autoplay,
					muted = p2.muted,
					looped = p2.looped,
					showPlayButton = p2.showPlayButton,
					showProgressBar = p2.showProgressBar,
					cornerRadius = cornerRadius,
					onMediaResolved = if fFlagSduiExperienceDetailsSupport and v == 1 then p2.onMediaResolved else nil
				}
				
				if t_2.itemProps then
					for i_1, v_1 in t_2.itemProps do
						t_1[i_1] = v_1
					end
				end
				var55 = reactModule.createElement(mediaGalleryVideoItemModule, t_1)
				t["Item" .. v] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = v,
					Size = var27.absoluteSizeBinding:map(function(p7) --[[ line: 333 ]]
						-- upvalues: aspectRatio (ref)
						return UDim2.new(1, 0, 0, p7.X / aspectRatio)
					end)
				}, { Content = var55 })
			end
			local t_1 = {
				imageId = t_2.imageId,
				isYouTubeVideo = isYouTubeVideoModule(t_2.assetTypeId),
				videoHash = t_2.videoHash,
				videoTitle = t_2.videoTitle,
				Size = UDim2.fromScale(1, 1),
				itemIndex = v,
				overlay = t_2.overlay,
				cornerRadius = cornerRadius,
				showGradient = p2.showGradient,
				onYouTubeVideoPlay = p2.onYouTubeVideoPlay,
				gradientOverlayHeight = gradientOverlayHeight,
				onMediaResolved = if fFlagSduiExperienceDetailsSupport and v == 1 then p2.onMediaResolved else nil
			}
			
			if t_2.itemProps then
				for i_1, v_1 in t_2.itemProps do
					t_1[i_1] = v_1
				end
			end
			var55 = reactModule.createElement(mediaGalleryImageItemModule, t_1)
		end
	end
	local size500 = var21.Size.Size_500
	local size350 = var21.Size.Size_350
	local t_1 = {}
	t_2 = {
		BackgroundTransparency = 1,
		Size = p2.Size or UDim2.fromScale(1, 1),
		AnchorPoint = p2.AnchorPoint,
		Position = p2.Position,
		ref = var50,
		AutoButtonColor = false,
		Text = "",
		[reactModule.Event.Activated] = var49,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionImageObject = if p2.isFullscreen then var48 else nil,
		SelectionGroup = true
	}
	t_1.Carousel = reactModule.createElement("TextButton", t_2, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			Selectable = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = var27.absoluteSizeBinding:map(function(p8) --[[ line: 363 ]]
				-- upvalues: aspectRatio (ref)
				return UDim2.new(1, 0, 0, p8.X / aspectRatio)
			end),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasPosition = var27.canvasPosition,
			ScrollingEnabled = false,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ClipsDescendants = true,
			ZIndex = 1,
			[reactModule.Change.AbsoluteSize] = var27.onAbsoluteSizeChanged,
			ref = var27.scrollingFrameRef
		}, t),
		PageIndicators = if itemsCount > 1 and p2.showPageIndicators ~= false and not p2.isFullscreen then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 1),
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, var21.Size.Size_200),
			Position = UDim2.new(0.5, 0, 1, -var38)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, size350),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			PageLeftGamepadIcon = if var45 then reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = -1,
				Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonL1),
				ImageTransparency = if var27.currentIndex <= 1 then 0.5 else nil,
				Size = UDim2.fromOffset(size500, size500)
			}) else nil,
			Indicators = reactModule.createElement(mediaGalleryPageIndicatorsModule, {
				useSpring = true,
				numberOfItems = itemsCount,
				startIndex = p2.startIndex or 1,
				currentItemProgressBinding = var36.progressBinding,
				mediaGalleryScrolledSignal = var27.scrolledSignal,
				springConfig = mediaGalleryConstantsModule.SPRING_CONFIG
			}),
			PageRightGamepadIcon = if var45 then reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonR1),
				ImageTransparency = if itemsCount <= var27.currentIndex then 0.5 else nil,
				Size = UDim2.fromOffset(size500, size500)
			}) else nil
		}) else nil,
		ScrollButtons = if u355 and not p2.isMediaGalleryOccluded then reactModule.createElement(carouselScrollButtons, {
			ZIndex = 10,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, if p2.isFullscreen then 0 else var21.Size.Size_1000, 1, 0),
			buttonOffsetFromEdge = if p2.isFullscreen then var21.Size.Size_500 else nil,
			leftScrollingEnabled = var27.currentIndex > 1,
			rightScrollingEnabled = var27.currentIndex < itemsCount,
			handleScrollLeft = var46,
			handleScrollRight = var47
		}) else nil,
		FullscreenButton = if var41 then reactModule.createElement(roundIconButton, {
			ZIndex = 4,
			Selectable = false,
			icon = if p2.isFullscreen then "two-arrows-to-center" else "two-arrows-from-center",
			onActivated = var42,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -var21.Size.Size_500, 0, var21.Size.Size_500)
		}) else nil,
		CarouselOverlay = if p2.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 15,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p2.overlay }) else nil,
		SizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = var27.absoluteSizeBinding:map(function(p9) --[[ line: 458 ]]
				-- upvalues: aspectRatio (ref)
				return Vector2.new(0, p9.X / aspectRatio)
			end)
		})
	})
	
	return t_1
end)