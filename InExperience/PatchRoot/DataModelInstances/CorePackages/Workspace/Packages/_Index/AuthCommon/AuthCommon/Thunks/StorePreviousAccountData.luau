local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local userModule = require(authCommon.Thunks.User)

return function()
	-- upvalues: userModule (ref), appStorageUtilitiesModule (ref)
	local var3 = userModule.fromLocalStorage()
	
	if var3 == nil or var3.userId == -1 then return end
	if var3.username == nil or var3.username == "" then return end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	previousAccountsList[tostring(var3.userId)] = {
		username = var3.username,
		displayName = if var3.displayName and var3.displayName ~= "nil" then var3.displayName else "",
		timestamp = os.time()
	}
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	appStorageUtilitiesModule.flush()
end