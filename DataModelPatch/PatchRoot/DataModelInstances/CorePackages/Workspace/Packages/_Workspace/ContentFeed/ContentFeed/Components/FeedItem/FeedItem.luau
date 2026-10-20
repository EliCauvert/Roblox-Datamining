local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CapturesCommonModule = require(Parent1.CapturesCommon)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UIBloxModule = require(Parent1.UIBlox)
local FetchGameVotes = require(Parent1.GameVotesRodux).GameVotes.FetchGameVotes
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local LoadingStrategy = UIBloxModule.App.Loading.Enum.LoadingStrategy
local View = require(Parent1.Foundation).View
local BlurDirection = CapturesCommonModule.Enums.BlurDirection
local EventNamesModule = require(Parent.Analytics.EventNames)
local ExperienceInfoModule = require(Parent.Components.FeedOverlay.ExperienceInfo)
local FeedContextModule = require(Parent.App.FeedContext)
local FeedItemPostsNotFoundModule = require(Parent.Components.FeedItem.FeedItemPostsNotFound)
local FeedOverlayModule = require(Parent.Components.FeedOverlay.FeedOverlay)
local ImageBlurEffect = CapturesCommonModule.Components.ImageBlurEffect
local LoadableVideo = CapturesCommonModule.Components.LoadableVideo
local NetworkingModule = require(Parent.App.Networking)
local PostTypeModule = require(Parent.Enums.PostType)
local _ = require(Parent.Types)
local UseAnalyticsModule = require(Parent.Hooks.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseFeedZoomControllerModule = require(Parent.Hooks.useFeedZoomController)
local UseMemoFunction = ReactModule.useMemo
local UsePostThumbnailFunction = CapturesCommonModule.Hooks.usePostThumbnail
local UseRefFunction = ReactModule.useRef
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState

local function _(p1): string
	return if p1 then "rbxassetid://" .. tostring(p1) else ""
end

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), FeedContextModule (copy), UseStateFunction (copy), UseRefFunction (copy), UseSelectorFunction (copy), UseEffectFunction (copy), NetworkingModule (copy), FetchGameVotes (copy), PostTypeModule (copy), UseCallbackFunction (copy), EventNamesModule (copy), FeedItemPostsNotFoundModule (copy), UseMemoFunction (copy), UseFeedZoomControllerModule (copy), UsePostThumbnailFunction (copy), View (copy), ImageBlurEffect (copy), BlurDirection (copy), LoadableVideo (copy), LoadableImage (copy), LoadingStrategy (copy), FeedOverlayModule (copy), ExperienceInfoModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local IsZooming = ReactModule.useContext(FeedContextModule).isZooming
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseRefResult = UseRefFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseRefResult1 = UseRefFunction(os.clock())
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(Vector2.new(UseScreenSizeResult.X, UseScreenSizeResult.Y))
	local UseRefResult2 = UseRefFunction(nil)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ContentFeed.Inspect.IsOpen
	end)
	UseEffectFunction(function()
		-- upvalues: UseDispatchResult (copy), NetworkingModule (upval), p1 (copy)
		UseDispatchResult(NetworkingModule.NetworkingUsers.GetUserV2FromUserId.API((tostring(p1.creatorUserId)))):catch(function() end)
	end, { UseDispatchResult, p1.creatorUserId })
	UseEffectFunction(function()
		-- upvalues: UseDispatchResult (copy), FetchGameVotes (upval), NetworkingModule (upval), p1 (copy)
		UseDispatchResult(FetchGameVotes.Fetch(NetworkingModule.ContentFeedNetworkImpl, (tostring(p1.universeId)))):catch(function() end)
	end, { UseDispatchResult, p1.universeId })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), PostTypeModule (upval), UseStateResult2_2 (copy)
		if p1.type ~= PostTypeModule.Video then
			UseStateResult2_2(Vector2.new(p1.screenshotMetadata.width, p1.screenshotMetadata.height))
		end
	end, { p1.screenshotMetadata, p1.type })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), EventNamesModule (upval), p1 (copy), PostTypeModule (upval), UseAnalyticsModuleResult (copy), UseRefResult1 (copy)
		if not UseRefResult.current then
			UseAnalyticsModuleResult.fireEvent(if p1.type == PostTypeModule.Video then EventNamesModule.ContentFeedVideoLatency else EventNamesModule.ContentFeedImageLatency, { statValue = os.clock() - UseRefResult1.current })
			UseRefResult.current = true
		end
	end, { UseAnalyticsModuleResult, UseRefResult, UseRefResult1 })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult1 (copy), EventNamesModule (upval), p1 (copy), PostTypeModule (upval), UseAnalyticsModuleResult (copy), UseStateResult2_1 (copy), ReactModule (upval), FeedItemPostsNotFoundModule (upval)
		if not UseStateResult1 then
			UseAnalyticsModuleResult.fireEvent(if p1.type == PostTypeModule.Video then EventNamesModule.ContentFeedVideoLoadFailed else EventNamesModule.ContentFeedImageLoadFailed, { postId = p1.postId })
			UseStateResult2_1(true)
		end
		return ReactModule.createElement(FeedItemPostsNotFoundModule, { layoutOrder = 1 })
	end, {
		UseAnalyticsModuleResult,
		UseStateResult1,
		p1.postId,
		p1.type
	})
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = UseMemoFunction(function()
		-- upvalues: UseStateResult3 (copy), UseScreenSizeResult (copy), UseStateResult (copy), p1 (copy), PostTypeModule (upval), UseStateResult1 (copy)
		local ScaledY = UseScreenSizeResult.Y * 0.33
		local UseStateResultRatio = UseStateResult / (UseStateResult3.X / UseStateResult3.Y)
		
		if UseStateResultRatio < ScaledY then
			UseStateResultRatio = ScaledY
		elseif UseScreenSizeResult.Y < UseStateResultRatio then
			UseStateResultRatio = UseScreenSizeResult.Y
		end
		if p1.type == PostTypeModule.Video then
			UseStateResultRatio = UseScreenSizeResult.Y
		end
		return UseStateResultRatio, p1.type ~= PostTypeModule.Video and (not UseStateResult1 and UseStateResultRatio < UseScreenSizeResult.Y / 2), (UseScreenSizeResult.Y - UseStateResultRatio) / 2
	end, {
		UseStateResult,
		UseStateResult1,
		UseStateResult3,
		p1.type,
		UseScreenSizeResult.Y
	})
	local IsPostIdMatch = p1.postId == p1.currentPostId
	local UseFeedZoomControllerModuleResult = UseFeedZoomControllerModule(IsPostIdMatch, UseMemoResult, UseStateResult, UseSelectorResult)
	UseEffectFunction(function()
		-- upvalues: IsPostIdMatch (copy), UseRefResult2 (copy)
		if IsPostIdMatch and UseRefResult2.current then
			UseRefResult2.current:Play()
			
			return
		end
		if UseRefResult2.current then
			UseRefResult2.current:Pause()
		end
	end, { IsPostIdMatch, UseRefResult2.current })
	local ItemContainerRef = UseFeedZoomControllerModuleResult.itemContainerRef
	local ItemFinalScale = UseFeedZoomControllerModuleResult.itemFinalScale
	local InitialZoomFocusPosition = UseFeedZoomControllerModuleResult.initialZoomFocusPosition
	local NonItemTransparency = UseFeedZoomControllerModuleResult.nonItemTransparency
	local ZoomAverageDelta = UseFeedZoomControllerModuleResult.zoomAverageDelta
	local ZoomEndTransition = UseFeedZoomControllerModuleResult.zoomEndTransition
	local ZoomEndTransitionActive = UseFeedZoomControllerModuleResult.zoomEndTransitionActive
	local FullSizeUrl = p1.screenshotMetadata.fullSizeUrl
	local NoFullSizeUrl: boolean = not FullSizeUrl or FullSizeUrl == ""
	local UsePostThumbnailResult, UsePostThumbnailResult2 = UsePostThumbnailFunction(if NoFullSizeUrl then p1.assetId else nil, p1.screenshotMetadata.width, p1.screenshotMetadata.height)
	
	if NoFullSizeUrl and UsePostThumbnailResult2 then
		FullSizeUrl = UsePostThumbnailResult
	end
	local CreateElementFunction1 = ReactModule.createElement
	local config = {
		tag = "bg-action-subtle",
		LayoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end,
		Size = UDim2.new(1, 0, 0, UseScreenSizeResult.Y),
		ZIndex = if IsPostIdMatch then 2 else 1
	}
	local config1 = {
		TopBlur = if UseMemoResult2 then ReactModule.createElement(ImageBlurEffect, {
			AnchorPoint = Vector2.new(0.5, 1),
			direction = BlurDirection.Up,
			image = FullSizeUrl,
			imageSize = UseStateResult3,
			Position = UDim2.new(0.5, 0, 0.5, -UseMemoResult / 2),
			Size = UDim2.new(1, 0, 0, UseMemoResult3),
			transparencyBinding = if IsPostIdMatch then NonItemTransparency else nil,
			ZIndex = if IsZooming and IsPostIdMatch then -3 else 0
		}) else nil
	}
	local CreateElementFunction = ReactModule.createElement
	local config2 = {
		ZIndex = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = if ZoomEndTransitionActive and InitialZoomFocusPosition.current then ZoomEndTransition:map(function(p2): UDim2
			-- upvalues: ItemFinalScale (copy), InitialZoomFocusPosition (copy), ZoomAverageDelta (copy), UseScreenSizeResult (copy)
			local CurrentRatio = ItemFinalScale.current / (1 + (ItemFinalScale.current - 1) * p2)
			
			return UDim2.new(0.5, (0.5 - (InitialZoomFocusPosition.current.X - ZoomAverageDelta.current.X) / UseScreenSizeResult.X) * UseScreenSizeResult.X * (CurrentRatio - 1), 0.5, (0.5 - (InitialZoomFocusPosition.current.Y - ZoomAverageDelta.current.Y) / UseScreenSizeResult.Y) * UseScreenSizeResult.Y * (CurrentRatio - 1))
		end) else UDim2.fromScale(0.5, 0.5),
		ref = ItemContainerRef,
		Size = if ZoomEndTransitionActive then ZoomEndTransition:map(function(p2): UDim2
			-- upvalues: ItemFinalScale (copy), UseMemoResult (copy)
			local CurrentRatio = ItemFinalScale.current / (1 + (ItemFinalScale.current - 1) * p2)
			
			return UDim2.new(CurrentRatio, 0, 0, UseMemoResult * CurrentRatio)
		end) else UDim2.new(1, 0, 0, UseMemoResult)
	}
	local t = {}
	local Element = nil
	
	if p1.type == PostTypeModule.Video then
		local AssetId = p1.assetId
		Element = ReactModule.createElement(LoadableVideo, {
			BackgroundTransparency = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			onLoaded = UseCallbackResult,
			onResolutionChanged = UseStateResult2_2,
			Position = UDim2.fromScale(0.5, 0.5),
			renderOnFailed = UseCallbackResult1,
			Size = UDim2.fromScale(1, 1),
			Video = if AssetId then "rbxassetid://" .. tostring(AssetId) else "",
			videoRef = UseRefResult2
		})
	else
		Element = ReactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = FullSizeUrl,
			loadingStrategy = LoadingStrategy.Eager,
			onLoaded = UseCallbackResult,
			renderOnFailed = UseCallbackResult1,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		})
	end
	t.ContentFeedItem = Element
	config1.ContentFeedImageContainer = CreateElementFunction(View, config2, t)
	config1.BottomBlur = if UseMemoResult2 then ReactModule.createElement(ImageBlurEffect, {
		AnchorPoint = Vector2.new(0.5, 0),
		direction = BlurDirection.Down,
		image = FullSizeUrl,
		imageSize = UseStateResult3,
		Position = UDim2.new(0.5, 0, 0.5, UseMemoResult / 2),
		Size = UDim2.new(1, 0, 0, UseMemoResult3),
		transparencyBinding = if IsPostIdMatch then NonItemTransparency else nil,
		ZIndex = if IsZooming and IsPostIdMatch then -3 else 0
	}) else nil
	config1.BottomBar = ReactModule.createElement(View, {
		tag = "auto-y anchor-bottom-center position-bottom-center bg-action-subtle size-full-0 col align-x-left align-y-bottom",
		ZIndex = 2,
		GroupTransparency = NonItemTransparency:map(function(p2)
			return p2
		end)
	}, {
		Overlay = ReactModule.createElement(FeedOverlayModule, {
			additionalInfo = p1.additionalInfo,
			caption = p1.caption,
			creatorUserId = p1.creatorUserId,
			postId = p1.postId,
			uploadedAtTimestamp = p1.uploadedAtTimestamp
		}),
		ExperienceInfo = ReactModule.createElement(ExperienceInfoModule, {
			layoutOrder = 2,
			placeId = p1.placeId,
			postId = p1.postId,
			universeId = p1.universeId
		})
	})
	
	return CreateElementFunction1(View, config, config1)
end