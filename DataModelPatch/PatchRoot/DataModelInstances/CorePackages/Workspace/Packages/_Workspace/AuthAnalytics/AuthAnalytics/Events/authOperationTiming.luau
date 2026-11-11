local CheckAndSendEventModule = require(script:FindFirstAncestor("AuthAnalytics").Utils.checkAndSendEvent)

return function(p1, ElapsedTime, State)
	-- upvalues: CheckAndSendEventModule (copy)
	CheckAndSendEventModule(p1, "authOperationTiming", { elapsedTime = ElapsedTime, state = State })
end