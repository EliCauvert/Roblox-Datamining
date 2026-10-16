local FriendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local _ = require(FriendsCarousel.Parent.GraphQLServer)
local _ = require(FriendsCarousel.Common.LocalTypes)

return function(p1) --[[ Line: 9 ]]
	local UniverseId = nil
	
	if p1.__typename == "Friend" then
		local Presence = p1.presence or {}
		
		return if Presence.universeId then tonumber(Presence.universeId) else nil
	end
	if p1.isFriendWithUser then
		UniverseId = p1.universeId
	end
	return UniverseId
end