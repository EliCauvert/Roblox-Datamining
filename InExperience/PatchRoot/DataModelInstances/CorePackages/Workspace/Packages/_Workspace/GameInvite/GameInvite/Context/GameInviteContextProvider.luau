local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local GetFFlagEnableCommonFriendsMenuFunction = require(Parent2.SharedFlags).GetFFlagEnableCommonFriendsMenu
local FriendsListContextProvider = require(Parent2.FriendsMenu).FriendsListContextProvider
local InviteFriendProviderModule = require(Parent.InviteFriendProvider)
local GameDetailsContextProviderModule = require(Parent.GameDetailsContextProvider)
local _ = require(Parent1.gameInviteModalType)

return function(p1)
	-- upvalues: ReactModule (copy), GameDetailsContextProviderModule (copy), GetFFlagEnableCommonFriendsMenuFunction (copy), InviteFriendProviderModule (copy), FriendsListContextProvider (copy)
	local Trigger = nil
	local InviteMessageId = nil
	local LaunchData = nil
	local PromptMessage = nil
	local IsCoreScript = nil
	local RootPlaceId = nil
	local UniverseId = nil
	
	if p1.options then
		Trigger = p1.options.trigger
		InviteMessageId = p1.options.inviteMessageId
		LaunchData = p1.options.launchData
		PromptMessage = p1.options.promptMessage
		IsCoreScript = p1.isCoreScript or false
		RootPlaceId = p1.options.rootPlaceId
		UniverseId = p1.options.universeId
	end
	return ReactModule.createElement(GameDetailsContextProviderModule, {
		gameDetails = p1.gameDetails,
		serverType = p1.serverType,
		promptMessage = PromptMessage,
		trigger = Trigger,
		isCoreScript = IsCoreScript
	}, {
		if GetFFlagEnableCommonFriendsMenuFunction() then ReactModule.createElement(InviteFriendProviderModule, {
			trigger = Trigger,
			inviteMessageId = InviteMessageId,
			launchData = LaunchData,
			promptMessage = PromptMessage,
			isCoreScript = IsCoreScript,
			rootPlaceId = RootPlaceId,
			universeId = UniverseId
		}, p1.children) else ReactModule.createElement(FriendsListContextProvider, { isLoadingCustomParams = p1.isLoadingCustomParams }, ReactModule.createElement(InviteFriendProviderModule, {
			trigger = Trigger,
			inviteMessageId = InviteMessageId,
			launchData = LaunchData,
			promptMessage = PromptMessage,
			isCoreScript = IsCoreScript,
			rootPlaceId = RootPlaceId,
			universeId = UniverseId
		}, p1.children))
	})
end