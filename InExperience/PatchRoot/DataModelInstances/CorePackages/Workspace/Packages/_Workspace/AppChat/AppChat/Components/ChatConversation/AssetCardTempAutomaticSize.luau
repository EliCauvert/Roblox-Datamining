local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local chatBubbleContainerAutomaticSizeModule = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize)
local constantsModule = require(appChat.Constants)
local useScaledValue = require(parent.Foundation).Hooks.useScaledValue
local placeIdContainerModule = require(appChat.Components.ChatConversation.ShareLinkComponents.GameCardComponents.PlaceIdContainer)
local gameCardContainerModule = require(appChat.Components.ChatConversation.ShareLinkComponents.GameCardComponents.GameCardContainer)
local shareLinkContainerModule = require(appChat.Components.ChatConversation.ShareLinkComponents.ShareLinkContainer)
local t = {
	hasTail = false,
	innerPadding = 0,
	isIncoming = false,
	isPending = true,
	isUnfiltered = false,
	isLastMessageInMessageGroup = false,
	maxWidth = 0,
	parentWidth = 0,
	wideMode = false,
	additionalProps = {
		shareLink = nil,
		placeId = nil,
		universeId = nil,
		senderUserId = nil,
		onDetailsOpened = function() end,
		openGameDetailsPage = function() end
	}
}

return function(value)
	-- upvalues: cryoModule (ref), t (ref), shareLinkContainerModule (ref), placeIdContainerModule (ref), gameCardContainerModule (ref), useScaledValue (ref), constantsModule (ref), roactModule (ref), chatBubbleContainerAutomaticSizeModule (ref)
	local var1 = cryoModule.Dictionary.union(t, value)
	local var2 = cryoModule.Dictionary.union(t.additionalProps, var1.additionalProps)
	local var3 = if var2.shareLink then shareLinkContainerModule elseif var2.placeId then placeIdContainerModule else gameCardContainerModule
	local isPending = var1.isPending
	local var4 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var5 = useScaledValue(constantsModule.GameCard.THUMBNAIL_HEIGHT + constantsModule.GameCard.FOOTER_HEIGHT)
	var2.isStartOfGroup = var1.hasTail
	var2.isIncoming = var1.isIncoming
	var2.isUnfiltered = var1.isUnfiltered
	var2.isPending = var1.isPending
	var2.isRepliedTo = var1.isRepliedTo
	
	return roactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
		hasTail = var1.hasTail,
		isIncoming = var1.isIncoming,
		isPending = isPending,
		isUnfiltered = nil,
		isAssetCard = true,
		LayoutOrder = var1.LayoutOrder,
		padding = 0,
		isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup or t.isLastMessageInMessageGroup,
		bubbleRef = var1.bubbleRef,
		[roactModule.Change.AbsoluteSize] = var1[roactModule.Change.AbsoluteSize]
	}, {
		AssetCard = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var4 or 256, var5 or 208),
			AutomaticSize = Enum.AutomaticSize.XY
		}, { Card = roactModule.createElement(var3, var2) })
	})
end