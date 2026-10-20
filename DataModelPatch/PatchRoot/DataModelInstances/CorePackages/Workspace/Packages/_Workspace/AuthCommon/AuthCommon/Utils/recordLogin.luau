local AuthCommon = script:FindFirstAncestor("AuthCommon")
local LoginResultModule = require(AuthCommon.Models.LoginResult)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local _ = require(AuthCommon.Utils.PreviousAccountEntry)
local PrunePreviousAccountsListModule = require(AuthCommon.Utils.prunePreviousAccountsList)
local CryoModule = require(AuthCommon.Parent.Cryo)

return function(p1, LoginMethod, Name): boolean
	-- upvalues: AppStorageUtilitiesModule (copy), LoginResultModule (copy), CryoModule (copy), PrunePreviousAccountsListModule (copy)
	if p1.user.id == nil or p1.user.id == "0" then
		return false
	end
	if p1.user.name == nil or p1.user.name == "" then
		return false
	end
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local Name1 = Name
	
	if Name1 == nil then
		Name1 = p1.user.name
	end
	local Timestamp: number? = os.time()
	local HasTwoStepData = LoginResultModule.hasTwoStepData(p1)
	
	if HasTwoStepData then
		Timestamp = nil
	end
	local config = {
		showInAccountPicker = true,
		userId = p1.user.id,
		userIdentifier = Name1,
		loginMethod = LoginMethod,
		username = p1.user.name,
		signInTimestamp = Timestamp
	}
	local PreviousAccounts = PreviousAccountsList[p1.user.id]
	
	if PreviousAccounts == nil then
		PreviousAccountsList[p1.user.id] = config
	else
		if not HasTwoStepData then
			config.signOutTimestamp = CryoModule.None
		end
		PreviousAccountsList[p1.user.id] = CryoModule.Dictionary.join(PreviousAccounts, config)
	end
	AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
	PrunePreviousAccountsListModule()
	
	return true
end