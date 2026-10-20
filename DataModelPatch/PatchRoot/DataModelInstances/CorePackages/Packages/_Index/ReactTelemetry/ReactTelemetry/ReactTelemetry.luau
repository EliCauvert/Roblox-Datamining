local Object = require(script.Parent.Parent.LuauPolyfill).Object
local ReportCounterModule = require(script.Parent.reportCounter)
local CustomFieldsModule = require(script.Parent.customFields)

return {
	customFields = CustomFieldsModule,
	reportNewDevtoolsConnection = function()
		-- upvalues: ReportCounterModule (copy), CustomFieldsModule (copy)
		ReportCounterModule({
			eventName = "react_new_devtools_connection",
			description = "A new connection to React Devtools",
			links = "https://roblox.atlassian.net/wiki/spaces/luauee/pages/3836510338/DevTools+Telemetry",
			lastUpdated = { 2025, 8, 28 },
			customFields = CustomFieldsModule
		})
	end,
	reportFailedDevtoolsConnection = function(Error_type)
		-- upvalues: ReportCounterModule (copy), Object (copy), CustomFieldsModule (copy)
		ReportCounterModule({
			eventName = "react_failed_devtools_connection",
			description = "A failed connection to React Devtools",
			links = "https://roblox.atlassian.net/wiki/spaces/luauee/pages/3836510338/DevTools+Telemetry",
			lastUpdated = { 2025, 8, 28 },
			customFields = Object.assign({}, CustomFieldsModule, { error_type = Error_type })
		})
	end
}