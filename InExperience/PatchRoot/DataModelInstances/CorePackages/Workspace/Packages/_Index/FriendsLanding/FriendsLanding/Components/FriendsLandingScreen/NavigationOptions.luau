local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Roact = require(FriendsLanding.dependencies).Roact
local LocalizedKeysModule = require(FriendsLanding.Enums.LocalizedKeys)
local HeaderBarRightViewModule = require(FriendsLanding.Components.HeaderBarRightView)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: LocalizedKeysModule (copy), Roact (copy), HeaderBarRightViewModule (copy)
	return {
		useSecondaryHeader = true,
		shouldExitNavigation = false,
		tabBarVisible = false,
		transparent = true,
		absorbInputSelectable = false,
		headerText = {
			shouldLocalize = true,
			raw = LocalizedKeysModule.FriendsHeader.rawValue()
		},
		renderRight = function() --[[ Line: 18 ]]
			-- upvalues: Roact (upval), HeaderBarRightViewModule (upval), p1 (copy)
			return Roact.createElement(HeaderBarRightViewModule, p1)
		end
	}
end