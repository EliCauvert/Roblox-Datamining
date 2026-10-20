local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local EventIngestService = game:GetService("EventIngestService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local SocialContextToastContainerFunction: (any, any, any) -> () = require(CorePackages.Workspace.Packages.SocialContextToasts).SocialContextToastContainer
local GetFFlagSocialContextToastEventStreamFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagSocialContextToastEventStream
local GetFIntReferredPlayerJoinRemoteEventTimeoutFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFIntReferredPlayerJoinRemoteEventTimeout
local HttpRequestModule = require(CorePackages.Packages.HttpRequest)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SocialContextToastHttpRetryCount", 4) else nil
})
local ApolloClientModule = require(game:GetService("CoreGui").RobloxGui.Modules.ApolloClient)
local Analytics = require(CorePackages.Workspace.Packages.Analytics).Analytics
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local ReferredPlayerJoin = if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent() then RobloxReplicatedStorage:WaitForChild("ReferredPlayerJoin", GetFIntReferredPlayerJoinRemoteEventTimeoutFunction()) else nil
local ShowFriendJoinedPlayerToast = nil
local ShowPlayerJoinedFriendsToast = nil
local FriendPlayerJoinedRemoteEventTimeout = game:DefineFastInt("FriendPlayerJoinedRemoteEventTimeout", 5)

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeAfterJoin then
	ShowFriendJoinedPlayerToast = RobloxReplicatedStorage:WaitForChild("ShowFriendJoinedPlayerToast", FriendPlayerJoinedRemoteEventTimeout)
	ShowPlayerJoinedFriendsToast = RobloxReplicatedStorage:WaitForChild("ShowPlayerJoinedFriendsToast", FriendPlayerJoinedRemoteEventTimeout)
end
SocialContextToastContainerFunction({
	networking = ConfigResult,
	playersService = Players,
	apolloClient = ApolloClientModule,
	analytics = Analytics.new(),
	ixpService = IXPServiceWrapper,
	eventIngest = EventIngest.new(EventIngestService),
	referredPlayerJoinRemoteEvent = ReferredPlayerJoin,
	showFriendJoinedPlayerToastRemoteEvent = ShowFriendJoinedPlayerToast,
	showPlayerJoinedFriendsToastRemoteEvent = ShowPlayerJoinedFriendsToast
}, if GetFFlagSocialContextToastEventStreamFunction() then tostring(game.GameId) else game.GameId, if GetFFlagSocialContextToastEventStreamFunction() then tostring(game.PlaceId) else game.PlaceId)