local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local eventIngestService = game:GetService("EventIngestService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local socialContextToastContainer = require(corePackagesService.Workspace.Packages.SocialContextToasts).SocialContextToastContainer
local getFFlagSocialContextToastEventStream = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagSocialContextToastEventStream
local fFlagEnablePartyNudgeAfterJoin = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeAfterJoin
local getFFlagEnableReferredPlayerJoinRemoteEvent = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent
local getFIntReferredPlayerJoinRemoteEventTimeout = require(corePackagesService.Workspace.Packages.SharedFlags).GetFIntReferredPlayerJoinRemoteEventTimeout
local httpRequestModule = require(corePackagesService.Packages.HttpRequest)
local var6 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 19 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	maxRetryCount = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SocialContextToastHttpRetryCount", 4) else nil
})
local apolloClientModule = require(coreGuiService.RobloxGui.Modules.ApolloClient)
local analytics = require(corePackagesService.Workspace.Packages.Analytics).Analytics
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local var8 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then robloxReplicatedStorageService:WaitForChild("ReferredPlayerJoin", getFIntReferredPlayerJoinRemoteEventTimeout()) else nil
local showFriendJoinedPlayerToast = nil
local showPlayerJoinedFriendsToast = nil
local friendPlayerJoinedRemoteEventTimeout = game:DefineFastInt("FriendPlayerJoinedRemoteEventTimeout", 5)

if fFlagEnablePartyNudgeAfterJoin then
	showFriendJoinedPlayerToast = robloxReplicatedStorageService:WaitForChild("ShowFriendJoinedPlayerToast", friendPlayerJoinedRemoteEventTimeout)
	showPlayerJoinedFriendsToast = robloxReplicatedStorageService:WaitForChild("ShowPlayerJoinedFriendsToast", friendPlayerJoinedRemoteEventTimeout)
end
socialContextToastContainer({
	networking = var6,
	playersService = playersService,
	apolloClient = apolloClientModule,
	analytics = analytics.new(),
	ixpService = IXPServiceWrapper,
	eventIngest = eventIngest.new(eventIngestService),
	referredPlayerJoinRemoteEvent = var8,
	showFriendJoinedPlayerToastRemoteEvent = showFriendJoinedPlayerToast,
	showPlayerJoinedFriendsToastRemoteEvent = showPlayerJoinedFriendsToast
}, if getFFlagSocialContextToastEventStream() then tostring(game.GameId) else game.GameId, if getFFlagSocialContextToastEventStream() then tostring(game.PlaceId) else game.PlaceId)