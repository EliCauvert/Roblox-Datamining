local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local FFlagSduiErrorPaths = require(SduiCoreSystem.Parent.SharedFlags).FFlagSduiErrorPaths
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local GetSduiTelemetryHandlerNameRegistryModule = require(SduiCoreSystem.getSduiTelemetryHandlerNameRegistry)
local ReportUnifiedLoggingActionModule = require(SduiCoreSystem.Analytics.reportUnifiedLoggingAction)

return function(p1, p2, p3, p4, p5)
	-- upvalues: GetSduiTelemetryHandlerNameRegistryModule (copy), FFlagSduiErrorPaths (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), ReportUnifiedLoggingActionModule (copy)
	if p1 and p1 ~= "" then
		local TelemetryHandler: (any, any, any) -> () = GetSduiTelemetryHandlerNameRegistryModule().getTelemetryHandler(p1)
		
		if TelemetryHandler then
			TelemetryHandler(p3, p4, p5)
		else
			(FFlagSduiErrorPaths and (p5.dependencies and p5.dependencies.logger) or SduiLoggerModule).reportError(SduiErrorsModule.SduiErrorType.InvalidActionParams, {
				message = `Unknown telemetry handler name: {p1}`,
				name = p3.actionType
			}, p5.appPage)
		end
	elseif p2.telemetryHandler then
		p2.telemetryHandler(p3, p4, p5)
	end
	if not p2.skipUnifiedLogging and not p3.skipUnifiedLogging then
		if p4 == nil then
			(FFlagSduiErrorPaths and (p5.dependencies and p5.dependencies.logger) or SduiLoggerModule).reportError(SduiErrorsModule.SduiErrorType.NilAnalyticsContext, {
				message = `Could not reportUnifiedLoggingAction. Missing analyticsContext {p3.actionType}`,
				name = p3.actionType
			}, p5.appPage)
			
			return
		end
		ReportUnifiedLoggingActionModule(p5, p3, p4)
	end
end