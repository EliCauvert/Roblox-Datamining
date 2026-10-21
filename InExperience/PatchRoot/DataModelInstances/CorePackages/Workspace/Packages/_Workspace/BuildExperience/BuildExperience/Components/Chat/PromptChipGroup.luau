local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local ChipGroup = FoundationModule.ChipGroup
local ChipGroupVariant = FoundationModule.Enums.ChipGroupVariant
local ChipSize = FoundationModule.Enums.ChipSize
local IconName = FoundationModule.Enums.IconName
local View = FoundationModule.View

local function _(p1)
	-- upvalues: IconName (copy)
	return if p1.value == "2D" then IconName.SquareCheck elseif p1.value == "3D" then IconName.CubeVertexes else IconName.PlusLarge
end

return function(Frame)
	-- upvalues: IconName (copy), ReactModule (copy), View (copy), ChipGroup (copy), ChipSize (copy), ChipGroupVariant (copy)
	local Chips = {}
	
	for i, promptChip in Frame.promptChips do
		local OnActivatedFunction = Frame.onActivated
		Chips[i] = {
			text = promptChip.value,
			leading = if promptChip.value == "2D" then IconName.SquareCheck elseif promptChip.value == "3D" then IconName.CubeVertexes else IconName.PlusLarge,
			onActivated = if OnActivatedFunction == nil then nil else function()
				-- upvalues: OnActivatedFunction (copy), promptChip (copy)
				OnActivatedFunction(promptChip)
			end
		}
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-bottom-large padding-top-small clip",
		testId = "PromptChipGroup",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ChipGroup = ReactModule.createElement(ChipGroup, {
			testId = "PromptChipGroup.Chips",
			chips = Chips,
			size = ChipSize.Medium,
			variant = ChipGroupVariant.Row
		})
	})
end