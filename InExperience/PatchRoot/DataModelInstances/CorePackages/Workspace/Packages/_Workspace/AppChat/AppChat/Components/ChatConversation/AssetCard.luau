local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
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
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local chatBubbleEnumModule = require(script.Parent.Bubble.ChatBubbleEnum)
local repliedToMarkerModule = require(script.Parent.Bubble.RepliedToMarker)
local toMessageGroupShapeModule = require(script.Parent.Grouping.toMessageGroupShape)
local isAssetCardClassificationModule = require(appChat.Components.ChatConversation.ShareLinkComponents.isAssetCardClassification)
local getShareLinkV2StoreModule = require(appChat.Stores.GetShareLinkV2Store)
local fFlagAppChatShareLinkV2FallbacksModule = require(appChat.Flags.FFlagAppChatShareLinkV2Fallbacks)
local fFlagAppChatFullPlaintextBeforeGameCardsModule = require(appChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
local fFlagAppChatIntrinsicAssetCardHeightModule = require(appChat.Flags.FFlagAppChatIntrinsicAssetCardHeight)
local fFlagAppChatResolveShareLinkV2Module = require(appChat.Flags.FFlagAppChatResolveShareLinkV2)
local fFlagAppChatPlusReferralAssetCardModule = require(appChat.Flags.FFlagAppChatPlusReferralAssetCard)
local fFlagAppChatMomentAssetCardModule = require(appChat.Flags.FFlagAppChatMomentAssetCard)
local fFlagAppChatGameAssetCardModule = require(appChat.Flags.FFlagAppChatGameAssetCard)
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
local var1 = signalsModule.createSignal(nil)

local function useRendersAssetCardView(value)
	-- upvalues: fFlagAppChatResolveShareLinkV2Module (ref), getShareLinkV2StoreModule (ref), reactModule (ref), signalsReactModule (ref), var1 (ref), fFlagAppChatGameAssetCardModule (ref), isAssetCardClassificationModule (ref)
	local var2 = if fFlagAppChatResolveShareLinkV2Module and value and value.version == 2 then value.linkId else nil
	local var3 = getShareLinkV2StoreModule(false)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref)
		return if var2 then var3.getAndFetchClassification(var2) else nil
	end, { var3, var2 or "" })
	
	return if var2 == nil then fFlagAppChatGameAssetCardModule else isAssetCardClassificationModule(signalsReactModule.useSignalState(if var4 then var4.data else var1))
end

local function renderAssetCardViewRow(value, p1)
	-- upvalues: reactModule (ref), foundationModule (ref), chatBubbleEnumModule (ref), repliedToMarkerModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		testId = "AssetCardRow",
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if value.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, chatBubbleEnumModule.REPLIED_TO_MARKER_GAP)
		},
		LayoutOrder = value.LayoutOrder
	}, {
		Card = reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = 1 }, { Card = p1 }),
		RepliedToMarker = if value.isRepliedTo then reactModule.createElement(repliedToMarkerModule, {
			isIncoming = value.isIncoming,
			layoutOrder = if value.isIncoming then 0 else 2
		}) else nil
	})
end

