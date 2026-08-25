local reactModule = require(script:FindFirstAncestor("VideoUtils").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref)
		local var1 = if p0.videoFrameRef then p0.videoFrameRef.current else nil
		
		return function()
			-- upvalues: var1 (ref)
			if var1 then
				var1.Video = ""
			end
		end
	end, { p0.videoFrameRef })
	
	return reactModule.createElement("VideoFrame", {
		Size = UDim2.fromScale(1, 1),
		Video = if p0.isPlaying then p0.video else "",
		Playing = p0.isPlaying,
		Looped = p0.looped,
		Volume = p0.volume,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p0.zIndex or 1,
		ref = p0.videoFrameRef,
		[reactModule.Event.Loaded] = p0.onLoaded,
		[reactModule.Event.DidLoop] = p0.onLooped,
		[reactModule.Event.Ended] = p0.onEnded
	}, {
		Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil
	})
end