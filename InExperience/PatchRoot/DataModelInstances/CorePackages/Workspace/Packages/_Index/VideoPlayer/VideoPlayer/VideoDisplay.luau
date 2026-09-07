local parent = script:FindFirstAncestor("VideoPlayer").Parent
local runService = game:GetService("RunService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local videoPlayerWrapperModule = require(script.Parent.VideoPlayerWrapper)
local videoLoadingStateModule = require(script.Parent.VideoLoadingState)

return function(p1)
	-- upvalues: reactModule (ref), videoLoadingStateModule (ref), userGameSettingsService (ref), argCheckModule (ref), runService (ref), videoPlayerWrapperModule (ref)
	local var1 = reactModule.useRef(nil)
	local videoPlayerRef = p1.videoPlayerRef or reactModule.useRef(nil)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(videoLoadingStateModule.Idle)
	local shouldStartPlayback = p1.shouldStartPlayback or p1.loadImmediately == true
	local var9 = reactModule.useRef(nil)
	var9.current = p1.onLoadingStateChanged
	local var10 = reactModule.useRef(nil)
	var10.current = p1.onVideoLoaded
	local var11 = reactModule.useRef(nil)
	var11.current = p1.onAspectRatioChanged
	local var12 = reactModule.useRef(nil)
	var12.current = p1.onVideoProgressChanged
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var9 (ref)
		var8(p2)
		
		if var9.current then
			var9.current(p2)
		end
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.current += 1
		
		if p1.onVideoLooped then
			p1.onVideoLooped()
		end
	end, { p1.onVideoLooped })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), var4 (ref)
		var2.current = 0
		var3.current = 0
		var4.current = false
	end, { p1.video })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), videoPlayerRef (ref), var2 (ref), var3 (ref), userGameSettingsService (copy)
		local videoPlaybackStateRef = p1.videoPlaybackStateRef
		
		if videoPlaybackStateRef == nil then
			return
		end
		local var15 = function()
			-- upvalues: videoPlayerRef (copy), var2 (copy), var3 (copy), userGameSettingsService (copy)
			local current = videoPlayerRef.current
			
			return if current then {
				isPlaying = current.IsPlaying,
				playbackPositionMs = math.round(math.max(0, current.TimePosition) * 1000),
				videoLengthMs = if current.TimeLength > 0 then math.round(current.TimeLength * 1000) else nil,
				loopCount = var2.current,
				endedCount = var3.current,
				audioLevel = math.clamp(current.Volume * userGameSettingsService.MasterVolume, 0, 1)
			} else nil
		end
		
		videoPlaybackStateRef.current = var15
		
		return function()
			-- upvalues: videoPlaybackStateRef (ref), var15 (ref)
			if videoPlaybackStateRef.current == var15 then
				videoPlaybackStateRef.current = nil
			end
		end
	end, { p1.videoPlaybackStateRef })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), shouldStartPlayback (ref), var13 (ref), videoLoadingStateModule (copy), videoPlayerRef (ref), argCheckModule (copy), p1 (ref), var10 (ref), var11 (ref)
		var6(false)
		
		if shouldStartPlayback then
			local current = videoPlayerRef.current
			argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before loading")
			var13(videoLoadingStateModule.Loading)
			local var15 = false
			task.spawn(function()
				-- upvalues: current (ref), var15 (write), var13 (copy), videoLoadingStateModule (copy), p1 (copy), var10 (copy), var11 (copy), var6 (copy)
				local currentTime = tick()
				local ok, status = pcall(function()
					-- upvalues: current (copy)
					return current:LoadAsync()
				end)
				
				if var15 then return end
				if not ok or status ~= Enum.AssetFetchStatus.Success then
					var13(videoLoadingStateModule.Failed)
					
					return
				elseif p1.startPlaybackProgress ~= nil then
					current.TimePosition = math.clamp(p1.startPlaybackProgress, 0, 1) * current.TimeLength
				end
				if var10.current then
					var10.current(current.TimeLength, tick() - currentTime)
				end
				local resolution = current.Resolution
				
				if var11.current and resolution and resolution.Y > 0 then
					var11.current(resolution.X / resolution.Y)
				end
				var6(true)
				var13(videoLoadingStateModule.Loaded)
			end)
			
			return function()
				-- upvalues: var15 (write)
				var15 = true
			end
		end
		var13(videoLoadingStateModule.Idle)
	end, { p1.video, shouldStartPlayback })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var3 (ref), p1 (ref)
		var4.current = true
		var3.current += 1
		
		if p1.onVideoEnded then
			p1.onVideoEnded()
		end
	end, { p1.onVideoEnded })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), videoPlayerRef (ref), argCheckModule (copy), var4 (ref), p1 (ref)
		if not var5 then return end
		local current = videoPlayerRef.current
		argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before playback")
		
		if var4.current and p1.shouldStartPlayback then
			current.TimePosition = 0
			var4.current = false
		elseif p1.shouldStartPlayback and not p1.preservePlaybackPosition then
			current.TimePosition = 0
		end
		if p1.shouldStartPlayback then
			current:Play()
			
			return
		end
		current:Pause()
	end, {
		var5,
		p1.preservePlaybackPosition,
		p1.shouldStartPlayback
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), videoPlayerRef (ref), argCheckModule (copy), runService (copy), var12 (ref)
		if var5 then
			local current = videoPlayerRef.current
			argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before reporting progress")
			local renderSteppedConnection = runService.RenderStepped:Connect(function()
				-- upvalues: var12 (copy), current (ref)
				local current_1 = var12.current
				
				if current_1 then
					current_1(if current.TimeLength > 0 then current.TimePosition / current.TimeLength else 0)
				end
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref)
				renderSteppedConnection:Disconnect()
			end
		end
	end, { var5 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = p1.Size,
		ZIndex = p1.ZIndex
	}, {
		Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil,
		Thumbnail = if p1.thumbnail and p1.thumbnail ~= "" then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = p1.thumbnail,
			Size = UDim2.fromScale(1, 1),
			ScaleType = p1.ScaleType
		}, {
			Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
		}) else nil,
		VideoDisplay = reactModule.createElement("VideoDisplay", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ScaleType = p1.ScaleType,
			Visible = var7 ~= videoLoadingStateModule.Failed and (p1.shouldStartPlayback or p1.showVideoWhenPaused == true),
			ref = var1
		}, {
			Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil,
			VideoPlayer = reactModule.createElement(videoPlayerWrapperModule, {
				video = p1.video,
				muted = p1.muted,
				looped = p1.looped,
				videoPlayerRef = videoPlayerRef,
				videoDisplayRef = var1,
				onVideoLooped = var14,
				onVideoEnded = var15
			})
		})
	})
end