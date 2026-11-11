local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local GamesProductInfoReducer = require(Parent1.GameProductInfoRodux).GamesProductInfoReducer
local NetworkingModule = require(Parent.App.Networking)
local NextDataExpirationTimeReducer = require(Parent1.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer
local CombineReducersResult = RoduxModule.combineReducers({
	[require(Parent.Constants).RoduxKey] = require(Parent.installReducer)(),
	[GamesProductInfoReducer.key] = GamesProductInfoReducer.reducer,
	ContentSharing = NetworkingModule.ContentSharingRodux.installReducer(),
	FetchingStatus = require(Parent1.Http).Reducers.FetchingStatus,
	GameDetails = require(Parent1.GameDetailRodux).GameDetails.GameDetailReducer,
	GameVotes = require(Parent1.GameVotesRodux).GameVotes.GameVotes,
	Games = NetworkingModule.RoduxGames.installReducer(),
	NetworkStatus = NetworkingModule.RoduxNetworking.installReducer(),
	Personalization = RoduxModule.combineReducers({
		[NextDataExpirationTimeReducer.key] = NextDataExpirationTimeReducer.reducer
	}),
	PlayabilityStatus = require(Parent1.PlayabilityRodux).PlayabilityStatus.PlayabilityStatusReducer,
	ScreenSize = require(Parent.installReducer.ScreenSize),
	ShowAgeVerificationOverlay = require(Parent1.VoiceChat).AgeVerificationOverlay.ShowAgeVerificationOverlay,
	UserGameVotes = require(Parent1.GameVotesRodux).UserGameVotes.UserGameVotes,
	Users = NetworkingModule.RoduxUsers.installReducer()
})

return function()
	-- upvalues: RoduxModule (copy), CombineReducersResult (copy)
	return RoduxModule.Store.new(CombineReducersResult, {}, { RoduxModule.thunkMiddleware })
end