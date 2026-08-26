local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local _ = require(parent.MomentsTypes)
local roactUtilsModule = require(parent.RoactUtils)
local useSignalState = require(parent.SignalsReact).useSignalState
local gameCardContainerModule = require(script.Parent.GameCardComponents.GameCardContainer)
local momentShareCardContainerModule = require(script.Parent.MomentShareCard.MomentShareCardContainer)
local shareLinkClassificationModule = require(appChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local name = require(appChat.Logger):new(script.Name)
local useEffect = reactModule.useEffect
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local getShareLinkStoreModule = require(appChat.Stores.GetShareLinkStore)
local getShareLinkV2StoreModule = require(appChat.Stores.GetShareLinkV2Store)
local fFlagAppChatResolveShareLinkV2Module = require(appChat.Flags.FFlagAppChatResolveShareLinkV2)
local fFlagAppChatMomentShareCardModule = require(appChat.Flags.FFlagAppChatMomentShareCard)

local function ShareLinkV1Container(p1)
	-- upvalues: getShareLinkStoreModule (ref), useSignalState (ref), useDispatch (ref), useEffect (ref), name (ref), reactModule (ref), gameCardContainerModule (ref)
	local linkId = p1.shareLink.linkId
	local linkType = p1.shareLink.linkType
	local var1 = getShareLinkStoreModule(false)
	local var2 = useSignalState(var1.getShareLinkMetadataComputed(linkId))
	local var3 = useDispatch()
	useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), var3 (ref), linkId (ref), linkType (ref), name (copy)
		if var2 then
			name:warning("ShareLinkContainer: Missing linkId or linkType in props.")
			
			return
		end
		var1.fetchShareLinkMetadata(var3, linkId, linkType)
	end, { linkId, linkType, var2 })
	
	return reactModule.createElement(gameCardContainerModule, {
		universeId = if var2 then var2.universeId else nil,
		placeId = if var2 then var2.placeId else nil,
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
		isRepliedTo = p1.isRepliedTo
	})
end

local function ShareLinkV2Container(p1)
	-- upvalues: getShareLinkV2StoreModule (ref), reactModule (ref), useSignalState (ref), fFlagAppChatMomentShareCardModule (ref), shareLinkClassificationModule (ref), momentShareCardContainerModule (ref)
	local linkId = p1.shareLink.linkId
	local var1 = getShareLinkV2StoreModule(false)
	local var2 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (ref), linkId (ref)
		return var1.getAndFetchClassification(linkId)
	end, { var1, linkId }).data)
	
	return if fFlagAppChatMomentShareCardModule and var2 and var2.type == shareLinkClassificationModule.Moment then reactModule.createElement(momentShareCardContainerModule, {
		momentId = var2.momentId,
		targetIdType = var2.targetIdType,
		openMomentsDeepLink = p1.openMomentsDeepLink,
		isStartOfGroup = p1.isStartOfGroup,
		isIncoming = p1.isIncoming,
		LayoutOrder = p1.LayoutOrder
	}) else nil
end

return function(p1)
	-- upvalues: fFlagAppChatResolveShareLinkV2Module (ref), reactModule (ref), ShareLinkV2Container (ref), ShareLinkV1Container (ref)
	return if fFlagAppChatResolveShareLinkV2Module and p1.shareLink.version == 2 then reactModule.createElement(ShareLinkV2Container, p1) else reactModule.createElement(ShareLinkV1Container, p1)
end