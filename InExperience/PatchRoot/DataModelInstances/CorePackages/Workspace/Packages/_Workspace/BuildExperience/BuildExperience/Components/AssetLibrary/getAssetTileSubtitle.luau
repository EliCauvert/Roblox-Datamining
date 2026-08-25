local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorInventory)
local _ = require(script.Parent.AssetLibraryTypes)

return function(value, p0)
	local creationContext = value.creationContext
	local var0 = if creationContext ~= nil then nil else creationContext.creator
	
	if var0 ~= nil and var0.name ~= nil and var0.name ~= "" then
		return var0.name
	end
	for i, v in value.sources or {} do
		if v.createdDetails == nil then
			if v.purchasedDetails == nil then
				if v.sharedDetails ~= nil then
					return p0.shared
				end
			end
			return p0.purchased
		end
		return p0.created
	end
	return nil
end