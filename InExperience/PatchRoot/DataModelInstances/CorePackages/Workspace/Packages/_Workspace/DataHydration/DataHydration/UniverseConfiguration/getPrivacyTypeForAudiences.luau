local audience = require(script:FindFirstAncestor("DataHydration").UniverseActivation.UniverseActivationStoreTypes).Audience
local privacyType = require(script.Parent.UniverseConfigurationStoreTypes).PrivacyType
local list = {
	{
		audience = audience.Public,
		privacyType = privacyType.Public
	},
	{
		audience = audience.Friends,
		privacyType = privacyType.FriendsOnly
	}
}

return function(p0)
	-- upvalues: list (ref), privacyType (ref)
	for i, v in list do
		if table.find(p0, v.audience) then
			return v.privacyType
		end
	end
	return privacyType.Private
end