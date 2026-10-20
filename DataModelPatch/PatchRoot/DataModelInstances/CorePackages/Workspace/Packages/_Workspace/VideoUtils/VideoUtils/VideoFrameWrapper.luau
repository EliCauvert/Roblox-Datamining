local ReactModule = require(script:FindFirstAncestor("VideoUtils").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		local Current = if p1.videoFrameRef then p1.videoFrameRef.current else nil
		
		return function()
			-- upvalues: Current (copy)
			if Current then
				Current.Video = ""
			end
		end
	end, { p1.videoFrameRef })
	
	return ReactModule.createElement("VideoFrame", {
		Size = UDim2.fromScale(1, 1),
		Video = if p1.isPlaying then p1.video else "",
		Playing = p1.isPlaying,
		Looped = p1.looped,
		Volume = p1.volume,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p1.zIndex or 1,
		ref = p1.videoFrameRef,
		[ReactModule.Event.Loaded] = p1.onLoaded,
		[ReactModule.Event.DidLoop] = p1.onLooped,
		[ReactModule.Event.Ended] = p1.onEnded
	}, {
		Corner = if p1.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
	})
end