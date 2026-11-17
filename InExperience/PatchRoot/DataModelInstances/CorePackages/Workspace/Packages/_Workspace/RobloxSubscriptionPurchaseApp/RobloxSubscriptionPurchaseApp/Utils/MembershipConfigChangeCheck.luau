local _ = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").types)

local function deepEqual(List, List1): boolean
	-- upvalues: deepEqual (copy)
	if type(List) ~= "table" or type(List1) ~= "table" then
		return List == List1
	end
	for i, value in List do
		if not deepEqual(value, List1[i]) then
			return false
		end
	end
	for i1 in List1 do
		if List[i1] == nil then
			return false
		end
	end
	return true
end

return {
	isChanged = function(p1, p2): boolean
		-- upvalues: deepEqual (copy)
		return not deepEqual(p1, p2)
	end
}