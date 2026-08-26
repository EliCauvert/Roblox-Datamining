local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorInventory)
local _ = require(script.Parent.AssetLibraryTypes)

return function(value, p1)
	local creationContext = value.creationContext
	local var1 = if creationContext ~= nil then nil else creationContext.creator
	
	if var1 ~= nil and var1.name ~= nil and var1.name ~= "" then
		return var1.name
	end
	for i, v in value.sources or {} do
		if v.createdDetails == nil then
			if v.purchasedDetails == nil then
				if v.sharedDetails ~= nil then
					return p1.shared
				end
			end
			return p1.purchased
		end
		return p1.created
	end
	return nil
end