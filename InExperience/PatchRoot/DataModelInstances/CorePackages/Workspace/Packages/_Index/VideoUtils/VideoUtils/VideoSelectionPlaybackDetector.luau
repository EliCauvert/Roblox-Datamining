local VideoUtils = script:FindFirstAncestor("VideoUtils")
local ReactModule = require(VideoUtils.Parent.React)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason

return function(p1) --[[ Line: 14 | Named "VideoSelectionPlaybackDetector" ]]
	-- upvalues: ReactModule (copy), VideoEndReason (copy)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: p1 (copy), VideoEndReason (upval)
		if p1.isSelected then
			p1.requestVideoPlayback(false)
			
			return
		else
			p1.cancelVideoPlayback(VideoEndReason.Unselected)
		end
	end, {
		p1.isSelected,
		p1.requestVideoPlayback,
		p1.cancelVideoPlayback
	})
	
	return nil
end