local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local userModule = require(authCommon.Thunks.User)
local cryoModule = require(authCommon.Parent.Cryo)
local prunePreviousAccountsListModule = require(authCommon.Utils.prunePreviousAccountsList)

return function(value, p0)
	-- upvalues: userModule (ref), appStorageUtilitiesModule (ref), cryoModule (ref), prunePreviousAccountsListModule (ref)
	local var6, var7
	local _ = nil
	p0 = p0 or true
	
	if value then
		var7 = {
			userId = value.user_id,
			username = value.username,
			displayName = value.display_name
		}
	else
		var6 = userModule.fromLocalStorage()
		
		if var6 == nil or var6.userId == -1 then return end
		if var6.username == nil or var6.username == "" then return end
		var7 = var6
	end
	var6 = appStorageUtilitiesModule.getPreviousAccountsList()
	local var8 = tostring(var7.userId)
	local var9 = var6[var8]
	
	if var9 then
		var6[var8] = cryoModule.Dictionary.join(var9, {
			userId = var8,
			username = var7.username,
			displayName = if var7.displayName and var7.displayName ~= "nil" then var7.displayName else "",
			signOutTimestamp = os.time(),
			showInAccountPicker = p0
		})
		appStorageUtilitiesModule.setPreviousAccountsList(var6)
		prunePreviousAccountsListModule()
		
		return true
	end
	var6[var8] = {
		loginMethod = nil,
		signInTimestamp = nil,
		userId = var8,
		username = var7.username,
		userIdentifier = var7.username,
		displayName = if var7.displayName and var7.displayName ~= "nil" then var7.displayName else "",
		signOutTimestamp = os.time(),
		showInAccountPicker = p0
	}
	appStorageUtilitiesModule.setPreviousAccountsList(var6)
	prunePreviousAccountsListModule()
	
	return true
end