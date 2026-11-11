local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local IXPUtilsModule = require(Parent.IXPUtils)

return function(p1, p2)
	-- upvalues: ReactModule (copy), IXPUtilsModule (copy)
	return ReactModule.useCallback(function(p3)
		-- upvalues: p1 (copy), IXPUtilsModule (upval), p2 (copy)
		local Current = p1.current
		
		if Current and p3.visibleInstance:IsDescendantOf(Current) then
			IXPUtilsModule.logLayerExposure(p2)
		end
	end, { p2 })
end