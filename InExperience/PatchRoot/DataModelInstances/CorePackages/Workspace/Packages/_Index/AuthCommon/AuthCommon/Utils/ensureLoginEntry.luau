local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local prunePreviousAccountsListModule = require(authCommon.Utils.prunePreviousAccountsList)
local parent = authCommon.Parent
local cryoModule = require(parent.Cryo)
local fFlagFixPreviousAccountsListEntries = require(parent.SharedFlags).FFlagFixPreviousAccountsListEntries

return function(p1, p2)
	-- upvalues: appStorageUtilitiesModule (ref), fFlagFixPreviousAccountsListEntries (ref), cryoModule (ref), prunePreviousAccountsListModule (ref)
	if p1 == nil or p1 == "" or (p1 == "0" or p1 == "-1") then
		return false
	elseif p2.username == nil or p2.username == "" then
		return false
	end
	local var1 = if p2.displayName and p2.displayName ~= "nil" then p2.displayName else nil
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var2 = previousAccountsList[p1]
	
	if not var2 then
		previousAccountsList[p1] = {
			showInAccountPicker = true,
			userId = p1,
			userIdentifier = p2.username,
			username = p2.username,
			displayName = var1,
			signInTimestamp = os.time()
		}
		appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
		prunePreviousAccountsListModule()
		
		return true
	end
	local t = { username = p2.username, displayName = var1 }
	
	if fFlagFixPreviousAccountsListEntries then
		t.userId = p1
	end
	previousAccountsList[p1] = cryoModule.Dictionary.join(var2, t)
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	
	return true
end