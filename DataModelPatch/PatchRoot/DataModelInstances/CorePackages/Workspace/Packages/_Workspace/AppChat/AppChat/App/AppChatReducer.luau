local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoduxModule = require(Parent.Rodux)
local InstallReducerModule = require(Parent.SquadsCore.installReducer)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local UserLibModule = require(Parent.UserLib)
local SocialBlockingModalModule = require(Parent.SocialBlockingModal)
local ScreenSizeModule = require(AppChat.installReducer.ScreenSize)
local SquadLocation = require(Parent.SquadsCore.Enums).SquadLocation

return (RoduxModule.combineReducers({
	PlayerContextualMenu = require(Parent.PlayerContextualMenu).installReducer(),
	EventReceievers = RoduxModule.combineReducers({
		NetworkStatus = require(AppChat.Http.RoduxNetworking).installReducer()
	}),
	ChatAppReducer = require(AppChat.installReducer)(),
	FetchingStatus = require(Parent.Http).Reducers.FetchingStatus,
	GameDetails = require(Parent.GameDetailRodux).GameDetails.GameDetailReducer,
	LocalUserId = UserLibModule.Reducers.LocalUserIdReducer,
	FriendCount = require(Parent.LegacyFriendsRodux).Reducers.FriendCount,
	PlayabilityStatus = require(Parent.PlayabilityRodux).PlayabilityStatus.PlayabilityStatusReducer,
	ScreenSize = if require(Parent.SocialExperiments).PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then ScreenSizeModule else nil,
	FormFactor = require(Parent.FormFactor).FormFactorReducer,
	Users = UserLibModule.Reducers.UserReducer,
	[require(Parent.SquadsCore.Constants).RODUX_KEY] = if GetFFlagIsSquadEnabledFunction() then InstallReducerModule(SquadLocation.InExperience) else nil,
	[SocialBlockingModalModule.RoduxKey] = SocialBlockingModalModule.installReducer()
}))