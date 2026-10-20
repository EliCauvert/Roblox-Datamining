local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local RoduxModule = require(Parent1.Rodux)
local ConstantsModule = require(Parent.Constants)
local FetchingStatus = require(Parent1.Http).Reducers.FetchingStatus
local GameDetailReducer = require(Parent1.GameDetailRodux).GameDetails.GameDetailReducer
local GamesProductInfoReducer = require(Parent1.GameProductInfoRodux).GamesProductInfoReducer
local GameVotesRoduxModule = require(Parent1.GameVotesRodux)
local InspectModule = require(Parent.installReducer.Inspect)
local InstallReducerModule = require(Parent.installReducer)
local ItemDetailsModule = require(Parent.installReducer.ItemDetails)
local NetworkingModule = require(Parent.App.Networking)
local NextDataExpirationTimeReducer = require(Parent1.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer
local PlayabilityStatusReducer = require(Parent1.PlayabilityRodux).PlayabilityStatus.PlayabilityStatusReducer
local ScreenSizeModule = require(Parent.installReducer.ScreenSize)
local ShowAgeVerificationOverlay = require(Parent1.VoiceChat).AgeVerificationOverlay.ShowAgeVerificationOverlay
local UserGameVotes = require(Parent1.GameVotesRodux).UserGameVotes.UserGameVotes
local t = {}

return function(p1)
	-- upvalues: DashModule (copy), t (copy), RoduxModule (copy), ConstantsModule (copy), InstallReducerModule (copy), GamesProductInfoReducer (copy), NetworkingModule (copy), FetchingStatus (copy), InspectModule (copy), ItemDetailsModule (copy), GameDetailReducer (copy), GameVotesRoduxModule (copy), NextDataExpirationTimeReducer (copy), PlayabilityStatusReducer (copy), ScreenSizeModule (copy), ShowAgeVerificationOverlay (copy), UserGameVotes (copy)
	return RoduxModule.Store.new(RoduxModule.combineReducers({
		[ConstantsModule.RoduxKey] = InstallReducerModule(),
		[GamesProductInfoReducer.key] = GamesProductInfoReducer.reducer,
		ContentSharing = NetworkingModule.ContentSharingRodux.installReducer(),
		FetchingStatus = FetchingStatus,
		Inspect = InspectModule,
		ItemAssets = ItemDetailsModule,
		GameDetails = GameDetailReducer,
		GameVotes = GameVotesRoduxModule.GameVotes.GameVotes,
		Games = NetworkingModule.RoduxGames.installReducer(),
		NetworkStatus = NetworkingModule.RoduxNetworking.installReducer(),
		Personalization = RoduxModule.combineReducers({
			[NextDataExpirationTimeReducer.key] = NextDataExpirationTimeReducer.reducer
		}),
		PlayabilityStatus = PlayabilityStatusReducer,
		ScreenSize = ScreenSizeModule,
		ShowAgeVerificationOverlay = ShowAgeVerificationOverlay,
		UserGameVotes = UserGameVotes,
		Users = NetworkingModule.RoduxUsers.installReducer()
	}), DashModule.joinDeep(t, p1 or {}), { RoduxModule.thunkMiddleware })
end