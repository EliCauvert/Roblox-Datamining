local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local userModule = require(authCommon.Thunks.User)
local cryoModule = require(authCommon.Parent.Cryo)
local prunePreviousAccountsListModule = require(authCommon.Utils.prunePreviousAccountsList)

return function(value, p1)
	-- upvalues: userModule (ref), appStorageUtilitiesModule (ref), cryoModule (ref), prunePreviousAccountsListModule (ref)
	local var1, var2
	local _ = nil
	p1 = p1 or true
	
	if value then
		var2 = {
			userId = value.user_id,
			username = value.username,
			displayName = value.display_name
		}
	else
		var1 = userModule.fromLocalStorage()
		
		if var1 == nil or var1.userId == -1 then return end
		if var1.username == nil or var1.username == "" then return end
		var2 = var1
	end
	var1 = appStorageUtilitiesModule.getPreviousAccountsList()
	local var3 = tostring(var2.userId)
	local var4 = var1[var3]
	
	if var4 then
		var1[var3] = cryoModule.Dictionary.join(var4, {
			userId = var3,
			username = var2.username,
			displayName = if var2.displayName and var2.displayName ~= "nil" then var2.displayName else "",
			signOutTimestamp = os.time(),
			showInAccountPicker = p1
		})
		appStorageUtilitiesModule.setPreviousAccountsList(var1)
		prunePreviousAccountsListModule()
		
		return true
	end
	var1[var3] = {
		loginMethod = nil,
		signInTimestamp = nil,
		userId = var3,
		username = var2.username,
		userIdentifier = var2.username,
		displayName = if var2.displayName and var2.displayName ~= "nil" then var2.displayName else "",
		signOutTimestamp = os.time(),
		showInAccountPicker = p1
	}
	appStorageUtilitiesModule.setPreviousAccountsList(var1)
	prunePreviousAccountsListModule()
	
	return true
end