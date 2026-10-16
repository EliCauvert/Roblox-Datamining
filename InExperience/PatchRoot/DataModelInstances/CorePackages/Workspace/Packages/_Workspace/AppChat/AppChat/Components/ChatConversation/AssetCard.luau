local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ChatBubbleContainerModule = require(script.Parent.Bubble.ChatBubbleContainer)
local ConstantsModule = require(AppChat.Constants)
local FoundationModule = require(Parent.Foundation)
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Text = require(Parent.AppCommonLib).Text
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local PlaceIdContainerModule = require(AppChat.Components.ChatConversation.ShareLinkComponents.GameCardComponents.PlaceIdContainer)
local GameCardContainerModule = require(AppChat.Components.ChatConversation.ShareLinkComponents.GameCardComponents.GameCardContainer)
local ShareLinkContainerModule = require(AppChat.Components.ChatConversation.ShareLinkComponents.ShareLinkContainer)
local ShareLinkV2PresentationModule = require(AppChat.Components.ChatConversation.ShareLinkComponents.ShareLinkV2Presentation)
local UseShareLinkV2PresentationModule = require(AppChat.Components.ChatConversation.ShareLinkComponents.useShareLinkV2Presentation)
local PlainTextModule = require(script.Parent.PlainText)
local ChatMessageContainerConstantsModule = require(script.Parent.ChatMessageContainerConstants)
local SignalsReactModule = require(Parent.SignalsReact)
local ChatBubbleEnumModule = require(script.Parent.Bubble.ChatBubbleEnum)
local RepliedToMarkerModule = require(script.Parent.Bubble.RepliedToMarker)
local ToMessageGroupShapeModule = require(script.Parent.Grouping.toMessageGroupShape)
local IsAssetCardClassificationModule = require(AppChat.Components.ChatConversation.ShareLinkComponents.isAssetCardClassification)
local GetShareLinkV2StoreModule = require(AppChat.Stores.GetShareLinkV2Store)
local FFlagAppChatShareLinkV2FallbacksModule = require(AppChat.Flags.FFlagAppChatShareLinkV2Fallbacks)
local FFlagAppChatFullPlaintextBeforeGameCardsModule = require(AppChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
local FFlagAppChatIntrinsicAssetCardHeightModule = require(AppChat.Flags.FFlagAppChatIntrinsicAssetCardHeight)
local FFlagAppChatResolveShareLinkV2Module = require(AppChat.Flags.FFlagAppChatResolveShareLinkV2)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local FFlagAppChatMomentAssetCardModule = require(AppChat.Flags.FFlagAppChatMomentAssetCard)
local FFlagAppChatGameAssetCardModule = require(AppChat.Flags.FFlagAppChatGameAssetCard)
local BUBBLEPADDING = ChatMessageContainerConstantsModule.BUBBLE_PADDING
local TEXTBUBBLEXPADDING = ChatMessageContainerConstantsModule.TEXT_BUBBLE_X_PADDING
local TEXTBUBBLEXWIDEADDITIONALPADDING = ChatMessageContainerConstantsModule.TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING
local config = {
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
		onDetailsOpened = function() --[[ Line: 56 ]] end,
		openGameDetailsPage = function() --[[ Line: 57 ]] end
	}
}
local Signal = require(Parent.Signals).createSignal(nil)

local function useRendersAssetCardView(ShareLink) --[[ Line: 73 ]]
	-- upvalues: FFlagAppChatResolveShareLinkV2Module (copy), GetShareLinkV2StoreModule (copy), ReactModule (copy), SignalsReactModule (copy), Signal (copy), FFlagAppChatGameAssetCardModule (copy), IsAssetCardClassificationModule (copy)
	local LinkId = if FFlagAppChatResolveShareLinkV2Module and ShareLink and ShareLink.version == 2 then ShareLink.linkId else nil
	local ShareLinkV2StoreModule = GetShareLinkV2StoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 80 ]]
		-- upvalues: LinkId (copy), ShareLinkV2StoreModule (copy)
		return if LinkId then ShareLinkV2StoreModule.getAndFetchClassification(LinkId) else nil
	end, { ShareLinkV2StoreModule, LinkId or "" })
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.data else Signal)
	
	return if LinkId == nil then FFlagAppChatGameAssetCardModule else IsAssetCardClassificationModule(UseSignalStateResult)
end

local function renderAssetCardViewRow(Frame, Card) --[[ Line: 93 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), ChatBubbleEnumModule (copy), RepliedToMarkerModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy",
		testId = "AssetCardRow",
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if Frame.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, ChatBubbleEnumModule.REPLIED_TO_MARKER_GAP)
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		Card = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 1 }, { Card = Card }),
		RepliedToMarker = if Frame.isRepliedTo then ReactModule.createElement(RepliedToMarkerModule, {
			isIncoming = Frame.isIncoming,
			layoutOrder = if Frame.isIncoming then 0 else 2
		}) else nil
	})
end

