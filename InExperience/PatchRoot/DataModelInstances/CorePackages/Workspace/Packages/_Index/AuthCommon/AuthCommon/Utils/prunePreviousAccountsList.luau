local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local cryoModule = require(authCommon.Parent.Cryo)
local defaultMaxPruneAccounts = game:DefineFastInt("DefaultMaxPruneAccounts", 50)
local _ = require(authCommon.Utils.PreviousAccountEntry)

return function()
	-- upvalues: appStorageUtilitiesModule (ref), cryoModule (ref), defaultMaxPruneAccounts (ref)
	local var1 = cryoModule.Dictionary.values(appStorageUtilitiesModule.getPreviousAccountsList())
	local var2 = cryoModule.List.filter(var1, function(p1)
		return p1.signOutTimestamp == nil
	end)
	local var3 = cryoModule.List.filter(var1, function(p1)
		return p1.signOutTimestamp ~= nil
	end)
	
	if #var3 <= defaultMaxPruneAccounts then
		return true
	end
	local var4 = cryoModule.List.sort(var3, function(p1, p2)
		return p2.signOutTimestamp < p1.signOutTimestamp
	end)
	local t = {}
	local var5 = 0
	
	for i, v in ipairs(var4) do
		if defaultMaxPruneAccounts <= var5 then break end
		if v.userId then
			t[v.userId] = v
		end
		var5 += 1
	end
	for i, v_1 in ipairs(var2) do
		if v_1.userId then
			t[v_1.userId] = v_1
		end
	end
	appStorageUtilitiesModule.setPreviousAccountsList(t)
	
	return true
end