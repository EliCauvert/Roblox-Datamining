local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local _ = require(authCommon.Utils.PreviousAccountEntry)
local parent = authCommon.Parent
local cryoModule = require(parent.Cryo)
local getFFlagShowInvoluntarilySignedOutAccounts = require(parent.SharedFlags).GetFFlagShowInvoluntarilySignedOutAccounts
local fFlagFixPreviousAccountsListEntries = require(parent.SharedFlags).FFlagFixPreviousAccountsListEntries

local function _(p1, p2, p3)
	local t = {}
	
	for i = p2, p3 do
		table.insert(t, p1[i])
	end
	return t
end

return function(value, p4, p5)
	-- upvalues: appStorageUtilitiesModule (ref), getFFlagShowInvoluntarilySignedOutAccounts (ref), cryoModule (ref), fFlagFixPreviousAccountsListEntries (ref)
	local var1 = getFFlagShowInvoluntarilySignedOutAccounts()
	local var2 = cryoModule.List.filter(cryoModule.Dictionary.values(appStorageUtilitiesModule.getPreviousAccountsList()), function(p6)
		-- upvalues: fFlagFixPreviousAccountsListEntries (copy), var1 (ref), p4 (ref), p5 (ref)
		local userId
		if fFlagFixPreviousAccountsListEntries then
			userId = p6.userId
			
			if userId == nil or userId == "" then
				return false
			elseif not var1 then
				return p6.signOutTimestamp
			end
			userId = p4 ~= nil and (p6.userId ~= nil and p4[p6.userId] == true)
			
			return not userId and not (p5 == true and p6.showInAccountPicker == false)
		end
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