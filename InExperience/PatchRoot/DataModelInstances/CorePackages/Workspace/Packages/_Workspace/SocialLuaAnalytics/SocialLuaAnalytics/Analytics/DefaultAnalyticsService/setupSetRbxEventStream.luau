local GetPlatformTargetFunction = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Analytics).getPlatformTarget

return function(p1) --[[ Line: 6 ]]
	-- upvalues: GetPlatformTargetFunction (copy)
	return function(_, p2, p3, p4) --[[ Line: 7 ]]
		-- upvalues: p1 (copy), GetPlatformTargetFunction (upval)
		p1:setRBXEventStream(GetPlatformTargetFunction(), p2, p3, p4)
	end
end