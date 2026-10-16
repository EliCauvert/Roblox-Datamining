local PlayabilityRodux = script:FindFirstAncestor("PlayabilityRodux")
local Parent = PlayabilityRodux.Parent
local PromiseModule = require(Parent.Promise)
local ResultModule = require(Parent.Result)
local PerformFetch = require(Parent.Http).PerformFetch
local GamesMultigetPlayabilityStatusModule = require(PlayabilityRodux.PlayabilityStatus.GamesMultigetPlayabilityStatus)
local SetPlayabilityStatusModule = require(PlayabilityRodux.PlayabilityStatus.SetPlayabilityStatus)
local PlayabilityStatusModelModule = require(PlayabilityRodux.PlayabilityStatus.PlayabilityStatusModel)
local LoggerModule = require(PlayabilityRodux.Logger)

local function keyMapper(Text): string --[[ Line: 15 ]]
	return "luaapp.gamesapi.playabilitystatus." .. Text
end

return {
	KeyMapper = keyMapper,
	Fetch = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: PerformFetch (copy), keyMapper (copy), GamesMultigetPlayabilityStatusModule (copy), ResultModule (copy), PlayabilityStatusModelModule (copy), SetPlayabilityStatusModule (copy), LoggerModule (copy), PromiseModule (copy)
		assert(type(p2) == "table", "ApiFetchPlayabilityStatus thunk expects universeIds to be a table")
		assert(#p2 > 0, "ApiFetchPlayabilityStatus thunk expects universeIds count to be greater than 0")
		assert(#p2 <= 100, "ApiFetchPlayabilityStatus thunk expects universeIds count to not exceed " .. 100)
		
		return PerformFetch.Batch(p2, keyMapper, function(p3, p4) --[[ Line: 31 ]]
			-- upvalues: GamesMultigetPlayabilityStatusModule (upval), p1 (copy), ResultModule (upval), PlayabilityStatusModelModule (upval), SetPlayabilityStatusModule (upval), LoggerModule (upval), PromiseModule (upval)
			return GamesMultigetPlayabilityStatusModule(p1, p4):andThen(function(Result) --[[ Line: 32 ]]
				-- upvalues: p4 (copy), ResultModule (upval), PlayabilityStatusModelModule (upval), p3 (copy), SetPlayabilityStatusModule (upval), LoggerModule (upval), PromiseModule (upval)
				local NewResults = {}
				
				for _, value in ipairs(p4) do
					NewResults["luaapp.gamesapi.playabilitystatus." .. value] = ResultModule.new(false, nil)
				end
				local ResponseBody = Result and Result.responseBody
				
				if ResponseBody == nil then
					LoggerModule:warning("Response from GameGetVotes is malformed!")
				else
					local t = {}
					
					for _, value1 in pairs(ResponseBody) do
						PlayabilityStatusModelModule.fromJsonData(value1):match(function(p5) --[[ Line: 45 ]]
							-- upvalues: t (copy), NewResults (copy), value1 (copy), ResultModule (upval)
							t[p5.universeId] = p5
							NewResults["luaapp.gamesapi.playabilitystatus." .. tostring(value1.universeId)] = ResultModule.new(true, nil)
						end):matchError(function(p5) --[[ Line: 49 ]]
							warn(p5)
						end)
					end
					if next(t) then
						p3:dispatch(SetPlayabilityStatusModule(t))
					end
				end
				return PromiseModule.resolve(NewResults)
			end, function(_) --[[ Line: 62 ]]
				-- upvalues: p4 (copy), ResultModule (upval), PromiseModule (upval)
				local NewResults = {}
				
				for _, value in ipairs(p4) do
					NewResults["luaapp.gamesapi.playabilitystatus." .. value] = ResultModule.new(false, nil)
				end
				return PromiseModule.resolve(NewResults)
			end)
		end)
	end,
	GetFetchingStatus = function(p5, Text) --[[ Line: 72 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p5, "luaapp.gamesapi.playabilitystatus." .. Text)
	end
}