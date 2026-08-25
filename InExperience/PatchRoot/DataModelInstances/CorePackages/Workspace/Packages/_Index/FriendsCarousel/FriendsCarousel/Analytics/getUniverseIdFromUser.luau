local friendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local _ = require(friendsCarousel.Parent.GraphQLServer)
local _ = require(friendsCarousel.Common.LocalTypes)

return function(p0)
	local universeId = nil
	
	if p0.__typename == "Friend" then
		local presence = p0.presence or {}
		
		if presence.universeId then
			return tonumber(presence.universeId)
		end
		universeId = nil
		
		return universeId
	elseif p0.isFriendWithUser then
		universeId = p0.universeId
	end
	return universeId
end