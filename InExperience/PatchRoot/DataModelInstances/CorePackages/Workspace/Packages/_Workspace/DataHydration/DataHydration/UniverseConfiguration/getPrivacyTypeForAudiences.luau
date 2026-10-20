local Audience = require(script:FindFirstAncestor("DataHydration").UniverseActivation.UniverseActivationStoreTypes).Audience
local PrivacyType = require(script.Parent.UniverseConfigurationStoreTypes).PrivacyType
local list = {
	{
		audience = Audience.Public,
		privacyType = PrivacyType.Public
	},
	{
		audience = Audience.Friends,
		privacyType = PrivacyType.FriendsOnly
	}
}

return function(List)
	-- upvalues: list (copy), PrivacyType (copy)
	for _, value in list do
		if table.find(List, value.audience) then
			return value.privacyType
		end
	end
	return PrivacyType.Private
end