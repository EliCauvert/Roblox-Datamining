local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useSignalState = require(parent.SignalsReact).useSignalState
local gameCardContainerModule = require(script.Parent.GameCardComponents.GameCardContainer)
local name = require(appChat.Logger):new(script.Name)
local useEffect = reactModule.useEffect
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local getShareLinkStoreModule = require(appChat.Stores.GetShareLinkStore)
local getShareLinkV2StoreModule = require(appChat.Stores.GetShareLinkV2Store)
local fFlagAppChatResolveShareLinkV2Module = require(appChat.Flags.FFlagAppChatResolveShareLinkV2)

local function ShareLinkV1Container(p0) --[[ line: 41 ]]
	-- upvalues: getShareLinkStoreModule (ref), useSignalState (ref), useDispatch (ref), useEffect (ref), name (ref), reactModule (ref), gameCardContainerModule (ref)
	local linkId = p0.shareLink.linkId
	local linkType = p0.shareLink.linkType
	local var10 = getShareLinkStoreModule(false)
	local var11 = useSignalState(var10.getShareLinkMetadataComputed(linkId))
	local var12 = useDispatch()
	useEffect(function() --[[ line: 49 ]]
		-- upvalues: var11 (ref), var10 (ref), var12 (ref), linkId (ref), linkType (ref), name (copy)
		if var11 then
			name:warning("ShareLinkContainer: Missing linkId or linkType in props.")
			
			return
		end
		var10.fetchShareLinkMetadata(var12, linkId, linkType)
	end, { linkId, linkType, var11 })
	
	return reactModule.createElement(gameCardContainerModule, {
		universeId = if var11 then var11.universeId else nil,
		placeId = if var11 then var11.placeId else nil,
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

local function ShareLinkV2Container(p1) --[[ line: 76 ]]
	-- upvalues: getShareLinkV2StoreModule (ref)
	getShareLinkV2StoreModule(false).getAndFetchClassification(p1.shareLink.linkId)
	
	return nil
end

return function(p2) --[[ line: 85 | named "ShareLinkContainer" ]]
	-- upvalues: fFlagAppChatResolveShareLinkV2Module (ref), reactModule (ref), ShareLinkV2Container (ref), ShareLinkV1Container (ref)
	return if fFlagAppChatResolveShareLinkV2Module and p2.shareLink.version == 2 then reactModule.createElement(ShareLinkV2Container, p2) else reactModule.createElement(ShareLinkV1Container, p2)
end