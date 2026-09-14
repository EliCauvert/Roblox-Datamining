local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local _ = require(accountUpgrade.AccountUpgradeField)
local _ = require(accountUpgrade.FlowSpec)

return function(p1)
	local t = {}
	
	for i, v in ipairs(p1.spec.optionalFields) do
		t[v] = { isUnlocked = true, blockingField = nil }
	end
	local var1 = nil
	
	for i_1, v_1 in ipairs(p1.spec.requiredFields) do
		t[v_1] = { isUnlocked = var1 == nil, blockingField = var1 }
		
		if not p1.isSatisfied[v_1] and var1 == nil then
			var1 = v_1
		end
	end
	return t
end