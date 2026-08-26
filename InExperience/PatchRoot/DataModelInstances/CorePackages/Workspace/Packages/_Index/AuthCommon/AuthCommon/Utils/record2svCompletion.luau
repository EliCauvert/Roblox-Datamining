local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local cryoModule = require(authCommon.Parent.Cryo)

return function(p1)
	-- upvalues: appStorageUtilitiesModule (ref), cryoModule (ref)
	if p1 == nil or p1 == "0" then
		return false
	end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var1 = previousAccountsList[p1]
	
	if var1 then
		previousAccountsList[p1] = cryoModule.Dictionary.join(var1, { signInTimestamp = os.time() })
		appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
		
		return true
	end
	return false
end