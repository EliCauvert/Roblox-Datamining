local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local config = {
	layoutOrder = 0,
	padding = 0,
	alignment = Enum.HorizontalAlignment.Right,
	children = {},
	imageStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) },
	onAbsoluteSizeChanged = function(_) end,
	position = UDim2.new(0, 0, 0, 0),
	setContentWidth = function(_) end,
	variant = ChatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE
}

function ChatBubbleGroupable(p1)
	-- upvalues: CryoModule (copy), config (copy), ChatBubbleEnumModule (copy), ReactModule (copy), Image (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local IsAlignmentMatch = UnionResult.alignment == Enum.HorizontalAlignment.Left
	local GROUPEDRECEIVEDBUBBLES = if IsAlignmentMatch then ChatBubbleEnumModule.GROUPED_RECEIVED_BUBBLES else ChatBubbleEnumModule.GROUPED_OUTGOING_BUBBLES
	
	return ReactModule.createElement(Image, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Image = if UnionResult.variant == ChatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE then ChatBubbleEnumModule.GROUPED_BUBBLE_SINGLE elseif UnionResult.variant == ChatBubbleEnumModule.BUBBLE_VARIANTS.TOP then GROUPEDRECEIVEDBUBBLES.BUBBLE_TOP elseif UnionResult.variant == ChatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM then GROUPEDRECEIVEDBUBBLES.BUBBLE_BOTTOM else GROUPEDRECEIVEDBUBBLES.BUBBLE_MIDDLE,
		ScaleType = Enum.ScaleType.Slice,
		slice = {
			center = ChatBubbleEnumModule.GROUPED_BUBBLE_SLICE_CENTER
		},
		imageStyle = UnionResult.imageStyle,
		Position = UnionResult.position,
		LayoutOrder = UnionResult.layoutOrder,
		onAbsoluteSizeChanged = UnionResult.onAbsoluteSizeChanged
	}, ReactModule.createElement(FoundationModule.View, {
		tag = "size-0 auto-xy",
		BackgroundTransparency = 1,
		padding = if typeof(UnionResult.padding) == "table" then {
			top = UnionResult.padding.top or UDim.new(0, 0),
			bottom = UnionResult.padding.bottom or UDim.new(0, 0),
			left = UnionResult.padding.left or UDim.new(0, 0),
			right = UnionResult.padding.right or UDim.new(0, 0)
		} else UDim2.fromOffset(UnionResult.padding or 0, UnionResult.padding or 0)
	}, UnionResult.children))
end

return ReactModule.memo(ChatBubbleGroupable)