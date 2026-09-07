local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local chatBubbleContainerAutomaticSizeModule = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize)
local t = {
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
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), reactModule (ref), chatBubbleContainerAutomaticSizeModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = foundationModule.Hooks.useTokens()
	
	return reactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
		isIncoming = var1.isIncoming,
		hasTail = var1.hasTail,
		isPending = var1.isPending,
		isUnfiltered = false,
		padding = {
			top = UDim.new(0, var2.Padding.Small),
			bottom = UDim.new(0, var2.Padding.Small),
			left = UDim.new(0, var2.Padding.Medium),
			right = UDim.new(0, var2.Padding.Medium)
		},
		LayoutOrder = var1.LayoutOrder,
		isRepliedTo = var1.isRepliedTo,
		isPressed = var1.isPressed,
		isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup,
		[reactModule.Change.AbsoluteSize] = var1[reactModule.Change.AbsoluteSize]
	}, {
		IconContainer = reactModule.createElement(foundationModule.View, {
			tag = "row align-x-center align-y-center content-muted",
			Size = UDim2.fromOffset(180 - var2.Padding.Medium * 2, 40 - var2.Padding.Small * 2)
		}, {
			LockIcon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.LockClosed,
				size = foundationModule.Enums.IconSize.Medium,
				variant = foundationModule.Enums.IconVariant.Regular
			})
		})
	})
end