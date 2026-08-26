local appStorageUtilitiesModule = require(script:FindFirstAncestor("AuthCommon").Utils.AppStorageUtilities)

return function(p1)
	-- upvalues: appStorageUtilitiesModule (ref)
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	
	if previousAccountsList[p1] ~= nil then
		previousAccountsList[p1] = nil
		appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
		appStorageUtilitiesModule.flush()
	end
end