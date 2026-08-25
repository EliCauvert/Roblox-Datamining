local authCommon = script:FindFirstAncestor("AuthCommon")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local cryoModule = require(authCommon.Parent.Cryo)
local defaultMaxPruneAccounts = game:DefineFastInt("DefaultMaxPruneAccounts", 50)
local _ = require(authCommon.Utils.PreviousAccountEntry)

return function()
	-- upvalues: appStorageUtilitiesModule (ref), cryoModule (ref), defaultMaxPruneAccounts (ref)
	local var4 = cryoModule.Dictionary.values(appStorageUtilitiesModule.getPreviousAccountsList())
	local var5 = cryoModule.List.filter(var4, function(p0)
		return p0.signOutTimestamp == nil
	end)
	local var6 = cryoModule.List.filter(var4, function(p1)
		return p1.signOutTimestamp ~= nil
	end)
	
	if #var6 <= defaultMaxPruneAccounts then
		return true
	end
	local var7 = cryoModule.List.sort(var6, function(p2, p3)
		return p3.signOutTimestamp < p2.signOutTimestamp
	end)
	local t = {}
	local var9 = 0
	
	for i, v in ipairs(var7) do
		if defaultMaxPruneAccounts <= var9 then break end
		if v.userId then
			t[v.userId] = v
		end
		var9 += 1
	end
	for i, v_1 in ipairs(var5) do
		if v_1.userId then
			t[v_1.userId] = v_1
		end
	end
	appStorageUtilitiesModule.setPreviousAccountsList(t)
	
	return true
end