return function(p1): boolean --[[ Line: 8 ]]
	return p1 ~= nil and (type(p1) == "table" and (if p1.failureReason == nil then p1.FailureReason ~= nil and p1.ExpirationTimeInMinutes ~= nil else p1.expirationTimeInMinutes ~= nil or p1.FailureReason ~= nil and p1.ExpirationTimeInMinutes ~= nil))
end