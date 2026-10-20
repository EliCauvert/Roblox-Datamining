local UserInputService = game:GetService("UserInputService")
local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local CursorType = FoundationModule.Enums.CursorType
local Signal = require(Parent.AppCommonLib).Signal
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseLastInputFunction = ResponsiveModule.useLastInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local LuaAppEnableVRMediaGalleryScrollButtons = game:DefineFastFlag("LuaAppEnableVRMediaGalleryScrollButtons", false)
local CarouselScrollButtons = require(Parent.CollectionViews).CarouselScrollButtons
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local RoundIconButton = VideoUtilsModule.RoundIconButton
local EnableAudioPlaybackInApp = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local MediaGalleryPageIndicatorsModule = require(MediaGallery.MediaGalleryPageIndicators)
local MediaGalleryConstantsModule = require(MediaGallery.MediaGalleryConstants)
local _ = require(MediaGallery.MediaGalleryTypes)
local MediaGalleryImageItemModule = require(MediaGallery.MediaGalleryImageItem)
local MediaGalleryVideoItemModule = require(MediaGallery.MediaGalleryVideoItem)
local IsYouTubeVideoModule = require(MediaGallery.isYouTubeVideo)
local IsValidIdentifierModule = require(MediaGallery.isValidIdentifier)
local UseSnapScrollModule = require(MediaGallery.Hooks.useSnapScroll)
local UseAutoAdvanceModule = require(MediaGallery.Hooks.useAutoAdvance)
local UseTouchDragScrollModule = require(MediaGallery.Hooks.useTouchDragScroll)
local UseCarouselGamepadInputModule = require(MediaGallery.Hooks.useCarouselGamepadInput)
local IsAudioPlaybackAllowedForDeviceModule = require(MediaGallery.isAudioPlaybackAllowedForDevice)
local SLIDINGWINDOWSIZE = MediaGalleryConstantsModule.SLIDING_WINDOW_SIZE

