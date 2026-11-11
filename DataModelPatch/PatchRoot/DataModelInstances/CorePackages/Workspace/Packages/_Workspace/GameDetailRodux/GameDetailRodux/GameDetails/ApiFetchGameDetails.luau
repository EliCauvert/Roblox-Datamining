local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local Parent = GameDetailRodux.Parent
local PromiseModule = require(Parent.Promise)
local ArgCheckModule = require(Parent.ArgCheck)
local ResultModule = require(Parent.Result)
local PerformFetch = require(Parent.Http).PerformFetch
local GamesMultigetDetailsModule = require(script.Parent.GamesMultigetDetails)
local AddGameDetailsModule = require(GameDetailRodux.GameDetails.AddGameDetails)
local SetGameDetailErrorModule = require(GameDetailRodux.GameDetails.SetGameDetailError)
local GameDetailModelModule = require(GameDetailRodux.GameDetails.GameDetailModel)
local EnumGameDetailErrorTypes = require(Parent.DiscoveryTypes).EnumGameDetailErrorTypes
local LoggerModule = require(GameDetailRodux.Logger)

local function KeyMapper(Text): string
	return "luaapp.gamesapi.games." .. Text
end

return {
	KeyMapper = KeyMapper,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.gamesapi.games." .. Text)
	end,
	Fetch = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), PerformFetch (copy), KeyMapper (copy), GamesMultigetDetailsModule (copy), GameDetailModelModule (copy), ResultModule (copy), SetGameDetailErrorModule (copy), EnumGameDetailErrorTypes (copy), AddGameDetailsModule (copy), LoggerModule (copy), PromiseModule (copy)
		ArgCheckModule.isType(p2, "table", "ApiFetchGameDetails: universeIds")
		
		return PerformFetch.Batch(p2, KeyMapper, function(p3, p4)
			-- upvalues: GamesMultigetDetailsModule (upval), p1 (copy), GameDetailModelModule (upval), ResultModule (upval), SetGameDetailErrorModule (upval), EnumGameDetailErrorTypes (upval), AddGameDetailsModule (upval), LoggerModule (upval), PromiseModule (upval)
			return GamesMultigetDetailsModule(p1, p4):andThen(function(Result)
				-- upvalues: GameDetailModelModule (upval), ResultModule (upval), p4 (copy), p3 (copy), SetGameDetailErrorModule (upval), EnumGameDetailErrorTypes (upval), AddGameDetailsModule (upval), LoggerModule (upval), PromiseModule (upval)
				local NewResults = {}
				local Data = Result and (Result.responseBody and Result.responseBody.data)
				
				if Data == nil then
					LoggerModule:warning("Response from GamesMultigetDetails is malformed!")
				else
					local FromJsonDataResults = {}
					
					for _, entry in ipairs(Data) do
						local FromJsonDataResult = GameDetailModelModule.fromJsonData(entry)
						FromJsonDataResults[FromJsonDataResult.id] = FromJsonDataResult
						NewResults["luaapp.gamesapi.games." .. FromJsonDataResult.id] = ResultModule.new(true, FromJsonDataResult)
					end
					for _, value in pairs(p4) do
						if not FromJsonDataResults[value] then
							p3:dispatch(SetGameDetailErrorModule(value, EnumGameDetailErrorTypes.ExperienceUnavailable))
						end
					end
					if next(FromJsonDataResults) then
						p3:dispatch(AddGameDetailsModule(FromJsonDataResults))
					end
				end
				return PromiseModule.resolve(NewResults)
			end, function(_)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve({})
			end)
		end)
	end
}