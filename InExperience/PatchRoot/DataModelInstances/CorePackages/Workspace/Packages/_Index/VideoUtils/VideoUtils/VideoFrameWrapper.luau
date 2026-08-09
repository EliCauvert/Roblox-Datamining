local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local fFlagLuaAppVideoFrameSingleTilePooling = require(parent.SharedFlags).FFlagLuaAppVideoFrameSingleTilePooling

return function(p0) --[[ line: 22 | named "VideoFrameWrapper" ]]
	-- upvalues: reactModule (ref), fFlagLuaAppVideoFrameSingleTilePooling (ref)
	reactModule.useEffect(function() --[[ line: 23 ]]
		-- upvalues: p0 (ref)
		local var1 = if p0.videoFrameRef then p0.videoFrameRef.current else nil
		
		return function() --[[ line: 26 ]]
			-- upvalues: var1 (ref)
			if var1 then
				var1.Video = ""
			end
		end
	end, { p0.videoFrameRef })
	
	return reactModule.createElement("VideoFrame", {
		Size = UDim2.fromScale(1, 1),
		Video = if fFlagLuaAppVideoFrameSingleTilePooling then if p0.isPlaying then p0.video else "" else p0.video,
		Playing = if fFlagLuaAppVideoFrameSingleTilePooling then p0.isPlaying else true,
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