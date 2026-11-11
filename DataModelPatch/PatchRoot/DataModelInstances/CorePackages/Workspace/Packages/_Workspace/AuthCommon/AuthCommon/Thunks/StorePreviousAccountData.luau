local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local UserModule = require(AuthCommon.Thunks.User)

return function()
	-- upvalues: UserModule (copy), AppStorageUtilitiesModule (copy)
	local FromLocalStorageResult = UserModule.fromLocalStorage()
	
	if FromLocalStorageResult == nil or FromLocalStorageResult.userId == -1 then return end
	if FromLocalStorageResult.username ~= nil and FromLocalStorageResult.username ~= "" then
		local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
		PreviousAccountsList[tostring(FromLocalStorageResult.userId)] = {
			username = FromLocalStorageResult.username,
			displayName = if FromLocalStorageResult.displayName and FromLocalStorageResult.displayName ~= "nil" then FromLocalStorageResult.displayName else "",
			timestamp = os.time()
		}
		AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
		AppStorageUtilitiesModule.flush()
		
		return
	end
end