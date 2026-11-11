local DiscoveryTypesModule = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants

return function(Game)
	-- upvalues: OmniFeedConstants (copy), OmniFeedTypes (copy)
	local SearchGameGrid = nil
	
	if Game == OmniFeedConstants.ContentGroupType.Game then
		SearchGameGrid = OmniFeedTypes.SearchGameGrid
		
		return SearchGameGrid
	end
	if Game == OmniFeedConstants.ContentGroupType.Text then
		SearchGameGrid = OmniFeedTypes.SearchText
		
		return SearchGameGrid
	end
	if Game == OmniFeedConstants.ContentGroupType.User then
		SearchGameGrid = OmniFeedTypes.UserSearchGrid
	end
	return SearchGameGrid
end