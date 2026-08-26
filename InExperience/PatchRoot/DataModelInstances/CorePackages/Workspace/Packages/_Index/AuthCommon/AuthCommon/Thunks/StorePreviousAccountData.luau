local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local userModule = require(authCommon.Thunks.User)

return function()
	-- upvalues: userModule (ref), appStorageUtilitiesModule (ref)
	local var1 = userModule.fromLocalStorage()
	
	if var1 == nil or var1.userId == -1 then return end
	if var1.username == nil or var1.username == "" then return end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	previousAccountsList[tostring(var1.userId)] = {
		username = var1.username,
		displayName = if var1.displayName and var1.displayName ~= "nil" then var1.displayName else "",
		timestamp = os.time()
	}
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	appStorageUtilitiesModule.flush()
end