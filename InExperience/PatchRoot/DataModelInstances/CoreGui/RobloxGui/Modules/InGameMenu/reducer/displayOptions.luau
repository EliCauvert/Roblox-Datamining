local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Rodux.createReducer({
	inspectMenuEnabled = true,
	inputType = require(parent.Resources.Constants).InputType.MouseAndKeyboard
}, {
	[require(parent.Actions.SetInspectMenuEnabled).name] = function(p0, p1)
		return {
			inspectMenuEnabled = p1.enabled,
			inputType = p0.inputType
		}
	end,
	[require(parent.Actions.SetInputType).name] = function(p2, p3)
		return {
			inspectMenuEnabled = p2.inspectMenuEnabled,
			inputType = p3.inputType
		}
	end
})