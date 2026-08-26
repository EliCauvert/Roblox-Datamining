local videoUtils = script:FindFirstAncestor("VideoUtils")
local reactModule = require(videoUtils.Parent.React)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason

return function(p1)
	-- upvalues: reactModule (ref), videoEndReason (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), videoEndReason (copy)
		if p1.isSelected then
			p1.requestVideoPlayback(false)
			
			return
		end
		p1.cancelVideoPlayback(videoEndReason.Unselected)
	end, {
		p1.isSelected,
		p1.requestVideoPlayback,
		p1.cancelVideoPlayback
	})
	
	return nil
end