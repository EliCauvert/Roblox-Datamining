local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local cryoModule = require(authCommon.Parent.Cryo)

return function(p0)
	-- upvalues: appStorageUtilitiesModule (ref), cryoModule (ref)
	if p0 == nil or p0 == "0" then
		return false
	end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var4 = previousAccountsList[p0]
	
	if var4 then
		previousAccountsList[p0] = cryoModule.Dictionary.join(var4, { signInTimestamp = os.time() })
		appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
		
		return true
	end
	return false
end