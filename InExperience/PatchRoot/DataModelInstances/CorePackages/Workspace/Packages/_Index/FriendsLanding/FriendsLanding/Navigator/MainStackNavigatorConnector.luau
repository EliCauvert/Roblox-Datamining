local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local roact = require(friendsLanding.dependencies).Roact
local mainStackNavigatorModule = require(friendsLanding.Navigator.MainStackNavigator)
local friendsLandingHeaderBarModule = require(friendsLanding.Components.FriendsLandingHeaderBar)
local isFromConnectionsHubModule = require(friendsLanding.Navigator.isFromConnectionsHub)
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local mainStackNavigatorConnector = roact.PureComponent:extend("MainStackNavigatorConnector")

function mainStackNavigatorConnector.render(p1)
	-- upvalues: fFlagCreateConnectionsHub (ref), isFromConnectionsHubModule (ref), roact (ref), friendsLandingHeaderBarModule (ref), mainStackNavigatorModule (ref)
	return roact.createFragment({
		layout = roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = if fFlagCreateConnectionsHub and (fFlagCreateConnectionsHub and isFromConnectionsHubModule(p1.props.navigation)) then nil else roact.createElement(friendsLandingHeaderBarModule, { navigation = p1.props.navigation }),
		navigator = roact.createElement(mainStackNavigatorModule, { navigation = p1.props.navigation })
	})
end

mainStackNavigatorConnector.router = mainStackNavigatorModule.router

return mainStackNavigatorConnector