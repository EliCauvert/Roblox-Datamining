local _ = require(script:FindFirstAncestor("PurchasePrompt").types)
local config = {
	[Enum.InfoType.GamePass] = "GamePass",
	[Enum.InfoType.Product] = "DeveloperProduct"
}

return function(p1, p2) --[[ Line: 22 | Named "getInGameItemProductIdentifier" ]]
	-- upvalues: config (copy)
	local Entry = config[p1]
	
	if Entry == nil then
		return nil
	elseif p2 == nil then
		return nil
	else
		local Text = tostring(p2)
		
		return if Text == "" then nil else { namespace = Entry, targetIdentifier = Text }
	end
end