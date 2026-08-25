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

function IGMMainPageControllerBar.render(p0)
	-- upvalues: withLocalizationModule (ref), VRService (ref), roact (ref), IGMControllerBar2Module (ref)
	return if p0.props.canCaptureFocus then withLocalizationModule({
		openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu",
		closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu",
		back = "CoreScripts.InGameMenu.ControllerBar.Back",
		respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter",
		leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
	})(function(p1)
		-- upvalues: VRService (copy), p0 (ref), roact (copy), IGMControllerBar2Module (copy)
		return roact.createElement(IGMControllerBar2Module, {
			leftHint = { text = p1.back, keyCode = Enum.KeyCode.ButtonB },
			rightHints = if not VRService.VREnabled then {
				{
					text = if p0.props.isMainPageMoreMenuOpen then p1.closeMoreMenu else p1.openMoreMenu,
					keyCode = Enum.KeyCode.ButtonL3
				},
				{
					text = p1.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p1.leave, keyCode = Enum.KeyCode.ButtonX }
			} else {
				{
					text = p1.respawnCharacter,
					keyCode = Enum.KeyCode.ButtonY
				},
				{ text = p1.leave, keyCode = Enum.KeyCode.ButtonX }
			}
		})
	end) else nil
end

return IGMMainPageControllerBar