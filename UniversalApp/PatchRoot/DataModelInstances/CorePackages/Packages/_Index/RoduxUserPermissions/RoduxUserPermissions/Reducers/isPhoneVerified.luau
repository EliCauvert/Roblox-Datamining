local RoduxModule = require(script.Parent.Parent.Parent.Rodux)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: RoduxModule (copy)
	return RoduxModule.createReducer(false, {
		[p1.networkingAccountInformation.GetPhoneInformation.Succeeded.name] = function(_, p2) --[[ Line: 11 ]]
			return p2.responseBody and p2.responseBody.isVerified
		end
	})
end