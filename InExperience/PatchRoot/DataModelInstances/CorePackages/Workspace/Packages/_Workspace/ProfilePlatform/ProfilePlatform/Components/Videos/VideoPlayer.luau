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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), useLastInput (ref), runService (ref), videoPlaybackDetector (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), responsiveModule (ref), videoPlaybackDetectionMethod (ref), mediaPlayerModule (ref)
	local createElement_1
	local videoId = p1.videoId
	local var1 = reactModule.useRef(nil)
	local isFullscreen = p1.isFullscreen or false
	local var2, var3 = reactModule.useState(p1.isMuted ~= nil or p1.isMuted)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7 = useLastInput()
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(0)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var1 (ref), var3 (ref), var2 (ref), var5 (ref), var10 (ref)
		return {
			setTimePosition = function(value)
				-- upvalues: var1 (copy)
				local current = var1.current
				
				if current then
					current.TimePosition = value
				end
			end,
			toggleMute = function()
				-- upvalues: var3 (copy), var2 (copy)
				var3(not var2)
			end,
			togglePlayPause = function()
				-- upvalues: var1 (copy), var5 (copy), var10 (copy)
				local current = var1.current
				
				if not current then return end
				if var5 then
					current:Pause()
					
					return
				elseif var10 - 0.2 <= current.TimePosition then
					current.TimePosition = 0
				end
				current:Play()
			end
		}
	end, { var2, var5, var10 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var2 (ref)
		local current = var1.current
		
		if current then
			current.Volume = if var2 then 0 else 1
		end
	end, { var2 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		})
	end, {})
	local var14 = reactModule.useCallback(function(_)
		-- upvalues: var1 (ref), var12 (ref), var11 (ref)
		local current = var1.current
		
		if current then
			var12()
			var11(current.TimeLength)
			
			return
		end
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(true)
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(false)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		var12()
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var10 (ref), var5 (ref)
		local current = var1.current
		
		if not current or var10 == 0 then return end
		if var5 and var10 - 0.2 <= current.TimePosition then
			current.TimePosition = 0
		end
	end, { var5, var10 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var10 (ref), p1 (ref)
		local current = var1.current
		
		if not current or var10 == 0 then return end
		if p1.initialTimePosition then
			if var10 - 0.2 <= p1.initialTimePosition then
				current.TimePosition = 0
				
				return
			end
			current.TimePosition = p1.initialTimePosition
		end
	end, { p1.initialTimePosition, var10 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), isFullscreen (ref), var6 (ref)
		local current = var1.current
		
		if current and isFullscreen then
			current:Play()
			var6(true)
		end
	end, { isFullscreen })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), runService (copy), var11 (ref), p1 (ref), var5 (ref), var2 (ref), var6 (ref)
		local current = var1.current
		
		if current then
			local renderSteppedConnection = runService.RenderStepped:Connect(function()
				-- upvalues: current (ref), var11 (copy), p1 (copy), var5 (copy), var2 (copy)
				local timePosition = current.TimePosition
				local timeLength = current.TimeLength
				var11(timeLength)
				
				if p1.onTimeUpdate then
					p1.onTimeUpdate(timePosition)
				end
				if p1.onProgressUpdate then
					p1.onProgressUpdate(timePosition, timeLength, var5, var2)
				end
			end)
			local playedConnection = current.Played:Connect(function()
				-- upvalues: var6 (copy)
				var6(true)
			end)
			local pausedConnection = current.Paused:Connect(function()
				-- upvalues: var6 (copy)
				var6(false)
			end)
			local endedConnection = current.Ended:Connect(function()
				-- upvalues: var6 (copy)
				var6(false)
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref), playedConnection (ref), pausedConnection (ref), endedConnection (ref)
				renderSteppedConnection:Disconnect()
				playedConnection:Disconnect()
				pausedConnection:Disconnect()
				endedConnection:Disconnect()
			end
		end
	end, { var2, var5, p1.onProgressUpdate, p1.onTimeUpdate })
	
	local function handleExpand()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.onExpandCallback then
			p1.onExpandCallback(if var1.current then var1.current.TimePosition else 0)
		end
	end
	
	local createElement = reactModule.createElement
	local var17 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		ClipsDescendants = not isFullscreen,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 1),
		ZIndex = if isFullscreen then 1000 else 1,
		ref = var4,
		[reactModule.Event.MouseEnter] = var15,
		[reactModule.Event.MouseLeave] = var16
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
			isHovered = var8,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var7 ~= responsiveModule.Input.Touch,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback and var7 ~= responsiveModule.Input.Touch then videoPlaybackDetectionMethod.Hover else nil,
			onPlaybackChange = function(p3)
				-- upvalues: var6 (ref)
				var6(p3)
			end,
			itemFrameRef = var4,
			videoKey = videoId,
			videoPlaybackCoordinator = p1.videoPlaybackCoordinator
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
			cornerRadius = p1.cornerRadius,
			isFullScreen = isFullscreen,
			Looped = p1.looped,
			onExpandCallback = handleExpand,
			onVideoLoaded = var14,
			Playing = var5,
			Position = UDim2.fromScale(0.5, 0.5),
			renderOnFailed = var13,
			Size = UDim2.fromScale(1, 1),
			thumbnailImage = p1.thumbnailImage,
			timeLength = var10,
			Video = videoId,
			videoRef = var1,
			ZIndex = if isFullscreen then 1001 else 1
		})
	})
	
	return createElement(var17, t, t_1)
end)