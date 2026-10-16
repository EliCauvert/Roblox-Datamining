local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local PlayerServiceConnectorModule = require(script.Parent.PlayerServiceConnector)
local CoreGuiConnectorModule = require(script.Parent.CoreGuiConnector)
local SocialConnectorModule = require(script.Parent.SocialConnector)
local GuiServiceConnectorModule = require(script.Parent.GuiServiceConnector)
local UserInputServiceConnectorModule = require(script.Parent.UserInputServiceConnector)
local ScreenSizeConnectorModule = require(script.Parent.ScreenSizeConnector)
local EventConnections = RoactModule.PureComponent:extend("EventConnections")

function EventConnections:render() --[[ Line: 17 ]]
	-- upvalues: RoactModule (copy), PlayerServiceConnectorModule (copy), CoreGuiConnectorModule (copy), SocialConnectorModule (copy), GuiServiceConnectorModule (copy), UserInputServiceConnectorModule (copy), ScreenSizeConnectorModule (copy)
	return RoactModule.createFragment({
		PlayerServiceConnector = RoactModule.createElement(PlayerServiceConnectorModule),
		CoreGuiConnector = RoactModule.createElement(CoreGuiConnectorModule),
		SocialConnector = RoactModule.createElement(SocialConnectorModule),
		GuiServiceConnector = RoactModule.createElement(GuiServiceConnectorModule),
		UserInputServiceConnector = RoactModule.createElement(UserInputServiceConnectorModule),
		ScreenSizeConnector = RoactModule.createElement(ScreenSizeConnectorModule)
	})
end

return EventConnections