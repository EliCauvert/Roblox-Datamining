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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), reactModule (ref), chatBubbleContainerAutomaticSizeModule (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	local var6 = foundationModule.Hooks.useTokens()
	
	return reactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
		isIncoming = var5.isIncoming,
		hasTail = var5.hasTail,
		isPending = var5.isPending,
		isUnfiltered = false,
		padding = {
			top = UDim.new(0, var6.Padding.Small),
			bottom = UDim.new(0, var6.Padding.Small),
			left = UDim.new(0, var6.Padding.Medium),
			right = UDim.new(0, var6.Padding.Medium)
		},
		LayoutOrder = var5.LayoutOrder,
		isRepliedTo = var5.isRepliedTo,
		isPressed = var5.isPressed,
		isLastMessageInMessageGroup = var5.isLastMessageInMessageGroup,
		[reactModule.Change.AbsoluteSize] = var5[reactModule.Change.AbsoluteSize]
	}, {
		IconContainer = reactModule.createElement(foundationModule.View, {
			tag = "row align-x-center align-y-center content-muted",
			Size = UDim2.fromOffset(180 - var6.Padding.Medium * 2, 40 - var6.Padding.Small * 2)
		}, {
			LockIcon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.LockClosed,
				size = foundationModule.Enums.IconSize.Medium,
				variant = foundationModule.Enums.IconVariant.Regular
			})
		})
	})
end