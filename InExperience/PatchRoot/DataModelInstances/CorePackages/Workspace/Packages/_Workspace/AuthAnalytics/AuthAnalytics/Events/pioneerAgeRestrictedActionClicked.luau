local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Source, Action)
	-- upvalues: CheckAndSendEventModule (copy)
	CheckAndSendEventModule(p1, "pioneerAgeRestrictedActionClicked", { source = Source, action = Action })
end