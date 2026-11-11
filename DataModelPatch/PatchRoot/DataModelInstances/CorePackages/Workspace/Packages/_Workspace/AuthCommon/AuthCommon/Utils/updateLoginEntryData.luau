local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local CryoModule = require(AuthCommon.Parent.Cryo)

return function(Key, p1): boolean
	-- upvalues: AppStorageUtilitiesModule (copy), CryoModule (copy)
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local PreviousAccounts = PreviousAccountsList[Key]
	
	if PreviousAccounts then
		PreviousAccountsList[Key] = CryoModule.Dictionary.join(PreviousAccounts, p1)
	end
	AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
	
	return true
end