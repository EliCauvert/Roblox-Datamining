local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Roact = require(FriendsLanding.dependencies).Roact
local MainStackNavigatorModule = require(FriendsLanding.Navigator.MainStackNavigator)
local FriendsLandingHeaderBarModule = require(FriendsLanding.Components.FriendsLandingHeaderBar)
local IsFromConnectionsHubModule = require(FriendsLanding.Navigator.isFromConnectionsHub)
local ConstantsModule = require(FriendsLanding.Common.Constants)
local FFlagCreateConnectionsHub = require(FriendsLanding.Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagFixFriendsListGapInConnectionsHubModule = require(FriendsLanding.Flags.FFlagFixFriendsListGapInConnectionsHub)
local MainStackNavigatorConnector = Roact.PureComponent:extend("MainStackNavigatorConnector")

function MainStackNavigatorConnector.render(p1)
	-- upvalues: FFlagCreateConnectionsHub (copy), IsFromConnectionsHubModule (copy), Roact (copy), MainStackNavigatorModule (copy), FriendsLandingHeaderBarModule (copy), FFlagFixFriendsListGapInConnectionsHubModule (copy), ConstantsModule (copy)
	local Navigation = p1.props.navigation
	local IsFromConnectionsHubModule1 = FFlagCreateConnectionsHub and IsFromConnectionsHubModule(Navigation)
	local Inverted = not (FFlagCreateConnectionsHub and IsFromConnectionsHubModule1)
	local Element = Roact.createElement(MainStackNavigatorModule, { navigation = p1.props.navigation })
	
	return Roact.createFragment({
		layout = Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = if Inverted then Roact.createElement(FriendsLandingHeaderBarModule, { navigation = p1.props.navigation }) else nil,
		navigator = if FFlagFixFriendsListGapInConnectionsHubModule then Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1, if Inverted then -ConstantsModule.TOP_BAR_HEIGHT else 0)
		}, { MainStackNavigator = Element }) else Element
	})
end

MainStackNavigatorConnector.router = MainStackNavigatorModule.router

return MainStackNavigatorConnector