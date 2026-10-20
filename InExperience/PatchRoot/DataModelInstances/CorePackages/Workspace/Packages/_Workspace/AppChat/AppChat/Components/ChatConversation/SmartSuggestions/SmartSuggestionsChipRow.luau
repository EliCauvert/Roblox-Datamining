local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ChipGroup = FoundationModule.ChipGroup
local ChipGroupVariant = FoundationModule.Enums.ChipGroupVariant
local ChipSize = FoundationModule.Enums.ChipSize
local Divider = FoundationModule.Divider
local View = FoundationModule.View
local SuggestionType = require(script.Parent.Types).SuggestionType
local config = {
	[SuggestionType.GameCard] = FoundationModule.Enums.IconName.Controller,
	[SuggestionType.StartParty] = FoundationModule.Enums.IconName.ThreePeople
}

return ReactModule.memo(function(Frame)
	-- upvalues: config (copy), ReactModule (copy), View (copy), Divider (copy), ChipGroup (copy), ChipSize (copy), ChipGroupVariant (copy)
	local Chips = {}
	
	for i, suggestion in Frame.suggestions do
		Chips[i] = {
			text = suggestion.display_text,
			leading = config[suggestion.type],
			onActivated = function()
				-- upvalues: Frame (copy), suggestion (copy)
				Frame.onActivated(suggestion)
			end
		}
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y clip",
		testId = "SmartSuggestionsChipRow--clip",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Divider = ReactModule.createElement(Divider, {
			LayoutOrder = 1,
			testId = "SmartSuggestionsChipRow--divider"
		}),
		ChipGroup = ReactModule.createElement(ChipGroup, {
			LayoutOrder = 2,
			testId = "SmartSuggestionsChipRow",
			chips = Chips,
			size = ChipSize.Medium,
			variant = ChipGroupVariant.Row
		})
	})
end)