local playabilityRodux = script:FindFirstAncestor("PlayabilityRodux")
local parent = playabilityRodux.Parent
local promiseModule = require(parent.Promise)
local resultModule = require(parent.Result)
local performFetch = require(parent.Http).PerformFetch
local gamesMultigetPlayabilityStatusModule = require(playabilityRodux.PlayabilityStatus.GamesMultigetPlayabilityStatus)
local setPlayabilityStatusModule = require(playabilityRodux.PlayabilityStatus.SetPlayabilityStatus)
local playabilityStatusModelModule = require(playabilityRodux.PlayabilityStatus.PlayabilityStatusModel)
local loggerModule = require(playabilityRodux.Logger)

local function keyMapper(p0)
	return "luaapp.gamesapi.playabilitystatus." .. p0
end

return {
	KeyMapper = keyMapper,
	Fetch = function(p1, p2)
		-- upvalues: performFetch (ref), keyMapper (ref), gamesMultigetPlayabilityStatusModule (ref), resultModule (ref), playabilityStatusModelModule (ref), setPlayabilityStatusModule (ref), loggerModule (ref), promiseModule (ref)
		assert(type(p2) == "table", "ApiFetchPlayabilityStatus thunk expects universeIds to be a table")
		assert(#p2 > 0, "ApiFetchPlayabilityStatus thunk expects universeIds count to be greater than 0")
		assert(#p2 <= 100, "ApiFetchPlayabilityStatus thunk expects universeIds count to not exceed " .. 100)
		
		return performFetch.Batch(p2, keyMapper, function(p3, p4)
			-- upvalues: gamesMultigetPlayabilityStatusModule (copy), p1 (ref), resultModule (copy), playabilityStatusModelModule (copy), setPlayabilityStatusModule (copy), loggerModule (copy), promiseModule (copy)
			return gamesMultigetPlayabilityStatusModule(p1, p4):andThen(function(p5)
				-- upvalues: p4 (ref), resultModule (copy), playabilityStatusModelModule (copy), p3 (ref), setPlayabilityStatusModule (copy), loggerModule (copy), promiseModule (copy)
				local t = {}
				
				for i, v in ipairs(p4) do
					t["luaapp.gamesapi.playabilitystatus." .. v] = resultModule.new(false, nil)
				end
				local responseBody = p5 and p5.responseBody
				
				if responseBody == nil then
					loggerModule:warning("Response from GameGetVotes is malformed!")
				else
					local t_1 = {}
					
					for i_1, v_1 in pairs(responseBody) do
						playabilityStatusModelModule.fromJsonData(v_1):match(function(p7)
							-- upvalues: t_1 (ref), t (ref), v_1 (ref), resultModule (copy)
							t_1[p7.universeId] = p7
							t["luaapp.gamesapi.playabilitystatus." .. tostring(v_1.universeId)] = resultModule.new(true, nil)
						end):matchError(function(p6)
							warn(p6)
						end)
					end
					if next(t_1) then
						p3:dispatch(setPlayabilityStatusModule(t_1))
					end
				end
				return promiseModule.resolve(t)
			end, function(_)
				-- upvalues: p4 (ref), resultModule (copy), promiseModule (copy)
				local t = {}
				
				for i, v in ipairs(p4) do
					t["luaapp.gamesapi.playabilitystatus." .. v] = resultModule.new(false, nil)
				end
				return promiseModule.resolve(t)
			end)
		end)
	end,
	GetFetchingStatus = function(p8, p9)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p8, "luaapp.gamesapi.playabilitystatus." .. p9)
	end
}