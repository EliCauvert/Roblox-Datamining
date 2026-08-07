return function(p0) --[[ line: 8 ]]
	local var0 = false
	
	if p0 ~= nil then
		var0 = false
		
		if type(p0) == "table" then
			if p0.failureReason ~= nil then
				var0 = true
				
				if p0.expirationTimeInMinutes == nil then
					var0 = p0.FailureReason ~= nil and p0.ExpirationTimeInMinutes ~= nil
				end
			end
		end
	end
	return var0
end