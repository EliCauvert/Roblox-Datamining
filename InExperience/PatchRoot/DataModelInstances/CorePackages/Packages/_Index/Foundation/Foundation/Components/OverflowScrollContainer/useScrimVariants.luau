local foundation = script:FindFirstAncestor("Foundation")
local icon = require(foundation.Parent.BuilderIcons).Icon
local getBuilderIconForKeycodeModule = require(foundation.Utility.getBuilderIconForKeycode)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.25, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local numberSequence_1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.4, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local numberSequence_2 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.75, 0),
	NumberSequenceKeypoint.new(1, 0)
})
local numberSequence_3 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.6, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function variantsFactory(p0) --[[ line: 46 ]]
	-- upvalues: numberSequence_3 (ref), numberSequence_2 (ref), numberSequence_1 (ref), numberSequence (ref), getBuilderIconForKeycodeModule (ref), icon (ref)
	return {
		fade = p0.Size.Size_1000,
		directionIcon = {
			[Enum.HorizontalAlignment.Right] = {
				[Enum.PreferredInput.Gamepad] = getBuilderIconForKeycodeModule(Enum.KeyCode.ButtonR1) or icon.ChevronSmallRight,
				[Enum.PreferredInput.KeyboardAndMouse] = icon.ChevronSmallRight,
				[Enum.PreferredInput.Touch] = icon.ChevronSmallRight
			},
			[Enum.HorizontalAlignment.Left] = {
				[Enum.PreferredInput.Gamepad] = getBuilderIconForKeycodeModule(Enum.KeyCode.ButtonL1) or icon.ChevronSmallLeft,
				[Enum.PreferredInput.KeyboardAndMouse] = icon.ChevronSmallLeft,
				[Enum.PreferredInput.Touch] = icon.ChevronSmallLeft
			}
		},
		gradient = {
			[Enum.HorizontalAlignment.Right] = { [true] = numberSequence_3, [false] = numberSequence_2 },
			[Enum.HorizontalAlignment.Left] = { [true] = numberSequence_1, [false] = numberSequence }
		},
		iconAlignmentTag = {
			[Enum.HorizontalAlignment.Right] = "anchor-center-right position-center-right",
			[Enum.HorizontalAlignment.Left] = "anchor-center-left position-center-left"
		}
	}
end

return function(p1, p2, p3) --[[ line: 90 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref)
	local overflowScrollContainerScrim = variantsContextModule.useVariants("OverflowScrollContainerScrim", variantsFactory, p1)
	
	return {
		fade = overflowScrollContainerScrim.fade,
		gradient = overflowScrollContainerScrim.gradient[p2][false],
		hoverGradient = overflowScrollContainerScrim.gradient[p2][true],
		directionIcon = overflowScrollContainerScrim.directionIcon[p2][p3],
		iconAlignmentTag = overflowScrollContainerScrim.iconAlignmentTag[p2]
	}
end