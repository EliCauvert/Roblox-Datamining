local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local t = {
	layoutOrder = 0,
	padding = 0,
	alignment = Enum.HorizontalAlignment.Right,
	children = {},
	imageStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) },
	onAbsoluteSizeChanged = function(_) --[[ line: 33 ]] end,
	position = UDim2.new(0, 0, 0, 0),
	setContentWidth = function(_) --[[ line: 36 ]] end,
	variant = chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE
}

function ChatBubbleGroupable(p0) --[[ line: 40 ]]
	-- upvalues: cryoModule (ref), t (ref), chatBubbleEnumModule (ref), reactModule (ref), image (ref), foundationModule (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	local var6 = if var5.alignment == Enum.HorizontalAlignment.Left then chatBubbleEnumModule.GROUPED_RECEIVED_BUBBLES else chatBubbleEnumModule.GROUPED_OUTGOING_BUBBLES
	
	return reactModule.createElement(image, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Image = if var5.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE then chatBubbleEnumModule.GROUPED_BUBBLE_SINGLE elseif var5.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.TOP then var6.BUBBLE_TOP elseif var5.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM then var6.BUBBLE_BOTTOM else var6.BUBBLE_MIDDLE,
		ScaleType = Enum.ScaleType.Slice,
		slice = {
			center = chatBubbleEnumModule.GROUPED_BUBBLE_SLICE_CENTER
		},
		imageStyle = var5.imageStyle,
		Position = var5.position,
		LayoutOrder = var5.layoutOrder,
		onAbsoluteSizeChanged = var5.onAbsoluteSizeChanged
	}, reactModule.createElement(foundationModule.View, {
		tag = "size-0 auto-xy",
		BackgroundTransparency = 1,
		padding = if typeof(var5.padding) == "table" then {
			top = var5.padding.top or UDim.new(0, 0),
			bottom = var5.padding.bottom or UDim.new(0, 0),
			left = var5.padding.left or UDim.new(0, 0),
			right = var5.padding.right or UDim.new(0, 0)
		} else UDim2.fromOffset(var5.padding or 0, var5.padding or 0)
	}, var5.children))
end

return reactModule.memo(ChatBubbleGroupable)