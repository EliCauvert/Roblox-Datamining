local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Rodux.createReducer({
	inspectMenuEnabled = true,
	inputType = require(Parent.Resources.Constants).InputType.MouseAndKeyboard
}, {
	[require(Parent.Actions.SetInspectMenuEnabled).name] = function(p1, p2) --[[ Line: 20 ]]
		return {
			inspectMenuEnabled = p2.enabled,
			inputType = p1.inputType
		}
	end,
	[require(Parent.Actions.SetInputType).name] = function(p1, p2) --[[ Line: 27 ]]
		return {
			inspectMenuEnabled = p1.inspectMenuEnabled,
			inputType = p2.inputType
		}
	end
})