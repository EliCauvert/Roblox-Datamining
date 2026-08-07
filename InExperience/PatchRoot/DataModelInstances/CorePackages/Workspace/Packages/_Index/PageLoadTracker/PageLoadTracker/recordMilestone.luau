local loggingProtocolModule = require(script:FindFirstAncestor("PageLoadTracker").Parent.LoggingProtocol)
local pageLoadConfigModule = require(script.Parent.PageLoadConfig)
local _ = require(script.Parent.PageLoadTypes)
local default = loggingProtocolModule.default

function recordMilestone(p0) --[[ line: 10 ]]
	-- upvalues: default (ref), pageLoadConfigModule (ref)
	default:logRobloxTelemetryEvent(pageLoadConfigModule.PAGE_LOAD_SUMMARY_CONFIG, { default.StandardizedFields.addOsInfo }, p0)
end

return recordMilestone