local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "sdui_type_usage",
	description = "Per-page-load delta of SDUI component types and action types observed for a given (page, version). `components` and `actions` are comma-joined strings convertible to `repeated string` server-side.",
	throttlingPercentage = 10000,
	lastUpdated = { 26, 4, 24 },
	backends = { "Points", "EventIngest" }
}
local config1 = {
	eventName = "sdui_param_usage",
	description = "Per-page-load delta of SDUI component-prop and action-param names observed for a given (page, version). `props` and `actionParams` are comma-joined strings convertible to `repeated string` server-side; each entry is shaped `componentType.propName` or `actionType.paramName`.",
	throttlingPercentage = 10000,
	lastUpdated = { 26, 4, 24 },
	backends = { "Points", "EventIngest" }
}

local function joinSet(ActionParams): string --[[ Line: 40 ]]
	local List = {}
	
	for i, _ in ActionParams do
		table.insert(List, i)
	end
	table.sort(List)
	
	return table.concat(List, ",")
end

return {
	sendTypeUsageEvent = function(p1) --[[ Line: 63 ]]
		-- upvalues: TelemetryService (copy), config (copy), joinSet (copy)
		TelemetryService:LogEvent(config, {
			customFields = {
				page = p1.page,
				version = p1.version,
				components = joinSet(p1.componentTypes),
				actions = joinSet(p1.actionTypes)
			},
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendParamUsageEvent = function(p1) --[[ Line: 75 ]]
		-- upvalues: TelemetryService (copy), config1 (copy), joinSet (copy)
		TelemetryService:LogEvent(config1, {
			customFields = {
				page = p1.page,
				version = p1.version,
				props = joinSet(p1.props),
				actionParams = joinSet(p1.actionParams)
			},
			standardizedFields = { "addOSInfo" }
		})
	end
}