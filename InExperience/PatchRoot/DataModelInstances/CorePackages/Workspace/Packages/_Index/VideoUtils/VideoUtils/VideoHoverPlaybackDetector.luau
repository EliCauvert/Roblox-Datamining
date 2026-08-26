local videoUtils = script:FindFirstAncestor("VideoUtils")
local reactModule = require(videoUtils.Parent.React)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason

return function(p1)
	-- upvalues: reactModule (ref), videoEndReason (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), videoEndReason (copy)
		if p1.isHovered then
			p1.requestVideoPlayback(false)
			
			return
		end
		p1.cancelVideoPlayback(videoEndReason.Unhovered)
	end, {
		p1.isHovered,
		p1.requestVideoPlayback,
		p1.cancelVideoPlayback
	})
	
	return nil
end