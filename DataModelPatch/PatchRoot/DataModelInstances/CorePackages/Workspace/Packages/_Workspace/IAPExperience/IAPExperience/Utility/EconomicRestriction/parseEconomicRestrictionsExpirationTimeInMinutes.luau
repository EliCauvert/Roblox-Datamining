return function(p1)
	return if p1 then p1.ExpirationTimeInMinutes or (p1.expirationTimeInMinutes or p1.timeoutMinutes) else nil
end