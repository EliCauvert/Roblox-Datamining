local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local uiModeStyleProvider = require(corePackagesService.Workspace.Packages.Style).UiModeStyleProvider
local parent = script.Parent
local connection = parent.Components.Connection
local playerListAppModule = require(parent.Components.Presentation.PlayerListApp)
local playerListAppModule_1 = require(parent.Components.PresentationMobile.PlayerListApp)
local provider = require(connection.LayoutValues).Provider
local createLayoutValuesModule = require(parent.CreateLayoutValues)
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local setPlayerListVisibilityModule = require(parent.Actions.SetPlayerListVisibility)
local playerListInitialVisibleStateModule = require(parent.PlayerListInitialVisibleState)
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local playerListSwitcher = roactModule.PureComponent:extend("PlayerListSwitcher")

function playerListSwitcher.didMount(p0) --[[ line: 28 ]]
	-- upvalues: playerListInitialVisibleStateModule (ref)
	p0.props.setPlayerListVisible(playerListInitialVisibleStateModule())
end

function playerListSwitcher.wrapWithUiModeStyleProvider(p1, p2) --[[ line: 32 ]]
	-- upvalues: roactModule (ref), uiModeStyleProvider (ref)
	return {
		ThemeProvider = roactModule.createElement(uiModeStyleProvider, {
			style = {
				themeName = p1.props.appStyleForUiModeStyleProvider.themeName,
				fontName = p1.props.appStyleForUiModeStyleProvider.fontName
			}
		}, p2)
	}
end

function playerListSwitcher.render(p3) --[[ line: 43 ]]
	-- upvalues: roactModule (ref), provider (ref), createLayoutValuesModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), playerListAppModule_1 (ref), playerListAppModule (ref)
	return roactModule.createElement(provider, {
		layoutValues = createLayoutValuesModule(if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled())
	}, p3:wrapWithUiModeStyleProvider({
		PlayerListApp = p3.props.isSmallTouchDevice and roactModule.createElement(playerListAppModule_1, {
			setLayerCollectorEnabled = p3.props.setLayerCollectorEnabled
		}) or roactModule.createElement(playerListAppModule, {
			setLayerCollectorEnabled = p3.props.setLayerCollectorEnabled
		})
	}))
end

function playerListSwitcher.didUpdate(p4) --[[ line: 59 ]]
	p4.props.setPlayerListVisible(not p4.props.isSmallTouchDevice)
end

return roactRoduxModule.connect(function(p5) --[[ line: 63 | named "mapStateToProps" ]]
	return {
		isSmallTouchDevice = p5.displayOptions.isSmallTouchDevice
	}
end, function(p6) --[[ line: 69 | named "mapDispatchToProps" ]]
	-- upvalues: setPlayerListVisibilityModule (ref)
	return {
		setPlayerListVisible = function(value) --[[ line: 71 ]]
			-- upvalues: p6 (ref), setPlayerListVisibilityModule (copy)
			return p6(setPlayerListVisibilityModule(value))
		end
	}
end)(playerListSwitcher)