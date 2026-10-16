local CorePackages = game:GetService("CorePackages")
local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local ReducerDependencies = require(CorePackages.Workspace.Packages.NotificationsCommon).ReducerDependencies
local PlaceInfosReducerFunction = require(CorePackages.Workspace.Packages.PlaceInfoRodux).Reducers.PlaceInfosReducer
local UserReducerFunction = require(CorePackages.Workspace.Packages.UserLib).Reducers.UserReducer
local FriendsFunction = require(CorePackages.Workspace.Packages.LegacyFriendsRodux).Reducers.Friends
local FriendCountFunction = require(CorePackages.Workspace.Packages.LegacyFriendsRodux).Reducers.FriendCount
local FFlagRemoveUnusedFriendCountRoduxSlice = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice
local ConversationsSearchModule = require(ShareGame.Reducers.ConversationsSearch)
local DeviceInfoModule = require(ShareGame.Reducers.DeviceInfo)
local InvitesModule = require(ShareGame.Reducers.Invites)
local GameInfoModule = require(ShareGame.Reducers.GameInfo)
local PageModule = require(ShareGame.Reducers.Page)
local ToastsModule = require(ShareGame.Reducers.Toasts)
local InstallReducerResult = ReducerDependencies.RoduxNetworking.installReducer()
local InstallReducerResult1 = ReducerDependencies.ShareLinksRodux.installReducer()

return function(p1, p2) --[[ Line: 27 ]]
	-- upvalues: ConversationsSearchModule (copy), DeviceInfoModule (copy), InvitesModule (copy), PageModule (copy), PlaceInfosReducerFunction (copy), ToastsModule (copy), UserReducerFunction (copy), FriendsFunction (copy), FFlagRemoveUnusedFriendCountRoduxSlice (copy), FriendCountFunction (copy), InstallReducerResult1 (copy), GameInfoModule (copy), InstallReducerResult (copy)
	local P0 = p1 or {}
	
	return {
		ConversationsSearch = ConversationsSearchModule(P0.ConversationsSearch, p2),
		DeviceInfo = DeviceInfoModule(P0.DeviceInfo, p2),
		Invites = InvitesModule(P0.Invites, p2),
		Page = PageModule(P0.Page, p2),
		PlaceInfos = PlaceInfosReducerFunction(P0.PlaceInfos, p2),
		Toasts = ToastsModule(P0.Toasts, p2),
		Users = UserReducerFunction(P0.Users, p2),
		Friends = FriendsFunction(P0.Friends, p2),
		FriendCount = if FFlagRemoveUnusedFriendCountRoduxSlice then nil else FriendCountFunction(P0.FriendCount, p2),
		ShareLinks = InstallReducerResult1(P0.ShareLinks, p2),
		GameInfo = GameInfoModule(P0.GameInfo, p2),
		NetworkStatus = InstallReducerResult(P0.NetworkStatus, p2)
	}
end