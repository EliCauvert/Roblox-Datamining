local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local getSduiTelemetryHandlerNameRegistryModule = require(sduiCoreSystem.getSduiTelemetryHandlerNameRegistry)
local reportUnifiedLoggingActionModule = require(sduiCoreSystem.Analytics.reportUnifiedLoggingAction)
local fFlagSduiActionSkipUnifiedLogging = require(parent.SharedFlags).FFlagSduiActionSkipUnifiedLogging

return function(p0, p1, p2, p3, p4)
	-- upvalues: getSduiTelemetryHandlerNameRegistryModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiActionSkipUnifiedLogging (ref), reportUnifiedLoggingActionModule (ref)
	if p0 and p0 ~= "" then
		local telemetryHandler = getSduiTelemetryHandlerNameRegistryModule().getTelemetryHandler(p0)
		
		if telemetryHandler then
			telemetryHandler(p2, p3, p4)
		else
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.InvalidActionParams, {
				message = `Unknown telemetry handler name: {p0}`,
				name = p2.actionType
			}, p4.appPage)
		end
	elseif p1.telemetryHandler then
		p1.telemetryHandler(p2, p3, p4)
	end
	if not (if fFlagSduiActionSkipUnifiedLogging then p1.skipUnifiedLogging or p2.skipUnifiedLogging else p1.skipUnifiedLogging) then
		if p3 == nil then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.NilAnalyticsContext, {
				message = `Could not reportUnifiedLoggingAction. Missing analyticsContext {p2.actionType}`,
				name = p2.actionType
			}, p4.appPage)
			
			return
		end
		reportUnifiedLoggingActionModule(p4, p2, p3)
	end
end