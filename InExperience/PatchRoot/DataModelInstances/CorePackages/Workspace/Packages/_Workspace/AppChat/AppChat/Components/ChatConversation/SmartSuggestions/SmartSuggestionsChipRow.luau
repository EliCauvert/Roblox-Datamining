local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local typesModule = require(script.Parent.Types)
local chipGroup = foundationModule.ChipGroup
local chipGroupVariant = foundationModule.Enums.ChipGroupVariant
local chipSize = foundationModule.Enums.ChipSize
local divider = foundationModule.Divider
local view = foundationModule.View
local suggestionType = typesModule.SuggestionType
local t = {
	[suggestionType.GameCard] = foundationModule.Enums.IconName.Controller,
	[suggestionType.StartParty] = foundationModule.Enums.IconName.ThreePeople
}

return reactModule.memo(function(p0)
	-- upvalues: t (ref), reactModule (ref), view (ref), divider (ref), chipGroup (ref), chipSize (ref), chipGroupVariant (ref)
	local t_1 = {}
	
	for i, v in p0.suggestions do
		t_1[i] = {
			text = v.display_text,
			leading = t[v.type],
			onActivated = function()
				-- upvalues: p0 (ref), v (ref)
				p0.onActivated(v)
			end
		}
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y clip",
		testId = "SmartSuggestionsChipRow--clip",
		LayoutOrder = p0.LayoutOrder
	}, {
		Divider = reactModule.createElement(divider, {
			LayoutOrder = 1,
			testId = "SmartSuggestionsChipRow--divider"
		}),
		ChipGroup = reactModule.createElement(chipGroup, {
			LayoutOrder = 2,
			testId = "SmartSuggestionsChipRow",
			chips = t_1,
			size = chipSize.Medium,
			variant = chipGroupVariant.Row
		})
	})
end)