local AppStorageUtilitiesModule = require(script:FindFirstAncestor("AuthCommon").Utils.AppStorageUtilities)

return function(UserIdentifier) --[[ Line: 5 | Named "getLastLoginMethod" ]]
	-- upvalues: AppStorageUtilitiesModule (copy)
	for _, value in AppStorageUtilitiesModule.getPreviousAccountsList() do
		if value.userIdentifier == UserIdentifier then
			return value.loginMethod
		end
	end
	return nil
end