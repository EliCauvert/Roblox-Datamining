local reactModule = require(script:FindFirstAncestor("VideoUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local var1 = if p1.videoFrameRef then p1.videoFrameRef.current else nil
		
		return function()
			-- upvalues: var1 (ref)
			if var1 then
				var1.Video = ""
			end
		end
	end, { p1.videoFrameRef })
	
	return reactModule.createElement("VideoFrame", {
		Size = UDim2.fromScale(1, 1),
		Video = if p1.isPlaying then p1.video else "",
		Playing = p1.isPlaying,
		Looped = p1.looped,
		Volume = p1.volume,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p1.zIndex or 1,
		ref = p1.videoFrameRef,
		[reactModule.Event.Loaded] = p1.onLoaded,
		[reactModule.Event.DidLoop] = p1.onLooped,
		[reactModule.Event.Ended] = p1.onEnded
	}, {
		Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
	})
end