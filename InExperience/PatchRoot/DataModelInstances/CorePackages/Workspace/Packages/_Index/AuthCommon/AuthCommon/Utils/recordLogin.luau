local authCommon = script:FindFirstAncestor("AuthCommon")
local loginResultModule = require(authCommon.Models.LoginResult)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local prunePreviousAccountsListModule = require(authCommon.Utils.prunePreviousAccountsList)
local cryoModule = require(authCommon.Parent.Cryo)

return function(p0, p1, p2) --[[ line: 10 | named "recordLogin" ]]
	-- upvalues: appStorageUtilitiesModule (ref), loginResultModule (ref), cryoModule (ref), prunePreviousAccountsListModule (ref)
	if p0.user.id == nil or p0.user.id == "0" then
		return false
	elseif p0.user.name == nil or p0.user.name == "" then
		return false
	end
	local previousAccountsList = appStorageUtilitiesModule.getPreviousAccountsList()
	local var6 = p2
	
	if var6 == nil then
		var6 = p0.user.name
	end
	local timestamp = os.time()
	local var8 = loginResultModule.hasTwoStepData(p0)
	
	if var8 then
		timestamp = nil
	end
	local t = {
		showInAccountPicker = true,
		userId = p0.user.id,
		userIdentifier = var6,
		loginMethod = p1,
		username = p0.user.name,
		signInTimestamp = timestamp
	}
	local id = previousAccountsList[p0.user.id]
	
	if id == nil then
		previousAccountsList[p0.user.id] = t
	elseif not var8 then
		t.signOutTimestamp = cryoModule.None
	end
	previousAccountsList[p0.user.id] = cryoModule.Dictionary.join(id, t)
	appStorageUtilitiesModule.setPreviousAccountsList(previousAccountsList)
	prunePreviousAccountsListModule()
	
	return true
end