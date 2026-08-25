local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local chatBubbleEnumModule = require(script.Parent.ChatBubbleEnum)
local getChatBubbleCornerRadiiModule = require(script.Parent.getChatBubbleCornerRadii)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagAppChatNativeFoundationCornerRadiiModule = require(appChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local t = {
	layoutOrder = 0,
	padding = 0,
	alignment = Enum.HorizontalAlignment.Right,
	children = {},
	imageStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) },
	onAbsoluteSizeChanged = function(_) end,
	position = UDim2.new(0, 0, 0, 0),
	setContentWidth = function(_) end,
	variant = chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE
}

function ChatBubbleGroupable(p0)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), view (ref), fFlagAppChatNativeFoundationCornerRadiiModule (ref), getChatBubbleCornerRadiiModule (ref), chatBubbleEnumModule (ref), image (ref)
	local var8 = cryoModule.Dictionary.union(t, p0)
	local var9 = var8.alignment == Enum.HorizontalAlignment.Left
	local size500 = useTokens().Size.Size_500
	local var10 = reactModule.createElement(view, {
		tag = "size-0 auto-xy",
		BackgroundTransparency = 1,
		padding = var8.padding
	}, var8.children)
	
	if fFlagAppChatNativeFoundationCornerRadiiModule then
		return reactModule.createElement(view, {
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var8.imageStyle,
			cornerRadius = getChatBubbleCornerRadiiModule(var8.variant, var9, size500),
			Position = var8.position,
			LayoutOrder = var8.layoutOrder,
			onAbsoluteSizeChanged = var8.onAbsoluteSizeChanged
		}, var10)
	end
	local var11 = if var9 then chatBubbleEnumModule.GROUPED_RECEIVED_BUBBLES else chatBubbleEnumModule.GROUPED_OUTGOING_BUBBLES
	
	return reactModule.createElement(image, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Image = if var8.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE then chatBubbleEnumModule.GROUPED_BUBBLE_SINGLE elseif var8.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.TOP then var11.BUBBLE_TOP elseif var8.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM then var11.BUBBLE_BOTTOM else var11.BUBBLE_MIDDLE,
		ScaleType = Enum.ScaleType.Slice,
		slice = {
			center = chatBubbleEnumModule.GROUPED_BUBBLE_SLICE_CENTER
		},
		imageStyle = var8.imageStyle,
		Position = var8.position,
		LayoutOrder = var8.layoutOrder,
		onAbsoluteSizeChanged = var8.onAbsoluteSizeChanged
	}, var10)
end

return reactModule.memo(ChatBubbleGroupable)