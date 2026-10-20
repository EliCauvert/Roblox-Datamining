local GetPlatformTargetFunction = require(script:FindFirstAncestor("ProfileQRCode").Parent.Analytics).getPlatformTarget

return function(p1)
	-- upvalues: GetPlatformTargetFunction (copy)
	return function(_, p2, p3, p4)
		-- upvalues: p1 (copy), GetPlatformTargetFunction (upval)
		p1:setRBXEventStream(GetPlatformTargetFunction(), p2, p3, p4)
	end
end