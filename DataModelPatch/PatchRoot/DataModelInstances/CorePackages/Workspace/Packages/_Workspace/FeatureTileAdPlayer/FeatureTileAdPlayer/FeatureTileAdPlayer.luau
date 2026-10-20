local Parent = script:FindFirstAncestor("FeatureTileAdPlayer").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local CanGoBackFunction = require(Parent.Navigation).canGoBack
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local UseLazyFmodFunction = require(Parent.MediaPlayback).useLazyFmod
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlayer = VideoUtilsModule.VideoPlayer
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local _ = require(script.Parent.types)
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay

return function(_)
	-- upvalues: UseNavigationFunction (copy), FoundationModule (copy), UseNavigationPropsFunction (copy), FFlagLuaAppHomeTouchAutoplay (copy), UseLazyFmodFunction (copy), VideoPlaybackCoordinator (copy), ReactModule (copy), CanGoBackFunction (copy), DiscoveryEventErrorLogger (copy), VideoEndReason (copy), FullscreenPageWithSafeArea (copy), VideoPlayer (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		-- upvalues: FFlagLuaAppHomeTouchAutoplay (upval)
		return {
			videoAssetId = p1.videoAssetId,
			imageAssetId = p1.imageAssetId,
			videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil
		}
	end)
	UseLazyFmodFunction()
	local VideoPlaybackCoordinator1 = if FFlagLuaAppHomeTouchAutoplay and UseNavigationPropsResult.videoPlaybackContext then UseNavigationPropsResult.videoPlaybackContext.videoPlaybackCoordinator else VideoPlaybackCoordinator.default
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CanGoBackFunction (upval), UseNavigationResult (copy), DiscoveryEventErrorLogger (upval)
		if CanGoBackFunction(UseNavigationResult) then
			UseNavigationResult.goBack()
			
			return
		else
			DiscoveryEventErrorLogger.reportError("FeatureTileAdPlayer_CloseWithNoBackStack", "FeatureTileAdPlayer close pressed but navigation stack cannot go back")
		end
	end, { UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: VideoPlaybackCoordinator1 (copy), VideoEndReason (upval)
		VideoPlaybackCoordinator1:forcePlayback("FeatureTileAdPlayer", "FeatureTileAdPlayer started")
		
		return function()
			-- upvalues: VideoPlaybackCoordinator1 (upval), VideoEndReason (upval)
			VideoPlaybackCoordinator1:cancelPlayback("FeatureTileAdPlayer", VideoEndReason.Unmounted)
		end
	end, { VideoPlaybackCoordinator1 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, { BackgroundTransparency = 1, includeStatusBar = true }, {
		Root = ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
			Backdrop = ReactModule.createElement(FoundationModule.View, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.fromScale(1, 1),
				onActivated = UseResult,
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				}
			}),
			VideoContainer = ReactModule.createElement(FoundationModule.View, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Visible = UseStateResult ~= nil
			}, {
				VideoFrameContainer = ReactModule.createElement(FoundationModule.View, {
					BackgroundTransparency = 1,
					ZIndex = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromScale(1, 1),
					aspectRatio = if UseStateResult then {
						AspectRatio = UseStateResult,
						AspectType = Enum.AspectType.FitWithinMaxSize
					} else nil
				}, {
					Video = ReactModule.createElement(VideoPlayer, {
						shouldStartPlayback = true,
						muted = false,
						looped = false,
						ZIndex = 1,
						disableActivation = true,
						hideCenterPlayButton = true,
						video = "rbxassetid://" .. UseNavigationPropsResult.videoAssetId,
						thumbnail = "rbxassetid://" .. UseNavigationPropsResult.imageAssetId,
						Size = UDim2.fromScale(1, 1),
						ScaleType = Enum.ScaleType.Fit,
						onAspectRatioChanged = UseStateResult2
					}),
					InputSink = ReactModule.createElement(FoundationModule.View, {
						BackgroundTransparency = 1,
						ZIndex = 2,
						Size = UDim2.fromScale(1, 1),
						onActivated = function() end,
						stateLayer = {
							affordance = FoundationModule.Enums.StateLayerAffordance.None
						}
					}),
					CloseButton = ReactModule.createElement(FoundationModule.View, {
						ZIndex = 3,
						AnchorPoint = Vector2.new(1, 0),
						Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
						Size = UDim2.fromOffset(UseTokensResult.Size.Size_900, UseTokensResult.Size.Size_900),
						onActivated = UseResult,
						backgroundStyle = UseTokensResult.Color.Extended.Black.Black_60,
						cornerRadius = UDim.new(0, UseTokensResult.Radius.Circle)
					}, {
						Icon = ReactModule.createElement(FoundationModule.Icon, {
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							name = FoundationModule.Enums.IconName.X,
							size = FoundationModule.Enums.IconSize.Small,
							style = UseTokensResult.Color.Extended.White.White_100
						})
					})
				})
			})
		})
	})
end