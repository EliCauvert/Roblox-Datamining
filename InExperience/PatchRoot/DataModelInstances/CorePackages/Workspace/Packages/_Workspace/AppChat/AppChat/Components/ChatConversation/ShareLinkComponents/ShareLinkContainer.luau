local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.MomentsTypes)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GameCardContainerModule = require(script.Parent.GameCardComponents.GameCardContainer)
local GameCardGroupableModule = require(script.Parent.GameCardComponents.GameCardGroupable)
local MomentShareCardContainerModule = require(script.Parent.MomentShareCard.MomentShareCardContainer)
local MomentAssetCardModule = require(script.Parent.MomentShareCard.MomentAssetCard)
local PlusReferralAssetCardModule = require(script.Parent.PlusReferralAssetCard.PlusReferralAssetCard)
local IsAssetCardClassificationModule = require(script.Parent.isAssetCardClassification)
local MessageGroupShapeModule = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local ShareLinkClassificationModule = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local ConstantsModule = require(AppChat.Constants)
local ShareLinkV2PresentationModule = require(script.Parent.ShareLinkV2Presentation)
local GetShareLinkV2PresentationModule = require(script.Parent.getShareLinkV2Presentation)
local NewResult = require(AppChat.Logger):new(script.Name)
local UseEffectFunction = ReactModule.useEffect
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local GetShareLinkStoreModule = require(AppChat.Stores.GetShareLinkStore)
local GetShareLinkV2StoreModule = require(AppChat.Stores.GetShareLinkV2Store)
local FFlagAppChatResolveShareLinkV2Module = require(AppChat.Flags.FFlagAppChatResolveShareLinkV2)
local FFlagAppChatMomentShareCardModule = require(AppChat.Flags.FFlagAppChatMomentShareCard)
local FFlagAppChatIntrinsicAssetCardHeightModule = require(AppChat.Flags.FFlagAppChatIntrinsicAssetCardHeight)
local FFlagAppChatShareLinkV2FallbacksModule = require(AppChat.Flags.FFlagAppChatShareLinkV2Fallbacks)
local Frozen = table.freeze({
	direction = MessageGroupShapeModule.Direction.Incoming,
	position = MessageGroupShapeModule.Position.Only
})

local function ShareLinkV1Container(p1)
	-- upvalues: GetShareLinkStoreModule (copy), UseSignalStateFunction (copy), UseDispatchFunction (copy), UseEffectFunction (copy), NewResult (copy), ReactModule (copy), GameCardContainerModule (copy)
	local LinkId = p1.shareLink.linkId
	local LinkType = p1.shareLink.linkType
	local ShareLinkStoreModule = GetShareLinkStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(ShareLinkStoreModule.getShareLinkMetadataComputed(LinkId))
	local UseDispatchResult = UseDispatchFunction()
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult (copy), ShareLinkStoreModule (copy), UseDispatchResult (copy), LinkId (copy), LinkType (copy), NewResult (upval)
		if UseSignalStateResult then
			NewResult:warning("ShareLinkContainer: Missing linkId or linkType in props.")
			
			return
		else
			ShareLinkStoreModule.fetchShareLinkMetadata(UseDispatchResult, LinkId, LinkType)
		end
	end, { LinkId, LinkType, UseSignalStateResult })
	
	return ReactModule.createElement(GameCardContainerModule, {
		universeId = if UseSignalStateResult then UseSignalStateResult.universeId else nil,
		placeId = if UseSignalStateResult then UseSignalStateResult.placeId else nil,
		conversationId = p1.conversationId,
		senderUserId = p1.senderUserId,
		onDetailsOpened = p1.onDetailsOpened,
		openGameDetailsPage = p1.openGameDetailsPage,
		networkImpl = p1.networkImpl,
		eventStream = p1.eventStream,
		eventIngest = p1.eventIngest,
		luaChatPlayTogetherEnabled = p1.luaChatPlayTogetherEnabled,
		isStartOfGroup = p1.isStartOfGroup,
		isIncoming = p1.isIncoming,
		isUnfiltered = p1.isUnfiltered,
		isPending = p1.isPending,
		isRepliedTo = p1.isRepliedTo,
		groupShape = p1.groupShape,
		mediaRef = p1.mediaRef
	})
end

