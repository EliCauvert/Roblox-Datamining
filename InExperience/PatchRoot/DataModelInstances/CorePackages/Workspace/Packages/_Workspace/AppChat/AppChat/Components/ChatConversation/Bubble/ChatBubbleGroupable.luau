local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ChatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local GetChatBubbleCornerRadiiModule = require(script.Parent.getChatBubbleCornerRadii)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAppChatNativeFoundationCornerRadiiModule = require(AppChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local config = {
	layoutOrder = 0,
	padding = 0,
	alignment = Enum.HorizontalAlignment.Right,
	children = {},
	imageStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) },
	onAbsoluteSizeChanged = function(_) --[[ Line: 31 ]] end,
	position = UDim2.new(0, 0, 0, 0),
	setContentWidth = function(_) --[[ Line: 34 ]] end,
	variant = ChatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE
}

function ChatBubbleGroupable(p1) --[[ Line: 38 ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), FFlagAppChatNativeFoundationCornerRadiiModule (copy), GetChatBubbleCornerRadiiModule (copy), ChatBubbleEnumModule (copy), Image (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local IsAlignmentMatch = UnionResult.alignment == Enum.HorizontalAlignment.Left
	local Size500 = UseTokensFunction().Size.Size_500
	local Element = ReactModule.createElement(View, {
		tag = "size-0 auto-xy",
		BackgroundTransparency = 1,
		padding = UnionResult.padding
	}, UnionResult.children)
	
	if FFlagAppChatNativeFoundationCornerRadiiModule then
		return ReactModule.createElement(View, {
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = UnionResult.imageStyle,
			cornerRadius = GetChatBubbleCornerRadiiModule(UnionResult.variant, IsAlignmentMatch, Size500),
			Position = UnionResult.position,
			LayoutOrder = UnionResult.layoutOrder,
			onAbsoluteSizeChanged = UnionResult.onAbsoluteSizeChanged
		}, Element)
	else
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
		}, Element)
	end
end

return ReactModule.memo(ChatBubbleGroupable)