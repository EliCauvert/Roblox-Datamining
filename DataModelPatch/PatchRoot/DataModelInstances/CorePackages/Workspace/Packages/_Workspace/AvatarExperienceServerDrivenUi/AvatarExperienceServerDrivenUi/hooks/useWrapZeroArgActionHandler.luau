local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local ReactModule = require(AvatarExperienceServerDrivenUi.Parent.React)
local WrapZeroArgActionModule = require(AvatarExperienceServerDrivenUi.Utils.wrapZeroArgAction)

return function(p1)
	-- upvalues: ReactModule (copy), WrapZeroArgActionModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: WrapZeroArgActionModule (upval), p1 (copy)
		return WrapZeroArgActionModule(p1)
	end, { p1 })
end