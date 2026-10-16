local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local _ = require(AccountUpgrade.AccountUpgradeField)
local _ = require(AccountUpgrade.FlowSpec)

return function(p1) --[[ Line: 23 | Named "resolveFieldStates" ]]
	local t = {}
	
	for _, optionalField in ipairs(p1.spec.optionalFields) do
		t[optionalField] = { isUnlocked = true, blockingField = nil }
	end
	local BlockingField = nil
	
	for _, requiredField in ipairs(p1.spec.requiredFields) do
		t[requiredField] = {
			isUnlocked = BlockingField == nil,
			blockingField = BlockingField
		}
		
		if not p1.isSatisfied[requiredField] and BlockingField == nil then
			BlockingField = requiredField
		end
	end
	return t
end