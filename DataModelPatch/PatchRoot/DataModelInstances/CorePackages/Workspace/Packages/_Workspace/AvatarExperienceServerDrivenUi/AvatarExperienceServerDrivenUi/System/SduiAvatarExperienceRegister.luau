local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local ReactModule = require(AvatarExperienceServerDrivenUi.Parent.React)
local RegisterAvatarExperienceActionsModule = require(AvatarExperienceServerDrivenUi.Actions.registerAvatarExperienceActions)
local RegisterAvatarExperienceUiComponentsModule = require(AvatarExperienceServerDrivenUi.UiComponents.registerAvatarExperienceUiComponents)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterAvatarExperienceActionsModule (copy), RegisterAvatarExperienceUiComponentsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterAvatarExperienceActionsModule (upval), RegisterAvatarExperienceUiComponentsModule (upval)
		RegisterAvatarExperienceActionsModule()
		RegisterAvatarExperienceUiComponentsModule()
	end, {})
	
	return nil
end)