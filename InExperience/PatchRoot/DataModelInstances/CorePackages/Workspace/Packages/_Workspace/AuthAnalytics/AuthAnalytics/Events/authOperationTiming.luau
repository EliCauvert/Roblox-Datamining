local checkAndSendEventModule = require(script:FindFirstAncestor("AuthAnalytics").Utils.checkAndSendEvent)

return function(p0, p1, p2) --[[ line: 4 ]]
	-- upvalues: checkAndSendEventModule (ref)
	checkAndSendEventModule(p0, "authOperationTiming", { elapsedTime = p1, state = p2 })
end