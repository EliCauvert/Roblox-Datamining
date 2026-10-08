local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local appAppLifecycleObserverService = require(parent.RoactServiceTags).AppAppLifecycleObserverService
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local videoUtilsModule = require(parent.VideoUtils)
local videoPlayer = videoUtilsModule.VideoPlayer
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local videoPlaybackDetectionMethod = videoUtilsModule.VideoPlaybackDetectionMethod
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector

return function(p1)
	-- upvalues: reactModule (ref), useRoactService (ref), appAppLifecycleObserverService (ref), videoPlayer (ref), videoPlaybackDetector (ref), videoPlaybackDetectionMethod (ref), videoPlaybackCoordinator (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(false)
	local var4 = useRoactService(appAppLifecycleObserverService)
	local var5, var6 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref)
		if var4 == nil then
			return
		end
		local onHideConnection = var4.OnHide:Connect(function()
			-- upvalues: var6 (copy)
			var6(false)
		end)
		local onUnhideConnection = var4.OnUnhide:Connect(function()
			-- upvalues: var6 (copy)
			var6(true)
		end)
		
		return function()
			-- upvalues: onHideConnection (ref), onUnhideConnection (ref)
			onHideConnection:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var4 })
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.current = p2
	end, {})
	local var8 = p1.mediaWidth + 2
	local ceiled = math.ceil(var8 / p1.videoAspectRatio)
	
	return reactModule.createElement("Frame", {
		Name = "TourVideoPlayer",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromOffset(p1.mediaWidth, ceiled - 1 - p1.topRadius),
		ref = var7
	}, {
		Viewport = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(-1, -1),
			Size = UDim2.fromOffset(var8, ceiled)
		}, {
			Player = reactModule.createElement(videoPlayer, {
				muted = true,
				looped = true,
				disableActivation = true,
				hideCenterPlayButton = true,
				video = p1.videoAssetId,
				shouldStartPlayback = var2,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Crop,
				cornerRadius = p1.topRadius + 1
			})
		}),
		PlaybackDetector = reactModule.createElement(videoPlaybackDetector, {
			videoKey = "SplitPaneEducationalTour",
			isHoverSupported = true,
			videoDwellTimeInSec = 0,
			videoVisiblePercent = 0,
			isVideoEligible = true,
			itemFrameRef = var1,
			playbackDetectionMethod = videoPlaybackDetectionMethod.Selection,
			isHovered = var5,
			isSelected = var5,
			videoPlaybackCoordinator = videoPlaybackCoordinator.default,
			onPlaybackChange = var3
		})
	})
end