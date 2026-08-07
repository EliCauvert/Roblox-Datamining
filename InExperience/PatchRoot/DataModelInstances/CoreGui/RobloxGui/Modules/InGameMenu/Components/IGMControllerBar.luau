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

function IGMControllerBar.didMount(p0) --[[ line: 39 ]]
	-- upvalues: t_1 (ref), constantsModule (ref)
	if p0:getHints(t_1) then
		p0.props.setControllerBarHeight(constantsModule.ControllerBarHeight)
		
		return
	end
	p0.props.setControllerBarHeight(0)
end

function IGMControllerBar.didUpdate(p1) --[[ line: 48 ]]
	-- upvalues: t_1 (ref), constantsModule (ref)
	if p1:getHints(t_1) then
		p1.props.setControllerBarHeight(constantsModule.ControllerBarHeight)
		
		return
	end
	p1.props.setControllerBarHeight(0)
end

function IGMControllerBar.willUnmount(p2) --[[ line: 57 ]]
	p2.props.setControllerBarHeight(0)
end

function IGMControllerBar.getHints(p3, p4) --[[ line: 61 ]]
	-- upvalues: constantsModule (ref)
	if p3.props.inputType == constantsModule.InputType.Gamepad then
		return if p3.props.respawnDialogOpen then {
			leftHint = { text = p4.cancel, keyCode = Enum.KeyCode.ButtonB },
			rightHints = { { text = p4.respawn, keyCode = Enum.KeyCode.ButtonA } }
		} elseif p3.props.isMenuOpen and p3.props.currentPage == "MainPage" then {
			leftHint = { text = p4.back, keyCode = Enum.KeyCode.ButtonB },
			rightHints = {
				{
					text = if not p3.props.isMainPageMoreMenuOpen then p4.openMoreMenu else p4.closeMoreMenu,
					keyCode = Enum.KeyCode.ButtonL3
				},
				{
					text = p4.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p4.leave, keyCode = Enum.KeyCode.ButtonX }
			}
		} else nil
	end
end

function IGMControllerBar.render(p5) --[[ line: 111 ]]
	-- upvalues: withLocalizationModule (ref), t_1 (ref), roact (ref), controllerBar (ref)
	return withLocalizationModule(t_1)(function(p6) --[[ line: 112 ]]
		-- upvalues: p5 (ref), roact (copy), controllerBar (copy)
		local var7 = p5:getHints(p6)
		
		return if var7 then roact.createElement(controllerBar, var7) else nil
	end)
end

return roactRodux.connect(function(p7, _) --[[ line: 122 | named "mapStateToProps" ]]
	return {
		isMenuOpen = p7.isMenuOpen,
		isMainPageMoreMenuOpen = p7.isMainPageMoreMenuOpen,
		currentPage = p7.menuPage,
		respawnDialogOpen = p7.respawn.dialogOpen,
		inputType = p7.displayOptions.inputType,
		screenSize = p7.screenSize
	}
end, function(p8) --[[ line: 133 ]]
	-- upvalues: setControllerBarHeightModule (ref)
	return {
		setControllerBarHeight = function(value) --[[ line: 135 ]]
			-- upvalues: p8 (ref), setControllerBarHeightModule (copy)
			p8(setControllerBarHeightModule(value))
		end
	}
end)(IGMControllerBar)