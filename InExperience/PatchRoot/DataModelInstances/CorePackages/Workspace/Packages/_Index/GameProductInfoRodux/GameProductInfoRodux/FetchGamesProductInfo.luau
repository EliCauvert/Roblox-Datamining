local gameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local parent = gameProductInfoRodux.Parent
local promiseModule = require(parent.Promise)
local resultModule = require(parent.Result)
local performFetch = require(parent.Http).PerformFetch
local logging = require(parent.AppCommonLib).Logging
local setGamesProductInfoModule = require(gameProductInfoRodux.SetGamesProductInfo)
local gamesGetProductInfoModule = require(gameProductInfoRodux.GamesGetProductInfo)
local gameProductInfoModule = require(gameProductInfoRodux.GameProductInfo)
local t = {}

local var1 = function(p1)
	return "luaapp.gamesapi.games-product-info." .. p0
end

t.KeyMapper = var1

function t.Fetch(p1, p2)
	-- upvalues: performFetch (ref), var1 (ref), gamesGetProductInfoModule (ref), resultModule (ref), gameProductInfoModule (ref), logging (ref), setGamesProductInfoModule (ref), promiseModule (ref)
	assert(type(p2) == "table", "FetchGamesProductInfo thunk expects universeIds to be a table")
	assert(#p2 > 0, "FetchGamesProductInfo thunk expects universeIds count to be greater than 0")
	assert(#p2 <= 100, "FetchGamesProductInfo thunk expects universeIds count to not exceed " .. 100)
	
	return performFetch.Batch(p2, var1, function(p3, p4)
		-- upvalues: gamesGetProductInfoModule (copy), p1 (ref), resultModule (copy), gameProductInfoModule (copy), logging (copy), setGamesProductInfoModule (copy), promiseModule (copy)
		return gamesGetProductInfoModule(p1, p4):andThen(function(p5)
			-- upvalues: p4 (ref), resultModule (copy), gameProductInfoModule (copy), logging (copy), p3 (ref), setGamesProductInfoModule (copy), promiseModule (copy)
			local t = {}
			
			for i, v in ipairs(p4) do
				t["luaapp.gamesapi.games-product-info." .. v] = resultModule.new(false, nil)
			end
			local data = p5 and (p5.responseBody and p5.responseBody.data)
			
			if data == nil then
				logging.warn("Response from GamesGetProductInfo is malformed!")
			else
				local t_1 = {}
				
				for i_1, v_1 in ipairs(data) do
					gameProductInfoModule.fromJsonData(v_1):match(function(p6)
						-- upvalues: t_1 (ref), t (ref), resultModule (copy)
						t_1[p6.universeId] = p6
						t["luaapp.gamesapi.games-product-info." .. p7.universeId] = resultModule.new(true, nil)
					end):matchError(function(p6)
						-- upvalues: logging (copy)
						logging.warn(p6)
					end)
				end
				if next(t_1) then
					p3:dispatch(setGamesProductInfoModule(t_1))
				end
			end
			return promiseModule.resolve(t)
		end, function(_)
			-- upvalues: p4 (ref), resultModule (copy), promiseModule (copy)
			local t = {}
			
			for i, v in ipairs(p4) do
				t["luaapp.gamesapi.games-product-info." .. v] = resultModule.new(false, nil)
			end
			return promiseModule.resolve(t)
		end)
	end)
end

function t.GetFetchingStatus(p6, p7)
	-- upvalues: performFetch (ref)
	return performFetch.GetStatus(p6, "luaapp.gamesapi.games-product-info." .. p9)
end

return t