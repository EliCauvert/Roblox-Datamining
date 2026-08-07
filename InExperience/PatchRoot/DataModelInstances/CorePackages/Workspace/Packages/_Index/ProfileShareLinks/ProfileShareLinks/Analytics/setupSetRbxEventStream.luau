local getPlatformTarget = require(script:FindFirstAncestor("ProfileShareLinks").Parent.Analytics).getPlatformTarget

return function(p0) --[[ line: 5 ]]
	-- upvalues: getPlatformTarget (ref)
	return function(_, p1, p2, p3) --[[ line: 6 ]]
		-- upvalues: p0 (ref), getPlatformTarget (copy)
		p0:setRBXEventStream(getPlatformTarget(), if p3 then p3.context else p1, p2, p3)
	end
end