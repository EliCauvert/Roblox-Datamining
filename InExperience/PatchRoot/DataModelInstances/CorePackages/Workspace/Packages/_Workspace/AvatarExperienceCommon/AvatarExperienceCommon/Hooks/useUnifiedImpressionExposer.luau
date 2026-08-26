local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local IXPUtilsModule = require(parent.IXPUtils)

return function(p1, p2)
	-- upvalues: reactModule (ref), IXPUtilsModule (ref)
	return reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), IXPUtilsModule (copy), p2 (ref)
		local current = p1.current
		
		if current and p3.visibleInstance:IsDescendantOf(current) then
			IXPUtilsModule.logLayerExposure(p2)
		end
	end, { p2 })
end