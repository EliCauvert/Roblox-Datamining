local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local Parent = script.Parent.Parent
local FFlagTopBarDeprecateCoreGuiRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux)
local FFlagTopBarDeprecateChatRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateChatRodux)
local FFlagTopBarDeprecateDisplayOptionsRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local FFlagTopBarDeprecateRespawnRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateRespawnRodux)
local FFlagTopBarDeprecateMoreMenuRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateMoreMenuRodux)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeHealthBar = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeHealthBar
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local CoreGuiConnectorModule = require(script.CoreGuiConnector)
local MenuConnectorModule = require(script.MenuConnector)
local ChatConnectorModule = require(script.ChatConnector)
local HealthConnectorModule = require(script.HealthConnector)
local EnabledNotifierModule = require(script.EnabledNotifier)
local OpenUIConnectorModule = require(script.OpenUIConnector)
local _ = require(script.LastInputTypeConnector)
local Connection = RoactModule.PureComponent:extend("Connection")

function Connection:render() --[[ Line: 26 ]]
	-- upvalues: RoactModule (copy), FFlagTopBarDeprecateCoreGuiRoduxModule (copy), CoreGuiConnectorModule (copy), FFlagTopBarSignalizeMenuOpen (copy), FFlagTopBarDeprecateRespawnRoduxModule (copy), MenuConnectorModule (copy), FFlagTopBarDeprecateChatRoduxModule (copy), ChatConnectorModule (copy), FFlagTopBarSignalizeHealthBar (copy), HealthConnectorModule (copy), FFlagTopBarDeprecateDisplayOptionsRoduxModule (copy), EnabledNotifierModule (copy), FFlagTopBarDeprecateMoreMenuRoduxModule (copy), OpenUIConnectorModule (copy)
	return RoactModule.createFragment({
		CoreGuiConnector = if FFlagTopBarDeprecateCoreGuiRoduxModule then nil else RoactModule.createElement(CoreGuiConnectorModule),
		MenuConnector = if FFlagTopBarSignalizeMenuOpen and FFlagTopBarDeprecateRespawnRoduxModule then nil else RoactModule.createElement(MenuConnectorModule),
		ChatConnector = if FFlagTopBarDeprecateChatRoduxModule then nil else RoactModule.createElement(ChatConnectorModule),
		HealthConnector = if FFlagTopBarSignalizeHealthBar then nil else RoactModule.createElement(HealthConnectorModule),
		EnabledNotifier = if FFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else RoactModule.createElement(EnabledNotifierModule),
		OpenUIConnector = if FFlagTopBarDeprecateMoreMenuRoduxModule then nil else RoactModule.createElement(OpenUIConnectorModule)
	})
end

return Connection