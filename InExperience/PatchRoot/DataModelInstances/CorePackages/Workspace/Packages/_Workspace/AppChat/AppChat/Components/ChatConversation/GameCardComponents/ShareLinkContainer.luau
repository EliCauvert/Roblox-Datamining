local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useSignalState = require(parent.SignalsReact).useSignalState
local gameCardContainerModule = require(script.Parent.GameCardContainer)
local name = require(appChat.Logger):new(script.Name)
local useEffect = reactModule.useEffect
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local getShareLinkStoreModule = require(appChat.Stores.GetShareLinkStore)

return function(p0) --[[ line: 37 | named "ShareLinkContainer" ]]
	-- upvalues: getShareLinkStoreModule (ref), useSignalState (ref), useDispatch (ref), useEffect (ref), name (ref), reactModule (ref), gameCardContainerModule (ref)
	local linkId = p0.shareLink.linkId
	local linkType = p0.shareLink.linkType
	local var6 = getShareLinkStoreModule(false)
	local var7 = useSignalState(var6.getShareLinkMetadataComputed(linkId))
	local var8 = useDispatch()
	useEffect(function() --[[ line: 44 ]]
		-- upvalues: var7 (ref), var6 (ref), var8 (ref), linkId (ref), linkType (ref), name (copy)
		if var7 then
			name:warning("ShareLinkContainer: Missing linkId or linkType in props.")
			
			return
		end
		var6.fetchShareLinkMetadata(var8, linkId, linkType)
	end, { linkId, linkType, var7 })
	
	return reactModule.createElement(gameCardContainerModule, {
		universeId = if var7 then var7.universeId else nil,
		placeId = if var7 then var7.placeId else nil,
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