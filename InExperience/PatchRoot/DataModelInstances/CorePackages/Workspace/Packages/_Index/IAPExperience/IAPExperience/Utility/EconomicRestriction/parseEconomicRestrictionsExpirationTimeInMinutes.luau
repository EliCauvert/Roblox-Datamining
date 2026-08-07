return function(a) --[[ line: 3 | named "parseEconomicRestrictionsExpirationTimeInMinutes" ]]
	return if a then a.ExpirationTimeInMinutes or (a.expirationTimeInMinutes or a.timeoutMinutes) else nil
end