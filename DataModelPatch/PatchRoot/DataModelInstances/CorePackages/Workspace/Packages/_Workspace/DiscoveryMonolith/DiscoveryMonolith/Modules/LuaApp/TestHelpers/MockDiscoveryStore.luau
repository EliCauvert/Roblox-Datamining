local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local FetchStatusReducer = require(Parent.FetchStatusRodux).FetchStatusReducer
local GameIconReducer = require(Parent.GameIconRodux).GameIcons.GameIconReducer
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local GameFiltersReducer = require(Parent.GameFilters).DataStore.GameFiltersReducer
local TopicInfosReducer = require(Parent.TopicInfosRodux).TopicInfosReducer
local NextDataExpirationTimeReducer = require(Parent.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer
local Modules = DiscoveryMonolith.Modules
local CombineReducersResult = RoduxModule.combineReducers({
	FetchingStatus = require(Parent.Http).Reducers.FetchingStatus,
	GameDetails = require(Parent.GameDetailRodux).GameDetails.GameDetailReducer,
	[GameIconReducer.key] = GameIconReducer.reducer,
	GameVotes = require(Parent.GameVotesRodux).GameVotes.GameVotes,
	InGameUsersByGame = function(p1, _)
		return p1 or {}
	end,
	OmniRecommendations = require(Modules.LuaApp.Reducers.Games.OmniRecommendations),
	OmniRecommendationsRefreshTime = require(Modules.LuaApp.Reducers.Games.OmniRecommendationsRefreshTime),
	Personalization = RoduxModule.combineReducers({
		[FetchStatusReducer.key] = FetchStatusReducer.reducer,
		[GameFiltersReducer.key] = GameFiltersReducer.reducer,
		GameGridFlexFeedItemBounds = require(Modules.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds),
		[GameInfosReducer.key] = GameInfosReducer.reducer,
		[NextDataExpirationTimeReducer.key] = NextDataExpirationTimeReducer.reducer,
		OrderedOmniItems = if require(Parent.SharedFlags).FFlagLuaAppChartsStickyHeader then function(p1, _)
			return p1 or {}
		end else nil,
		[TopicContentsReducer.key] = TopicContentsReducer.reducer,
		[TopicInfosReducer.key] = TopicInfosReducer.reducer
	}),
	RequestsStatus = require(Modules.LuaApp.Reducers.RequestsStatus),
	UserGameVotes = require(Parent.GameVotesRodux).UserGameVotes.UserGameVotes
})

local function v13(p1, p2)
	-- upvalues: CombineReducersResult (copy)
	return CombineReducersResult(p1, p2)
end

return {
	new = function(p1, p2)
		-- upvalues: CryoModule (copy), RoduxModule (copy), v13 (copy)
		if p2 == nil then
			p2 = {}
		end
		return RoduxModule.Store.new(v13, p1 or {}, (CryoModule.List.join(p2, { RoduxModule.thunkMiddleware })))
	end
}