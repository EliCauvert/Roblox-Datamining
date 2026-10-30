local ReactModule = require(script:FindFirstAncestor("VideoUtils").Parent.React)
local VideoFrameWrapperModule = require(script.Parent.VideoFrameWrapper)
local CreateVideoEditPlaybackModule = require(script.Parent.createVideoEditPlayback)
local _ = require(script.Parent.getVideoEdits)

return function(p1)
	-- upvalues: ReactModule (copy), CreateVideoEditPlaybackModule (copy), VideoFrameWrapperModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local VideoFrameRef = p1.videoFrameRef or UseRefResult
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult11 = ReactModule.useRef(nil)
	UseRefResult11.current = { onEnded = p1.onEnded, onLooped = p1.onLooped }
	local IsVolumeMatch = p1.volume == 0
	ReactModule.useLayoutEffect(function()
		-- upvalues: VideoFrameRef (copy), p1 (copy), CreateVideoEditPlaybackModule (upval), UseRefResult11 (copy), UseRefResult1 (copy)
		local Current = VideoFrameRef.current
		
		if Current == nil or not p1.isPlaying then
			return nil
		else
			local VideoEditPlaybackModule = CreateVideoEditPlaybackModule(Current, p1.edits, p1.looped == true, function()
				-- upvalues: UseRefResult11 (upval)
				return UseRefResult11.current
			end)
			UseRefResult1.current = VideoEditPlaybackModule
			
			return function()
				-- upvalues: VideoEditPlaybackModule (copy), UseRefResult1 (upval)
				VideoEditPlaybackModule.destroy()
				UseRefResult1.current = nil
			end
		end
	end, {
		VideoFrameRef,
		p1.video,
		p1.isPlaying,
		p1.edits,
		p1.looped
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), IsVolumeMatch (copy)
		if UseRefResult1.current then
			UseRefResult1.current.setMuted(IsVolumeMatch)
		end
	end, {
		IsVolumeMatch,
		p1.video,
		p1.isPlaying,
		p1.edits,
		p1.looped
	})
	
	return ReactModule.createElement(VideoFrameWrapperModule, {
		startPaused = true,
		videoFrameRef = VideoFrameRef,
		video = p1.video,
		isPlaying = p1.isPlaying,
		looped = p1.looped == true and p1.edits.trim == nil,
		volume = if p1.edits.music then 0 else p1.volume,
		onLoaded = p1.onLoaded,
		cornerRadius = p1.cornerRadius,
		zIndex = p1.zIndex
	})
end