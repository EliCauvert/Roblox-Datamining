local GetPlatformTargetFunction = require(script:FindFirstAncestor("ProfileShareLinks").Parent.Analytics).getPlatformTarget

return function(p1) --[[ Line: 5 ]]
	-- upvalues: GetPlatformTargetFunction (copy)
	return function(_, p2, p3, p4) --[[ Line: 6 ]]
		-- upvalues: p1 (copy), GetPlatformTargetFunction (upval)
		p1:sendEventDeferred(GetPlatformTargetFunction(), if p4 then p4.context else p2, p3, p4)
	end
end