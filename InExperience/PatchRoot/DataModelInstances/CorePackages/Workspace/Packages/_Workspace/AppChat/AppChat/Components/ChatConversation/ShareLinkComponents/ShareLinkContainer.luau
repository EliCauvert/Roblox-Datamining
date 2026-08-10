local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
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

local function ShareLinkV1Container(p0) --[[ line: 45 ]]
	-- upvalues: getShareLinkStoreModule (ref), useSignalState (ref), useDispatch (ref), useEffect (ref), name (ref), reactModule (ref), gameCardContainerModule (ref)
	local linkId = p0.shareLink.linkId
	local linkType = p0.shareLink.linkType
	local var13 = getShareLinkStoreModule(false)
	local var14 = useSignalState(var13.getShareLinkMetadataComputed(linkId))
	local var15 = useDispatch()
	useEffect(function() --[[ line: 53 ]]
		-- upvalues: var14 (ref), var13 (ref), var15 (ref), linkId (ref), linkType (ref), name (copy)
		if var14 then
			name:warning("ShareLinkContainer: Missing linkId or linkType in props.")
			
			return
		end
		var13.fetchShareLinkMetadata(var15, linkId, linkType)
	end, { linkId, linkType, var14 })
	
	return reactModule.createElement(gameCardContainerModule, {
		universeId = if var14 then var14.universeId else nil,
		placeId = if var14 then var14.placeId else nil,
		conversationId = p0.conversationId,
		senderUserId = p0.senderUserId,
		onDetailsOpened = p0.onDetailsOpened,
		openGameDetailsPage = p0.openGameDetailsPage,
		networkImpl = p0.networkImpl,
		eventStream = p0.eventStream,
		eventIngest = p0.eventIngest,
		luaChatPlayTogetherEnabled = p0.luaChatPlayTogetherEnabled,
		isStartOfGroup = p0.isStartOfGroup,
		isIncoming = p0.isIncoming,
		isUnfiltered = p0.isUnfiltered,
		isPending = p0.isPending,
		isRepliedTo = p0.isRepliedTo
	})
end

local function ShareLinkV2Container(p1) --[[ line: 80 ]]
	-- upvalues: getShareLinkV2StoreModule (ref), reactModule (ref), useSignalState (ref), fFlagAppChatMomentShareCardModule (ref), shareLinkClassificationModule (ref), momentShareCardContainerModule (ref)
	local linkId = p1.shareLink.linkId
	local var16 = getShareLinkV2StoreModule(false)
	local var17 = useSignalState(reactModule.useMemo(function() --[[ line: 83 ]]
		-- upvalues: var16 (ref), linkId (ref)
		return var16.getAndFetchClassification(linkId)
	end, { var16, linkId }).data)
	
	return if fFlagAppChatMomentShareCardModule and var17 and var17.type == shareLinkClassificationModule.Moment then reactModule.createElement(momentShareCardContainerModule, {
		momentId = var17.momentId,
		targetIdType = var17.targetIdType,
		openMomentsDeepLink = p1.openMomentsDeepLink,
		isStartOfGroup = p1.isStartOfGroup,
		isIncoming = p1.isIncoming,
		LayoutOrder = p1.LayoutOrder
	}) else nil
end

return function(p2) --[[ line: 102 | named "ShareLinkContainer" ]]
	-- upvalues: fFlagAppChatResolveShareLinkV2Module (ref), reactModule (ref), ShareLinkV2Container (ref), ShareLinkV1Container (ref)
	return if fFlagAppChatResolveShareLinkV2Module and p2.shareLink.version == 2 then reactModule.createElement(ShareLinkV2Container, p2) else reactModule.createElement(ShareLinkV1Container, p2)
end