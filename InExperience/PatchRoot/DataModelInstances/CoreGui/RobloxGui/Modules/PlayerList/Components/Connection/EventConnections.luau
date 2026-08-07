local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local playerServiceConnectorModule = require(script.Parent.PlayerServiceConnector)
local coreGuiConnectorModule = require(script.Parent.CoreGuiConnector)
local socialConnectorModule = require(script.Parent.SocialConnector)
local guiServiceConnectorModule = require(script.Parent.GuiServiceConnector)
local userInputServiceConnectorModule = require(script.Parent.UserInputServiceConnector)
local screenSizeConnectorModule = require(script.Parent.ScreenSizeConnector)
local eventConnections = roactModule.PureComponent:extend("EventConnections")

function eventConnections.render(_) --[[ line: 17 ]]
	-- upvalues: roactModule (ref), playerServiceConnectorModule (ref), coreGuiConnectorModule (ref), socialConnectorModule (ref), guiServiceConnectorModule (ref), userInputServiceConnectorModule (ref), screenSizeConnectorModule (ref)
	return roactModule.createFragment({
		PlayerServiceConnector = roactModule.createElement(playerServiceConnectorModule),
		CoreGuiConnector = roactModule.createElement(coreGuiConnectorModule),
		SocialConnector = roactModule.createElement(socialConnectorModule),
		GuiServiceConnector = roactModule.createElement(guiServiceConnectorModule),
		UserInputServiceConnector = roactModule.createElement(userInputServiceConnectorModule),
		ScreenSizeConnector = roactModule.createElement(screenSizeConnectorModule)
	})
end

return eventConnections