local function getVisibleIndices(CountItems, CurrentIndex: number)
	-- upvalues: SLIDINGWINDOWSIZE (copy)
	local List = {}
	
	for i = 1, SLIDINGWINDOWSIZE do
		local CurrentIndexDelta = CurrentIndex + i - math.floor(SLIDINGWINDOWSIZE / 2) - 1
		
		if CurrentIndexDelta >= 1 and CurrentIndexDelta <= CountItems then
			table.insert(List, CurrentIndexDelta)
		end
	end
	return List
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), MediaGalleryConstantsModule (copy), ReactModule (copy), IsValidIdentifierModule (copy), IsYouTubeVideoModule (copy), IsAudioPlaybackAllowedForDeviceModule (copy), EnableAudioPlaybackInApp (copy), UseSnapScrollModule (copy), getVisibleIndices (copy), Signal (copy), VideoPlaybackCoordinator (copy), UseAutoAdvanceModule (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), UseLastInputFunction (copy), LuaAppEnableVRMediaGalleryScrollButtons (copy), UseIsSpatialFunction (copy), UseCursorFunction (copy), CursorType (copy), UseCarouselGamepadInputModule (copy), UseTouchDragScrollModule (copy), FFlagSduiExperienceDetailsSupport (copy), MediaGalleryVideoItemModule (copy), MediaGalleryImageItemModule (copy), UserInputService (copy), MediaGalleryPageIndicatorsModule (copy), CarouselScrollButtons (copy), RoundIconButton (copy)
	local UseTokensResult = UseTokensFunction()
	local ItemPadding = Frame.itemPadding or UseTokensResult.Padding.Medium
	local AspectRatio = Frame.aspectRatio or MediaGalleryConstantsModule.ITEM_ASPECT_RATIO
	local CornerRadius = Frame.cornerRadius or UseTokensResult.Radius.Medium
	local CountItems = #Frame.items
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: Frame (copy), IsValidIdentifierModule (upval), IsYouTubeVideoModule (upval)
		for _, item in Frame.items do
			if IsValidIdentifierModule(item.videoId) and not IsYouTubeVideoModule(item.assetTypeId) then
				return true
			end
		end
		return false
	end, { Frame.items })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), IsAudioPlaybackAllowedForDeviceModule (upval), EnableAudioPlaybackInApp (upval)
		if UseMemoResult and IsAudioPlaybackAllowedForDeviceModule() then
			task.delay(0, EnableAudioPlaybackInApp)
		end
	end, { UseMemoResult })
	local UseSnapScrollModuleResult = UseSnapScrollModule({
		itemCount = CountItems,
		itemPadding = ItemPadding,
		springConfig = MediaGalleryConstantsModule.SPRING_CONFIG,
		targetIndex = Frame.startIndex,
		onScrollComplete = ReactModule.useCallback(function(p1, p2)
			-- upvalues: Frame (copy)
			if Frame.onMediaChanged then
				Frame.onMediaChanged(p1, p2)
			end
		end, { Frame.onMediaChanged })
	})
	local VisibleIndices = getVisibleIndices(CountItems, UseSnapScrollModuleResult.currentIndex)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: VideoPlaybackCoordinator (upval)
		return VideoPlaybackCoordinator.new()
	end, {})
	local VideoPlaybackCoordinator1 = Frame.videoPlaybackCoordinator or UseMemoResult3
	local UseAutoAdvanceModuleResult = UseAutoAdvanceModule({
		enabled = Frame.autoAdvanceEnabled ~= false,
		intervalSeconds = Frame.autoAdvanceIntervalSeconds,
		galleryRef = UseSnapScrollModuleResult.scrollingFrameRef,
		isMediaGalleryOccluded = Frame.isMediaGalleryOccluded,
		isAutoAdvanceTimerSuspended = UseStateResult1,
		scrollRight = ReactModule.useCallback(function()
			-- upvalues: UseSnapScrollModuleResult (copy)
			UseSnapScrollModuleResult.scrollInDirection("Right", true)
		end, { UseSnapScrollModuleResult.scrollInDirection })
	})
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseAutoAdvanceModuleResult (copy), UseSnapScrollModuleResult (copy)
		UseAutoAdvanceModuleResult.resetProgress()
		UseSnapScrollModuleResult.scrollInDirection(p1, p2)
	end, {
		UseAutoAdvanceModuleResult.resetProgress,
		UseSnapScrollModuleResult.scrollInDirection
	})
	local Size200 = UseTokensResult.Size.Size_200
	local Size400 = if UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small) then UseTokensResult.Size.Size_400 else UseTokensResult.Size.Size_700
	local GradientOverlayHeight = Frame.gradientOverlayHeight or Size200 + Size400 + UseTokensResult.Size.Size_1000
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), VideoPlaybackCoordinator1 (copy)
		return {
			videoAnalyticsData = {
				source = Frame.analyticsSource or "MediaGallery",
				sourceId = Frame.analyticsSourceId or nil
			},
			getPlaybackSessionId = function()
				-- upvalues: VideoPlaybackCoordinator1 (upval)
				return VideoPlaybackCoordinator1.currentPlaybackSessionId
			end
		}
	end, {
		Frame.analyticsSource,
		Frame.analyticsSourceId,
		VideoPlaybackCoordinator1
	})
	local OnFullscreenToggle = if Frame.fullscreenEnabled == false then nil else Frame.onFullscreenToggle
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: OnFullscreenToggle (copy), UseSnapScrollModuleResult (copy)
		if OnFullscreenToggle then
			OnFullscreenToggle(UseSnapScrollModuleResult.currentIndex)
		end
	end, {
		OnFullscreenToggle,
		UseSnapScrollModuleResult.currentIndex
	})
	local UseLastInputResult = UseLastInputFunction()
	local UseIsSpatialResult = if LuaAppEnableVRMediaGalleryScrollButtons then UseIsSpatialFunction() else nil
	local IsUseLastInputResultMatch = UseLastInputResult == ResponsiveModule.Input.Directional
	local IsUseLastInputResultMatch1 = UseLastInputResult == ResponsiveModule.Input.Pointer or LuaAppEnableVRMediaGalleryScrollButtons and UseIsSpatialResult
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult("Left")
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult("Right")
	end, { UseResult })
	local UseCursorResult = UseCursorFunction(CursorType.Invisible)
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseMemoResult1 (copy)
		if UseStateResult1 then
			UseMemoResult1:fire()
		end
	end, { UseStateResult1, UseMemoResult1 })
	local UseCarouselGamepadInputModuleResult = UseCarouselGamepadInputModule({
		isFullscreen = Frame.isFullscreen,
		isVideoActive = UseStateResult1,
		isMuted = UseStateResult,
		toggleMuteSignal = UseMemoResult2,
		onFullscreenToggle = UseResult1,
		scrollLeft = UseResult2,
		scrollRight = UseResult3
	})
	UseTouchDragScrollModule(UseSnapScrollModuleResult.scrollingFrameRef, UseSnapScrollModuleResult.scrollInDirection)
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, ItemPadding)
		})
	}
	
	for _, visibleIndice in VisibleIndices do
		local Item = Frame.items[visibleIndice]
		
		if Item then
			local Element = nil
			if IsValidIdentifierModule(Item.videoId) and not IsYouTubeVideoModule(Item.assetTypeId) then
				local config2 = {
					videoId = Item.videoId,
					thumbnail = Item.imageId,
					Size = UDim2.fromScale(1, 1),
					itemIndex = visibleIndice,
					overlay = Item.overlay,
					currentIndex = UseSnapScrollModuleResult.currentIndex,
					videoPlaybackCoordinator = VideoPlaybackCoordinator1,
					toggleVideoPlaybackSignal = UseMemoResult1,
					toggleMuteSignal = UseMemoResult2,
					onVideoEnded = UseAutoAdvanceModuleResult.onVideoEnded,
					onVideoProgressChanged = UseAutoAdvanceModuleResult.onVideoProgressChanged,
					onMutedChanged = UseStateResult2,
					setIsVideoActive = UseStateResult2_1,
					isFullscreen = Frame.isFullscreen,
					isMediaGalleryOccluded = Frame.isMediaGalleryOccluded,
					videoAnalytics = Frame.videoAnalytics,
					videoAnalyticsContext = UseMemoResult4,
					videoDwellTimeHundredthsSec = Frame.videoDwellTimeHundredthsSec,
					videoVisiblePercent = Frame.videoVisiblePercent,
					autoplay = Frame.autoplay,
					muted = Frame.muted,
					looped = Frame.looped,
					showPlayButton = Frame.showPlayButton,
					showProgressBar = Frame.showProgressBar,
					cornerRadius = CornerRadius,
					onMediaResolved = if FFlagSduiExperienceDetailsSupport and visibleIndice == 1 then Frame.onMediaResolved else nil
				}
				
				if Item.itemProps then
					for i, itemProp in Item.itemProps do
						config2[i] = itemProp
					end
				end
				Element = ReactModule.createElement(MediaGalleryVideoItemModule, config2)
			else
				local config1 = {
					imageId = Item.imageId,
					isYouTubeVideo = IsYouTubeVideoModule(Item.assetTypeId),
					videoHash = Item.videoHash,
					videoTitle = Item.videoTitle,
					Size = UDim2.fromScale(1, 1),
					itemIndex = visibleIndice,
					overlay = Item.overlay,
					cornerRadius = CornerRadius,
					showGradient = Frame.showGradient,
					onYouTubeVideoPlay = Frame.onYouTubeVideoPlay,
					gradientOverlayHeight = GradientOverlayHeight,
					onMediaResolved = if FFlagSduiExperienceDetailsSupport and visibleIndice == 1 then Frame.onMediaResolved else nil
				}
				
				if Item.itemProps then
					for i1, itemProp1 in Item.itemProps do
						config1[i1] = itemProp1
					end
				end
				Element = ReactModule.createElement(MediaGalleryImageItemModule, config1)
			end
			config["Item" .. visibleIndice] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = visibleIndice,
				Size = UseSnapScrollModuleResult.absoluteSizeBinding:map(function(p1): UDim2
					-- upvalues: AspectRatio (copy)
					return UDim2.new(1, 0, 0, p1.X / AspectRatio)
				end)
			}, { Content = Element })
		end
	end
	local Size500 = UseTokensResult.Size.Size_500
	local Size350 = UseTokensResult.Size.Size_350
	
	return {
		Carousel = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Size = Frame.Size or UDim2.fromScale(1, 1),
			AnchorPoint = Frame.AnchorPoint,
			Position = Frame.Position,
			ref = UseCarouselGamepadInputModuleResult,
			AutoButtonColor = false,
			Text = "",
			[ReactModule.Event.Activated] = UseResult4,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionImageObject = if Frame.isFullscreen then UseCursorResult else nil,
			SelectionGroup = true
		}, {
			ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
				Selectable = false,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.fromScale(0, 0.5),
				Size = UseSnapScrollModuleResult.absoluteSizeBinding:map(function(p1): UDim2
					-- upvalues: AspectRatio (copy)
					return UDim2.new(1, 0, 0, p1.X / AspectRatio)
				end),
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasPosition = UseSnapScrollModuleResult.canvasPosition,
				ScrollingEnabled = false,
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ClipsDescendants = true,
				ZIndex = 1,
				[ReactModule.Change.AbsoluteSize] = UseSnapScrollModuleResult.onAbsoluteSizeChanged,
				ref = UseSnapScrollModuleResult.scrollingFrameRef
			}, config),
			PageIndicators = if CountItems > 1 and Frame.showPageIndicators ~= false and not Frame.isFullscreen then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.fromOffset(0, UseTokensResult.Size.Size_200),
				Position = UDim2.new(0.5, 0, 1, -Size400)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, Size350),
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				PageLeftGamepadIcon = if IsUseLastInputResultMatch then ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = -1,
					Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonL1),
					ImageTransparency = if UseSnapScrollModuleResult.currentIndex <= 1 then 0.5 else nil,
					Size = UDim2.fromOffset(Size500, Size500)
				}) else nil,
				Indicators = ReactModule.createElement(MediaGalleryPageIndicatorsModule, {
					useSpring = true,
					numberOfItems = CountItems,
					startIndex = Frame.startIndex or 1,
					currentItemProgressBinding = UseAutoAdvanceModuleResult.progressBinding,
					mediaGalleryScrolledSignal = UseSnapScrollModuleResult.scrolledSignal,
					springConfig = MediaGalleryConstantsModule.SPRING_CONFIG
				}),
				PageRightGamepadIcon = if IsUseLastInputResultMatch then ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonR1),
					ImageTransparency = if CountItems <= UseSnapScrollModuleResult.currentIndex then 0.5 else nil,
					Size = UDim2.fromOffset(Size500, Size500)
				}) else nil
			}) else nil,
			ScrollButtons = if IsUseLastInputResultMatch1 and not Frame.isMediaGalleryOccluded then ReactModule.createElement(CarouselScrollButtons, {
				ZIndex = 10,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(0.5, 0),
				Size = UDim2.new(1, if Frame.isFullscreen then 0 else UseTokensResult.Size.Size_1000, 1, 0),
				buttonOffsetFromEdge = if Frame.isFullscreen then UseTokensResult.Size.Size_500 else nil,
				leftScrollingEnabled = UseSnapScrollModuleResult.currentIndex > 1,
				rightScrollingEnabled = UseSnapScrollModuleResult.currentIndex < CountItems,
				handleScrollLeft = UseResult2,
				handleScrollRight = UseResult3
			}) else nil,
			FullscreenButton = if OnFullscreenToggle then ReactModule.createElement(RoundIconButton, {
				ZIndex = 4,
				Selectable = false,
				icon = if Frame.isFullscreen then "two-arrows-to-center" else "two-arrows-from-center",
				onActivated = UseResult1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -UseTokensResult.Size.Size_500, 0, UseTokensResult.Size.Size_500)
			}) else nil,
			CarouselOverlay = if Frame.overlay then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 15,
				Size = UDim2.fromScale(1, 1)
			}, { Overlay = Frame.overlay }) else nil,
			SizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MinSize = UseSnapScrollModuleResult.absoluteSizeBinding:map(function(p1): Vector2
					-- upvalues: AspectRatio (copy)
					return Vector2.new(0, p1.X / AspectRatio)
				end)
			})
		})
	}
end)