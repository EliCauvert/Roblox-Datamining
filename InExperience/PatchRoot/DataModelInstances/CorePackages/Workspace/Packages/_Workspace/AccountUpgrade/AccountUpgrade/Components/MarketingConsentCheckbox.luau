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
	local IsSizeMatch: boolean = Frame.size == InputSize.Small or Frame.size == InputSize.XSmall
	local IsSmallGap = Frame.smallGap == true
	local OnToggledFunction = Frame.onToggled
	local IsDisabled = Frame.isDisabled
	
	return ReactModule.createElement(View, {
		testId = "AccountUpgradeMarketingConsent",
		tag = {
			["row align-y-top size-full-0 auto-y"] = true,
			["gap-small"] = IsSmallGap,
			["gap-medium"] = not IsSmallGap
		},
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
			LayoutOrder = 2,
			testId = "AccountUpgradeMarketingConsentText",
			tag = {
				["fill size-full-0 auto-y"] = true,
				["padding-top-xxsmall"] = IsSizeMatch
			},
			GroupTransparency = if IsDisabled then 0.5 else 0
		}, {
			Text = ReactModule.createElement(Text, {
				Text = Frame.text,
				tag = {
					["size-full-0 auto-y text-wrap text-align-x-left content-emphasis"] = true,
					["text-body-small"] = IsSizeMatch,
					["text-body-medium"] = not IsSizeMatch
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