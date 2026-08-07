local appStorageUtilitiesModule = require(script:FindFirstAncestor("AuthCommon").Utils.AppStorageUtilities)

return function(p0) --[[ line: 4 ]]
	-- upvalues: appStorageUtilitiesModule (ref)
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	
	if previousAccountsList[p0] ~= nil then
		previousAccountsList[p0] = nil
		appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
		appStorageUtilitiesModule.flush()
	end
end