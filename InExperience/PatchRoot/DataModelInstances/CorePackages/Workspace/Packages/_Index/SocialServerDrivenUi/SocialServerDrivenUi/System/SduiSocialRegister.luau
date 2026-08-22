local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local reactModule = require(socialServerDrivenUi.Parent.React)
local registerSocialActionsModule = require(socialServerDrivenUi.Actions.registerSocialActions)
local registerSocialActionTelemetryHandlersModule = require(socialServerDrivenUi.Actions.TelemetryHandlers.registerSocialActionTelemetryHandlers)
local registerSocialComponentsModule = require(socialServerDrivenUi.System.registerSocialComponents)
local registerSocialImpressionsModule = require(socialServerDrivenUi.Impressions.registerSocialImpressions)
local fFlagSduiCreateSocialTelemetryRegistriesModule = require(socialServerDrivenUi.Flags.FFlagSduiCreateSocialTelemetryRegistries)

return reactModule.memo(function() --[[ line: 15 | named "SduiSocialRegister" ]]
	-- upvalues: reactModule (ref), registerSocialComponentsModule (ref), registerSocialActionsModule (ref), fFlagSduiCreateSocialTelemetryRegistriesModule (ref), registerSocialImpressionsModule (ref), registerSocialActionTelemetryHandlersModule (ref)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: registerSocialComponentsModule (copy), registerSocialActionsModule (copy), fFlagSduiCreateSocialTelemetryRegistriesModule (copy), registerSocialImpressionsModule (copy), registerSocialActionTelemetryHandlersModule (copy)
		registerSocialComponentsModule()
		registerSocialActionsModule()
		
		if fFlagSduiCreateSocialTelemetryRegistriesModule then
			registerSocialImpressionsModule()
			registerSocialActionTelemetryHandlersModule()
		end
	end, {})
	
	return nil
end)