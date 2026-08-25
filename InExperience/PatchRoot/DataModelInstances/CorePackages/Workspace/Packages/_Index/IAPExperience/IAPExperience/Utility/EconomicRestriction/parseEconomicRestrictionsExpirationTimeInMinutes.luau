return function(a)
	return if a then a.ExpirationTimeInMinutes or (a.expirationTimeInMinutes or a.timeoutMinutes) else nil
end