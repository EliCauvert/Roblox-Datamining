local Parent = script:FindFirstAncestor("VideoPlayer").Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)

return function(p1)
	-- upvalues: ReactModule (copy), ArgCheckModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return Content.fromUri(p1.video)
	end, { p1.video })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onVideoLooped then
			p1.onVideoLooped()
		end
	end, { p1.onVideoLooped })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onVideoEnded then
			p1.onVideoEnded()
		end
	end, { p1.onVideoEnded })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ArgCheckModule (upval)
		local Current = p1.videoPlayerRef.current
		local Current1 = p1.videoDisplayRef.current
		ArgCheckModule.assert(Current ~= nil and Current1 ~= nil, "VideoPlayerWrapper expects videoPlayer and videoDisplay refs to be set before wiring")
		local Wire = Instance.new("Wire")
		Wire.SourceInstance = Current
		Wire.TargetInstance = Current1
		Wire.Parent = Current
		local VideoAudioOutput = Instance.new("AudioDeviceOutput")
		VideoAudioOutput.Name = "VideoAudioOutput"
		VideoAudioOutput.Parent = Current
		local Wire1 = Instance.new("Wire")
		Wire1.SourceInstance = Current
		Wire1.TargetInstance = VideoAudioOutput
		Wire1.Parent = Current
		
		return function()
			-- upvalues: Wire1 (copy), VideoAudioOutput (copy), Wire (copy)
			Wire1:Destroy()
			VideoAudioOutput:Destroy()
			Wire:Destroy()
		end
	end, { p1.videoPlayerRef, p1.videoDisplayRef })
	
	return ReactModule.createElement("VideoPlayer", {
		Name = "VideoPlayer",
		VideoContent = UseMemoResult,
		Volume = if p1.muted then 0 else 1,
		Looping = p1.looped or false,
		[ReactModule.Event.DidLoop] = UseResult,
		[ReactModule.Event.DidEnd] = UseResult1,
		ref = p1.videoPlayerRef
	})
end