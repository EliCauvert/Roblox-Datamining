return function(p1) --[[ Line: 3 | Named "parseEconomicRestrictionsExpirationTimeInMinutes" ]]
	return if p1 then p1.ExpirationTimeInMinutes or (p1.expirationTimeInMinutes or p1.timeoutMinutes) else nil
end