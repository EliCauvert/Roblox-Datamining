local PageLoadConfigModule = require(script.Parent.PageLoadConfig)
local _ = require(script.Parent.PageLoadTypes)
local Default = require(script:FindFirstAncestor("PageLoadTracker").Parent.LoggingProtocol).default

function recordMilestone(p1)
	-- upvalues: Default (copy), PageLoadConfigModule (copy)
	Default:logRobloxTelemetryEvent(PageLoadConfigModule.PAGE_LOAD_SUMMARY_CONFIG, { Default.StandardizedFields.addOsInfo }, p1)
end

return recordMilestone