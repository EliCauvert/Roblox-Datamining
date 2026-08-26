local checkAndSendEventModule = require(script:FindFirstAncestor("AuthAnalytics").Utils.checkAndSendEvent)

return function(p1, p2, p3)
	-- upvalues: checkAndSendEventModule (ref)
	checkAndSendEventModule(p1, "authOperationTiming", { elapsedTime = p2, state = p3 })
end