local function ShareLinkV2Container(Frame: Frame)
	-- upvalues: GetShareLinkV2StoreModule (copy), ReactModule (copy), UseSignalStateFunction (copy), FFlagAppChatIntrinsicAssetCardHeightModule (copy), FFlagAppChatMomentShareCardModule (copy), UseScaledValueFunction (copy), ConstantsModule (copy), FFlagAppChatShareLinkV2FallbacksModule (copy), IsAssetCardClassificationModule (copy), Frozen (copy), ShareLinkClassificationModule (copy), PlusReferralAssetCardModule (copy), MomentAssetCardModule (copy), MomentShareCardContainerModule (copy), GetShareLinkV2PresentationModule (copy), ShareLinkV2PresentationModule (copy), GameCardGroupableModule (copy), DataHydrationModule (copy), FoundationModule (copy)
	local LinkId = Frame.shareLink.linkId
	local ShareLinkV2StoreModule = GetShareLinkV2StoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ShareLinkV2StoreModule (copy), LinkId (copy)
		return ShareLinkV2StoreModule.getAndFetchClassification(LinkId)
	end, { ShareLinkV2StoreModule, LinkId })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local UseSignalStateResult1 = if FFlagAppChatIntrinsicAssetCardHeightModule and FFlagAppChatMomentShareCardModule then UseSignalStateFunction(UseMemoResult.status) else nil
	local UseScaledValueResult = if FFlagAppChatIntrinsicAssetCardHeightModule and FFlagAppChatMomentShareCardModule then UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_HEIGHT + ConstantsModule.GameCard.FOOTER_HEIGHT) else nil
	local UseSignalStateResult2 = if FFlagAppChatShareLinkV2FallbacksModule then UseSignalStateFunction(UseMemoResult.status) else nil
	
	if IsAssetCardClassificationModule(UseSignalStateResult) then
		local GroupShape = Frame.groupShape or Frozen
		
		if UseSignalStateResult and UseSignalStateResult.type == ShareLinkClassificationModule.PlusReferral then
			return ReactModule.createElement(PlusReferralAssetCardModule, {
				referrerId = UseSignalStateResult.referrerId,
				groupShape = GroupShape,
				mediaRef = Frame.mediaRef
			})
		elseif UseSignalStateResult and UseSignalStateResult.type == ShareLinkClassificationModule.Moment then
			return ReactModule.createElement(MomentAssetCardModule, {
				momentId = UseSignalStateResult.momentId,
				targetIdType = UseSignalStateResult.targetIdType,
				openMomentsDeepLink = Frame.openMomentsDeepLink,
				groupShape = GroupShape,
				mediaRef = Frame.mediaRef
			})
		end
	end
	return if FFlagAppChatMomentShareCardModule and UseSignalStateResult and UseSignalStateResult.type == ShareLinkClassificationModule.Moment then ReactModule.createElement(MomentShareCardContainerModule, {
		momentId = UseSignalStateResult.momentId,
		targetIdType = UseSignalStateResult.targetIdType,
		openMomentsDeepLink = Frame.openMomentsDeepLink,
		isStartOfGroup = Frame.isStartOfGroup,
		isIncoming = Frame.isIncoming,
		LayoutOrder = Frame.LayoutOrder
	}) elseif FFlagAppChatShareLinkV2FallbacksModule and GetShareLinkV2PresentationModule(UseSignalStateResult, UseSignalStateResult2) == ShareLinkV2PresentationModule.Loading then ReactModule.createElement(GameCardGroupableModule, { isLoading = true, gameName = "", gameThumbnail = "" }) elseif FFlagAppChatIntrinsicAssetCardHeightModule and FFlagAppChatMomentShareCardModule and UseSignalStateResult1 == DataHydrationModule.DataStatus.NotReady then ReactModule.createElement(FoundationModule.View, {
		testId = "ShareLinkPendingCard",
		Size = UDim2.fromOffset(0, UseScaledValueResult),
		LayoutOrder = Frame.LayoutOrder
	}) else nil
end

return function(p1)
	-- upvalues: FFlagAppChatResolveShareLinkV2Module (copy), ReactModule (copy), ShareLinkV2Container (copy), ShareLinkV1Container (copy)
	return if FFlagAppChatResolveShareLinkV2Module and p1.shareLink.version == 2 then ReactModule.createElement(ShareLinkV2Container, p1) else ReactModule.createElement(ShareLinkV1Container, p1)
end