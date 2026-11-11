local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ChatBubbleContainerAutomaticSizeModule = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize)
local config = {
	isIncoming = false,
	hasTail = false,
	isPending = false,
	isRepliedTo = false,
	isPressed = false,
	innerPadding = 0,
	maxWidth = 180,
	LayoutOrder = 0,
	isLastMessageInMessageGroup = false
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), ReactModule (copy), ChatBubbleContainerAutomaticSizeModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(ChatBubbleContainerAutomaticSizeModule, {
		isIncoming = UnionResult.isIncoming,
		hasTail = UnionResult.hasTail,
		isPending = UnionResult.isPending,
		isUnfiltered = false,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Small),
			bottom = UDim.new(0, UseTokensResult.Padding.Small),
			left = UDim.new(0, UseTokensResult.Padding.Medium),
			right = UDim.new(0, UseTokensResult.Padding.Medium)
		},
		LayoutOrder = UnionResult.LayoutOrder,
		isRepliedTo = UnionResult.isRepliedTo,
		isPressed = UnionResult.isPressed,
		isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup,
		[ReactModule.Change.AbsoluteSize] = UnionResult[ReactModule.Change.AbsoluteSize]
	}, {
		IconContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-center align-y-center content-muted",
			Size = UDim2.fromOffset(180 - UseTokensResult.Padding.Medium * 2, 40 - UseTokensResult.Padding.Small * 2)
		}, {
			LockIcon = ReactModule.createElement(FoundationModule.Icon, {
				name = FoundationModule.Enums.IconName.LockClosed,
				size = FoundationModule.Enums.IconSize.Medium,
				variant = FoundationModule.Enums.IconVariant.Regular
			})
		})
	})
end