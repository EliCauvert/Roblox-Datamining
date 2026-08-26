local getPlatformTarget = require(script:FindFirstAncestor("ProfileShareLinks").Parent.Analytics).getPlatformTarget

return function(p1)
	-- upvalues: getPlatformTarget (ref)
	return function(_, p2, p3, p4)
		-- upvalues: p1 (ref), getPlatformTarget (copy)
		p1:sendEventDeferred(getPlatformTarget(), if p4 then p4.context else p2, p3, p4)
	end
end