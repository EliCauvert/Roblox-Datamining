local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local friendsMenuModule = require(parent_2.FriendsMenu)
local reactModule = require(parent_2.React)
local getFFlagEnableCommonFriendsMenu = require(parent_2.SharedFlags).GetFFlagEnableCommonFriendsMenu
local friendsListContextProvider = friendsMenuModule.FriendsListContextProvider
local inviteFriendProviderModule = require(parent.InviteFriendProvider)
local gameDetailsContextProviderModule = require(parent.GameDetailsContextProvider)
local _ = require(parent_1.gameInviteModalType)

return function(p0)
	-- upvalues: reactModule (ref), gameDetailsContextProviderModule (ref), getFFlagEnableCommonFriendsMenu (ref), inviteFriendProviderModule (ref), friendsListContextProvider (ref)
	local trigger = nil
	local inviteMessageId = nil
	local launchData = nil
	local promptMessage = nil
	local isCoreScript = nil
	local rootPlaceId = nil
	local universeId = nil
	
	if p0.options then
		trigger = p0.options.trigger
		inviteMessageId = p0.options.inviteMessageId
		launchData = p0.options.launchData
		promptMessage = p0.options.promptMessage
		isCoreScript = p0.isCoreScript or false
		rootPlaceId = p0.options.rootPlaceId
		universeId = p0.options.universeId
	end
	return reactModule.createElement(gameDetailsContextProviderModule, {
		gameDetails = p0.gameDetails,
		serverType = p0.serverType,
		promptMessage = promptMessage,
		trigger = trigger,
		isCoreScript = isCoreScript
	}, {
		if getFFlagEnableCommonFriendsMenu() then reactModule.createElement(inviteFriendProviderModule, {
			trigger = trigger,
			inviteMessageId = inviteMessageId,
			launchData = launchData,
			promptMessage = promptMessage,
			isCoreScript = isCoreScript,
			rootPlaceId = rootPlaceId,
			universeId = universeId
		}, p0.children) else reactModule.createElement(friendsListContextProvider, { isLoadingCustomParams = p0.isLoadingCustomParams }, reactModule.createElement(inviteFriendProviderModule, {
			trigger = trigger,
			inviteMessageId = inviteMessageId,
			launchData = launchData,
			promptMessage = promptMessage,
			isCoreScript = isCoreScript,
			rootPlaceId = rootPlaceId,
			universeId = universeId
		}, p0.children))
	})
end