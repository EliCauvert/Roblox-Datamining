local parent = script:FindFirstAncestor("VideoPlayer").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)

return function(p1)
	-- upvalues: reactModule (ref), argCheckModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return Content.fromUri(p1.video)
	end, { p1.video })
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onVideoLooped then
			p1.onVideoLooped()
		end
	end, { p1.onVideoLooped })
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onVideoEnded then
			p1.onVideoEnded()
		end
	end, { p1.onVideoEnded })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), argCheckModule (copy)
		local current = p1.videoPlayerRef.current
		local current_1 = p1.videoDisplayRef.current
		argCheckModule.assert(current ~= nil and current_1 ~= nil, "VideoPlayerWrapper expects videoPlayer and videoDisplay refs to be set before wiring")
		local wire = Instance.new("Wire")
		wire.SourceInstance = current
		wire.TargetInstance = current_1
		wire.Parent = current
		local videoAudioOutput = Instance.new("AudioDeviceOutput")
		videoAudioOutput.Name = "VideoAudioOutput"
		videoAudioOutput.Parent = current
		local wire_1 = Instance.new("Wire")
		wire_1.SourceInstance = current
		wire_1.TargetInstance = videoAudioOutput
		wire_1.Parent = current
		
		return function()
			-- upvalues: wire_1 (ref), videoAudioOutput (ref), wire (ref)
			wire_1:Destroy()
			videoAudioOutput:Destroy()
			wire:Destroy()
		end
	end, { p1.videoPlayerRef, p1.videoDisplayRef })
	
	return reactModule.createElement("VideoPlayer", {
		Name = "VideoPlayer",
		VideoContent = var1,
		Volume = if p1.muted then 0 else 1,
		Looping = p1.looped or false,
		[reactModule.Event.DidLoop] = var2,
		[reactModule.Event.DidEnd] = var3,
		ref = p1.videoPlayerRef
	})
end