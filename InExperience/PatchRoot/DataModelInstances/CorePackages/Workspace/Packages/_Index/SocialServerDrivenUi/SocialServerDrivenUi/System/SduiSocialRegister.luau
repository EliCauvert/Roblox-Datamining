local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local ReactModule = require(SocialServerDrivenUi.Parent.React)
local RegisterSocialActionsModule = require(SocialServerDrivenUi.Actions.registerSocialActions)
local RegisterSocialActionTelemetryHandlersModule = require(SocialServerDrivenUi.Actions.TelemetryHandlers.registerSocialActionTelemetryHandlers)
local RegisterSocialComponentsModule = require(SocialServerDrivenUi.System.registerSocialComponents)
local RegisterSocialImpressionsModule = require(SocialServerDrivenUi.Impressions.registerSocialImpressions)
local FFlagSduiCreateSocialTelemetryRegistriesModule = require(SocialServerDrivenUi.Flags.FFlagSduiCreateSocialTelemetryRegistries)

return ReactModule.memo(function() --[[ Line: 15 | Named "SduiSocialRegister" ]]
	-- upvalues: ReactModule (copy), RegisterSocialComponentsModule (copy), RegisterSocialActionsModule (copy), FFlagSduiCreateSocialTelemetryRegistriesModule (copy), RegisterSocialImpressionsModule (copy), RegisterSocialActionTelemetryHandlersModule (copy)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: RegisterSocialComponentsModule (upval), RegisterSocialActionsModule (upval), FFlagSduiCreateSocialTelemetryRegistriesModule (upval), RegisterSocialImpressionsModule (upval), RegisterSocialActionTelemetryHandlersModule (upval)
		RegisterSocialComponentsModule()
		RegisterSocialActionsModule()
		
		if FFlagSduiCreateSocialTelemetryRegistriesModule then
			RegisterSocialImpressionsModule()
			RegisterSocialActionTelemetryHandlersModule()
		end
	end, {})
	
	return nil
end)