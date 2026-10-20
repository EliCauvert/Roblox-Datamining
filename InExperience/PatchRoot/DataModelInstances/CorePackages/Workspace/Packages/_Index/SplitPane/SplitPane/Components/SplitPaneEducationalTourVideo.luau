local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local AppAppLifecycleObserverService = require(Parent.RoactServiceTags).AppAppLifecycleObserverService
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlayer = VideoUtilsModule.VideoPlayer
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector

return function(p1)
	-- upvalues: ReactModule (copy), UseRoactServiceFunction (copy), AppAppLifecycleObserverService (copy), VideoPlayer (copy), VideoPlaybackDetector (copy), VideoPlaybackDetectionMethod (copy), VideoPlaybackCoordinator (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRoactServiceResult = UseRoactServiceFunction(AppAppLifecycleObserverService)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), UseStateResult2_1 (copy)
		if UseRoactServiceResult == nil then return end
		local OnHideConnection = UseRoactServiceResult.OnHide:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(false)
		end)
		local OnUnhideConnection = UseRoactServiceResult.OnUnhide:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(true)
		end)
		
		return function()
			-- upvalues: OnHideConnection (copy), OnUnhideConnection (copy)
			OnHideConnection:Disconnect()
			OnUnhideConnection:Disconnect()
		end
	end, { UseRoactServiceResult })
	local NewMediaWidth = p1.mediaWidth + 2
	local Ceiled = math.ceil(NewMediaWidth / p1.videoAspectRatio)
	
	return ReactModule.createElement("Frame", {
		Name = "TourVideoPlayer",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromOffset(p1.mediaWidth, Ceiled - 1 - p1.topRadius),
		ref = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult (copy)
			UseRefResult.current = Current
		end, {})
	}, {
		Viewport = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(-1, -1),
			Size = UDim2.fromOffset(NewMediaWidth, Ceiled)
		}, {
			Player = ReactModule.createElement(VideoPlayer, {
				muted = true,
				looped = true,
				disableActivation = true,
				hideCenterPlayButton = true,
				video = p1.videoAssetId,
				shouldStartPlayback = UseStateResult,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Crop,
				cornerRadius = p1.topRadius + 1
			})
		}),
		PlaybackDetector = ReactModule.createElement(VideoPlaybackDetector, {
			videoKey = "SplitPaneEducationalTour",
			isHoverSupported = true,
			videoDwellTimeInSec = 0,
			videoVisiblePercent = 0,
			isVideoEligible = true,
			itemFrameRef = UseRefResult,
			playbackDetectionMethod = VideoPlaybackDetectionMethod.Selection,
			isHovered = UseStateResult1,
			isSelected = UseStateResult1,
			videoPlaybackCoordinator = VideoPlaybackCoordinator.default,
			onPlaybackChange = UseStateResult2
		})
	})
end