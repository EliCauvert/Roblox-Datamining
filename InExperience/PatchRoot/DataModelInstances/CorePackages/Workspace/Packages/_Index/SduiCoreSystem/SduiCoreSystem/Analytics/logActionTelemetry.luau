local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local getSduiTelemetryHandlerNameRegistryModule = require(sduiCoreSystem.getSduiTelemetryHandlerNameRegistry)
local reportUnifiedLoggingActionModule = require(sduiCoreSystem.Analytics.reportUnifiedLoggingAction)

return function(p0, p1, p2, p3, p4) --[[ line: 16 | named "logActionTelemetry" ]]
	-- upvalues: getSduiTelemetryHandlerNameRegistryModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), reportUnifiedLoggingActionModule (ref)
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
	if not p1.skipUnifiedLogging then
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