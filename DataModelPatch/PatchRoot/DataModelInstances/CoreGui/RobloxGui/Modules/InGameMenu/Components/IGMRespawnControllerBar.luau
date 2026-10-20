local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local IGMControllerBar2Module = require(script.Parent.IGMControllerBar2)
local ConstantsModule = require(Parent.Resources.Constants)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local IGMRespawnControllerBar = Roact.PureComponent:extend("IGMRespawnControllerBar")
IGMRespawnControllerBar.validateProps = T.strictInterface({ inputType = T.string })

function IGMRespawnControllerBar.render(p1)
	-- upvalues: ConstantsModule (copy), WithLocalizationModule (copy), Roact (copy), IGMControllerBar2Module (copy)
	return if p1.props.inputType == ConstantsModule.InputType.Gamepad then WithLocalizationModule({
		cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel",
		respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn"
	})(function(p2)
		-- upvalues: Roact (upval), IGMControllerBar2Module (upval)
		return Roact.createElement(IGMControllerBar2Module, {
			leftHint = { text = p2.cancel, keyCode = Enum.KeyCode.ButtonB },
			rightHints = { { text = p2.respawn, keyCode = Enum.KeyCode.ButtonA } }
		})
	end) else nil
end

return IGMRespawnControllerBar