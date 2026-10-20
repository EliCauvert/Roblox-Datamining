local _ = require(script:FindFirstAncestor("FriendsActivityFeed").Common.ActivityFeedTypes)

return function(p1)
	return if p1 == nil then nil elseif p1.displayName == nil or p1.displayName == "" then if p1.username == nil or p1.username == "" then nil else p1.username else p1.displayName
end