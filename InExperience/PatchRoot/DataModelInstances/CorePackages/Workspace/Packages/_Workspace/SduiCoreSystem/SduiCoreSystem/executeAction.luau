local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local LogActionTelemetryModule = require(SduiCoreSystem.Analytics.logActionTelemetry)
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local GetSduiActionHandlerRegistryModule = require(SduiCoreSystem.getSduiActionHandlerRegistry)
local CreateSduiErrorLoggerModule = require(SduiCoreSystem.createSduiErrorLogger)
local FFlagSduiErrorPaths = require(SduiCoreSystem.Parent.SharedFlags).FFlagSduiErrorPaths

return function(p1, p2, Tbl, p3)
	-- upvalues: GetSduiActionHandlerRegistryModule (copy), FFlagSduiErrorPaths (copy), CreateSduiErrorLoggerModule (copy), LogActionTelemetryModule (copy)
	if not p1 then return end
	assert(p1, "actionConfig must exist")
	local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(p1.actionType)
	
	if not ActionHandlerConfig then return end
	assert(ActionHandlerConfig, "actionHandlerConfig must exist")
	
	if FFlagSduiErrorPaths then
		Tbl = table.clone(Tbl)
		Tbl.dependencies = table.clone(Tbl.dependencies)
		Tbl.dependencies.logger = CreateSduiErrorLoggerModule(Tbl.dependencies.logger, nil, p1.actionType)
	end
	LogActionTelemetryModule(p1.telemetryHandler, ActionHandlerConfig, p1, p2, Tbl)
	
	if not ActionHandlerConfig.handler then return end
	return ActionHandlerConfig.handler(p1, p2, Tbl, p3)
end