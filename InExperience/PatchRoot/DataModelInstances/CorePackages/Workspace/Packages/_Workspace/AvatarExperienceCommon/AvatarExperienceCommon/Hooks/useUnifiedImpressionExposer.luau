local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local IXPUtilsModule = require(parent.IXPUtils)

return function(p0, p1) --[[ line: 7 | named "unifiedImpressionExposer" ]]
	-- upvalues: reactModule (ref), IXPUtilsModule (ref)
	return reactModule.useCallback(function(p2) --[[ line: 8 ]]
		-- upvalues: p0 (ref), IXPUtilsModule (copy), p1 (ref)
		local current = p0.current
		
		if current and p2.visibleInstance:IsDescendantOf(current) then
			IXPUtilsModule.logLayerExposure(p1)
		end
	end, { p1 })
end