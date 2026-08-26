local friendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local _ = require(friendsCarousel.Parent.GraphQLServer)
local _ = require(friendsCarousel.Common.LocalTypes)

return function(p1)
	local universeId = nil
	
	if p1.__typename == "Friend" then
		local presence = p1.presence or {}
		
		if presence.universeId then
			return tonumber(presence.universeId)
		end
		universeId = nil
		
		return universeId
	elseif p1.isFriendWithUser then
		universeId = p1.universeId
	end
	return universeId
end