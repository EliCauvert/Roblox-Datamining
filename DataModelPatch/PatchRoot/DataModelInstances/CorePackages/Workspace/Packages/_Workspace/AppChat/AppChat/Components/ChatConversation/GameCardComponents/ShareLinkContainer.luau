local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GameCardContainerModule = require(script.Parent.GameCardContainer)
local NewResult = require(AppChat.Logger):new(script.Name)
local UseEffectFunction = ReactModule.useEffect
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetShareLinkStoreModule = require(AppChat.Stores.GetShareLinkStore)

return function(p1)
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
		isRepliedTo = p1.isRepliedTo
	})
end