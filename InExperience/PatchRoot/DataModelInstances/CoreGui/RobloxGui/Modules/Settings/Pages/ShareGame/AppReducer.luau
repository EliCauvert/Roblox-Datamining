local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local reducerDependencies = require(corePackagesService.Workspace.Packages.NotificationsCommon).ReducerDependencies
local placeInfosReducer = require(corePackagesService.Workspace.Packages.PlaceInfoRodux).Reducers.PlaceInfosReducer
local userReducer = require(corePackagesService.Workspace.Packages.UserLib).Reducers.UserReducer
local friends = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Reducers.Friends
local friendCount = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Reducers.FriendCount
local fFlagRemoveUnusedFriendCountRoduxSlice = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice
local conversationsSearchModule = require(shareGame.Reducers.ConversationsSearch)
local deviceInfoModule = require(shareGame.Reducers.DeviceInfo)
local invitesModule = require(shareGame.Reducers.Invites)
local gameInfoModule = require(shareGame.Reducers.GameInfo)
local pageModule = require(shareGame.Reducers.Page)
local toastsModule = require(shareGame.Reducers.Toasts)
local var1 = reducerDependencies.RoduxNetworking.installReducer()
local var2 = reducerDependencies.ShareLinksRodux.installReducer()

return function(p1, p2)
	-- upvalues: conversationsSearchModule (ref), deviceInfoModule (ref), invitesModule (ref), pageModule (ref), placeInfosReducer (ref), toastsModule (ref), userReducer (ref), friends (ref), fFlagRemoveUnusedFriendCountRoduxSlice (ref), friendCount (ref), var2 (ref), gameInfoModule (ref), var1 (ref)
	p1 = p1 or {}
	
	return {
		ConversationsSearch = conversationsSearchModule(p1.ConversationsSearch, p2),
		DeviceInfo = deviceInfoModule(p1.DeviceInfo, p2),
		Invites = invitesModule(p1.Invites, p2),
		Page = pageModule(p1.Page, p2),
		PlaceInfos = placeInfosReducer(p1.PlaceInfos, p2),
		Toasts = toastsModule(p1.Toasts, p2),
		Users = userReducer(p1.Users, p2),
		Friends = friends(p1.Friends, p2),
		FriendCount = if fFlagRemoveUnusedFriendCountRoduxSlice then nil else friendCount(p1.FriendCount, p2),
		ShareLinks = var2(p1.ShareLinks, p2),
		GameInfo = gameInfoModule(p1.GameInfo, p2),
		NetworkStatus = var1(p1.NetworkStatus, p2)
	}
end