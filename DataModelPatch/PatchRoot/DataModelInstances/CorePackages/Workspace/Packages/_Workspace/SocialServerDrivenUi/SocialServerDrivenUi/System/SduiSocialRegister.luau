local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local ReactModule = require(SocialServerDrivenUi.Parent.React)
local RegisterSocialActionsModule = require(SocialServerDrivenUi.Actions.registerSocialActions)
local RegisterSocialComponentsModule = require(SocialServerDrivenUi.System.registerSocialComponents)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterSocialComponentsModule (copy), RegisterSocialActionsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterSocialComponentsModule (upval), RegisterSocialActionsModule (upval)
		RegisterSocialComponentsModule()
		RegisterSocialActionsModule()
	end, {})
	
	return nil
end)