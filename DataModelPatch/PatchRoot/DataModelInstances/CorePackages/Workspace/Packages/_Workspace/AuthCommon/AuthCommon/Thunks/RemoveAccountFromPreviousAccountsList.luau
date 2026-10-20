local AppStorageUtilitiesModule = require(script:FindFirstAncestor("AuthCommon").Utils.AppStorageUtilities)

return function(Key)
	-- upvalues: AppStorageUtilitiesModule (copy)
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	
	if PreviousAccountsList[Key] ~= nil then
		PreviousAccountsList[Key] = nil
		AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
		AppStorageUtilitiesModule.flush()
	end
end