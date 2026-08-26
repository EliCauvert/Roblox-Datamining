local getPlatformTarget = require(script:FindFirstAncestor("StreamNotifications").Parent.Analytics).getPlatformTarget

return function(p1)
	-- upvalues: getPlatformTarget (ref)
	return function(p2, p3, p4)
		-- upvalues: p1 (ref), getPlatformTarget (copy)
		p1:SendEventDeferred(getPlatformTarget(), p2, p3, p4)
	end
end