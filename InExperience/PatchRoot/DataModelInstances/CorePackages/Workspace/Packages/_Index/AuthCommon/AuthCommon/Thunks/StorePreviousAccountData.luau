local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local UserModule = require(AuthCommon.Thunks.User)
local Parent = AuthCommon.Parent
local CryoModule = require(Parent.Cryo)
local FFlagFixPreviousAccountsListEntries = require(Parent.SharedFlags).FFlagFixPreviousAccountsListEntries

return function() --[[ Line: 8 ]]
	-- upvalues: UserModule (copy), AppStorageUtilitiesModule (copy), FFlagFixPreviousAccountsListEntries (copy), CryoModule (copy)
	local FromLocalStorageResult = UserModule.fromLocalStorage()
	
	if FromLocalStorageResult == nil or FromLocalStorageResult.userId == -1 then return end
	if FromLocalStorageResult.username == nil or FromLocalStorageResult.username == "" then return end
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local Text = tostring(FromLocalStorageResult.userId)
	local config = {
		username = FromLocalStorageResult.username,
		displayName = if FromLocalStorageResult.displayName and FromLocalStorageResult.displayName ~= "nil" then FromLocalStorageResult.displayName else "",
		timestamp = os.time()
	}
	
	if FFlagFixPreviousAccountsListEntries then
		config.userId = Text
		PreviousAccountsList[Text] = CryoModule.Dictionary.join(PreviousAccountsList[Text] or {}, config)
	else
		PreviousAccountsList[Text] = config
	end
	AppStorageUtilitiesModule.setPreviousAccountsList(PreviousAccountsList)
	AppStorageUtilitiesModule.flush()
end