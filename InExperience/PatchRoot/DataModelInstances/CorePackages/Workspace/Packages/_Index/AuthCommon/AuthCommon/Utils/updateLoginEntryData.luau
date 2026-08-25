local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local cryoModule = require(authCommon.Parent.Cryo)

return function(p0, p1)
	-- upvalues: appStorageUtilitiesModule (ref), cryoModule (ref)
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var4 = previousAccountsList[p0]
	
	if var4 then
		previousAccountsList[p0] = cryoModule.Dictionary.join(var4, p1)
	end
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	
	return true
end