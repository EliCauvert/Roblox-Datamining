local getPlatformTarget = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Analytics).getPlatformTarget

return function(p1)
	-- upvalues: getPlatformTarget (ref)
	return function(_, p2, p3, p4)
		-- upvalues: p1 (ref), getPlatformTarget (copy)
		p1:sendEventDeferred(getPlatformTarget(), p2, p3, p4)
	end
end