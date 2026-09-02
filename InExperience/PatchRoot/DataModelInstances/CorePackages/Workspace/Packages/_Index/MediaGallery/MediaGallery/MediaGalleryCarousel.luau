local userInputService = game:GetService("UserInputService")
local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local cursorType = foundationModule.Enums.CursorType
local appCommonLibModule = require(parent.AppCommonLib)
local signal = appCommonLibModule.Signal
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppMediaGalleryGamepadSupport = require(parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local useLastInput = responsiveModule.useLastInput
local useGamepadSupports = require(parent.RoactUtils).Hooks.useGamepadSupports
local luaAppMediaGalleryGamepadSupportsPagingIcons = game:DefineFastFlag("LuaAppMediaGalleryGamepadSupportsPagingIcons", false)
local var1 = if fFlagLuaAppMediaGalleryGamepadSupport then { Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonR2 } else { Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1 }
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

local function getVisibleIndices(p1, p2)
	-- upvalues: SLIDING_WINDOW_SIZE (ref)
	local t = {}
	
	for i = 1, SLIDING_WINDOW_SIZE do
		local var2 = p2 + i - math.floor(SLIDING_WINDOW_SIZE / 2) - 1
		
		if var2 >= 1 and var2 <= p1 then
			table.insert(t, var2)
		end
	end
	return t
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), mediaGalleryConstantsModule (ref), reactModule (ref), isValidIdentifierModule (ref), isYouTubeVideoModule (ref), isAudioPlaybackAllowedForDeviceModule (ref), enableAudioPlaybackInApp (ref), useSnapScrollModule (ref), getVisibleIndices (ref), signal (ref), videoPlaybackCoordinator (ref), useAutoAdvanceModule (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), useLastInput (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), appCommonLibModule (ref), luaAppMediaGalleryGamepadSupportsPagingIcons (ref), useGamepadSupports (ref), var1 (ref), useCursor (ref), cursorType (ref), useCarouselGamepadInputModule (ref), useTouchDragScrollModule (ref), fFlagSduiExperienceDetailsSupport (ref), mediaGalleryVideoItemModule (ref), mediaGalleryImageItemModule (ref), userInputService (ref), mediaGalleryPageIndicatorsModule (ref), carouselScrollButtons (ref), roundIconButton (ref)
	local t_2
	local var3 = useTokens()
	local itemPadding = p3.itemPadding or var3.Padding.Medium
	local aspectRatio = p3.aspectRatio or mediaGalleryConstantsModule.ITEM_ASPECT_RATIO
	local cornerRadius = p3.cornerRadius or var3.Radius.Medium
	local itemsCount = #p3.items
	local var4 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), isValidIdentifierModule (copy), isYouTubeVideoModule (copy)
		for i, v in p3.items do
			if isValidIdentifierModule(v.videoId) and not isYouTubeVideoModule(v.assetTypeId) then
				return true
			end
		end
		return false
	end, { p3.items })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), isAudioPlaybackAllowedForDeviceModule (copy), enableAudioPlaybackInApp (copy)
		if var4 and isAudioPlaybackAllowedForDeviceModule() then
			task.delay(0, enableAudioPlaybackInApp)
		end
	end, { var4 })
	local var5 = useSnapScrollModule({
		itemCount = itemsCount,
		itemPadding = itemPadding,
		springConfig = mediaGalleryConstantsModule.SPRING_CONFIG,
		targetIndex = p3.startIndex,
		onScrollComplete = reactModule.useCallback(function(p4, p5)
			-- upvalues: p3 (ref)
			if p3.onMediaChanged then
				p3.onMediaChanged(p4, p5)
			end
		end, { p3.onMediaChanged })
	})
	local var6 = getVisibleIndices(itemsCount, var5.currentIndex)
	local var7 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var8 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var9, var10 = reactModule.useState(true)
	local var11, var12 = reactModule.useState(false)
	local videoPlaybackCoordinator_1 = p3.videoPlaybackCoordinator or reactModule.useMemo(function()
		-- upvalues: videoPlaybackCoordinator (copy)
		return videoPlaybackCoordinator.new()
	end, {})
	local var13 = useAutoAdvanceModule({
		enabled = p3.autoAdvanceEnabled ~= false,
		intervalSeconds = p3.autoAdvanceIntervalSeconds,
		galleryRef = var5.scrollingFrameRef,
		isMediaGalleryOccluded = p3.isMediaGalleryOccluded,
		isAutoAdvanceTimerSuspended = var11,
		scrollRight = reactModule.useCallback(function()
			-- upvalues: var5 (ref)
			var5.scrollInDirection("Right", true)
		end, { var5.scrollInDirection })
	})
	local var14 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var13 (ref), var5 (ref)
		var13.resetProgress()
		var5.scrollInDirection(p4, p5)
	end, { var13.resetProgress, var5.scrollInDirection })
	local var15 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) then var3.Size.Size_400 else var3.Size.Size_700
	local gradientOverlayHeight = p3.gradientOverlayHeight or var3.Size.Size_200 + var15 + var3.Size.Size_1000
	local var16 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), videoPlaybackCoordinator_1 (ref)
		return {
			videoAnalyticsData = {
				source = p3.analyticsSource or "MediaGallery",
				sourceId = p3.analyticsSourceId or nil
			},
			getPlaybackSessionId = function()
				-- upvalues: videoPlaybackCoordinator_1 (copy)
				return videoPlaybackCoordinator_1.currentPlaybackSessionId
			end
		}
	end, {
		p3.analyticsSource,
		p3.analyticsSourceId,
		videoPlaybackCoordinator_1
	})
	local var17 = if p3.fullscreenEnabled == false then nil else p3.onFullscreenToggle
	local var18 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var5 (ref)
		if var17 then
			var17(var5.currentIndex)
		end
	end, { var17, var5.currentIndex })
	local var19 = if fFlagLuaAppMediaGalleryGamepadSupport and appCommonLibModule.isSpatial() then responsiveModule.Input.Pointer else useLastInput()
	local var20 = var19 == responsiveModule.Input.Directional
	local var21 = if luaAppMediaGalleryGamepadSupportsPagingIcons then useGamepadSupports(var1, var19) else false
	local var22 = if luaAppMediaGalleryGamepadSupportsPagingIcons then var20 and var21 else var20
	local var23 = if var19 ~= responsiveModule.Input.Pointer then luaAppMediaGalleryGamepadSupportsPagingIcons and not var21 else true
	local var24 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14("Left")
	end, { var14 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14("Right")
	end, { var14 })
	local var26 = useCursor(cursorType.Invisible)
	local var27 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var7 (ref)
		if var11 then
			var7:fire()
		end
	end, { var11, var7 })
	local var28 = useCarouselGamepadInputModule({
		isFullscreen = p3.isFullscreen,
		isVideoActive = var11,
		isMuted = var9,
		toggleMuteSignal = var8,
		onFullscreenToggle = var18,
		scrollLeft = var24,
		scrollRight = var25
	})
	useTouchDragScrollModule(var5.scrollingFrameRef, var5.scrollInDirection)
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, itemPadding)
		})
	}
	
	for i, v in var6 do
		t_2 = p3.items[v]
		
		if t_2 then
			local var29
			local _ = nil
			
			if isValidIdentifierModule(t_2.videoId) and not isYouTubeVideoModule(t_2.assetTypeId) then
				local t_1 = {
					videoId = t_2.videoId,
					thumbnail = t_2.imageId,
					Size = UDim2.fromScale(1, 1),
					itemIndex = v,
					overlay = t_2.overlay,
					currentIndex = var5.currentIndex,
					videoPlaybackCoordinator = videoPlaybackCoordinator_1,
					toggleVideoPlaybackSignal = var7,
					toggleMuteSignal = var8,
					onVideoEnded = var13.onVideoEnded,
					onVideoProgressChanged = var13.onVideoProgressChanged,
					onMutedChanged = var10,
					setIsVideoActive = var12,
					isFullscreen = p3.isFullscreen,
					isMediaGalleryOccluded = p3.isMediaGalleryOccluded,
					videoAnalytics = p3.videoAnalytics,
					videoAnalyticsContext = var16,
					videoDwellTimeHundredthsSec = p3.videoDwellTimeHundredthsSec,
					videoVisiblePercent = p3.videoVisiblePercent,
					autoplay = p3.autoplay,
					muted = p3.muted,
					looped = p3.looped,
					showPlayButton = p3.showPlayButton,
					showProgressBar = p3.showProgressBar,
					cornerRadius = cornerRadius,
					onMediaResolved = if fFlagSduiExperienceDetailsSupport and v == 1 then p3.onMediaResolved else nil
				}
				
				if t_2.itemProps then
					for i_1, v_1 in t_2.itemProps do
						t_1[i_1] = v_1
					end
				end
				var29 = reactModule.createElement(mediaGalleryVideoItemModule, t_1)
				t["Item" .. v] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = v,
					Size = var5.absoluteSizeBinding:map(function(p4)
						-- upvalues: aspectRatio (ref)
						return UDim2.new(1, 0, 0, p4.X / aspectRatio)
					end)
				}, { Content = var29 })
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
				showGradient = p3.showGradient,
				onYouTubeVideoPlay = p3.onYouTubeVideoPlay,
				gradientOverlayHeight = gradientOverlayHeight,
				onMediaResolved = if fFlagSduiExperienceDetailsSupport and v == 1 then p3.onMediaResolved else nil
			}
			
			if t_2.itemProps then
				for i_1, v_1 in t_2.itemProps do
					t_1[i_1] = v_1
				end
			end
			var29 = reactModule.createElement(mediaGalleryImageItemModule, t_1)
		end
	end
	local size500 = var3.Size.Size_500
	local size350 = var3.Size.Size_350
	local t_1 = {}
	t_2 = {
		BackgroundTransparency = 1,
		Size = p3.Size or UDim2.fromScale(1, 1),
		AnchorPoint = p3.AnchorPoint,
		Position = p3.Position,
		ref = var28,
		AutoButtonColor = false,
		Text = "",
		[reactModule.Event.Activated] = var27,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionImageObject = if p3.isFullscreen then var26 else nil,
		SelectionGroup = true
	}
	t_1.Carousel = reactModule.createElement("TextButton", t_2, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			Selectable = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = var5.absoluteSizeBinding:map(function(p4)
				-- upvalues: aspectRatio (ref)
				return UDim2.new(1, 0, 0, p4.X / aspectRatio)
			end),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasPosition = var5.canvasPosition,
			ScrollingEnabled = false,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ClipsDescendants = true,
			ZIndex = 1,
			[reactModule.Change.AbsoluteSize] = var5.onAbsoluteSizeChanged,
			ref = var5.scrollingFrameRef
		}, t),
		PageIndicators = if itemsCount > 1 and p3.showPageIndicators ~= false and not p3.isFullscreen then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 1),
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, var3.Size.Size_200),
			Position = UDim2.new(0.5, 0, 1, -var15)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, size350),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			PageLeftGamepadIcon = if var22 then reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = -1,
				Image = userInputService:GetImageForKeyCode(if fFlagLuaAppMediaGalleryGamepadSupport then Enum.KeyCode.ButtonL2 else Enum.KeyCode.ButtonL1),
				ImageTransparency = if var5.currentIndex <= 1 then 0.5 else nil,
				Size = UDim2.fromOffset(size500, size500)
			}) else nil,
			Indicators = reactModule.createElement(mediaGalleryPageIndicatorsModule, {
				useSpring = true,
				numberOfItems = itemsCount,
				startIndex = p3.startIndex or 1,
				currentItemProgressBinding = var13.progressBinding,
				mediaGalleryScrolledSignal = var5.scrolledSignal,
				springConfig = mediaGalleryConstantsModule.SPRING_CONFIG
			}),
			PageRightGamepadIcon = if var22 then reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Image = userInputService:GetImageForKeyCode(if fFlagLuaAppMediaGalleryGamepadSupport then Enum.KeyCode.ButtonR2 else Enum.KeyCode.ButtonR1),
				ImageTransparency = if itemsCount <= var5.currentIndex then 0.5 else nil,
				Size = UDim2.fromOffset(size500, size500)
			}) else nil
		}) else nil,
		ScrollButtons = if var23 and not p3.isMediaGalleryOccluded then reactModule.createElement(carouselScrollButtons, {
			ZIndex = 10,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, if p3.isFullscreen then 0 else var3.Size.Size_1000, 1, 0),
			buttonOffsetFromEdge = if p3.isFullscreen then var3.Size.Size_500 else nil,
			leftScrollingEnabled = var5.currentIndex > 1,
			rightScrollingEnabled = var5.currentIndex < itemsCount,
			handleScrollLeft = var24,
			handleScrollRight = var25
		}) else nil,
		FullscreenButton = if var17 then reactModule.createElement(roundIconButton, {
			ZIndex = 4,
			Selectable = false,
			icon = if p3.isFullscreen then "two-arrows-to-center" else "two-arrows-from-center",
			onActivated = var18,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -var3.Size.Size_500, 0, var3.Size.Size_500)
		}) else nil,
		CarouselOverlay = if p3.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 15,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p3.overlay }) else nil,
		SizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = var5.absoluteSizeBinding:map(function(p4)
				-- upvalues: aspectRatio (ref)
				return Vector2.new(0, p4.X / aspectRatio)
			end)
		})
	})
	
	return t_1
end)