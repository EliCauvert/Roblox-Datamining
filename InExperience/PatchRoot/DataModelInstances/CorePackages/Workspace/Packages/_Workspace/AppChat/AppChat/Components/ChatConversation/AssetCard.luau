local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local _ = require(parent.React)
local cryoModule = require(parent.Cryo)
local chatBubbleContainerModule = require(script.Parent.Bubble.ChatBubbleContainer)
local constantsModule = require(appChat.Constants)
local foundationModule = require(parent.Foundation)
local useScaledValue = foundationModule.Hooks.useScaledValue
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local text = require(parent.AppCommonLib).Text
local getTextSize = require(parent.Style).GetTextSize
local placeIdContainerModule = require(appChat.Components.ChatConversation.ShareLinkComponents.GameCardComponents.PlaceIdContainer)
local gameCardContainerModule = require(appChat.Components.ChatConversation.ShareLinkComponents.GameCardComponents.GameCardContainer)
local shareLinkContainerModule = require(appChat.Components.ChatConversation.ShareLinkComponents.ShareLinkContainer)
local shareLinkV2PresentationModule = require(appChat.Components.ChatConversation.ShareLinkComponents.ShareLinkV2Presentation)
local useShareLinkV2PresentationModule = require(appChat.Components.ChatConversation.ShareLinkComponents.useShareLinkV2Presentation)
local plainTextModule = require(script.Parent.PlainText)
local chatMessageContainerConstantsModule = require(script.Parent.ChatMessageContainerConstants)
local fFlagAppChatShareLinkV2FallbacksModule = require(appChat.Flags.FFlagAppChatShareLinkV2Fallbacks)
local fFlagAppChatFullPlaintextBeforeGameCardsModule = require(appChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
local fFlagAppChatIntrinsicAssetCardHeightModule = require(appChat.Flags.FFlagAppChatIntrinsicAssetCardHeight)
local BUBBLE_PADDING = chatMessageContainerConstantsModule.BUBBLE_PADDING
local TEXT_BUBBLE_X_PADDING = chatMessageContainerConstantsModule.TEXT_BUBBLE_X_PADDING
local TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING = chatMessageContainerConstantsModule.TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING
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
	-- upvalues: cryoModule (ref), t (ref), shareLinkContainerModule (ref), placeIdContainerModule (ref), gameCardContainerModule (ref), useScaledValue (ref), constantsModule (ref), fFlagAppChatShareLinkV2FallbacksModule (ref), useShareLinkV2PresentationModule (ref), shareLinkV2PresentationModule (ref), fFlagAppChatFullPlaintextBeforeGameCardsModule (ref), TEXT_BUBBLE_X_PADDING (ref), BUBBLE_PADDING (ref), TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref), roactModule (ref), plainTextModule (ref), chatBubbleContainerModule (ref), fFlagAppChatIntrinsicAssetCardHeightModule (ref)
	local shareLink
	local var1 = cryoModule.Dictionary.union(t, value)
	local var2 = cryoModule.Dictionary.union(t.additionalProps, var1.additionalProps)
	local var3 = if var2.shareLink then shareLinkContainerModule elseif var2.placeId then placeIdContainerModule else gameCardContainerModule
	local isPending = var1.isPending
	local var4 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var5 = useScaledValue(constantsModule.GameCard.THUMBNAIL_HEIGHT + constantsModule.GameCard.FOOTER_HEIGHT)
	local var6 = nil
	
	if fFlagAppChatShareLinkV2FallbacksModule then
		shareLink = var2.shareLink
		var6 = useShareLinkV2PresentationModule(if shareLink and shareLink.version == 2 then shareLink.linkId else nil)
	end
	if var6 == shareLinkV2PresentationModule.Fallback then
		shareLink = var2.shareLink.url
		
		if fFlagAppChatFullPlaintextBeforeGameCardsModule or shareLink == nil then
			return nil
		end
		local var7 = var1.parentWidth - (TEXT_BUBBLE_X_PADDING + BUBBLE_PADDING) * 2 - (if var1.wideMode then TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING else 0)
		
		return roactModule.createElement(plainTextModule, {
			text = shareLink,
			font = var1.font,
			textSize = var1.textSize,
			innerPadding = var1.innerPadding,
			maxWidth = (if foundationFontFaceMigration then getTextSize(shareLink, var1.textSize, var1.font, Vector2.new(var7, 10000)) else text.GetTextBounds(shareLink, var1.font, var1.textSize, Vector2.new(var7, 10000))).X + BUBBLE_PADDING * 2,
			hasTail = var1.hasTail,
			isIncoming = var1.isIncoming,
			isPending = var1.isPending,
			isUnfiltered = var1.isUnfiltered,
			isRepliedTo = var1.isRepliedTo,
			isPressed = var1.isPressed,
			isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup,
			bubbleRef = var1.bubbleRef,
			LayoutOrder = var1.LayoutOrder,
			[roactModule.Change.AbsoluteSize] = var1[roactModule.Change.AbsoluteSize]
		})
	else
		var2.isStartOfGroup = var1.hasTail
		var2.isIncoming = var1.isIncoming
		var2.isUnfiltered = var1.isUnfiltered
		var2.isPending = var1.isPending
		var2.isRepliedTo = var1.isRepliedTo
		
		return roactModule.createElement(chatBubbleContainerModule, {
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
				Size = if fFlagAppChatIntrinsicAssetCardHeightModule then UDim2.fromOffset(var4 or 256, 0) else UDim2.fromOffset(var4 or 256, var5 or 208),
				AutomaticSize = Enum.AutomaticSize.XY
			}, { Card = roactModule.createElement(var3, var2) })
		})
	end
end