local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local LogActionTelemetryModule = require(SduiCoreSystem.Analytics.logActionTelemetry)
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local GetSduiActionHandlerRegistryModule = require(SduiCoreSystem.getSduiActionHandlerRegistry)

return function(p1, p2, p3, p4) --[[ Line: 17 | Named "executeAction" ]]
	-- upvalues: GetSduiActionHandlerRegistryModule (copy), LogActionTelemetryModule (copy)
	if not p1 then return end
	assert(p1, "actionConfig must exist")
	local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(p1.actionType)
	
	if not ActionHandlerConfig then return end
	assert(ActionHandlerConfig, "actionHandlerConfig must exist")
	LogActionTelemetryModule(p1.telemetryHandler, ActionHandlerConfig, p1, p2, p3)
	
	if not ActionHandlerConfig.handler then return end
	return ActionHandlerConfig.handler(p1, p2, p3, p4)
end