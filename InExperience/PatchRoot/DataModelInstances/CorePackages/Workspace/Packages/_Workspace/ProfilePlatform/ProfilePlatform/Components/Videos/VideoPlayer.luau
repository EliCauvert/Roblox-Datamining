local runService = game:GetService("RunService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local mediaPlayerModule = require(profilePlatform.Components.Videos.MediaPlayer)
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackDetectionMethod = videoUtilsModule.VideoPlaybackDetectionMethod
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback

return reactModule.forwardRef(function(p0, p1) --[[ line: 38 ]]
	-- upvalues: reactModule (ref), useLastInput (ref), runService (ref), videoPlaybackDetector (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), responsiveModule (ref), videoPlaybackDetectionMethod (ref), mediaPlayerModule (ref)
	local createElement_1
	local videoId = p0.videoId
	local var6 = reactModule.useRef(nil)
	local isFullscreen = p0.isFullscreen or false
	local var8, var9 = reactModule.useState(p0.isMuted ~= nil or p0.isMuted)
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useState(false)
	local var13 = useLastInput()
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(0)
	reactModule.useImperativeHandle(p1, function() --[[ line: 49 ]]
		-- upvalues: var6 (ref), var9 (ref), var8 (ref), var11 (ref), var16 (ref)
		return {
			setTimePosition = function(value) --[[ line: 51 ]]
				-- upvalues: var6 (copy)
				local current = var6.current
				
				if current then
					current.TimePosition = value
				end
			end,
			toggleMute = function() --[[ line: 57 ]]
				-- upvalues: var9 (copy), var8 (copy)
				var9(not var8)
			end,
			togglePlayPause = function() --[[ line: 60 ]]
				-- upvalues: var6 (copy), var11 (copy), var16 (copy)
				local current = var6.current
				
				if not current then return end
				if var11 then
					current:Pause()
					
					return
				elseif var16 - 0.2 <= current.TimePosition then
					current.TimePosition = 0
				end
				current:Play()
			end
		}
	end, { var8, var11, var16 })
	local var18 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: var6 (ref), var8 (ref)
		local current = var6.current
		
		if current then
			current.Volume = if var8 then 0 else 1
		end
	end, { var8 })
	local var19 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		})
	end, {})
	local var20 = reactModule.useCallback(function(_) --[[ line: 91 ]]
		-- upvalues: var6 (ref), var18 (ref), var17 (ref)
		local current = var6.current
		
		if current then
			var18()
			var17(current.TimeLength)
			
			return
		end
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 100 ]]
		-- upvalues: var15 (ref)
		var15(true)
	end, {})
	local var22 = reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: var15 (ref)
		var15(false)
	end, {})
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: var18 (ref)
		var18()
	end, { var8 })
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var6 (ref), var16 (ref), var11 (ref)
		local current = var6.current
		
		if not current or var16 == 0 then return end
		if var11 and var16 - 0.2 <= current.TimePosition then
			current.TimePosition = 0
		end
	end, { var11, var16 })
	reactModule.useEffect(function() --[[ line: 124 ]]
		-- upvalues: var6 (ref), var16 (ref), p0 (ref)
		local current = var6.current
		
		if not current or var16 == 0 then return end
		if p0.initialTimePosition then
			if var16 - 0.2 <= p0.initialTimePosition then
				current.TimePosition = 0
				
				return
			end
			current.TimePosition = p0.initialTimePosition
		end
	end, { p0.initialTimePosition, var16 })
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: var6 (ref), isFullscreen (ref), var12 (ref)
		local current = var6.current
		
		if current and isFullscreen then
			current:Play()
			var12(true)
		end
	end, { isFullscreen })
	reactModule.useEffect(function() --[[ line: 147 ]]
		-- upvalues: var6 (ref), runService (copy), var17 (ref), p0 (ref), var11 (ref), var8 (ref), var12 (ref)
		local current = var6.current
		
		if current then
			local renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 153 ]]
				-- upvalues: current (ref), var17 (copy), p0 (copy), var11 (copy), var8 (copy)
				local timePosition = current.TimePosition
				local timeLength = current.TimeLength
				var17(timeLength)
				
				if p0.onTimeUpdate then
					p0.onTimeUpdate(timePosition)
				end
				if p0.onProgressUpdate then
					p0.onProgressUpdate(timePosition, timeLength, var11, var8)
				end
			end)
			local playedConnection = current.Played:Connect(function() --[[ line: 165 ]]
				-- upvalues: var12 (copy)
				var12(true)
			end)
			local pausedConnection = current.Paused:Connect(function() --[[ line: 169 ]]
				-- upvalues: var12 (copy)
				var12(false)
			end)
			local endedConnection = current.Ended:Connect(function() --[[ line: 173 ]]
				-- upvalues: var12 (copy)
				var12(false)
			end)
			
			return function() --[[ line: 177 ]]
				-- upvalues: renderSteppedConnection (ref), playedConnection (ref), pausedConnection (ref), endedConnection (ref)
				renderSteppedConnection:Disconnect()
				playedConnection:Disconnect()
				pausedConnection:Disconnect()
				endedConnection:Disconnect()
			end
		end
	end, { var8, var11, p0.onProgressUpdate, p0.onTimeUpdate })
	
	local function handleExpand() --[[ line: 185 ]]
		-- upvalues: p0 (ref), var6 (ref)
		if p0.onExpandCallback then
			p0.onExpandCallback(if var6.current then var6.current.TimePosition else 0)
		end
	end
	
	local createElement = reactModule.createElement
	local var24 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		ClipsDescendants = not isFullscreen,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.fromScale(1, 1),
		ZIndex = if isFullscreen then 1000 else 1,
		ref = var10,
		[reactModule.Event.MouseEnter] = var21,
		[reactModule.Event.MouseLeave] = var22
	}
	local t_1 = {}
	
	if isFullscreen then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(videoPlaybackDetector, {
			isVideoEligible = true,
			itemIndex = nil,
			videoDwellTimeInSec = 1,
			videoVisiblePercent = 80,
			isHovered = var14,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var13 ~= responsiveModule.Input.Touch,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback and var13 ~= responsiveModule.Input.Touch then videoPlaybackDetectionMethod.Hover else nil,
			onPlaybackChange = function(p2) --[[ line: 213 ]]
				-- upvalues: var12 (ref)
				var12(p2)
			end,
			itemFrameRef = var10,
			videoKey = videoId,
			videoPlaybackCoordinator = p0.videoPlaybackCoordinator
		})
	end
	t_1.VideoPlaybackDetector = createElement_1
	t_1.VideoContainer = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		ZIndex = if isFullscreen then 1001 else 1
	}, {
		VideoContent = reactModule.createElement(mediaPlayerModule, {
			cornerRadius = p0.cornerRadius,
			isFullScreen = isFullscreen,
			Looped = p0.looped,
			onExpandCallback = handleExpand,
			onVideoLoaded = var20,
			Playing = var11,
			Position = UDim2.fromScale(0.5, 0.5),
			renderOnFailed = var19,
			Size = UDim2.fromScale(1, 1),
			thumbnailImage = p0.thumbnailImage,
			timeLength = var16,
			Video = videoId,
			videoRef = var6,
			ZIndex = if isFullscreen then 1001 else 1
		})
	})
	
	return createElement(var24, t, t_1)
end)