local dataHydration = script:FindFirstAncestor("DataHydration")
local dashModule = require(dataHydration.Parent.Dash)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchGameIconsModule = require(script.Parent.fetchGameIcons)
local _ = require(script.Parent.GameIconStoreTypes)
local gameIconSizeModule = require(script.Parent.GameIconSize)
local gameIconConstantsModule = require(script.Parent.GameIconConstants)
local sizeString = gameIconConstantsModule.sizeString
local fIntGameIconSmallSizePx = gameIconConstantsModule.FIntGameIconSmallSizePx
local fIntGameIconLargeSizePx = gameIconConstantsModule.FIntGameIconLargeSizePx

local function _(p0)
	return tostring(p0)
end

local _ = function(p1)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, tostring(v))
	end
	return t
end

local function createResolver(p2)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), dashModule (ref), fetchGameIconsModule (ref)
	local var9 = createDataCacheModule()
	
	return var9, createDataResolverModule({
		queueProcessDelaySec = 0,
		requestBatchSize = 100,
		cache = var9,
		fetchFn = function(p3)
			-- upvalues: dashModule (copy), fetchGameIconsModule (copy), p2 (ref)
			return fetchGameIconsModule(dashModule.keys(p3), p2):andThen(function(p4)
				-- upvalues: p2 (copy)
				local t = {}
				
				for i, v in p4 do
					if type(v) == "table" and type(v.targetId) == "number" and v.state ~= "Pending" then
						local var11 = tostring(v.targetId)
						t[var11] = {
							universeId = var11,
							state = v.state,
							url = v.imageUrl,
							size = p2
						}
					end
				end
				return t
			end)
		end
	})
end

return function()
	-- upvalues: createResolver (ref), sizeString (ref), fIntGameIconSmallSizePx (ref), fIntGameIconLargeSizePx (ref), gameIconSizeModule (ref)
	local var12, var13 = createResolver(sizeString(fIntGameIconSmallSizePx))
	local var14, var15 = createResolver(sizeString(fIntGameIconLargeSizePx))
	
	local function _(p5)
		-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
		return if p5 == gameIconSizeModule.Large then var15 else var13
	end
	
	local _ = function(p6)
		-- upvalues: gameIconSizeModule (copy), var14 (ref), var12 (ref)
		return if p6 == gameIconSizeModule.Large then var14 else var12
	end
	
	return {
		fetchGameIcon = function(p7, p8)
			-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
			return (if p8 == gameIconSizeModule.Large then var15 else var13).fetchItem(tostring(p7))
		end,
		fetchGameIcons = function(p9, p10)
			-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
			local fetchItems = (if p10 == gameIconSizeModule.Large then var15 else var13).fetchItems
			local t = {}
			
			for i, v in p9 do
				table.insert(t, tostring(v))
			end
			return fetchItems(t)
		end,
		getGameIcon = function(p11, p12)
			-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
			return (if p12 == gameIconSizeModule.Large then var15 else var13).getCachedItem(tostring(p11))
		end,
		getGameIcons = function(p13, p14)
			-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
			local getCachedItems = (if p14 == gameIconSizeModule.Large then var15 else var13).getCachedItems
			local t = {}
			
			for i, v in p13 do
				table.insert(t, tostring(v))
			end
			return getCachedItems(t)
		end,
		getAndFetchGameIcon = function(p15, p16, p17)
			-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
			return (if p16 == gameIconSizeModule.Large then var15 else var13).getAndFetchItem(tostring(p15), p17)
		end,
		getAndFetchGameIcons = function(p18, p19, p20)
			-- upvalues: gameIconSizeModule (copy), var15 (ref), var13 (ref)
			local getAndFetchItems = (if p19 == gameIconSizeModule.Large then var15 else var13).getAndFetchItems
			local t = {}
			
			for i, v in p18 do
				table.insert(t, tostring(v))
			end
			return getAndFetchItems(t, p20)
		end,
		updateGameIcons = function(p21, p22)
			-- upvalues: gameIconSizeModule (copy), var14 (ref), var12 (ref)
			;(if p22 == gameIconSizeModule.Large then var14 else var12).updateItems(p21)
		end,
		clear = function()
			-- upvalues: var13 (ref), var15 (ref)
			var13.clear()
			var15.clear()
		end,
		dispose = function()
			-- upvalues: var13 (ref), var15 (ref)
			var13.dispose()
			var15.dispose()
		end
	}
end