return function(value)
	-- upvalues: cryoModule (ref), t (ref), shareLinkContainerModule (ref), placeIdContainerModule (ref), gameCardContainerModule (ref), useScaledValue (ref), constantsModule (ref), fFlagAppChatShareLinkV2FallbacksModule (ref), useShareLinkV2PresentationModule (ref), fFlagAppChatPlusReferralAssetCardModule (ref), fFlagAppChatMomentAssetCardModule (ref), fFlagAppChatGameAssetCardModule (ref), useRendersAssetCardView (ref), reactModule (ref), toMessageGroupShapeModule (ref), shareLinkV2PresentationModule (ref), fFlagAppChatFullPlaintextBeforeGameCardsModule (ref), TEXT_BUBBLE_X_PADDING (ref), BUBBLE_PADDING (ref), TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref), roactModule (ref), plainTextModule (ref), renderAssetCardViewRow (ref), chatBubbleContainerModule (ref), fFlagAppChatIntrinsicAssetCardHeightModule (ref)
	local shareLink
	local var2 = cryoModule.Dictionary.union(t, value)
	local var3 = cryoModule.Dictionary.union(t.additionalProps, var2.additionalProps)
	local var4 = if var3.shareLink then shareLinkContainerModule elseif var3.placeId then placeIdContainerModule else gameCardContainerModule
	local isPending = var2.isPending
	local var5 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var6 = useScaledValue(constantsModule.GameCard.THUMBNAIL_HEIGHT + constantsModule.GameCard.FOOTER_HEIGHT)
	local var7 = nil
	
	if fFlagAppChatShareLinkV2FallbacksModule then
		shareLink = var3.shareLink
		var7 = useShareLinkV2PresentationModule(if shareLink and shareLink.version == 2 then shareLink.linkId else nil)
	end
	shareLink = false
	local var8 = nil
	
	if fFlagAppChatPlusReferralAssetCardModule or fFlagAppChatMomentAssetCardModule or fFlagAppChatGameAssetCardModule then
		shareLink = useRendersAssetCardView(var3.shareLink)
		var8 = reactModule.useMemo(function()
			-- upvalues: toMessageGroupShapeModule (copy), var2 (ref)
			return toMessageGroupShapeModule(var2.hasTail, var2.isLastMessageInMessageGroup, var2.isRepliedTo, var2.isIncoming)
		end, {
			var2.hasTail,
			var2.isLastMessageInMessageGroup,
			var2.isRepliedTo,
			var2.isIncoming
		})
	end
	if var7 == shareLinkV2PresentationModule.Fallback then
		local url = var3.shareLink.url
		
		if fFlagAppChatFullPlaintextBeforeGameCardsModule or url == nil then
			return nil
		end
		local var9 = var2.parentWidth - (TEXT_BUBBLE_X_PADDING + BUBBLE_PADDING) * 2 - (if var2.wideMode then TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING else 0)
		
		return roactModule.createElement(plainTextModule, {
			text = url,
			font = var2.font,
			textSize = var2.textSize,
			innerPadding = var2.innerPadding,
			maxWidth = (if foundationFontFaceMigration then getTextSize(url, var2.textSize, var2.font, Vector2.new(var9, 10000)) else text.GetTextBounds(url, var2.font, var2.textSize, Vector2.new(var9, 10000))).X + BUBBLE_PADDING * 2,
			hasTail = var2.hasTail,
			isIncoming = var2.isIncoming,
			isPending = var2.isPending,
			isUnfiltered = var2.isUnfiltered,
			isRepliedTo = var2.isRepliedTo,
			isPressed = var2.isPressed,
			isLastMessageInMessageGroup = var2.isLastMessageInMessageGroup,
			bubbleRef = var2.bubbleRef,
			LayoutOrder = var2.LayoutOrder,
			[roactModule.Change.AbsoluteSize] = var2[roactModule.Change.AbsoluteSize]
		})
	else
		var3.isStartOfGroup = var2.hasTail
		var3.isIncoming = var2.isIncoming
		var3.isUnfiltered = var2.isUnfiltered
		var3.isPending = var2.isPending
		var3.isRepliedTo = var2.isRepliedTo
		
		return if shareLink then renderAssetCardViewRow(var2, roactModule.createElement(var4, cryoModule.Dictionary.join(var3, { groupShape = var8, mediaRef = var2.bubbleRef }))) else roactModule.createElement(chatBubbleContainerModule, {
			hasTail = var2.hasTail,
			isIncoming = var2.isIncoming,
			isPending = isPending,
			isUnfiltered = nil,
			isAssetCard = true,
			LayoutOrder = var2.LayoutOrder,
			padding = 0,
			isLastMessageInMessageGroup = var2.isLastMessageInMessageGroup or t.isLastMessageInMessageGroup,
			bubbleRef = var2.bubbleRef,
			[roactModule.Change.AbsoluteSize] = var2[roactModule.Change.AbsoluteSize]
		}, {
			AssetCard = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if fFlagAppChatIntrinsicAssetCardHeightModule then UDim2.fromOffset(var5 or 256, 0) else UDim2.fromOffset(var5 or 256, var6 or 208),
				AutomaticSize = Enum.AutomaticSize.XY
			}, { Card = roactModule.createElement(var4, var3) })
		})
	end
end