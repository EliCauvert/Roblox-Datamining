local Parent = script:FindFirstAncestor("AccountUpgrade").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Checkbox = FoundationModule.Checkbox
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

return function(Frame)
	-- upvalues: InputSize (copy), ReactModule (copy), View (copy), Checkbox (copy), Text (copy), StateLayerAffordance (copy)
	local IsSizeMatch = Frame.size == InputSize.Large
	local OnToggledFunction = Frame.onToggled
	local IsDisabled = Frame.isDisabled
	
	return ReactModule.createElement(View, {
		tag = "row align-y-top gap-medium size-full-0 auto-y",
		testId = "AccountUpgradeMarketingConsent",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Box = ReactModule.createElement(Checkbox, {
			label = "",
			LayoutOrder = 1,
			testId = "AccountUpgradeMarketingConsentBox",
			isChecked = Frame.isChecked,
			isDisabled = IsDisabled,
			onActivated = ReactModule.useCallback(function(_)
				-- upvalues: OnToggledFunction (copy)
				OnToggledFunction()
			end, { OnToggledFunction }),
			size = Frame.size
		}),
		Text = ReactModule.createElement(View, {
			tag = "fill size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "AccountUpgradeMarketingConsentText",
			GroupTransparency = if IsDisabled then 0.5 else 0
		}, {
			Text = ReactModule.createElement(Text, {
				Text = Frame.text,
				tag = {
					["size-full-0 auto-y text-wrap text-align-x-left content-default"] = true,
					["text-body-medium"] = not IsSizeMatch,
					["text-body-large"] = IsSizeMatch
				},
				onActivated = ReactModule.useCallback(function()
					-- upvalues: IsDisabled (copy), OnToggledFunction (copy)
					if not IsDisabled then
						OnToggledFunction()
					end
				end, { OnToggledFunction, IsDisabled }),
				isDisabled = IsDisabled,
				stateLayer = { affordance = StateLayerAffordance.None },
				selection = { Selectable = false }
			})
		})
	})
end