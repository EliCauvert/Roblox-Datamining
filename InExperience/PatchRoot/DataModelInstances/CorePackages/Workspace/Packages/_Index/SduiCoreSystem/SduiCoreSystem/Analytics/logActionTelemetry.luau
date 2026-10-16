local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local getSduiTelemetryHandlerNameRegistryModule = require(sduiCoreSystem.getSduiTelemetryHandlerNameRegistry)
local reportUnifiedLoggingActionModule = require(sduiCoreSystem.Analytics.reportUnifiedLoggingAction)
local fFlagSduiActionSkipUnifiedLogging = require(parent.SharedFlags).FFlagSduiActionSkipUnifiedLogging

return function(p1, p2, p3, p4, p5)
	-- upvalues: getSduiTelemetryHandlerNameRegistryModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiActionSkipUnifiedLogging (ref), reportUnifiedLoggingActionModule (ref)
	if p1 and p1 ~= "" then
		local telemetryHandler = getSduiTelemetryHandlerNameRegistryModule().getTelemetryHandler(p1)
		
		if telemetryHandler then
			telemetryHandler(p3, p4, p5)
		else
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.InvalidActionParams, {
				message = `Unknown telemetry handler name: {p1}`,
				name = p3.actionType
			}, p5.appPage)
		end
	elseif p2.telemetryHandler then
		p2.telemetryHandler(p3, p4, p5)
	end
	if not (if fFlagSduiActionSkipUnifiedLogging then p2.skipUnifiedLogging or p3.skipUnifiedLogging else p2.skipUnifiedLogging) then
		if p4 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.NilAnalyticsContext, {
				message = `Could not reportUnifiedLoggingAction. Missing analyticsContext {p3.actionType}`,
				name = p3.actionType
			}, p5.appPage)
			
			return
		end
		reportUnifiedLoggingActionModule(p5, p3, p4)
	end
end