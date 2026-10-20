local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local _ = require(AuthCommon.Utils.PreviousAccountEntry)
local PrunePreviousAccountsListModule = require(AuthCommon.Utils.prunePreviousAccountsList)
local Parent = AuthCommon.Parent
local CryoModule = require(Parent.Cryo)
local FFlagFixPreviousAccountsListEntries = require(Parent.SharedFlags).FFlagFixPreviousAccountsListEntries

return function(UserId, p1): boolean
	-- upvalues: AppStorageUtilitiesModule (copy), FFlagFixPreviousAccountsListEntries (copy), CryoModule (copy), PrunePreviousAccountsListModule (copy)
	if UserId == nil or UserId == "" or UserId == "0" or UserId == "-1" then
		return false
	end
	if p1.username == nil or p1.username == "" then
		return false
	end
	local DisplayName = if p1.displayName and p1.displayName ~= "nil" then p1.displayName else nil
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local PreviousAccounts = PreviousAccountsList[UserId]
	
	if not PreviousAccounts then
		PreviousAccountsList[UserId] = {
			showInAccountPicker = true,
			userId = UserId,
			userIdentifier = p1.username,
			username = p1.username,
			displayName = DisplayName,
			signInTimestamp = os.time()
		}
		AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
		PrunePreviousAccountsListModule()
		
		return true
	end
	local config = { username = p1.username, displayName = DisplayName }
	
	if FFlagFixPreviousAccountsListEntries then
		config.userId = UserId
	end
	PreviousAccountsList[UserId] = CryoModule.Dictionary.join(PreviousAccounts, config)
	AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
	
	return true
end