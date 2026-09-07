local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local parent = authCommon.Parent
local cryoModule = require(parent.Cryo)
local getFFlagShowInvoluntarilySignedOutAccounts = require(parent.SharedFlags).GetFFlagShowInvoluntarilySignedOutAccounts

local function _(p1, p2, p3)
	local t = {}
	
	for i = p2, p3 do
		table.insert(t, p1[i])
	end
	return t
end

return function(value, p4, p5)
	-- upvalues: appStorageUtilitiesModule (ref), getFFlagShowInvoluntarilySignedOutAccounts (ref), cryoModule (ref)
	local var1 = getFFlagShowInvoluntarilySignedOutAccounts()
	local var2 = cryoModule.List.filter(cryoModule.Dictionary.values(appStorageUtilitiesModule.getPreviousAccountsList()), function(p6)
		-- upvalues: var1 (ref), p4 (ref), p5 (ref)
		return if var1 then not (p4 ~= nil and (p6.userId ~= nil and p4[p6.userId] == true)) and not (p5 == true and p6.showInAccountPicker == false) else p6.signOutTimestamp
	end)
	var2 = if var1 then cryoModule.List.sort(var2, function(p6, p7)
		return (p7.signOutTimestamp or (p7.signInTimestamp or 0)) < (p6.signOutTimestamp or (p6.signInTimestamp or 0))
	end) else cryoModule.List.sort(var2, function(p6, p7)
		return p7.signOutTimestamp < p6.signOutTimestamp
	end)
	
	if not var2 then
		return {}
	end
	local var3 = var2
	local t = {}
	
	for i = 1, math.min(value, #var2) do
		table.insert(t, var3[i])
	end
	return t
end