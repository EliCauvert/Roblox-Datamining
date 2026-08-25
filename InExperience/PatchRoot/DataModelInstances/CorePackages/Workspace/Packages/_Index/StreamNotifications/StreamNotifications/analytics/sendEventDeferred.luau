local getPlatformTarget = require(script:FindFirstAncestor("StreamNotifications").Parent.Analytics).getPlatformTarget

return function(p0)
	-- upvalues: getPlatformTarget (ref)
	return function(p1, p2, p3)
		-- upvalues: p0 (ref), getPlatformTarget (copy)
		p0:SendEventDeferred(getPlatformTarget(), p1, p2, p3)
	end
end