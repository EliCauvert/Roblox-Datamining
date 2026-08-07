return function(p0) --[[ line: 3 | named "parseEconomicRestrictionsFailureReason" ]]
	return if p0 then p0.FailureReason or (p0.failureReason or p0.violationType) else nil
end