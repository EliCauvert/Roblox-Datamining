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
local useGamepadSupports = require(parent.RoactUtils).Hooks.useGamepadSupports
local luaAppMediaGalleryGamepadSupportsPagingIcons = game:DefineFastFlag("LuaAppMediaGalleryGamepadSupportsPagingIcons", false)
local list = { Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1 }
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

local function getVisibleIndices(p0, p1) --[[ line: 52 ]]
	-- upvalues: SLIDING_WINDOW_SIZE (ref)
	local t = {}
	
	for i = 1, SLIDING_WINDOW_SIZE do
		local var21 = p1 + i - math.floor(SLIDING_WINDOW_SIZE / 2) - 1
		
		if var21 >= 1 and var21 <= p0 then
			table.insert(t, var21)
		end
	end
	return t
end

return reactModule.memo(function(p2) --[[ line: 115 | named "MediaGalleryCarousel" ]]
	-- upvalues: useTokens (ref), mediaGalleryConstantsModule (ref), reactModule (ref), isValidIdentifierModule (ref), isYouTubeVideoModule (ref), isAudioPlaybackAllowedForDeviceModule (ref), enableAudioPlaybackInApp (ref), useSnapScrollModule (ref), getVisibleIndices (ref), signal (ref), videoPlaybackCoordinator (ref), useAutoAdvanceModule (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), useLastInput (ref), luaAppMediaGalleryGamepadSupportsPagingIcons (ref), useGamepadSupports (ref), list (ref), useCursor (ref), cursorType (ref), useCarouselGamepadInputModule (ref), useTouchDragScrollModule (ref), fFlagSduiExperienceDetailsSupport (ref), mediaGalleryVideoItemModule (ref), mediaGalleryImageItemModule (ref), userInputService (ref), mediaGalleryPageIndicatorsModule (ref), carouselScrollButtons (ref), roundIconButton (ref)
	local t_2
	local var22 = useTokens()
	local itemPadding = p2.itemPadding or var22.Padding.Medium
	local aspectRatio = p2.aspectRatio or mediaGalleryConstantsModule.ITEM_ASPECT_RATIO
	local cornerRadius = p2.cornerRadius or var22.Radius.Medium
	local itemsCount = #p2.items
	local var27 = reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: p2 (ref), isValidIdentifierModule (copy), isYouTubeVideoModule (copy)
		for i, v in p2.items do
			if isValidIdentifierModule(v.videoId) and not isYouTubeVideoModule(v.assetTypeId) then
				return true
			end
		end
		return false
	end, { p2.items })
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: var27 (ref), isAudioPlaybackAllowedForDeviceModule (copy), enableAudioPlaybackInApp (copy)
		if var27 and isAudioPlaybackAllowedForDeviceModule() then
			task.delay(0, enableAudioPlaybackInApp)
		end
	end, { var27 })
	local var28 = useSnapScrollModule({
		itemCount = itemsCount,
		itemPadding = itemPadding,
		springConfig = mediaGalleryConstantsModule.SPRING_CONFIG,
		targetIndex = p2.startIndex,
		onScrollComplete = reactModule.useCallback(function(p3, p4) --[[ line: 137 ]]
			-- upvalues: p2 (ref)
			if p2.onMediaChanged then
				p2.onMediaChanged(p3, p4)
			end
		end, { p2.onMediaChanged })
	})
	local var29 = getVisibleIndices(itemsCount, var28.currentIndex)
	local var30 = reactModule.useMemo(function() --[[ line: 154 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var31 = reactModule.useMemo(function() --[[ line: 157 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var32, var33 = reactModule.useState(true)
	local var34, var35 = reactModule.useState(false)
	local videoPlaybackCoordinator_1 = p2.videoPlaybackCoordinator or reactModule.useMemo(function() --[[ line: 164 ]]
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var37 = useAutoAdvanceModule({
		enabled = p2.autoAdvanceEnabled ~= false,
		intervalSeconds = p2.autoAdvanceIntervalSeconds,
		galleryRef = var28.scrollingFrameRef,
		isMediaGalleryOccluded = p2.isMediaGalleryOccluded,
		isAutoAdvanceTimerSuspended = var34,
		scrollRight = reactModule.useCallback(function() --[[ line: 169 ]]
			-- upvalues: var28 (ref)
			var28.scrollInDirection("Right", true)
		end, { var28.scrollInDirection })
	})
	local var38 = reactModule.useCallback(function(p5, p6) --[[ line: 182 ]]
		-- upvalues: var37 (ref), var28 (ref)
		var37.resetProgress()
		var28.scrollInDirection(p5, p6)
	end, { var37.resetProgress, var28.scrollInDirection })
	local var39 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) then var22.Size.Size_400 else var22.Size.Size_700
	local gradientOverlayHeight = p2.gradientOverlayHeight or var22.Size.Size_200 + var39 + var22.Size.Size_1000
	local var41 = reactModule.useMemo(function() --[[ line: 196 ]]
		-- upvalues: p2 (ref), videoPlaybackCoordinator_1 (ref)
		return {
			videoAnalyticsData = {
				source = p2.analyticsSource or "MediaGallery",
				sourceId = p2.analyticsSourceId or nil
			},
			getPlaybackSessionId = function() --[[ line: 207 ]]
				-- upvalues: videoPlaybackCoordinator_1 (copy)
				return videoPlaybackCoordinator_1.currentPlaybackSessionId
			end
		}
	end, {
		p2.analyticsSource,
		p2.analyticsSourceId,
		videoPlaybackCoordinator_1
	})
	local var42 = if p2.fullscreenEnabled == false then nil else p2.onFullscreenToggle
	local var43 = reactModule.useCallback(function() --[[ line: 215 ]]
		-- upvalues: var42 (ref), var28 (ref)
		if var42 then
			var42(var28.currentIndex)
		end
	end, { var42, var28.currentIndex })
	local var44 = useLastInput()
	local var45 = var44 == responsiveModule.Input.Directional
	local var46 = if luaAppMediaGalleryGamepadSupportsPagingIcons then useGamepadSupports(list, var44) else false
	local var47 = if luaAppMediaGalleryGamepadSupportsPagingIcons then var45 and var46 else var45
	local var48 = if var44 ~= responsiveModule.Input.Pointer then luaAppMediaGalleryGamepadSupportsPagingIcons and not var46 else true
	local var49 = reactModule.useCallback(function() --[[ line: 233 ]]
		-- upvalues: var38 (ref)
		var38("Left")
	end, { var38 })
	local var50 = reactModule.useCallback(function() --[[ line: 237 ]]
		-- upvalues: var38 (ref)
		var38("Right")
	end, { var38 })
	local var51 = useCursor(cursorType.Invisible)
	local var52 = reactModule.useCallback(function() --[[ line: 243 ]]
		-- upvalues: var34 (ref), var30 (ref)
		if var34 then
			var30:fire()
		end
	end, { var34, var30 })
	local var53 = useCarouselGamepadInputModule({
		isFullscreen = p2.isFullscreen,
		isVideoActive = var34,
		isMuted = var32,
		toggleMuteSignal = var31,
		onFullscreenToggle = var43,
		scrollLeft = var49,
		scrollRight = var50
	})
	useTouchDragScrollModule(var28.scrollingFrameRef, var28.scrollInDirection)
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, itemPadding)
		})
	}
	
	for i, v in var29 do
		t_2 = p2.items[v]
		
		if t_2 then
			local var58
			local _ = nil
			
			if isValidIdentifierModule(t_2.videoId) and not isYouTubeVideoModule(t_2.assetTypeId) then
				local t_1 = {
					videoId = t_2.videoId,
					thumbnail = t_2.imageId,
					Size = UDim2.fromScale(1, 1),
					itemIndex = v,
					overlay = t_2.overlay,
					currentIndex = var28.currentIndex,
					videoPlaybackCoordinator = videoPlaybackCoordinator_1,
					toggleVideoPlaybackSignal = var30,
					toggleMuteSignal = var31,
					onVideoEnded = var37.onVideoEnded,
					onVideoProgressChanged = var37.onVideoProgressChanged,
					onMutedChanged = var33,
					setIsVideoActive = var35,
					isFullscreen = p2.isFullscreen,
					isMediaGalleryOccluded = p2.isMediaGalleryOccluded,
					videoAnalytics = p2.videoAnalytics,
					videoAnalyticsContext = var41,
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
				var58 = reactModule.createElement(mediaGalleryVideoItemModule, t_1)
				t["Item" .. v] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = v,
					Size = var28.absoluteSizeBinding:map(function(p7) --[[ line: 339 ]]
						-- upvalues: aspectRatio (ref)
						return UDim2.new(1, 0, 0, p7.X / aspectRatio)
					end)
				}, { Content = var58 })
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
			var58 = reactModule.createElement(mediaGalleryImageItemModule, t_1)
		end
	end
	local size500 = var22.Size.Size_500
	local size350 = var22.Size.Size_350
	local t_1 = {}
	t_2 = {
		BackgroundTransparency = 1,
		Size = p2.Size or UDim2.fromScale(1, 1),
		AnchorPoint = p2.AnchorPoint,
		Position = p2.Position,
		ref = var53,
		AutoButtonColor = false,
		Text = "",
		[reactModule.Event.Activated] = var52,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionImageObject = if p2.isFullscreen then var51 else nil,
		SelectionGroup = true
	}
	t_1.Carousel = reactModule.createElement("TextButton", t_2, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			Selectable = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = var28.absoluteSizeBinding:map(function(p8) --[[ line: 369 ]]
				-- upvalues: aspectRatio (ref)
				return UDim2.new(1, 0, 0, p8.X / aspectRatio)
			end),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasPosition = var28.canvasPosition,
			ScrollingEnabled = false,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ClipsDescendants = true,
			ZIndex = 1,
			[reactModule.Change.AbsoluteSize] = var28.onAbsoluteSizeChanged,
			ref = var28.scrollingFrameRef
		}, t),
		PageIndicators = if itemsCount > 1 and p2.showPageIndicators ~= false and not p2.isFullscreen then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 1),
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, var22.Size.Size_200),
			Position = UDim2.new(0.5, 0, 1, -var39)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, size350),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			PageLeftGamepadIcon = if var47 then reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = -1,
				Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonL1),
				ImageTransparency = if var28.currentIndex <= 1 then 0.5 else nil,
				Size = UDim2.fromOffset(size500, size500)
			}) else nil,
			Indicators = reactModule.createElement(mediaGalleryPageIndicatorsModule, {
				useSpring = true,
				numberOfItems = itemsCount,
				startIndex = p2.startIndex or 1,
				currentItemProgressBinding = var37.progressBinding,
				mediaGalleryScrolledSignal = var28.scrolledSignal,
				springConfig = mediaGalleryConstantsModule.SPRING_CONFIG
			}),
			PageRightGamepadIcon = if var47 then reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonR1),
				ImageTransparency = if itemsCount <= var28.currentIndex then 0.5 else nil,
				Size = UDim2.fromOffset(size500, size500)
			}) else nil
		}) else nil,
		ScrollButtons = if var48 and not p2.isMediaGalleryOccluded then reactModule.createElement(carouselScrollButtons, {
			ZIndex = 10,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, if p2.isFullscreen then 0 else var22.Size.Size_1000, 1, 0),
			buttonOffsetFromEdge = if p2.isFullscreen then var22.Size.Size_500 else nil,
			leftScrollingEnabled = var28.currentIndex > 1,
			rightScrollingEnabled = var28.currentIndex < itemsCount,
			handleScrollLeft = var49,
			handleScrollRight = var50
		}) else nil,
		FullscreenButton = if var42 then reactModule.createElement(roundIconButton, {
			ZIndex = 4,
			Selectable = false,
			icon = if p2.isFullscreen then "two-arrows-to-center" else "two-arrows-from-center",
			onActivated = var43,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -var22.Size.Size_500, 0, var22.Size.Size_500)
		}) else nil,
		CarouselOverlay = if p2.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 15,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p2.overlay }) else nil,
		SizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = var28.absoluteSizeBinding:map(function(p9) --[[ line: 464 ]]
				-- upvalues: aspectRatio (ref)
				return Vector2.new(0, p9.X / aspectRatio)
			end)
		})
	})
	
	return t_1
end)