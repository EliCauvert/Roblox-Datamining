local Parent = script.Parent.Parent
local DiagEventsModule = require(Parent.Analytics.DiagEvents)
local EventNamesModule = require(Parent.Analytics.Enums.EventNames)

return function(p1)
	-- upvalues: EventNamesModule (copy), DiagEventsModule (copy)
	assert(EventNamesModule.isEnumValue(p1), "Invalid event name")
	local DiagEventsModuleEntry = DiagEventsModule[p1]
	
	return DiagEventsModuleEntry.name, DiagEventsModuleEntry.count or 1
end