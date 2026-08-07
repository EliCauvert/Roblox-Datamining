local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local parent = authCommon.Parent
local cryoModule = require(parent.Cryo)
local getFFlagShowInvoluntarilySignedOutAccounts = require(parent.SharedFlags).GetFFlagShowInvoluntarilySignedOutAccounts

local function _(p0, p1, p2) --[[ line: 12 | named "subarray" ]]
	local t = {}
	
	for i = p1, p2 do
		table.insert(t, p0[i])
	end
	return t
end

return function(value, p3, p4) --[[ line: 20 | named "getSignedOutAccounts" ]]
	-- upvalues: appStorageUtilitiesModule (ref), getFFlagShowInvoluntarilySignedOutAccounts (ref), cryoModule (ref)
	local var4 = getFFlagShowInvoluntarilySignedOutAccounts()
	local var5 = cryoModule.List.filter(cryoModule.Dictionary.values(appStorageUtilitiesModule.getPreviousAccountsList()), function(p5) --[[ line: 29 ]]
		-- upvalues: var4 (ref), p3 (ref), p4 (ref)
		return if var4 then not (p3 ~= nil and (p5.userId ~= nil and p3[p5.userId] == true)) and not (p4 == true and p5.showInAccountPicker == false) else p5.signOutTimestamp
	end)
	var5 = if var4 then cryoModule.List.sort(var5, function(p8, p9) --[[ line: 43 ]]
		return (p9.signOutTimestamp or (p9.signInTimestamp or 0)) < (p8.signOutTimestamp or (p8.signInTimestamp or 0))
	end) else cryoModule.List.sort(var5, function(p6, p7) --[[ line: 52 ]]
		return p7.signOutTimestamp < p6.signOutTimestamp
	end)
	
	if not var5 then
		return {}
	end
	local var6 = var5
	local t = {}
	
	for i = 1, math.min(value, #var5) do
		table.insert(t, var6[i])
	end
	return t
end