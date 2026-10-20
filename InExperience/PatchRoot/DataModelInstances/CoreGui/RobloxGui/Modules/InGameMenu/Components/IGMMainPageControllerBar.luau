local VRService = game:GetService("VRService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local IGMControllerBar2Module = require(script.Parent.IGMControllerBar2)
local WithLocalizationModule = require(script.Parent.Parent.Localization.withLocalization)
local IGMMainPageControllerBar = Roact.PureComponent:extend("IGMMainPageControllerBar")
IGMMainPageControllerBar.validateProps = T.strictInterface({
	canCaptureFocus = T.boolean,
	isMainPageMoreMenuOpen = T.boolean
})

function IGMMainPageControllerBar.render(p1)
	-- upvalues: WithLocalizationModule (copy), VRService (copy), Roact (copy), IGMControllerBar2Module (copy)
	return if p1.props.canCaptureFocus then WithLocalizationModule({
		openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
		closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
		back = "CoreScripts.InGameMenu.ControllerBar.Back",
		respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
		leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
	})(function(p2)
		-- upvalues: VRService (upval), p1 (copy), Roact (upval), IGMControllerBar2Module (upval)
		return Roact.createElement(IGMControllerBar2Module, {
			leftHint = { text = p2.back, keyCode = Enum.KeyCode.ButtonB },
			rightHints = if VRService.VREnabled then {
				{
					text = p2.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p2.leave, keyCode = Enum.KeyCode.ButtonX }
			} else {
				{
					text = p1.props.isMainPageMoreMenuOpen and p2.closeMoreMenu or p2.openMoreMenu,
					keyCode = Enum.KeyCode.ButtonL3
				},
				{
					text = p2.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p2.leave, keyCode = Enum.KeyCode.ButtonX }
			}
		})
	end) else nil
end

return IGMMainPageControllerBar