local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Tile = require(SocialCarousel.Common.Enums).Tile
local FFlagShowRequestsInCarouselForAllUsers = require(SocialCarousel.Parent.SharedFlags).FFlagShowRequestsInCarouselForAllUsers

return function(Friend)
	-- upvalues: FFlagShowRequestsInCarouselForAllUsers (copy), Tile (copy)
	return if FFlagShowRequestsInCarouselForAllUsers and Friend == Tile.FriendRequest then Enum.FriendStatus.FriendRequestReceived elseif Friend == Tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend
end