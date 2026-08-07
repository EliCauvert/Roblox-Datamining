local videoUtils = script:FindFirstAncestor("VideoUtils")
local reactModule = require(videoUtils.Parent.React)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason

return function(p0) --[[ line: 14 | named "VideoHoverPlaybackDetector" ]]
	-- upvalues: reactModule (ref), videoEndReason (ref)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: p0 (ref), videoEndReason (copy)
		if p0.isHovered then
			p0.requestVideoPlayback(false)
			
			return
		end
		p0.cancelVideoPlayback(videoEndReason.Unhovered)
	end, {
		p0.isHovered,
		p0.requestVideoPlayback,
		p0.cancelVideoPlayback
	})
	
	return nil
end