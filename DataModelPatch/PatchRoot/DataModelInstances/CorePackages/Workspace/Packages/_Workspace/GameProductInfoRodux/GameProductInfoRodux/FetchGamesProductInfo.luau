local GameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local Parent = GameProductInfoRodux.Parent
local PromiseModule = require(Parent.Promise)
local ResultModule = require(Parent.Result)
local PerformFetch = require(Parent.Http).PerformFetch
local Logging = require(Parent.AppCommonLib).Logging
local SetGamesProductInfoModule = require(GameProductInfoRodux.SetGamesProductInfo)
local GamesGetProductInfoModule = require(GameProductInfoRodux.GamesGetProductInfo)
local GameProductInfoModule = require(GameProductInfoRodux.GameProductInfo)

local function KeyMapper(Text): string
	return "luaapp.gamesapi.games-product-info." .. Text
end

return {
	KeyMapper = KeyMapper,
	Fetch = function(p1, p2)
		-- upvalues: PerformFetch (copy), KeyMapper (copy), GamesGetProductInfoModule (copy), ResultModule (copy), GameProductInfoModule (copy), Logging (copy), SetGamesProductInfoModule (copy), PromiseModule (copy)
		assert(type(p2) == "table", "FetchGamesProductInfo thunk expects universeIds to be a table")
		assert(#p2 > 0, "FetchGamesProductInfo thunk expects universeIds count to be greater than 0")
		assert(#p2 <= 100, "FetchGamesProductInfo thunk expects universeIds count to not exceed " .. 100)
		
		return PerformFetch.Batch(p2, KeyMapper, function(p3, p4)
			-- upvalues: GamesGetProductInfoModule (upval), p1 (copy), ResultModule (upval), GameProductInfoModule (upval), Logging (upval), SetGamesProductInfoModule (upval), PromiseModule (upval)
			return GamesGetProductInfoModule(p1, p4):andThen(function(Result)
				-- upvalues: p4 (copy), ResultModule (upval), GameProductInfoModule (upval), Logging (upval), p3 (copy), SetGamesProductInfoModule (upval), PromiseModule (upval)
				local NewResults = {}
				
				for _, value in ipairs(p4) do
					NewResults["luaapp.gamesapi.games-product-info." .. value] = ResultModule.new(false, nil)
				end
				local Data = Result and (Result.responseBody and Result.responseBody.data)
				
				if Data == nil then
					Logging.warn("Response from GamesGetProductInfo is malformed!")
				else
					local t = {}
					
					for _, entry in ipairs(Data) do
						GameProductInfoModule.fromJsonData(entry):match(function(p5)
							-- upvalues: t (copy), NewResults (copy), ResultModule (upval)
							t[p5.universeId] = p5
							NewResults["luaapp.gamesapi.games-product-info." .. p5.universeId] = ResultModule.new(true, nil)
						end):matchError(function(p5)
							-- upvalues: Logging (upval)
							Logging.warn(p5)
						end)
					end
					if next(t) then
						p3:dispatch(SetGamesProductInfoModule(t))
					end
				end
				return PromiseModule.resolve(NewResults)
			end, function(_)
				-- upvalues: p4 (copy), ResultModule (upval), PromiseModule (upval)
				local NewResults = {}
				
				for _, value in ipairs(p4) do
					NewResults["luaapp.gamesapi.games-product-info." .. value] = ResultModule.new(false, nil)
				end
				return PromiseModule.resolve(NewResults)
			end)
		end)
	end,
	GetFetchingStatus = function(p5, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p5, "luaapp.gamesapi.games-product-info." .. Text)
	end
}