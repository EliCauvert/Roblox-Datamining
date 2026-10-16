local Foundation = script:FindFirstAncestor("Foundation")
local Icon = require(Foundation.Parent.BuilderIcons).Icon
local GetBuilderIconForKeycodeModule = require(Foundation.Utility.getBuilderIconForKeycode)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.25, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local NumberSequence2 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.4, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local NumberSequence3 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.75, 0),
	NumberSequenceKeypoint.new(1, 0)
})
local NumberSequence4 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.6, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function variantsFactory(p1) --[[ Line: 46 ]]
	-- upvalues: NumberSequence4 (copy), NumberSequence3 (copy), NumberSequence2 (copy), NumberSequence1 (copy), GetBuilderIconForKeycodeModule (copy), Icon (copy)
	return {
		fade = p1.Size.Size_1000,
		directionIcon = {
			[Enum.HorizontalAlignment.Right] = {
				[Enum.PreferredInput.Gamepad] = GetBuilderIconForKeycodeModule(Enum.KeyCode.ButtonR1) or Icon.ChevronSmallRight,
				[Enum.PreferredInput.KeyboardAndMouse] = Icon.ChevronSmallRight,
				[Enum.PreferredInput.Touch] = Icon.ChevronSmallRight
			},
			[Enum.HorizontalAlignment.Left] = {
				[Enum.PreferredInput.Gamepad] = GetBuilderIconForKeycodeModule(Enum.KeyCode.ButtonL1) or Icon.ChevronSmallLeft,
				[Enum.PreferredInput.KeyboardAndMouse] = Icon.ChevronSmallLeft,
				[Enum.PreferredInput.Touch] = Icon.ChevronSmallLeft
			}
		},
		gradient = {
			[Enum.HorizontalAlignment.Right] = { [true] = NumberSequence4, [false] = NumberSequence3 },
			[Enum.HorizontalAlignment.Left] = { [true] = NumberSequence2, [false] = NumberSequence1 }
		},
		iconAlignmentTag = {
			[Enum.HorizontalAlignment.Right] = "anchor-center-right position-center-right",
			[Enum.HorizontalAlignment.Left] = "anchor-center-left position-center-left"
		}
	}
end

return function(p1, p2, p3) --[[ Line: 90 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy)
	local OverflowScrollContainerScrim = VariantsContextModule.useVariants("OverflowScrollContainerScrim", variantsFactory, p1)
	
	return {
		fade = OverflowScrollContainerScrim.fade,
		gradient = OverflowScrollContainerScrim.gradient[p2][false],
		hoverGradient = OverflowScrollContainerScrim.gradient[p2][true],
		directionIcon = OverflowScrollContainerScrim.directionIcon[p2][p3],
		iconAlignmentTag = OverflowScrollContainerScrim.iconAlignmentTag[p2]
	}
end