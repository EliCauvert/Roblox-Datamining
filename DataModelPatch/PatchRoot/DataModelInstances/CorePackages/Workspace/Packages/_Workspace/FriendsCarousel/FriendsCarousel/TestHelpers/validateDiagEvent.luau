local Parent = script.Parent.Parent
local DiagActionListModule = require(Parent.Analytics.DiagActionList)
local EventNamesModule = require(Parent.Analytics.EventNames)

return function(p1)
	-- upvalues: EventNamesModule (copy), DiagActionListModule (copy)
	assert(EventNamesModule.isEnumValue(p1), "Invalid event name")
	local DiagActionListModuleEntry = DiagActionListModule[p1]
	
	return DiagActionListModuleEntry.name, DiagActionListModuleEntry.count or 1
end