local VideoUtils = script:FindFirstAncestor("VideoUtils")
local ReactModule = require(VideoUtils.Parent.React)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason

return function(p1)
	-- upvalues: ReactModule (copy), VideoEndReason (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), VideoEndReason (upval)
		if p1.isHovered then
			p1.requestVideoPlayback(false)
			
			return
		else
			p1.cancelVideoPlayback(VideoEndReason.Unhovered)
		end
	end, {
		p1.isHovered,
		p1.requestVideoPlayback,
		p1.cancelVideoPlayback
	})
	
	return nil
end