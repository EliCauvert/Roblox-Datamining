local _ = require(script:FindFirstAncestor("FriendsActivityFeed").Parent.React)

return {
	ExperienceJoin = require(script.Parent.ExperienceJoinTile),
	AvatarChange = require(script.Parent.AvatarChangeTile),
	BadgeAwarded = require(script.Parent.BadgeAwardedTile)
}