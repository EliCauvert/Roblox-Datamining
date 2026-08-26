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

local function _(p1)
	return tostring(p1)
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
	local var1 = createDataCacheModule()
	
	return var1, createDataResolverModule({
		queueProcessDelaySec = 0,
		requestBatchSize = 100,
		cache = var1,
		fetchFn = function(p3)
			-- upvalues: dashModule (copy), fetchGameIconsModule (copy), p2 (ref)
			return fetchGameIconsModule(dashModule.keys(p3), p2):andThen(function(p4)
				-- upvalues: p2 (copy)
				local t = {}
				
				for i, v in p4 do
					if type(v) == "table" and type(v.targetId) == "number" and v.state ~= "Pending" then
						local var2 = tostring(v.targetId)
						t[var2] = {
							universeId = var2,
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
	local var2, var3 = createResolver(sizeString(fIntGameIconSmallSizePx))
	local var4, var5 = createResolver(sizeString(fIntGameIconLargeSizePx))
	
	local function _(p3)
		-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
		return if p3 == gameIconSizeModule.Large then var5 else var3
	end
	
	local _ = function(p3)
		-- upvalues: gameIconSizeModule (copy), var4 (ref), var2 (ref)
		return if p3 == gameIconSizeModule.Large then var4 else var2
	end
	
	return {
		fetchGameIcon = function(p3, p4)
			-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
			return (if p4 == gameIconSizeModule.Large then var5 else var3).fetchItem(tostring(p3))
		end,
		fetchGameIcons = function(p3, p4)
			-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
			local fetchItems = (if p4 == gameIconSizeModule.Large then var5 else var3).fetchItems
			local t = {}
			
			for i, v in p3 do
				table.insert(t, tostring(v))
			end
			return fetchItems(t)
		end,
		getGameIcon = function(p5, p6)
			-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
			return (if p6 == gameIconSizeModule.Large then var5 else var3).getCachedItem(tostring(p5))
		end,
		getGameIcons = function(p5, p6)
			-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
			local getCachedItems = (if p6 == gameIconSizeModule.Large then var5 else var3).getCachedItems
			local t = {}
			
			for i, v in p5 do
				table.insert(t, tostring(v))
			end
			return getCachedItems(t)
		end,
		getAndFetchGameIcon = function(p7, p8, p9)
			-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
			return (if p8 == gameIconSizeModule.Large then var5 else var3).getAndFetchItem(tostring(p7), p9)
		end,
		getAndFetchGameIcons = function(p7, p8, p9)
			-- upvalues: gameIconSizeModule (copy), var5 (ref), var3 (ref)
			local getAndFetchItems = (if p8 == gameIconSizeModule.Large then var5 else var3).getAndFetchItems
			local t = {}
			
			for i, v in p7 do
				table.insert(t, tostring(v))
			end
			return getAndFetchItems(t, p9)
		end,
		updateGameIcons = function(p10, p11)
			-- upvalues: gameIconSizeModule (copy), var4 (ref), var2 (ref)
			;(if p11 == gameIconSizeModule.Large then var4 else var2).updateItems(p10)
		end,
		clear = function()
			-- upvalues: var3 (ref), var5 (ref)
			var3.clear()
			var5.clear()
		end,
		dispose = function()
			-- upvalues: var3 (ref), var5 (ref)
			var3.dispose()
			var5.dispose()
		end
	}
end