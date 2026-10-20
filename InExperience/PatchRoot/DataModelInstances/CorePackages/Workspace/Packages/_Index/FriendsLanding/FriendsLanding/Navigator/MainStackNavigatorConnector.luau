local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Roact = require(FriendsLanding.dependencies).Roact
local MainStackNavigatorModule = require(FriendsLanding.Navigator.MainStackNavigator)
local FriendsLandingHeaderBarModule = require(FriendsLanding.Components.FriendsLandingHeaderBar)
local IsFromConnectionsHubModule = require(FriendsLanding.Navigator.isFromConnectionsHub)
local FFlagCreateConnectionsHub = require(FriendsLanding.Parent.SharedFlags).FFlagCreateConnectionsHub
local MainStackNavigatorConnector = Roact.PureComponent:extend("MainStackNavigatorConnector")

function MainStackNavigatorConnector.render(p1)
	-- upvalues: FFlagCreateConnectionsHub (copy), IsFromConnectionsHubModule (copy), Roact (copy), FriendsLandingHeaderBarModule (copy), MainStackNavigatorModule (copy)
	local Navigation = p1.props.navigation
	local IsFromConnectionsHubModule1 = FFlagCreateConnectionsHub and IsFromConnectionsHubModule(Navigation)
	
	return Roact.createFragment({
		layout = Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = if FFlagCreateConnectionsHub and IsFromConnectionsHubModule1 then nil else Roact.createElement(FriendsLandingHeaderBarModule, { navigation = p1.props.navigation }),
		navigator = Roact.createElement(MainStackNavigatorModule, { navigation = p1.props.navigation })
	})
end

MainStackNavigatorConnector.router = MainStackNavigatorModule.router

return MainStackNavigatorConnector