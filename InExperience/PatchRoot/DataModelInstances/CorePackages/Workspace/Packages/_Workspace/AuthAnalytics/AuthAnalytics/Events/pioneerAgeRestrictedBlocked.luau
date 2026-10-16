local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Source) --[[ Line: 5 ]]
	-- upvalues: CheckAndSendEventModule (copy)
	CheckAndSendEventModule(p1, "pioneerAgeRestrictedBlocked", { source = Source })
end