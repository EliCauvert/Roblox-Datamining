local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Roact = require(FriendsLanding.dependencies).Roact
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FriendsLandingContainerModule = require(FriendsLanding.Components.FriendsLandingContainer)
local FriendsLandingScreen = Roact.PureComponent:extend("FriendsLandingScreen")
FriendsLandingScreen.defaultProps = { friends = {} }

function FriendsLandingScreen:render() --[[ Line: 13 ]]
	-- upvalues: FriendsLandingContextModule (copy), Roact (copy), FriendsLandingContainerModule (copy)
	return FriendsLandingContextModule.with(function(_) --[[ Line: 14 ]]
		-- upvalues: Roact (upval), FriendsLandingContainerModule (upval)
		return Roact.createElement(FriendsLandingContainerModule, {})
	end)
end

return FriendsLandingScreen