local EventIngestService = game:GetService("EventIngestService")
local EventIngest = require(game:GetService("CorePackages").Workspace.Packages.Analytics).AnalyticsReporters.EventIngest

return function(Page)
	-- upvalues: EventIngest (copy), EventIngestService (copy)
	EventIngest.new(EventIngestService):sendEventDeferred("lockScreenWidgetClicked", "lockScreenWidgetClicked", { page = Page })
end