local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local roact = require(friendsLanding.dependencies).Roact
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local friendsLandingContainerModule = require(friendsLanding.Components.FriendsLandingContainer)
local friendsLandingScreen = roact.PureComponent:extend("FriendsLandingScreen")
friendsLandingScreen.defaultProps = { friends = {} }

function friendsLandingScreen.render(_) --[[ line: 13 ]]
	-- upvalues: friendsLandingContextModule (ref), roact (ref), friendsLandingContainerModule (ref)
	return friendsLandingContextModule.with(function(_) --[[ line: 14 ]]
		-- upvalues: roact (copy), friendsLandingContainerModule (copy)
		return roact.createElement(friendsLandingContainerModule, {})
	end)
end

return friendsLandingScreen