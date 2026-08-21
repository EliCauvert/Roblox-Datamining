local parent = script:FindFirstAncestor("VideoPlayer").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)

return function(p0) --[[ line: 16 | named "VideoPlayerWrapper" ]]
	-- upvalues: reactModule (ref), argCheckModule (ref)
	local var2 = reactModule.useMemo(function() --[[ line: 17 ]]
		-- upvalues: p0 (ref)
		return Content.fromUri(p0.video)
	end, { p0.video })
	local var3 = reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: p0 (ref)
		if p0.onVideoLooped then
			p0.onVideoLooped()
		end
	end, { p0.onVideoLooped })
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: p0 (ref), argCheckModule (copy)
		local current = p0.videoPlayerRef.current
		local current_1 = p0.videoDisplayRef.current
		argCheckModule.assert(current ~= nil and current_1 ~= nil, "VideoPlayerWrapper expects videoPlayer and videoDisplay refs to be set before wiring")
		local wire = Instance.new("Wire")
		wire.SourceInstance = current
		wire.TargetInstance = current_1
		wire.Parent = current
		
		return function() --[[ line: 38 ]]
			-- upvalues: wire (ref)
			wire:Destroy()
		end
	end, { p0.videoPlayerRef, p0.videoDisplayRef })
	
	return reactModule.createElement("VideoPlayer", {
		Name = "VideoPlayer",
		VideoContent = var2,
		Volume = if p0.muted then 0 else 1,
		Looping = p0.looped or false,
		[reactModule.Event.DidLoop] = var3,
		ref = p0.videoPlayerRef
	})
end