return function(p1) --[[ Line: 121 | Named "AssetCardTemp" ]]
	-- upvalues: CryoModule (copy), config (copy), ShareLinkContainerModule (copy), PlaceIdContainerModule (copy), GameCardContainerModule (copy), UseScaledValueFunction (copy), ConstantsModule (copy), FFlagAppChatShareLinkV2FallbacksModule (copy), UseShareLinkV2PresentationModule (copy), FFlagAppChatPlusReferralAssetCardModule (copy), FFlagAppChatMomentAssetCardModule (copy), FFlagAppChatGameAssetCardModule (copy), useRendersAssetCardView (copy), ReactModule (copy), ToMessageGroupShapeModule (copy), ShareLinkV2PresentationModule (copy), FFlagAppChatFullPlaintextBeforeGameCardsModule (copy), TEXTBUBBLEXPADDING (copy), BUBBLEPADDING (copy), TEXTBUBBLEXWIDEADDITIONALPADDING (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), RoactModule (copy), PlainTextModule (copy), renderAssetCardViewRow (copy), ChatBubbleContainerModule (copy), FFlagAppChatIntrinsicAssetCardHeightModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UnionResult1 = CryoModule.Dictionary.union(config.additionalProps, UnionResult.additionalProps)
	local ShareLinkContainerModule1 = if UnionResult1.shareLink then ShareLinkContainerModule else UnionResult1.placeId and PlaceIdContainerModule or GameCardContainerModule
	local IsPending = UnionResult.isPending
	local UseScaledValueResult = UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_WIDTH)
	local UseScaledValueResult1 = UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_HEIGHT + ConstantsModule.GameCard.FOOTER_HEIGHT)
	local Fallback = nil
	
	if FFlagAppChatShareLinkV2FallbacksModule then
		local ShareLink = UnionResult1.shareLink
		Fallback = UseShareLinkV2PresentationModule(if ShareLink and ShareLink.version == 2 then ShareLink.linkId else nil)
	end
	local v1 = false
	local UseMemoResult = nil
	
	if FFlagAppChatPlusReferralAssetCardModule or FFlagAppChatMomentAssetCardModule or FFlagAppChatGameAssetCardModule then
		v1 = useRendersAssetCardView(UnionResult1.shareLink)
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 147 ]]
			-- upvalues: ToMessageGroupShapeModule (upval), UnionResult (copy)
			return ToMessageGroupShapeModule(UnionResult.hasTail, UnionResult.isLastMessageInMessageGroup, UnionResult.isRepliedTo, UnionResult.isIncoming)
		end, {
			UnionResult.hasTail,
			UnionResult.isLastMessageInMessageGroup,
			UnionResult.isRepliedTo,
			UnionResult.isIncoming
		})
	end
	if Fallback == ShareLinkV2PresentationModule.Fallback then
		local Url = UnionResult1.shareLink.url
		
		if FFlagAppChatFullPlaintextBeforeGameCardsModule or Url == nil then
			return nil
		else
			local ParentWidthDelta = UnionResult.parentWidth - (TEXTBUBBLEXPADDING + BUBBLEPADDING) * 2 - (if UnionResult.wideMode then TEXTBUBBLEXWIDEADDITIONALPADDING else 0)
			
			return RoactModule.createElement(PlainTextModule, {
				text = Url,
				font = UnionResult.font,
				textSize = UnionResult.textSize,
				innerPadding = UnionResult.innerPadding,
				maxWidth = (if FoundationFontFaceMigration then GetTextSizeFunction(Url, UnionResult.textSize, UnionResult.font, Vector2.new(ParentWidthDelta, 10000)) else Text.GetTextBounds(Url, UnionResult.font, UnionResult.textSize, Vector2.new(ParentWidthDelta, 10000))).X + BUBBLEPADDING * 2,
				hasTail = UnionResult.hasTail,
				isIncoming = UnionResult.isIncoming,
				isPending = UnionResult.isPending,
				isUnfiltered = UnionResult.isUnfiltered,
				isRepliedTo = UnionResult.isRepliedTo,
				isPressed = UnionResult.isPressed,
				isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup,
				bubbleRef = UnionResult.bubbleRef,
				LayoutOrder = UnionResult.LayoutOrder,
				[RoactModule.Change.AbsoluteSize] = UnionResult[RoactModule.Change.AbsoluteSize]
			})
		end
	else
		UnionResult1.isStartOfGroup = UnionResult.hasTail
		UnionResult1.isIncoming = UnionResult.isIncoming
		UnionResult1.isUnfiltered = UnionResult.isUnfiltered
		UnionResult1.isPending = UnionResult.isPending
		UnionResult1.isRepliedTo = UnionResult.isRepliedTo
		
		return if v1 then renderAssetCardViewRow(UnionResult, RoactModule.createElement(ShareLinkContainerModule1, CryoModule.Dictionary.join(UnionResult1, {
			groupShape = UseMemoResult,
			mediaRef = UnionResult.bubbleRef
		}))) else RoactModule.createElement(ChatBubbleContainerModule, {
			hasTail = UnionResult.hasTail,
			isIncoming = UnionResult.isIncoming,
			isPending = IsPending,
			isUnfiltered = nil,
			isAssetCard = true,
			LayoutOrder = UnionResult.LayoutOrder,
			padding = 0,
			isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup or config.isLastMessageInMessageGroup,
			bubbleRef = UnionResult.bubbleRef,
			[RoactModule.Change.AbsoluteSize] = UnionResult[RoactModule.Change.AbsoluteSize]
		}, {
			AssetCard = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if FFlagAppChatIntrinsicAssetCardHeightModule then UDim2.fromOffset(UseScaledValueResult or 256, 0) else UDim2.fromOffset(UseScaledValueResult or 256, UseScaledValueResult1 or 208),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Card = RoactModule.createElement(ShareLinkContainerModule1, UnionResult1)
			})
		})
	end
end