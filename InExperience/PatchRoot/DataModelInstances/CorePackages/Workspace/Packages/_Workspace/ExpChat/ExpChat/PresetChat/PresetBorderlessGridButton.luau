local Parent = script:FindFirstAncestor("ExpChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local Unicode = p1.unicode
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-900-900", LayoutOrder = p1.layoutOrder or 0 }, {
		Button = ReactModule.createElement(FoundationModule.View, {
			tag = "position-center-center anchor-center-center size-1100-1100 radius-medium",
			testId = "PresetBorderlessGridButton",
			backgroundStyle = FoundationModule.Hooks.useTokens().Color.None,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: p1 (copy), Unicode (copy)
				p1.onActivated(Unicode)
			end, { p1.onActivated, Unicode }),
			selection = { Selectable = true },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.Background
			},
			ref = p1.buttonRef
		}, {
			Emoji = ReactModule.createElement(FoundationModule.Text, {
				tag = "position-center-center anchor-center-center size-800-800 text-heading-medium text-align-x-center text-align-y-center content-default",
				Text = Unicode
			})
		})
	})
end)