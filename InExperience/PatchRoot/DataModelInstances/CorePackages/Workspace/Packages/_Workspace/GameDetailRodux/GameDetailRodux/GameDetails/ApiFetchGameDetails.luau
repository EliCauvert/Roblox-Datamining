local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local parent = gameDetailRodux.Parent
local promiseModule = require(parent.Promise)
local argCheckModule = require(parent.ArgCheck)
local resultModule = require(parent.Result)
local performFetch = require(parent.Http).PerformFetch
local gamesMultigetDetailsModule = require(script.Parent.GamesMultigetDetails)
local addGameDetailsModule = require(gameDetailRodux.GameDetails.AddGameDetails)
local setGameDetailErrorModule = require(gameDetailRodux.GameDetails.SetGameDetailError)
local gameDetailModelModule = require(gameDetailRodux.GameDetails.GameDetailModel)
local enumGameDetailErrorTypes = require(parent.DiscoveryTypes).EnumGameDetailErrorTypes
local loggerModule = require(gameDetailRodux.Logger)
local t = {}

local var1 = function(p1)
	return "luaapp.gamesapi.games." .. p0
end

t.KeyMapper = var1

function t.GetFetchingStatus(p1, p2)
	-- upvalues: performFetch (ref)
	return performFetch.GetStatus(p1, "luaapp.gamesapi.games." .. p2)
end

function t.Fetch(p1, p2)
	-- upvalues: argCheckModule (ref), performFetch (ref), var1 (ref), gamesMultigetDetailsModule (ref), gameDetailModelModule (ref), resultModule (ref), setGameDetailErrorModule (ref), enumGameDetailErrorTypes (ref), addGameDetailsModule (ref), loggerModule (ref), promiseModule (ref)
	argCheckModule.isType(p2, "table", "ApiFetchGameDetails: universeIds")
	
	return performFetch.Batch(p2, var1, function(p3, p4)
		-- upvalues: gamesMultigetDetailsModule (copy), p1 (ref), gameDetailModelModule (copy), resultModule (copy), setGameDetailErrorModule (copy), enumGameDetailErrorTypes (copy), addGameDetailsModule (copy), loggerModule (copy), promiseModule (copy)
		return gamesMultigetDetailsModule(p1, p4):andThen(function(p5)
			-- upvalues: gameDetailModelModule (copy), resultModule (copy), p4 (ref), p3 (ref), setGameDetailErrorModule (copy), enumGameDetailErrorTypes (copy), addGameDetailsModule (copy), loggerModule (copy), promiseModule (copy)
			local t = {}
			local data = p5 and (p5.responseBody and p5.responseBody.data)
			
			if data == nil then
				loggerModule:warning("Response from GamesMultigetDetails is malformed!")
			else
				local t_1 = {}
				
				for i, v in ipairs(data) do
					local var2 = gameDetailModelModule.fromJsonData(v)
					t_1[var2.id] = var2
					t["luaapp.gamesapi.games." .. var14.id] = resultModule.new(true, var2)
				end
				for i, v_1 in pairs(p4) do
					if not t_1[v_1] then
						p3:dispatch(setGameDetailErrorModule(v_1, enumGameDetailErrorTypes.ExperienceUnavailable))
					end
				end
				if next(t_1) then
					p3:dispatch(addGameDetailsModule(t_1))
				end
			end
			return promiseModule.resolve(t)
		end, function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end)
	end)
end

return t