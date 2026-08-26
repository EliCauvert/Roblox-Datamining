return function(p1)
	local var1 = false
	
	if p1 ~= nil then
		var1 = false
		
		if type(p1) == "table" then
			if p1.failureReason ~= nil then
				var1 = true
				
				if p1.expirationTimeInMinutes == nil then
					var1 = p1.FailureReason ~= nil and p1.ExpirationTimeInMinutes ~= nil
				end
			end
		end
	end
	return var1
end