local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local reducerDependencies = require(corePackagesService.Workspace.Packages.NotificationsCommon).ReducerDependencies
local placeInfosReducer = require(corePackagesService.Workspace.Packages.PlaceInfoRodux).Reducers.PlaceInfosReducer
local userReducer = require(corePackagesService.Workspace.Packages.UserLib).Reducers.UserReducer
local friends = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Reducers.Friends
local friendCount = require(corePackagesService.Workspace.Packages.LegacyFriendsRodux).Reducers.FriendCount
local conversationsSearchModule = require(shareGame.Reducers.ConversationsSearch)
local deviceInfoModule = require(shareGame.Reducers.DeviceInfo)
local invitesModule = require(shareGame.Reducers.Invites)
local gameInfoModule = require(shareGame.Reducers.GameInfo)
local pageModule = require(shareGame.Reducers.Page)
local toastsModule = require(shareGame.Reducers.Toasts)
local var7 = reducerDependencies.RoduxNetworking.installReducer()
local var8 = reducerDependencies.ShareLinksRodux.installReducer()

return function(p0, p1) --[[ line: 25 ]]
	-- upvalues: conversationsSearchModule (ref), deviceInfoModule (ref), invitesModule (ref), pageModule (ref), placeInfosReducer (ref), toastsModule (ref), userReducer (ref), friends (ref), friendCount (ref), var8 (ref), gameInfoModule (ref), var7 (ref)
	p0 = p0 or {}
	
	return {
		ConversationsSearch = conversationsSearchModule(p0.ConversationsSearch, p1),
		DeviceInfo = deviceInfoModule(p0.DeviceInfo, p1),
		Invites = invitesModule(p0.Invites, p1),
		Page = pageModule(p0.Page, p1),
		PlaceInfos = placeInfosReducer(p0.PlaceInfos, p1),
		Toasts = toastsModule(p0.Toasts, p1),
		Users = userReducer(p0.Users, p1),
		Friends = friends(p0.Friends, p1),
		FriendCount = friendCount(p0.FriendCount, p1),
		ShareLinks = var8(p0.ShareLinks, p1),
		GameInfo = gameInfoModule(p0.GameInfo, p1),
		NetworkStatus = var7(p0.NetworkStatus, p1)
	}
end