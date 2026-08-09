local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local reactModule = require(socialServerDrivenUi.Parent.React)
local registerSocialActionsModule = require(socialServerDrivenUi.Actions.registerSocialActions)
local registerSocialComponentsModule = require(socialServerDrivenUi.System.registerSocialComponents)

return reactModule.memo(function() --[[ line: 9 | named "SduiSocialRegister" ]]
	-- upvalues: reactModule (ref), registerSocialComponentsModule (ref), registerSocialActionsModule (ref)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: registerSocialComponentsModule (copy), registerSocialActionsModule (copy)
		registerSocialComponentsModule()
		registerSocialActionsModule()
	end, {})
	
	return nil
end)