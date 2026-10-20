local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local ReactModule = require(ExperienceStoreServerDrivenUi.Parent.React)
local RegisterExperienceStoreActionsModule = require(ExperienceStoreServerDrivenUi.Actions.registerExperienceStoreActions)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterExperienceStoreActionsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterExperienceStoreActionsModule (upval)
		RegisterExperienceStoreActionsModule()
	end, {})
	
	return nil
end)