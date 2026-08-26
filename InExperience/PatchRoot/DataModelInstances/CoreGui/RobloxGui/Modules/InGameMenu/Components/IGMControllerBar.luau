local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local controllerBar = require(corePackagesService.Packages.UIBlox).App.Bar.ControllerBar
local setControllerBarHeightModule = require(script.Parent.Parent.Actions.SetControllerBarHeight)
local withLocalizationModule = require(script.Parent.Parent.Localization.withLocalization)
local constantsModule = require(script.Parent.Parent.Resources.Constants)
local IGMControllerBar = roact.PureComponent:extend("IGMControllerBar")
local t_1 = {
	cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel",
	respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn",
	openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
	closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
	back = "CoreScripts.InGameMenu.ControllerBar.Back",
	respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
	leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
}
IGMControllerBar.validateProps = t.strictInterface({
	isMenuOpen = t.boolean,
	isMainPageMoreMenuOpen = t.boolean,
	currentPage = t.string,
	respawnDialogOpen = t.boolean,
	inputType = t.string,
	screenSize = t.Vector2,
	setControllerBarHeight = t.callback
})

function IGMControllerBar.didMount(p1)
	-- upvalues: t_1 (ref), constantsModule (ref)
	if p1:getHints(t_1) then
		p1.props.setControllerBarHeight(constantsModule.ControllerBarHeight)
		
		return
	end
	p1.props.setControllerBarHeight(0)
end

function IGMControllerBar.didUpdate(p1)
	-- upvalues: t_1 (ref), constantsModule (ref)
	if p1:getHints(t_1) then
		p1.props.setControllerBarHeight(constantsModule.ControllerBarHeight)
		
		return
	end
	p1.props.setControllerBarHeight(0)
end

function IGMControllerBar.willUnmount(p1)
	p1.props.setControllerBarHeight(0)
end

function IGMControllerBar.getHints(p1, p2)
	-- upvalues: constantsModule (ref)
	if p1.props.inputType == constantsModule.InputType.Gamepad then
		return if p1.props.respawnDialogOpen then {
			leftHint = { text = p2.cancel, keyCode = Enum.KeyCode.ButtonB },
			rightHints = { { text = p2.respawn, keyCode = Enum.KeyCode.ButtonA } }
		} elseif p1.props.isMenuOpen and p1.props.currentPage == "MainPage" then {
			leftHint = { text = p2.back, keyCode = Enum.KeyCode.ButtonB },
			rightHints = {
				{
					text = if not p1.props.isMainPageMoreMenuOpen then p2.openMoreMenu else p2.closeMoreMenu,
					keyCode = Enum.KeyCode.ButtonL3
				},
				{
					text = p2.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p2.leave, keyCode = Enum.KeyCode.ButtonX }
			}
		} else nil
	end
end

function IGMControllerBar.render(p1)
	-- upvalues: withLocalizationModule (ref), t_1 (ref), roact (ref), controllerBar (ref)
	return withLocalizationModule(t_1)(function(p2)
		-- upvalues: p1 (ref), roact (copy), controllerBar (copy)
		local var1 = p1:getHints(p2)
		
		return if var1 then roact.createElement(controllerBar, var1) else nil
	end)
end

return roactRodux.connect(function(p1, _)
	return {
		isMenuOpen = p1.isMenuOpen,
		isMainPageMoreMenuOpen = p1.isMainPageMoreMenuOpen,
		currentPage = p1.menuPage,
		respawnDialogOpen = p1.respawn.dialogOpen,
		inputType = p1.displayOptions.inputType,
		screenSize = p1.screenSize
	}
end, function(p1)
	-- upvalues: setControllerBarHeightModule (ref)
	return {
		setControllerBarHeight = function(value)
			-- upvalues: p1 (ref), setControllerBarHeightModule (copy)
			p1(setControllerBarHeightModule(value))
		end
	}
end)(IGMControllerBar)