local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Chip = FoundationModule.Chip
local ChipSize = FoundationModule.Enums.ChipSize
local Radius = FoundationModule.Enums.Radius
local ScrollView = FoundationModule.ScrollView
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Visibility = FoundationModule.Enums.Visibility

local function AnimatedChipSlot(p1)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), Chip (copy), ChipSize (copy)
	return ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.index }, {
		Skeleton = ReactModule.createElement(Skeleton, {
			LayoutOrder = p1.index,
			Position = UDim2.fromOffset(0, 0),
			radius = Radius.Circle,
			Size = UDim2.fromOffset(p1.tokens.Size.Size_2800, p1.tokens.Size.Size_800),
			Visible = p1.animationState.hasStarted:map(function(p2): boolean
				return not p2
			end),
			testId = `PromptChipGroup.Skeleton{p1.index}`
		}),
		Chip = ReactModule.createElement(View, {
			tag = "auto-xy",
			GroupTransparency = p1.animationState.groupTransparency,
			Visible = p1.animationState.hasStarted,
			testId = `PromptChipGroup.Fade{p1.index}`
		}, {
			Content = ReactModule.createElement(Chip, {
				leading = p1.chip.leading,
				onActivated = p1.chip.onActivated,
				size = ChipSize.Medium,
				text = p1.chip.text,
				testId = `PromptChipGroup.Chips--chip-{p0.index}`
			})
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), AnimatedChipSlot (copy), View (copy), ScrollView (copy), Visibility (copy)
	local Elements = {}
	
	for Index, chip in p1.chips do
		Elements[`Chip{Index}`] = ReactModule.createElement(AnimatedChipSlot, {
			animationState = p1.chipAnimationStates[Index],
			chip = chip,
			index = Index,
			tokens = p1.tokens
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		testId = "PromptChipGroup.Chips",
		ref = p1.chipGroupRef
	}, {
		Scroll = ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, p1.tokens.Padding.Small)
			},
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = Visibility.None
			}
		}, Elements)
	})
end