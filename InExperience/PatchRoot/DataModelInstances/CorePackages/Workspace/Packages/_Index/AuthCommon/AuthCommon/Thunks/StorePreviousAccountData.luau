local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local userModule = require(authCommon.Thunks.User)
local parent = authCommon.Parent
local cryoModule = require(parent.Cryo)
local fFlagFixPreviousAccountsListEntries = require(parent.SharedFlags).FFlagFixPreviousAccountsListEntries

return function()
	-- upvalues: userModule (ref), appStorageUtilitiesModule (ref), fFlagFixPreviousAccountsListEntries (ref), cryoModule (ref)
	local var1 = userModule.fromLocalStorage()
	
	if var1 == nil or var1.userId == -1 then return end
	if var1.username == nil or var1.username == "" then return end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var2 = tostring(var1.userId)
	local t = {
		username = var1.username,
		displayName = if var1.displayName and var1.displayName ~= "nil" then var1.displayName else "",
		timestamp = os.time()
	}
	
	if fFlagFixPreviousAccountsListEntries then
		t.userId = var2
		previousAccountsList[var2] = cryoModule.Dictionary.join(previousAccountsList[var2] or {}, t)
	else
		previousAccountsList[var2] = t
	end
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	appStorageUtilitiesModule.flush()
end