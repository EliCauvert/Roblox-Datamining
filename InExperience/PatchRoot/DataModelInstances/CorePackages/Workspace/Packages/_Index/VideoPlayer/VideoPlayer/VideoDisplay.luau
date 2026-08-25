local parent = script:FindFirstAncestor("VideoPlayer").Parent
local runService = game:GetService("RunService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local videoPlayerWrapperModule = require(script.Parent.VideoPlayerWrapper)
local videoLoadingStateModule = require(script.Parent.VideoLoadingState)

return function(p0)
	-- upvalues: reactModule (ref), videoLoadingStateModule (ref), userGameSettingsService (ref), argCheckModule (ref), runService (ref), videoPlayerWrapperModule (ref)
	local var6 = reactModule.useRef(nil)
	local videoPlayerRef = p0.videoPlayerRef or reactModule.useRef(nil)
	local var8 = reactModule.useRef(0)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(videoLoadingStateModule.Idle)
	local shouldStartPlayback = p0.shouldStartPlayback or p0.loadImmediately == true
	local var16 = reactModule.useRef(nil)
	var16.current = p0.onLoadingStateChanged
	local var17 = reactModule.useRef(nil)
	var17.current = p0.onVideoLoaded
	local var18 = reactModule.useRef(nil)
	var18.current = p0.onAspectRatioChanged
	local var19 = reactModule.useRef(nil)
	var19.current = p0.onVideoProgressChanged
	local var20 = reactModule.useCallback(function(p1)
		-- upvalues: var14 (ref), var16 (ref)
		var14(p1)
		
		if var16.current then
			var16.current(p1)
		end
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), p0 (ref)
		var8.current += 1
		
		if p0.onVideoLooped then
			p0.onVideoLooped()
		end
	end, { p0.onVideoLooped })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), var10 (ref)
		var8.current = 0
		var9.current = 0
		var10.current = false
	end, { p0.video })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), videoPlayerRef (ref), var8 (ref), var9 (ref), userGameSettingsService (copy)
		local videoPlaybackStateRef = p0.videoPlaybackStateRef
		
		if videoPlaybackStateRef == nil then
			return
		end
		local var23 = function()
			-- upvalues: videoPlayerRef (copy), var8 (copy), var9 (copy), userGameSettingsService (copy)
			local current = videoPlayerRef.current
			
			return if current then {
				isPlaying = current.IsPlaying,
				playbackPositionMs = math.round(math.max(0, current.TimePosition) * 1000),
				videoLengthMs = if current.TimeLength > 0 then math.round(current.TimeLength * 1000) else nil,
				loopCount = var8.current,
				endedCount = var9.current,
				audioLevel = math.clamp(current.Volume * userGameSettingsService.MasterVolume, 0, 1)
			} else nil
		end
		
		videoPlaybackStateRef.current = var23
		
		return function()
			-- upvalues: videoPlaybackStateRef (ref), var23 (ref)
			if videoPlaybackStateRef.current == var23 then
				videoPlaybackStateRef.current = nil
			end
		end
	end, { p0.videoPlaybackStateRef })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), shouldStartPlayback (ref), var20 (ref), videoLoadingStateModule (copy), videoPlayerRef (ref), argCheckModule (copy), p0 (ref), var17 (ref), var18 (ref)
		var12(false)
		
		if shouldStartPlayback then
			local current = videoPlayerRef.current
			argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before loading")
			var20(videoLoadingStateModule.Loading)
			local var24 = false
			task.spawn(function()
				-- upvalues: current (ref), var24 (write), var20 (copy), videoLoadingStateModule (copy), p0 (copy), var17 (copy), var18 (copy), var12 (copy)
				local currentTime = tick()
				local ok, status = pcall(function()
					-- upvalues: current (copy)
					return current:LoadAsync()
				end)
				
				if var24 then return end
				if not ok or status ~= Enum.AssetFetchStatus.Success then
					var20(videoLoadingStateModule.Failed)
					
					return
				elseif p0.startPlaybackProgress ~= nil then
					current.TimePosition = math.clamp(p0.startPlaybackProgress, 0, 1) * current.TimeLength
				end
				if var17.current then
					var17.current(current.TimeLength, tick() - currentTime)
				end
				local resolution = current.Resolution
				
				if var18.current and resolution and resolution.Y > 0 then
					var18.current(resolution.X / resolution.Y)
				end
				var12(true)
				var20(videoLoadingStateModule.Loaded)
			end)
			
			return function()
				-- upvalues: var24 (write)
				var24 = true
			end
		end
		var20(videoLoadingStateModule.Idle)
	end, { p0.video, shouldStartPlayback })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var9 (ref), p0 (ref)
		var10.current = true
		var9.current += 1
		
		if p0.onVideoEnded then
			p0.onVideoEnded()
		end
	end, { p0.onVideoEnded })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), videoPlayerRef (ref), argCheckModule (copy), var10 (ref), p0 (ref)
		if not var11 then return end
		local current = videoPlayerRef.current
		argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before playback")
		
		if var10.current and p0.shouldStartPlayback then
			current.TimePosition = 0
			var10.current = false
		elseif p0.shouldStartPlayback and not p0.preservePlaybackPosition then
			current.TimePosition = 0
		end
		if p0.shouldStartPlayback then
			current:Play()
			
			return
		end
		current:Pause()
	end, {
		var11,
		p0.preservePlaybackPosition,
		p0.shouldStartPlayback
	})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), videoPlayerRef (ref), argCheckModule (copy), runService (copy), var19 (ref)
		if var11 then
			local current = videoPlayerRef.current
			argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before reporting progress")
			local renderSteppedConnection = runService.RenderStepped:Connect(function()
				-- upvalues: var19 (copy), current (ref)
				local current_1 = var19.current
				
				if current_1 then
					current_1(if current.TimeLength > 0 then current.TimePosition / current.TimeLength else 0)
				end
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref)
				renderSteppedConnection:Disconnect()
			end
		end
	end, { var11 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = p0.Size,
		ZIndex = p0.ZIndex
	}, {
		Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil,
		Thumbnail = if p0.thumbnail and p0.thumbnail ~= "" then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = p0.thumbnail,
			Size = UDim2.fromScale(1, 1),
			ScaleType = p0.ScaleType
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil
		}) else nil,
		VideoDisplay = reactModule.createElement("VideoDisplay", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ScaleType = p0.ScaleType,
			Visible = var13 ~= videoLoadingStateModule.Failed and (p0.shouldStartPlayback or p0.showVideoWhenPaused == true),
			ref = var6
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil,
			VideoPlayer = reactModule.createElement(videoPlayerWrapperModule, {
				video = p0.video,
				muted = p0.muted,
				looped = p0.looped,
				videoPlayerRef = videoPlayerRef,
				videoDisplayRef = var6,
				onVideoLooped = var21,
				onVideoEnded = var22
			})
		})
	})
end