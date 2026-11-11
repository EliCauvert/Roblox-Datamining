return function(p1)
	return if p1 then p1.FailureReason or (p1.failureReason or p1.violationType) else nil
end