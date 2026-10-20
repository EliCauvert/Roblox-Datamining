local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local CryoModule = require(AuthCommon.Parent.Cryo)

return function(Key): boolean
	-- upvalues: AppStorageUtilitiesModule (copy), CryoModule (copy)
	if Key == nil or Key == "0" then
		return false
	end
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local PreviousAccounts = PreviousAccountsList[Key]
	
	if PreviousAccounts then
		PreviousAccountsList[Key] = CryoModule.Dictionary.join(PreviousAccounts, { signInTimestamp = os.time() })
		AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
		
		return true
	else
		return false
	end
end