local videoUtils = script:FindFirstAncestor("VideoUtils")
local reactModule = require(videoUtils.Parent.React)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason

return function(p0)
	-- upvalues: reactModule (ref), videoEndReason (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), videoEndReason (copy)
		if p0.isSelected then
			p0.requestVideoPlayback(false)
			
			return
		end
		p0.cancelVideoPlayback(videoEndReason.Unselected)
	end, {
		p0.isSelected,
		p0.requestVideoPlayback,
		p0.cancelVideoPlayback
	})
	
	return nil
end