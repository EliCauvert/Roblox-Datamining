local roduxModule = require(script.Parent.Parent.Parent.Rodux)

return function(p1)
	-- upvalues: roduxModule (ref)
	return roduxModule.createReducer(false, {
		[p1.networkingAccountInformation.GetPhoneInformation.Succeeded.name] = function(_, p2)
			return p2.responseBody and p2.responseBody.isVerified
		end
	})
end