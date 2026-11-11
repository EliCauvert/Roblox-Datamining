local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local Parent = script.Parent
local PlayerListAppModule = require(Parent.Components.Presentation.PlayerListApp)
local PlayerListAppModule1 = require(Parent.Components.PresentationMobile.PlayerListApp)
local Provider = require(Parent.Components.Connection.LayoutValues).Provider
local CreateLayoutValuesModule = require(Parent.CreateLayoutValues)
local TenFootInterfaceModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface)
local SetPlayerListVisibilityModule = require(Parent.Actions.SetPlayerListVisibility)
local PlayerListInitialVisibleStateModule = require(Parent.PlayerListInitialVisibleState)
local FFlagEnableMobilePlayerListOnConsole = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagEnableMobilePlayerListOnConsole
local PlayerListSwitcher = RoactModule.PureComponent:extend("PlayerListSwitcher")

function PlayerListSwitcher.didMount(p1)
	-- upvalues: PlayerListInitialVisibleStateModule (copy)
	p1.props.setPlayerListVisible(PlayerListInitialVisibleStateModule())
end

function PlayerListSwitcher.wrapWithUiModeStyleProvider(p1, p2)
	-- upvalues: RoactModule (copy), UiModeStyleProvider (copy)
	return {
		ThemeProvider = RoactModule.createElement(UiModeStyleProvider, {
			style = {
				themeName = p1.props.appStyleForUiModeStyleProvider.themeName,
				fontName = p1.props.appStyleForUiModeStyleProvider.fontName
			}
		}, p2)
	}
end

function PlayerListSwitcher.render(p1)
	-- upvalues: RoactModule (copy), Provider (copy), CreateLayoutValuesModule (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), PlayerListAppModule1 (copy), PlayerListAppModule (copy)
	return RoactModule.createElement(Provider, {
		layoutValues = CreateLayoutValuesModule(not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled())
	}, p1:wrapWithUiModeStyleProvider({
		PlayerListApp = p1.props.isSmallTouchDevice and RoactModule.createElement(PlayerListAppModule1, {
			setLayerCollectorEnabled = p1.props.setLayerCollectorEnabled
		}) or RoactModule.createElement(PlayerListAppModule, {
			setLayerCollectorEnabled = p1.props.setLayerCollectorEnabled
		})
	}))
end

function PlayerListSwitcher.didUpdate(p1)
	p1.props.setPlayerListVisible(not p1.props.isSmallTouchDevice)
end

return RoactRoduxModule.connect(function(p1)
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice
	}
end, function(Callback)
	-- upvalues: SetPlayerListVisibilityModule (copy)
	return {
		setPlayerListVisible = function(p1)
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(p1))
		end
	}
end)(PlayerListSwitcher)