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

function ChatBubbleGroupable(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), view (ref), fFlagAppChatNativeFoundationCornerRadiiModule (ref), getChatBubbleCornerRadiiModule (ref), chatBubbleEnumModule (ref), image (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = var1.alignment == Enum.HorizontalAlignment.Left
	local size500 = useTokens().Size.Size_500
	local var3 = reactModule.createElement(view, {
		tag = "size-0 auto-xy",
		BackgroundTransparency = 1,
		padding = var1.padding
	}, var1.children)
	
	if fFlagAppChatNativeFoundationCornerRadiiModule then
		return reactModule.createElement(view, {
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var1.imageStyle,
			cornerRadius = getChatBubbleCornerRadiiModule(var1.variant, var2, size500),
			Position = var1.position,
			LayoutOrder = var1.layoutOrder,
			onAbsoluteSizeChanged = var1.onAbsoluteSizeChanged
		}, var3)
	end
	local var4 = if var2 then chatBubbleEnumModule.GROUPED_RECEIVED_BUBBLES else chatBubbleEnumModule.GROUPED_OUTGOING_BUBBLES
	
	return reactModule.createElement(image, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Image = if var1.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.SINGLE then chatBubbleEnumModule.GROUPED_BUBBLE_SINGLE elseif var1.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.TOP then var4.BUBBLE_TOP elseif var1.variant == chatBubbleEnumModule.BUBBLE_VARIANTS.BOTTOM then var4.BUBBLE_BOTTOM else var4.BUBBLE_MIDDLE,
		ScaleType = Enum.ScaleType.Slice,
		slice = {
			center = chatBubbleEnumModule.GROUPED_BUBBLE_SLICE_CENTER
		},
		imageStyle = var1.imageStyle,
		Position = var1.position,
		LayoutOrder = var1.layoutOrder,
		onAbsoluteSizeChanged = var1.onAbsoluteSizeChanged
	}, var3)
end

return reactModule.memo(ChatBubbleGroupable)