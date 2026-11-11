local RunService = game:GetService("RunService")
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local MediaPlayerModule = require(ProfilePlatform.Components.Videos.MediaPlayer)
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector
local ResponsiveModule = require(Parent.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback

return (ReactModule.forwardRef(function(p1, p2)
	-- upvalues: ReactModule (copy), UseLastInputFunction (copy), RunService (copy), VideoPlaybackDetector (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), ResponsiveModule (copy), VideoPlaybackDetectionMethod (copy), MediaPlayerModule (copy)
	local VideoId = p1.videoId
	local UseRefResult = ReactModule.useRef(nil)
	local IsFullscreen = p1.isFullscreen or false
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.isMuted == nil or p1.isMuted)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseLastInputResult = UseLastInputFunction()
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseStateResult (copy), UseStateResult1 (copy), UseStateResult4 (copy)
		return {
			setTimePosition = function(TimePosition)
				-- upvalues: UseRefResult (upval)
				local Current = UseRefResult.current
				
				if Current then
					Current.TimePosition = TimePosition
				end
			end,
			toggleMute = function()
				-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
				UseStateResult2(not UseStateResult)
			end,
			togglePlayPause = function()
				-- upvalues: UseRefResult (upval), UseStateResult1 (upval), UseStateResult4 (upval)
				local Current = UseRefResult.current
				
				if not Current then return end
				if UseStateResult1 then
					Current:Pause()
					
					return
				end
				if UseStateResult4 - 0.2 <= Current.TimePosition then
					Current.TimePosition = 0
				end
				Current:Play()
			end
		}
	end, { UseStateResult, UseStateResult1, UseStateResult4 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.Volume = if UseStateResult then 0 else 1
		end
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval)
		return (ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		}))
	end, {})
	local UseResult2 = ReactModule.useCallback(function(_)
		-- upvalues: UseRefResult (copy), UseResult (copy), UseStateResult2_3 (copy)
		local Current = UseRefResult.current
		
		if Current then
			UseResult()
			UseStateResult2_3(Current.TimeLength)
			
			return
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(true)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult4 (copy), UseStateResult1 (copy)
		local Current = UseRefResult.current
		
		if not Current or UseStateResult4 == 0 then return end
		if UseStateResult1 and UseStateResult4 - 0.2 <= Current.TimePosition then
			Current.TimePosition = 0
		end
	end, { UseStateResult1, UseStateResult4 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult4 (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if not Current or UseStateResult4 == 0 then return end
		if p1.initialTimePosition then
			if UseStateResult4 - 0.2 <= p1.initialTimePosition then
				Current.TimePosition = 0
				
				return
			end
			Current.TimePosition = p1.initialTimePosition
		end
	end, { p1.initialTimePosition, UseStateResult4 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), IsFullscreen (copy), UseStateResult2_1 (copy)
		local Current = UseRefResult.current
		
		if Current and IsFullscreen then
			Current:Play()
			UseStateResult2_1(true)
		end
	end, { IsFullscreen })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), RunService (upval), UseStateResult2_3 (copy), p1 (copy), UseStateResult1 (copy), UseStateResult (copy), UseStateResult2_1 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local RenderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: Current (copy), UseStateResult2_3 (upval), p1 (upval), UseStateResult1 (upval), UseStateResult (upval)
			local TimePosition = Current.TimePosition
			local TimeLength = Current.TimeLength
			UseStateResult2_3(TimeLength)
			
			if p1.onTimeUpdate then
				p1.onTimeUpdate(TimePosition)
			end
			if p1.onProgressUpdate then
				p1.onProgressUpdate(TimePosition, TimeLength, UseStateResult1, UseStateResult)
			end
		end)
		local PlayedConnection = Current.Played:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(true)
		end)
		local PausedConnection = Current.Paused:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(false)
		end)
		local EndedConnection = Current.Ended:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(false)
		end)
		
		return function()
			-- upvalues: RenderSteppedConnection (copy), PlayedConnection (copy), PausedConnection (copy), EndedConnection (copy)
			RenderSteppedConnection:Disconnect()
			PlayedConnection:Disconnect()
			PausedConnection:Disconnect()
			EndedConnection:Disconnect()
		end
	end, {
		UseStateResult,
		UseStateResult1,
		p1.onProgressUpdate,
		p1.onTimeUpdate
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = not IsFullscreen,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 1),
		ZIndex = if IsFullscreen then 1000 else 1,
		ref = UseRefResult1,
		[ReactModule.Event.MouseEnter] = UseResult3,
		[ReactModule.Event.MouseLeave] = UseResult4
	}, {
		VideoPlaybackDetector = if IsFullscreen then nil else ReactModule.createElement(VideoPlaybackDetector, {
			isVideoEligible = true,
			itemIndex = nil,
			videoDwellTimeInSec = 1,
			videoVisiblePercent = 80,
			isHovered = UseStateResult3,
			isHoverSupported = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else UseLastInputResult ~= ResponsiveModule.Input.Touch,
			playbackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback and UseLastInputResult ~= ResponsiveModule.Input.Touch then VideoPlaybackDetectionMethod.Hover else nil,
			onPlaybackChange = function(p3)
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(p3)
			end,
			itemFrameRef = UseRefResult1,
			videoKey = VideoId,
			videoPlaybackCoordinator = p1.videoPlaybackCoordinator
		}),
		VideoContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			ZIndex = if IsFullscreen then 1001 else 1
		}, {
			VideoContent = ReactModule.createElement(MediaPlayerModule, {
				cornerRadius = p1.cornerRadius,
				isFullScreen = IsFullscreen,
				Looped = p1.looped,
				onExpandCallback = function()
					-- upvalues: p1 (copy), UseRefResult (copy)
					if p1.onExpandCallback then
						p1.onExpandCallback(UseRefResult.current and UseRefResult.current.TimePosition or 0)
					end
				end,
				onVideoLoaded = UseResult2,
				Playing = UseStateResult1,
				Position = UDim2.fromScale(0.5, 0.5),
				renderOnFailed = UseResult1,
				Size = UDim2.fromScale(1, 1),
				thumbnailImage = p1.thumbnailImage,
				timeLength = UseStateResult4,
				Video = VideoId,
				videoRef = UseRefResult,
				ZIndex = if IsFullscreen then 1001 else 1
			})
		})
	})
end))