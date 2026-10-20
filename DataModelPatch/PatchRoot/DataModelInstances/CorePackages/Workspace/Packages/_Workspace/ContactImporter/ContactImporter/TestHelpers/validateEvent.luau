local Parent = script.Parent.Parent
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventNamesModule = require(Parent.Analytics.Enums.EventNames)
local Llama = require(Parent.dependencies).llama

return function(p1, p2)
	-- upvalues: EventNamesModule (copy), AnalyticsEventsModule (copy), Llama (copy)
	assert(EventNamesModule.isEnumValue(p1), "Invalid event name")
	local AnalyticsEventsModuleEntry = AnalyticsEventsModule[p1]
	
	return AnalyticsEventsModuleEntry.context, AnalyticsEventsModuleEntry.eventType, Llama.Dictionary.join(AnalyticsEventsModuleEntry.additionalInfo, {
		btn = if AnalyticsEventsModuleEntry.additionalInfo and AnalyticsEventsModuleEntry.additionalInfo.btn then AnalyticsEventsModuleEntry.additionalInfo.btn.rawValue() else nil
	}, p2)
end