return function(p0)
	return if p0 then p0.FailureReason or (p0.failureReason or p0.violationType) else nil
end