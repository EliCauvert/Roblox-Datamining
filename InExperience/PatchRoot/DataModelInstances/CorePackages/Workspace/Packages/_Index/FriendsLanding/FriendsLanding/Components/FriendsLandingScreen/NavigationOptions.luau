local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local roact = require(friendsLanding.dependencies).Roact
local localizedKeysModule = require(friendsLanding.Enums.LocalizedKeys)
local headerBarRightViewModule = require(friendsLanding.Components.HeaderBarRightView)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename

return function(p1)
	-- upvalues: fFlagConnectionsToFriendsRename (ref), localizedKeysModule (ref), roact (ref), headerBarRightViewModule (ref)
	return {
		useSecondaryHeader = true,
		shouldExitNavigation = false,
		tabBarVisible = false,
		transparent = true,
		absorbInputSelectable = false,
		headerText = {
			shouldLocalize = true,
			raw = if fFlagConnectionsToFriendsRename then localizedKeysModule.FriendsHeader.rawValue() else localizedKeysModule.ConnectionsHeader.rawValue()
		},
		renderRight = function()
			-- upvalues: roact (copy), headerBarRightViewModule (copy), p1 (ref)
			return roact.createElement(headerBarRightViewModule, p1)
		end
	}
end