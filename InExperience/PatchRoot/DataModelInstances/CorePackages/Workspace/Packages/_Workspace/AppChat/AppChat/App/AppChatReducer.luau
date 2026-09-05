local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local gameDetailRoduxModule = require(parent.GameDetailRodux)
local httpModule = require(parent.Http)
local playabilityRoduxModule = require(parent.PlayabilityRodux)
local roduxModule = require(parent.Rodux)
local constantsModule = require(parent.SquadsCore.Constants)
local installReducerModule = require(parent.SquadsCore.installReducer)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagRemoveUnusedFriendCountRoduxSlice = require(parent.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice
local formFactorReducer = require(parent.FormFactor).FormFactorReducer
local userLibModule = require(parent.UserLib)
local socialBlockingModalModule = require(parent.SocialBlockingModal)

return roduxModule.combineReducers({
	PlayerContextualMenu = require(parent.PlayerContextualMenu).installReducer(),
	EventReceievers = roduxModule.combineReducers({
		NetworkStatus = require(appChat.Http.RoduxNetworking).installReducer()
	}),
	ChatAppReducer = require(appChat.installReducer)(),
	FetchingStatus = httpModule.Reducers.FetchingStatus,
	GameDetails = gameDetailRoduxModule.GameDetails.GameDetailReducer,
	LocalUserId = userLibModule.Reducers.LocalUserIdReducer,
	FriendCount = if fFlagRemoveUnusedFriendCountRoduxSlice then nil else require(parent.LegacyFriendsRodux).Reducers.FriendCount,
	PlayabilityStatus = playabilityRoduxModule.PlayabilityStatus.PlayabilityStatusReducer,
	ScreenSize = if require(parent.SocialExperiments).PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then require(appChat.installReducer.ScreenSize) else nil,
	FormFactor = formFactorReducer,
	Users = userLibModule.Reducers.UserReducer,
	[constantsModule.RODUX_KEY] = if getFFlagIsSquadEnabled() then installReducerModule(require(parent.SquadsCore.Enums).SquadLocation.InExperience) else nil,
	[socialBlockingModalModule.RoduxKey] = socialBlockingModalModule.installReducer()
})