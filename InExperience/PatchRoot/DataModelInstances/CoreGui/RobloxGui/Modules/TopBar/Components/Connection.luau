local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local parent = script.Parent.Parent
local fFlagTopBarDeprecateCoreGuiRoduxModule = require(parent.Flags.FFlagTopBarDeprecateCoreGuiRodux)
local fFlagTopBarDeprecateChatRoduxModule = require(parent.Flags.FFlagTopBarDeprecateChatRodux)
local fFlagTopBarDeprecateDisplayOptionsRoduxModule = require(parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local fFlagTopBarDeprecateRespawnRoduxModule = require(parent.Flags.FFlagTopBarDeprecateRespawnRodux)
local fFlagTopBarDeprecateMoreMenuRoduxModule = require(parent.Flags.FFlagTopBarDeprecateMoreMenuRodux)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeHealthBar = coreGuiCommonModule.Flags.FFlagTopBarSignalizeHealthBar
local fFlagTopBarSignalizeMenuOpen = coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local coreGuiConnectorModule = require(script.CoreGuiConnector)
local menuConnectorModule = require(script.MenuConnector)
local chatConnectorModule = require(script.ChatConnector)
local healthConnectorModule = require(script.HealthConnector)
local enabledNotifierModule = require(script.EnabledNotifier)
local openUIConnectorModule = require(script.OpenUIConnector)
local _ = require(script.LastInputTypeConnector)
local connection = roactModule.PureComponent:extend("Connection")

function connection.render(_) --[[ line: 26 ]]
	-- upvalues: roactModule (ref), fFlagTopBarDeprecateCoreGuiRoduxModule (ref), coreGuiConnectorModule (ref), fFlagTopBarSignalizeMenuOpen (ref), fFlagTopBarDeprecateRespawnRoduxModule (ref), menuConnectorModule (ref), fFlagTopBarDeprecateChatRoduxModule (ref), chatConnectorModule (ref), fFlagTopBarSignalizeHealthBar (ref), healthConnectorModule (ref), fFlagTopBarDeprecateDisplayOptionsRoduxModule (ref), enabledNotifierModule (ref), fFlagTopBarDeprecateMoreMenuRoduxModule (ref), openUIConnectorModule (ref)
	return roactModule.createFragment({
		CoreGuiConnector = if fFlagTopBarDeprecateCoreGuiRoduxModule then nil else roactModule.createElement(coreGuiConnectorModule),
		MenuConnector = if fFlagTopBarSignalizeMenuOpen and fFlagTopBarDeprecateRespawnRoduxModule then nil else roactModule.createElement(menuConnectorModule),
		ChatConnector = if fFlagTopBarDeprecateChatRoduxModule then nil else roactModule.createElement(chatConnectorModule),
		HealthConnector = if fFlagTopBarSignalizeHealthBar then nil else roactModule.createElement(healthConnectorModule),
		EnabledNotifier = if fFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else roactModule.createElement(enabledNotifierModule),
		OpenUIConnector = if fFlagTopBarDeprecateMoreMenuRoduxModule then nil else roactModule.createElement(openUIConnectorModule)
	})
end

return connection