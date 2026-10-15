local failureReasonModule = require(script:FindFirstAncestor("Gifting").Enums.FailureReason)

return function(p1, p2)
	-- upvalues: failureReasonModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref)
		p2:expect()
	end)
	p1(ok).toBe(false)
	assert(type(status) == "table", `expected a formatted gift error, got {typeof(status)}`)
	p1(status.failureReason).toBe(failureReasonModule.InvalidInput)
	p1(type(status.errorMessage)).toBe("string")
end