local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local IGMControllerBar2Module = require(script.Parent.IGMControllerBar2)
local constantsModule = require(parent.Resources.Constants)
local withLocalizationModule = require(parent.Localization.withLocalization)
local IGMRespawnControllerBar = roact.PureComponent:extend("IGMRespawnControllerBar")
IGMRespawnControllerBar.validateProps = t.strictInterface({ inputType = t.string })

function IGMRespawnControllerBar.render(p1)
	-- upvalues: constantsModule (ref), withLocalizationModule (ref), roact (ref), IGMControllerBar2Module (ref)
	return if p1.props.inputType == constantsModule.InputType.Gamepad then withLocalizationModule({
		cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel",
		respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn"
	})(function(p2)
		-- upvalues: roact (copy), IGMControllerBar2Module (copy)
		return roact.createElement(IGMControllerBar2Module, {
			leftHint = { text = p2.cancel, keyCode = Enum.KeyCode.ButtonB },
			rightHints = { { text = p2.respawn, keyCode = Enum.KeyCode.ButtonA } }
		})
	end) else nil
end

return IGMRespawnControllerBar