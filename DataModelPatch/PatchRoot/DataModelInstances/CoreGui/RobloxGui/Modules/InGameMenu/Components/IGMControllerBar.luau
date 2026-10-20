local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local ControllerBar = require(CorePackages.Packages.UIBlox).App.Bar.ControllerBar
local SetControllerBarHeightModule = require(script.Parent.Parent.Actions.SetControllerBarHeight)
local WithLocalizationModule = require(script.Parent.Parent.Localization.withLocalization)
local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local IGMControllerBar = Roact.PureComponent:extend("IGMControllerBar")
local config = {
	cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel",
	respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn",
	openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
	closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
	back = "CoreScripts.InGameMenu.ControllerBar.Back",
	respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
	leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
}
IGMControllerBar.validateProps = T.strictInterface({
	isMenuOpen = T.boolean,
	isMainPageMoreMenuOpen = T.boolean,
	currentPage = T.string,
	respawnDialogOpen = T.boolean,
	inputType = T.string,
	screenSize = T.Vector2,
	setControllerBarHeight = T.callback
})

function IGMControllerBar.didMount(p1)
	-- upvalues: config (copy), ConstantsModule (copy)
	if p1:getHints(config) then
		p1.props.setControllerBarHeight(ConstantsModule.ControllerBarHeight)
		
		return
	else
		p1.props.setControllerBarHeight(0)
	end
end

function IGMControllerBar.didUpdate(p1)
	-- upvalues: config (copy), ConstantsModule (copy)
	if p1:getHints(config) then
		p1.props.setControllerBarHeight(ConstantsModule.ControllerBarHeight)
		
		return
	else
		p1.props.setControllerBarHeight(0)
	end
end

function IGMControllerBar.willUnmount(p1)
	p1.props.setControllerBarHeight(0)
end

function IGMControllerBar.getHints(p1, p2)
	-- upvalues: ConstantsModule (copy)
	if p1.props.inputType == ConstantsModule.InputType.Gamepad then
		if p1.props.respawnDialogOpen then
			return {
				leftHint = { text = p2.cancel, keyCode = Enum.KeyCode.ButtonB },
				rightHints = { { text = p2.respawn, keyCode = Enum.KeyCode.ButtonA } }
			}
		elseif p1.props.isMenuOpen and p1.props.currentPage == "MainPage" then
			return {
				leftHint = { text = p2.back, keyCode = Enum.KeyCode.ButtonB },
				rightHints = {
					{
						text = if p1.props.isMainPageMoreMenuOpen then p2.closeMoreMenu else p2.openMoreMenu,
						keyCode = Enum.KeyCode.ButtonL3
					},
					{
						text = p2.respawnCharacter,
						keyCode = Enum.KeyCode.ButtonY
					},
					{ text = p2.leave, keyCode = Enum.KeyCode.ButtonX }
				}
			}
		end
	end
	return nil
end

function IGMControllerBar.render(p1)
	-- upvalues: WithLocalizationModule (copy), config (copy), Roact (copy), ControllerBar (copy)
	return WithLocalizationModule(config)(function(p2)
		-- upvalues: p1 (copy), Roact (upval), ControllerBar (upval)
		local Hints = p1:getHints(p2)
		
		return if Hints then Roact.createElement(ControllerBar, Hints) else nil
	end)
end

return RoactRodux.connect(function(p1, _)
	return {
		isMenuOpen = p1.isMenuOpen,
		isMainPageMoreMenuOpen = p1.isMainPageMoreMenuOpen,
		currentPage = p1.menuPage,
		respawnDialogOpen = p1.respawn.dialogOpen,
		inputType = p1.displayOptions.inputType,
		screenSize = p1.screenSize
	}
end, function(Callback)
	-- upvalues: SetControllerBarHeightModule (copy)
	return {
		setControllerBarHeight = function(p1)
			-- upvalues: Callback (copy), SetControllerBarHeightModule (upval)
			Callback(SetControllerBarHeightModule(p1))
		end
	}
end)(IGMControllerBar)