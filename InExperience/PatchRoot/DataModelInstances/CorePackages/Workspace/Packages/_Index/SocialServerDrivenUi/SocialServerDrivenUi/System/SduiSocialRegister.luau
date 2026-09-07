local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local reactModule = require(parent.React)
local registerSocialActionsModule = require(socialServerDrivenUi.Actions.registerSocialActions)
local registerSocialActionTelemetryHandlersModule = require(socialServerDrivenUi.Actions.TelemetryHandlers.registerSocialActionTelemetryHandlers)
local registerSocialComponentsModule = require(socialServerDrivenUi.System.registerSocialComponents)
local registerSocialImpressionsModule = require(socialServerDrivenUi.Impressions.registerSocialImpressions)
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler
local fFlagSduiCreateSocialTelemetryRegistriesModule = require(socialServerDrivenUi.Flags.FFlagSduiCreateSocialTelemetryRegistries)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), registerSocialComponentsModule (ref), registerSocialActionsModule (ref), fFlagSduiCreateSocialTelemetryRegistriesModule (ref), registerSocialImpressionsModule (ref), fFlagSduiActionTelemetryHandler (ref), registerSocialActionTelemetryHandlersModule (ref)
	reactModule.useEffect(function()
		-- upvalues: registerSocialComponentsModule (copy), registerSocialActionsModule (copy), fFlagSduiCreateSocialTelemetryRegistriesModule (copy), registerSocialImpressionsModule (copy), fFlagSduiActionTelemetryHandler (copy), registerSocialActionTelemetryHandlersModule (copy)
		registerSocialComponentsModule()
		registerSocialActionsModule()
		
		if fFlagSduiCreateSocialTelemetryRegistriesModule then
			registerSocialImpressionsModule()
			
			if fFlagSduiActionTelemetryHandler then
				registerSocialActionTelemetryHandlersModule()
			end
		end
	end, {})
	
	return nil
end)