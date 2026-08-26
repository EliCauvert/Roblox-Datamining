local VRService = game:GetService("VRService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local IGMControllerBar2Module = require(script.Parent.IGMControllerBar2)
local withLocalizationModule = require(script.Parent.Parent.Localization.withLocalization)
local IGMMainPageControllerBar = roact.PureComponent:extend("IGMMainPageControllerBar")
IGMMainPageControllerBar.validateProps = t.strictInterface({
	canCaptureFocus = t.boolean,
	isMainPageMoreMenuOpen = t.boolean
})

function IGMMainPageControllerBar.render(p1)
	-- upvalues: withLocalizationModule (ref), VRService (ref), roact (ref), IGMControllerBar2Module (ref)
	return if p1.props.canCaptureFocus then withLocalizationModule({
		openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
		closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
		back = "CoreScripts.InGameMenu.ControllerBar.Back",
		respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
		leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
	})(function(p2)
		-- upvalues: VRService (copy), p1 (ref), roact (copy), IGMControllerBar2Module (copy)
		return roact.createElement(IGMControllerBar2Module, {
			leftHint = { text = p2.back, keyCode = Enum.KeyCode.ButtonB },
			rightHints = if not VRService.VREnabled then {
				{
					text = if p1.props.isMainPageMoreMenuOpen then p2.closeMoreMenu else p2.openMoreMenu,
					keyCode = Enum.KeyCode.ButtonL3
				},
				{
					text = p2.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p2.leave, keyCode = Enum.KeyCode.ButtonX }
			} else {
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