local authCommon = script:FindFirstAncestor("AuthCommon")
local loginResultModule = require(authCommon.Models.LoginResult)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local prunePreviousAccountsListModule = require(authCommon.Utils.prunePreviousAccountsList)
local cryoModule = require(authCommon.Parent.Cryo)

return function(p1, p2, p3)
	-- upvalues: appStorageUtilitiesModule (ref), loginResultModule (ref), cryoModule (ref), prunePreviousAccountsListModule (ref)
	if p1.user.id == nil or p1.user.id == "0" then
		return false
	elseif p1.user.name == nil or p1.user.name == "" then
		return false
	end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var1 = p3
	
	if var1 == nil then
		var1 = p1.user.name
	end
	local timestamp = os.time()
	local var2 = loginResultModule.hasTwoStepData(p1)
	
	if var2 then
		timestamp = nil
	end
	local t = {
		showInAccountPicker = true,
		userId = p1.user.id,
		userIdentifier = var1,
		loginMethod = p2,
		username = p1.user.name,
		signInTimestamp = timestamp
	}
	local id = previousAccountsList[p1.user.id]
	
	if id == nil then
		previousAccountsList[p1.user.id] = t
	elseif not var2 then
		t.signOutTimestamp = cryoModule.None
	end
	previousAccountsList[p1.user.id] = cryoModule.Dictionary.join(id, t)
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	prunePreviousAccountsListModule()
	
	return true
end