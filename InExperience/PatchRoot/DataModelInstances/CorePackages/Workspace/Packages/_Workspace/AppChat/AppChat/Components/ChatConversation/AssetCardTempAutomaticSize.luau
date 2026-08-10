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
		onDetailsOpened = function() --[[ line: 26 ]] end,
		openGameDetailsPage = function() --[[ line: 27 ]] end
	}
}

return function(value) --[[ line: 40 | named "AssetCardTemp" ]]
	-- upvalues: cryoModule (ref), t (ref), shareLinkContainerModule (ref), placeIdContainerModule (ref), gameCardContainerModule (ref), useScaledValue (ref), constantsModule (ref), roactModule (ref), chatBubbleContainerAutomaticSizeModule (ref)
	local var9 = cryoModule.Dictionary.union(t, value)
	local var10 = cryoModule.Dictionary.union(t.additionalProps, var9.additionalProps)
	local var11 = if var10.shareLink then shareLinkContainerModule elseif var10.placeId then placeIdContainerModule else gameCardContainerModule
	local isPending = var9.isPending
	local var12 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var13 = useScaledValue(constantsModule.GameCard.THUMBNAIL_HEIGHT + constantsModule.GameCard.FOOTER_HEIGHT)
	var10.isStartOfGroup = var9.hasTail
	var10.isIncoming = var9.isIncoming
	var10.isUnfiltered = var9.isUnfiltered
	var10.isPending = var9.isPending
	var10.isRepliedTo = var9.isRepliedTo
	
	return roactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
		hasTail = var9.hasTail,
		isIncoming = var9.isIncoming,
		isPending = isPending,
		isUnfiltered = nil,
		isAssetCard = true,
		LayoutOrder = var9.LayoutOrder,
		padding = 0,
		isLastMessageInMessageGroup = var9.isLastMessageInMessageGroup or t.isLastMessageInMessageGroup,
		[roactModule.Change.AbsoluteSize] = var9[roactModule.Change.AbsoluteSize]
	}, {
		AssetCard = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var12 or 256, var13 or 208),
			AutomaticSize = Enum.AutomaticSize.XY
		}, { Card = roactModule.createElement(var11, var10) })
	})
end