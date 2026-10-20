local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local _ = require(AuthCommon.Utils.PreviousAccountEntry)
local UserModule = require(AuthCommon.Thunks.User)
local CryoModule = require(AuthCommon.Parent.Cryo)
local PrunePreviousAccountsListModule = require(AuthCommon.Utils.prunePreviousAccountsList)

return function(p1, p2): boolean?
	-- upvalues: UserModule (copy), AppStorageUtilitiesModule (copy), CryoModule (copy), PrunePreviousAccountsListModule (copy)
	local P1 = p2 or true
	local config = nil
	
	if p1 then
		config = {
			userId = p1.user_id,
			username = p1.username,
			displayName = p1.display_name
		}
	else
		local FromLocalStorageResult = UserModule.fromLocalStorage()
		
		if FromLocalStorageResult == nil or FromLocalStorageResult.userId == -1 then return end
		if FromLocalStorageResult.username == nil or FromLocalStorageResult.username == "" then return end
		config = FromLocalStorageResult
	end
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local Text = tostring(config.userId)
	local PreviousAccounts = PreviousAccountsList[Text]
	
	if PreviousAccounts then
		PreviousAccountsList[Text] = CryoModule.Dictionary.join(PreviousAccounts, {
			userId = Text,
			username = config.username,
			displayName = if config.displayName and config.displayName ~= "nil" then config.displayName else "",
			signOutTimestamp = os.time(),
			showInAccountPicker = P1
		})
		AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
		PrunePreviousAccountsListModule()
		
		return true
	else
		PreviousAccountsList[Text] = {
			loginMethod = nil,
			signInTimestamp = nil,
			userId = Text,
			username = config.username,
			userIdentifier = config.username,
			displayName = if config.displayName and config.displayName ~= "nil" then config.displayName else "",
			signOutTimestamp = os.time(),
			showInAccountPicker = P1
		}
		AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
		PrunePreviousAccountsListModule()
		
		return true
	end
end