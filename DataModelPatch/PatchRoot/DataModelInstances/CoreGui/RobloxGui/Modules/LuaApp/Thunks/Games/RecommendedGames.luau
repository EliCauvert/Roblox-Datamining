local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(CorePackages.Packages.Promise)
local SetNetworkingErrorToastFunction = require(CorePackages.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ParseAndAddGameInfosFunction = require(CorePackages.Workspace.Packages.GameInfosRodux).parseAndAddGameInfos
local GameInfoModel = require(CorePackages.Workspace.Packages.GameModels).GameInfoModel
local TopicContentsEntryModel = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsEntryModel
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetRecommendedGameEntriesModule = require(Modules.LuaApp.Actions.Games.SetRecommendedGameEntries)
local GameGetRecommendedGamesModule = require(Modules.LuaApp.Http.Requests.GamesApi.GameGetRecommendedGames)

return {
	Fetch = function(p1, Text, p2)
		-- upvalues: PerformFetch (copy), GameGetRecommendedGamesModule (copy), TopicContentsEntryModel (copy), CryoModule (copy), ParseAndAddGameInfosFunction (copy), GameInfoModel (copy), SetRecommendedGameEntriesModule (copy), PromiseModule (copy), SetNetworkingErrorToastFunction (copy)
		assert(type(Text) == "string", "RecommendedGames thunk expects universeId to be a string")
		assert(type(p2) == "table", "RecommendedGames thunk expects argTable to be a table")
		
		return PerformFetch.Single("RecommendedGames" .. Text, function(p3)
			-- upvalues: GameGetRecommendedGamesModule (upval), p1 (copy), Text (copy), p2 (copy), TopicContentsEntryModel (upval), CryoModule (upval), ParseAndAddGameInfosFunction (upval), GameInfoModel (upval), SetRecommendedGameEntriesModule (upval), PromiseModule (upval), SetNetworkingErrorToastFunction (upval)
			return GameGetRecommendedGamesModule(p1, Text, p2):andThen(function(Result)
				-- upvalues: Text (upval), TopicContentsEntryModel (upval), CryoModule (upval), ParseAndAddGameInfosFunction (upval), p1 (upval), p3 (copy), GameInfoModel (upval), SetRecommendedGameEntriesModule (upval), PromiseModule (upval)
				local JoinResults = {}
				local ResponseBody = Result.responseBody
				
				if #ResponseBody.games == 0 then
					warn("Found no recommended games related to universe", Text)
				end
				ParseAndAddGameInfosFunction(p1, p3, ResponseBody.games, GameInfoModel.fromGamesApi, function(p4, p5)
					-- upvalues: TopicContentsEntryModel (upval), CryoModule (upval), JoinResults (copy)
					TopicContentsEntryModel.fromGamesApiData(p4):match(function(p6)
						-- upvalues: CryoModule (upval), p5 (copy), JoinResults (upval)
						table.insert(JoinResults, (CryoModule.Dictionary.join(p5, p6)))
					end):matchError(function(p6)
						warn(p6)
					end)
				end)
				p3:dispatch(SetRecommendedGameEntriesModule(Text, JoinResults))
				
				return PromiseModule.resolve(Result)
			end, function(p4)
				-- upvalues: p3 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
				p3:dispatch(SetNetworkingErrorToastFunction(p4))
				
				return PromiseModule.reject(p4)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "RecommendedGames" .. Text)
	end,
	KeyMapper = function(Text): string
		return "RecommendedGames" .. Text
	end
}