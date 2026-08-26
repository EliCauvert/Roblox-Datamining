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

return function(p1)
	-- upvalues: reactModule (ref), gameDetailsContextProviderModule (ref), getFFlagEnableCommonFriendsMenu (ref), inviteFriendProviderModule (ref), friendsListContextProvider (ref)
	local trigger = nil
	local inviteMessageId = nil
	local launchData = nil
	local promptMessage = nil
	local isCoreScript = nil
	local rootPlaceId = nil
	local universeId = nil
	
	if p1.options then
		trigger = p1.options.trigger
		inviteMessageId = p1.options.inviteMessageId
		launchData = p1.options.launchData
		promptMessage = p1.options.promptMessage
		isCoreScript = p1.isCoreScript or false
		rootPlaceId = p1.options.rootPlaceId
		universeId = p1.options.universeId
	end
	return reactModule.createElement(gameDetailsContextProviderModule, {
		gameDetails = p1.gameDetails,
		serverType = p1.serverType,
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
		}, p1.children) else reactModule.createElement(friendsListContextProvider, { isLoadingCustomParams = p1.isLoadingCustomParams }, reactModule.createElement(inviteFriendProviderModule, {
			trigger = trigger,
			inviteMessageId = inviteMessageId,
			launchData = launchData,
			promptMessage = promptMessage,
			isCoreScript = isCoreScript,
			rootPlaceId = rootPlaceId,
			universeId = universeId
		}, p1.children))
	})
end