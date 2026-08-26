local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local cryoModule = require(authCommon.Parent.Cryo)

return function(p1, p2)
	-- upvalues: appStorageUtilitiesModule (ref), cryoModule (ref)
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var1 = previousAccountsList[p1]
	
	if var1 then
		previousAccountsList[p1] = cryoModule.Dictionary.join(var1, p2)
	end
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	
	return true
end