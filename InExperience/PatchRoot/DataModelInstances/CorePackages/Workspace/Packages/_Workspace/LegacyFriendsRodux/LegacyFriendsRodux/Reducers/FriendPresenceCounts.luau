local legacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local cryoModule = require(legacyFriendsRodux.Parent.Cryo)
local updateFriendPresenceCounts = require(legacyFriendsRodux.Actions).UpdateFriendPresenceCounts

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: updateFriendPresenceCounts (ref), cryoModule (ref)
	return if p1.type == updateFriendPresenceCounts.name then cryoModule.Dictionary.join({}, p1.presenceCounts) else p0 or {}
end