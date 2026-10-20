local Parent = script.Parent.Parent
local EventStreamActionListModule = require(Parent.Analytics.EventStreamActionList)
local EventNamesModule = require(Parent.Analytics.EventNames)
local Llama = require(Parent.dependencies).llama

return function(p1, p2)
	-- upvalues: EventNamesModule (copy), EventStreamActionListModule (copy), Llama (copy)
	assert(EventNamesModule.isEnumValue(p1), "Invalid event name")
	local EventStreamActionListModuleEntry = EventStreamActionListModule[p1]
	
	return EventStreamActionListModuleEntry.context, EventStreamActionListModuleEntry.eventType, Llama.Dictionary.join(EventStreamActionListModuleEntry.additionalInfo, {
		btn = if EventStreamActionListModuleEntry.additionalInfo and EventStreamActionListModuleEntry.additionalInfo.btn then EventStreamActionListModuleEntry.additionalInfo.btn.rawValue() else nil
	}, p2)
end