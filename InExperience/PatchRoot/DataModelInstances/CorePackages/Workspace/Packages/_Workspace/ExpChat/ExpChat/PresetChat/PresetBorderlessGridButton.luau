local parent = script:FindFirstAncestor("ExpChat").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)

return reactModule.memo(function(value)
	-- upvalues: foundationModule (ref), reactModule (ref)
	local unicode = value.unicode
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-900-900",
		LayoutOrder = value.layoutOrder or 0
	}, {
		Button = reactModule.createElement(foundationModule.View, {
			tag = "position-center-center anchor-center-center size-1100-1100 radius-medium",
			testId = "PresetBorderlessGridButton",
			backgroundStyle = foundationModule.Hooks.useTokens().Color.None,
			onActivated = reactModule.useCallback(function()
				-- upvalues: value (ref), unicode (ref)
				value.onActivated(unicode)
			end, { value.onActivated, unicode }),
			selection = { Selectable = true },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.Background
			},
			ref = value.buttonRef
		}, {
			Emoji = reactModule.createElement(foundationModule.Text, {
				tag = "position-center-center anchor-center-center size-800-800 text-heading-medium text-align-x-center text-align-y-center content-default",
				Text = unicode
			})
		})
	})
end)