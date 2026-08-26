local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Rodux.createReducer({
	inspectMenuEnabled = true,
	inputType = require(parent.Resources.Constants).InputType.MouseAndKeyboard
}, {
	[require(parent.Actions.SetInspectMenuEnabled).name] = function(p1, p2)
		return {
			inspectMenuEnabled = p2.enabled,
			inputType = p1.inputType
		}
	end,
	[require(parent.Actions.SetInputType).name] = function(p1, p2)
		return {
			inspectMenuEnabled = p1.inspectMenuEnabled,
			inputType = p2.inputType
		}
	end
})