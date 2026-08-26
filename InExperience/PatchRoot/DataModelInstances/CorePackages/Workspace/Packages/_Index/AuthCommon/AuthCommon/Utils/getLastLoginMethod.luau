local appStorageUtilitiesModule = require(script:FindFirstAncestor("AuthCommon").Utils.AppStorageUtilities)

return function(p1)
	-- upvalues: appStorageUtilitiesModule (ref)
	for i, v in appStorageUtilitiesModule.getPreviousAccountsList() do
		if v.userIdentifier == p1 then
			return v.loginMethod
		end
	end
	return nil
end