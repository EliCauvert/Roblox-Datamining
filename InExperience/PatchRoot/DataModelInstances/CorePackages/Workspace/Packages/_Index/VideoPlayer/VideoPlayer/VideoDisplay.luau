local parent = script:FindFirstAncestor("VideoPlayer").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local videoPlayerWrapperModule = require(script.Parent.VideoPlayerWrapper)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = require(parent.SharedFlags).FFlagLuaAppSponsoredAdVideoViewabilityEnabled

return function(p0) --[[ line: 40 | named "VideoDisplay" ]]
	-- upvalues: reactModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), argCheckModule (ref), videoPlayerWrapperModule (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	var7.current = p0.onVideoLoaded
	local var8 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then reactModule.useRef(0) else nil
	local var9 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then reactModule.useCallback(function() --[[ line: 51 ]]
		-- upvalues: var8 (ref), p0 (ref)
		var8.current += 1
		
		if p0.onVideoLooped then
			p0.onVideoLooped()
		end
	end, { p0.onVideoLooped }) else nil
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		reactModule.useEffect(function() --[[ line: 60 ]]
			-- upvalues: var8 (ref)
			var8.current = 0
		end, { p0.video })
		reactModule.useEffect(function() --[[ line: 64 ]]
			-- upvalues: p0 (ref), var4 (ref), var8 (ref)
			local videoPlaybackStateRef = p0.videoPlaybackStateRef
			
			if videoPlaybackStateRef == nil then
				return
			end
			local var10 = function() --[[ line: 70 ]]
				-- upvalues: var4 (copy), var8 (copy)
				local current = var4.current
				
				return if current then {
					isPlaying = current.IsPlaying,
					playbackPositionMs = math.round(math.max(0, current.TimePosition) * 1000),
					videoLengthMs = if current.TimeLength > 0 then math.round(current.TimeLength * 1000) else nil,
					loopCount = var8.current
				} else nil
			end
			
			videoPlaybackStateRef.current = var10
			
			return function() --[[ line: 87 ]]
				-- upvalues: videoPlaybackStateRef (ref), var10 (ref)
				if videoPlaybackStateRef.current == var10 then
					videoPlaybackStateRef.current = nil
				end
			end
		end, { p0.videoPlaybackStateRef, p0.video })
	end
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: var6 (ref), p0 (ref), var4 (ref), argCheckModule (copy), var7 (ref)
		var6(false)
		
		if p0.shouldStartPlayback then
			local current = var4.current
			argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before loading")
			local var11 = false
			task.spawn(function() --[[ line: 103 ]]
				-- upvalues: current (ref), var11 (write), var7 (copy), var6 (copy)
				local currentTime = tick()
				local ok, status = pcall(function() --[[ line: 105 ]]
					-- upvalues: current (copy)
					return current:LoadAsync()
				end)
				
				if var11 then return end
				if not ok or status ~= Enum.AssetFetchStatus.Success then return end
				if var7.current then
					var7.current(current.TimeLength, tick() - currentTime)
				end
				var6(true)
			end)
			
			return function() --[[ line: 119 ]]
				-- upvalues: var11 (write)
				var11 = true
			end
		end
	end, { p0.video, p0.shouldStartPlayback })
	reactModule.useEffect(function() --[[ line: 124 ]]
		-- upvalues: var5 (ref), var4 (ref), argCheckModule (copy), p0 (ref)
		if not var5 then return end
		local current = var4.current
		argCheckModule.assert(current ~= nil, "VideoDisplay expects videoPlayer ref to be set before playback")
		
		if p0.shouldStartPlayback then
			current.TimePosition = 0
			current:Play()
			
			return
		end
		current:Pause()
	end, { var5, p0.shouldStartPlayback })
	
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
			Visible = p0.shouldStartPlayback,
			ref = var3
		}, {
			Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil,
			VideoPlayer = reactModule.createElement(videoPlayerWrapperModule, {
				video = p0.video,
				muted = p0.muted,
				looped = p0.looped,
				videoPlayerRef = var4,
				videoDisplayRef = var3,
				onVideoLooped = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p0.videoPlaybackStateRef ~= nil then var9 else p0.onVideoLooped
			})
		})
	})
end