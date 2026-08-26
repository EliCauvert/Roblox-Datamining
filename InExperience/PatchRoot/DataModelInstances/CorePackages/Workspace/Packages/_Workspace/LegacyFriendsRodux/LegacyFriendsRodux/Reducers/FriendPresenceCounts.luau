local legacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local cryoModule = require(legacyFriendsRodux.Parent.Cryo)
local updateFriendPresenceCounts = require(legacyFriendsRodux.Actions).UpdateFriendPresenceCounts

return function(p1, p2)
	-- upvalues: updateFriendPresenceCounts (ref), cryoModule (ref)
	return if p2.type == updateFriendPresenceCounts.name then cryoModule.Dictionary.join({}, p2.presenceCounts) else p1 or {}
end