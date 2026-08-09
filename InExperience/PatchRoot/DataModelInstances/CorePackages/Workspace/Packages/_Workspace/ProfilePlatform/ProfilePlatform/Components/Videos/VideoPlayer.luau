local runService = game:GetService("RunService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local mediaPlayerModule = require(profilePlatform.Components.Videos.MediaPlayer)
local videoPlaybackDetector = require(parent.VideoUtils).VideoPlaybackDetector
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput

return reactModule.forwardRef(function(p0, p1) --[[ line: 35 ]]
	-- upvalues: reactModule (ref), useLastInput (ref), runService (ref), videoPlaybackDetector (ref), responsiveModule (ref), mediaPlayerModule (ref)
	local videoId = p0.videoId
	local var5 = reactModule.useRef(nil)
	local isFullscreen = p0.isFullscreen or false
	local var7, var8 = reactModule.useState(p0.isMuted ~= nil or p0.isMuted)
	local var9 = reactModule.useRef(nil)
	local var10, var11 = reactModule.useState(false)
	local var12 = useLastInput()
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(0)
	reactModule.useImperativeHandle(p1, function() --[[ line: 46 ]]
		-- upvalues: var5 (ref), var8 (ref), var7 (ref), var10 (ref), var15 (ref)
		return {
			setTimePosition = function(value) --[[ line: 48 ]]
				-- upvalues: var5 (copy)
				local current = var5.current
				
				if current then
					current.TimePosition = value
				end
			end,
			toggleMute = function() --[[ line: 54 ]]
				-- upvalues: var8 (copy), var7 (copy)
				var8(not var7)
			end,
			togglePlayPause = function() --[[ line: 57 ]]
				-- upvalues: var5 (copy), var10 (copy), var15 (copy)
				local current = var5.current
				
				if not current then return end
				if var10 then
					current:Pause()
					
					return
				elseif var15 - 0.2 <= current.TimePosition then
					current.TimePosition = 0
				end
				current:Play()
			end
		}
	end, { var7, var10, var15 })
	local var17 = reactModule.useCallback(function() --[[ line: 74 ]]
		-- upvalues: var5 (ref), var7 (ref)
		local current = var5.current
		
		if current then
			current.Volume = if var7 then 0 else 1
		end
	end, { var7 })
	local var18 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		})
	end, {})
	local var19 = reactModule.useCallback(function(_) --[[ line: 88 ]]
		-- upvalues: var5 (ref), var17 (ref), var16 (ref)
		local current = var5.current
		
		if current then
			var17()
			var16(current.TimeLength)
			
			return
		end
	end, {})
	local var20 = reactModule.useCallback(function() --[[ line: 97 ]]
		-- upvalues: var14 (ref)
		var14(true)
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var14 (ref)
		var14(false)
	end, {})
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: var17 (ref)
		var17()
	end, { var7 })
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var5 (ref), var15 (ref), var10 (ref)
		local current = var5.current
		
		if not current or var15 == 0 then return end
		if var10 and var15 - 0.2 <= current.TimePosition then
			current.TimePosition = 0
		end
	end, { var10, var15 })
	reactModule.useEffect(function() --[[ line: 121 ]]
		-- upvalues: var5 (ref), var15 (ref), p0 (ref)
		local current = var5.current
		
		if not current or var15 == 0 then return end
		if p0.initialTimePosition then
			if var15 - 0.2 <= p0.initialTimePosition then
				current.TimePosition = 0
				
				return
			end
			current.TimePosition = p0.initialTimePosition
		end
	end, { p0.initialTimePosition, var15 })
	reactModule.useEffect(function() --[[ line: 136 ]]
		-- upvalues: var5 (ref), isFullscreen (ref), var11 (ref)
		local current = var5.current
		
		if current and isFullscreen then
			current:Play()
			var11(true)
		end
	end, { isFullscreen })
	reactModule.useEffect(function() --[[ line: 144 ]]
		-- upvalues: var5 (ref), runService (copy), var16 (ref), p0 (ref), var10 (ref), var7 (ref), var11 (ref)
		local current = var5.current
		
		if current then
			local renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 150 ]]
				-- upvalues: current (ref), var16 (copy), p0 (copy), var10 (copy), var7 (copy)
				local timePosition = current.TimePosition
				local timeLength = current.TimeLength
				var16(timeLength)
				
				if p0.onTimeUpdate then
					p0.onTimeUpdate(timePosition)
				end
				if p0.onProgressUpdate then
					p0.onProgressUpdate(timePosition, timeLength, var10, var7)
				end
			end)
			local playedConnection = current.Played:Connect(function() --[[ line: 162 ]]
				-- upvalues: var11 (copy)
				var11(true)
			end)
			local pausedConnection = current.Paused:Connect(function() --[[ line: 166 ]]
				-- upvalues: var11 (copy)
				var11(false)
			end)
			local endedConnection = current.Ended:Connect(function() --[[ line: 170 ]]
				-- upvalues: var11 (copy)
				var11(false)
			end)
			
			return function() --[[ line: 174 ]]
				-- upvalues: renderSteppedConnection (ref), playedConnection (ref), pausedConnection (ref), endedConnection (ref)
				renderSteppedConnection:Disconnect()
				playedConnection:Disconnect()
				pausedConnection:Disconnect()
				endedConnection:Disconnect()
			end
		end
	end, { var7, var10, p0.onProgressUpdate, p0.onTimeUpdate })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = not isFullscreen,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.fromScale(1, 1),
		ZIndex = if isFullscreen then 1000 else 1,
		ref = var9,
		[reactModule.Event.MouseEnter] = var20,
		[reactModule.Event.MouseLeave] = var21
	}, {
		VideoPlaybackDetector = if not isFullscreen then reactModule.createElement(videoPlaybackDetector, {
			isVideoEligible = true,
			itemIndex = nil,
			videoDwellTimeInSec = 1,
			videoVisiblePercent = 80,
			isHovered = var13,
			isHoverSupported = var12 ~= responsiveModule.Input.Touch,
			onPlaybackChange = function(p2) --[[ line: 204 ]]
				-- upvalues: var11 (ref)
				var11(p2)
			end,
			itemFrameRef = var9,
			videoKey = videoId,
			videoPlaybackCoordinator = p0.videoPlaybackCoordinator
		}) else nil,
		VideoContainer = reactModule.createElement("Frame", {
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
				onExpandCallback = function() --[[ line: 182 ]]
					-- upvalues: p0 (ref), var5 (ref)
					if p0.onExpandCallback then
						p0.onExpandCallback(if var5.current then var5.current.TimePosition else 0)
					end
				end,
				onVideoLoaded = var19,
				Playing = var10,
				Position = UDim2.fromScale(0.5, 0.5),
				renderOnFailed = var18,
				Size = UDim2.fromScale(1, 1),
				thumbnailImage = p0.thumbnailImage,
				timeLength = var15,
				Video = videoId,
				videoRef = var5,
				ZIndex = if isFullscreen then 1001 else 1
			})
		})
	})
end)