local object = require(script.Parent.Parent.LuauPolyfill).Object
local reportCounterModule = require(script.Parent.reportCounter)
local customFieldsModule = require(script.Parent.customFields)

return {
	customFields = customFieldsModule,
	reportNewDevtoolsConnection = function()
		-- upvalues: reportCounterModule (ref), customFieldsModule (ref)
		reportCounterModule({
			eventName = "react_new_devtools_connection",
			description = "A new connection to React Devtools",
			links = "https://roblox.atlassian.net/wiki/spaces/luauee/pages/3836510338/DevTools+Telemetry",
			lastUpdated = { 2025, 8, 28 },
			customFields = customFieldsModule
		})
	end,
	reportFailedDevtoolsConnection = function(p1)
		-- upvalues: reportCounterModule (ref), object (ref), customFieldsModule (ref)
		reportCounterModule({
			eventName = "react_failed_devtools_connection",
			description = "A failed connection to React Devtools",
			links = "https://roblox.atlassian.net/wiki/spaces/luauee/pages/3836510338/DevTools+Telemetry",
			lastUpdated = { 2025, 8, 28 },
			customFields = object.assign({}, customFieldsModule, { error_type = p1 })
		})
	end
}