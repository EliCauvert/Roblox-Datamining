local FailureReasonModule = require(script:FindFirstAncestor("Gifting").Enums.FailureReason)

return function(Callback, Promise)
	-- upvalues: FailureReasonModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: Promise (copy)
		Promise:expect()
	end)
	Callback(Success).toBe(false)
	assert(type(Result) == "table", `expected a formatted gift error, got {typeof(Result)}`)
	Callback(Result.failureReason).toBe(FailureReasonModule.InvalidInput)
	Callback((type(Result.errorMessage))).toBe("string")
end