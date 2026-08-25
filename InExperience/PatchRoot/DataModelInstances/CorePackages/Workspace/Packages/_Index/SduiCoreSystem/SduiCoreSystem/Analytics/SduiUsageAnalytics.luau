local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "sdui_type_usage",
	description = "Per-page-load delta of SDUI component types and action types observed for a given (page, version). `components` and `actions` are comma-joined strings convertible to `repeated string` server-side.",
	throttlingPercentage = 10000,
	lastUpdated = { 26, 4, 24 },
	backends = { "Points", "EventIngest" }
}
local t_1 = {
	eventName = "sdui_param_usage",
	description = "Per-page-load delta of SDUI component-prop and action-param names observed for a given (page, version). `props` and `actionParams` are comma-joined strings convertible to `repeated string` server-side; each entry is shaped `componentType.propName` or `actionType.paramName`.",
	throttlingPercentage = 10000,
	lastUpdated = { 26, 4, 24 },
	backends = { "Points", "EventIngest" }
}

local function joinSet(value)
	local t = {}
	
	for i, v in value do
		table.insert(t, i)
	end
	table.sort(t)
	
	return table.concat(t, ",")
end

return {
	sendTypeUsageEvent = function(p0)
		-- upvalues: telemetryService (ref), t (ref), joinSet (ref)
		telemetryService:LogEvent(t, {
			customFields = {
				page = p0.page,
				version = p0.version,
				components = joinSet(p0.componentTypes),
				actions = joinSet(p0.actionTypes)
			},
			standardizedFields = { "addOSInfo" }
		})
	end,
	sendParamUsageEvent = function(p1)
		-- upvalues: telemetryService (ref), t_1 (ref), joinSet (ref)
		telemetryService:LogEvent(t_1, {
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