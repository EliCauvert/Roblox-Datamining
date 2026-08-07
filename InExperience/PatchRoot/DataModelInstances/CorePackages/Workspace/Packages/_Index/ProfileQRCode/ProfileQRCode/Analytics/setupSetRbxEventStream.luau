local getPlatformTarget = require(script:FindFirstAncestor("ProfileQRCode").Parent.Analytics).getPlatformTarget

return function(p0) --[[ line: 5 ]]
	-- upvalues: getPlatformTarget (ref)
	return function(_, p1, p2, p3) --[[ line: 6 ]]
		-- upvalues: p0 (ref), getPlatformTarget (copy)
		p0:setRBXEventStream(getPlatformTarget(), p1, p2, p3)
	end
end