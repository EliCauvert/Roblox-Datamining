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
local fFlagPlayerListTwoTabsOnLegacy = playerListModule.Flags.FFlagPlayerListTwoTabsOnLegacy
local fFlagPlayerListKeepModalHiddenOnRemountModule = require(parent.Flags.FFlagPlayerListKeepModalHiddenOnRemount)
local platformLeaderboardContainer = playerListModule.Container.PlatformLeaderboardContainer
local playerListSwitcher = roactModule.PureComponent:extend("PlayerListSwitcher")

function playerListSwitcher.didMount(p1)
	-- upvalues: fFlagPlayerListKeepModalHiddenOnRemountModule (ref), playerListInitialVisibleStateModule (ref)
	if fFlagPlayerListKeepModalHiddenOnRemountModule and p1.props.isSmallTouchDevice then
		p1.props.setPlayerListVisible(false)
		
		return
	end
	p1.props.setPlayerListVisible(playerListInitialVisibleStateModule())
end

function playerListSwitcher.wrapWithUiModeStyleProvider(p1, p2)
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

function playerListSwitcher.render(p1)
	-- upvalues: roactModule (ref), provider (ref), createLayoutValuesModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), playerListAppModule_1 (ref), playerListAppModule (ref), fFlagPlayerListTwoTabsOnLegacy (ref), platformLeaderboardContainer (ref)
	local var1 = roactModule.createElement(provider, {
		layoutValues = createLayoutValuesModule(if fFlagEnableMobilePlayerListOnConsole then false else tenFootInterfaceModule:IsEnabled())
	}, p1:wrapWithUiModeStyleProvider({
		PlayerListApp = p1.props.isSmallTouchDevice and roactModule.createElement(playerListAppModule_1, {
			setLayerCollectorEnabled = p1.props.setLayerCollectorEnabled
		}) or roactModule.createElement(playerListAppModule, {
			setLayerCollectorEnabled = p1.props.setLayerCollectorEnabled
		})
	}))
	
	return if fFlagPlayerListTwoTabsOnLegacy then roactModule.createElement(platformLeaderboardContainer, {}, var1) else var1
end

function playerListSwitcher.didUpdate(p1)
	p1.props.setPlayerListVisible(not p1.props.isSmallTouchDevice)
end

return roactRoduxModule.connect(function(p1)
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice
	}
end, function(p1)
	-- upvalues: setPlayerListVisibilityModule (ref)
	return {
		setPlayerListVisible = function(value)
			-- upvalues: p1 (ref), setPlayerListVisibilityModule (copy)
			return p1(setPlayerListVisibilityModule(value))
		end
	}
end)(playerListSwitcher)