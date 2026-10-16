local LegacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local CryoModule = require(LegacyFriendsRodux.Parent.Cryo)
local UpdateFriendPresenceCounts = require(LegacyFriendsRodux.Actions).UpdateFriendPresenceCounts

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: UpdateFriendPresenceCounts (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	return if p2.type == UpdateFriendPresenceCounts.name then CryoModule.Dictionary.join({}, p2.presenceCounts) else P0
end