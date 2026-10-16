local DataHydration = script:FindFirstAncestor("DataHydration")
local DashModule = require(DataHydration.Parent.Dash)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchGameIconsModule = require(script.Parent.fetchGameIcons)
local _ = require(script.Parent.GameIconStoreTypes)
local GameIconSizeModule = require(script.Parent.GameIconSize)
local GameIconConstantsModule = require(script.Parent.GameIconConstants)
local SizeStringFunction = GameIconConstantsModule.sizeString
local FIntGameIconSmallSizePx = GameIconConstantsModule.FIntGameIconSmallSizePx
local FIntGameIconLargeSizePx = GameIconConstantsModule.FIntGameIconLargeSizePx

local function _(p1): string --[[ Line: 31 | Named "toId" ]]
	return (tostring(p1))
end

local _ = function(List) --[[ Line: 35 | Named "toIds" ]]
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, (tostring(value)))
	end
	return List1
end

local function createResolver(Size) --[[ Line: 43 ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), DashModule (copy), FetchGameIconsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	
	return DataCacheModule, (CreateDataResolverModule({
		queueProcessDelaySec = 0,
		requestBatchSize = 100,
		cache = DataCacheModule,
		fetchFn = function(p1) --[[ Line: 49 ]]
			-- upvalues: DashModule (upval), FetchGameIconsModule (upval), Size (copy)
			return FetchGameIconsModule(DashModule.keys(p1), Size):andThen(function(Result) --[[ Line: 53 ]]
				-- upvalues: Size (upval)
				local t = {}
				
				for _, value in Result do
					if type(value) == "table" and type(value.targetId) == "number" and value.state ~= "Pending" then
						local Text = tostring(value.targetId)
						t[Text] = {
							universeId = Text,
							state = value.state,
							url = value.imageUrl,
							size = Size
						}
					end
				end
				return t
			end)
		end
	}))
end

return function() --[[ Line: 80 | Named "createGameIconStore" ]]
	-- upvalues: createResolver (copy), SizeStringFunction (copy), FIntGameIconSmallSizePx (copy), FIntGameIconLargeSizePx (copy), GameIconSizeModule (copy)
	local Resolver, Resolver2 = createResolver(SizeStringFunction(FIntGameIconSmallSizePx))
	local Resolver1, Resolver2_1 = createResolver(SizeStringFunction(FIntGameIconLargeSizePx))
	
	local function _(Large) --[[ Line: 84 | Named "resolverFor" ]]
		-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
		return if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2
	end
	
	local _ = function(Large) --[[ Line: 91 | Named "cacheFor" ]]
		-- upvalues: GameIconSizeModule (upval), Resolver1 (copy), Resolver (copy)
		return if Large == GameIconSizeModule.Large then Resolver1 else Resolver
	end
	
	return {
		fetchGameIcon = function(p1, Large) --[[ Line: 99 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
			return (if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2).fetchItem((tostring(p1)))
		end,
		fetchGameIcons = function(List, Large) --[[ Line: 102 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
			local FetchItemsFunction = (if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2).fetchItems
			local List1 = {}
			
			for _, value in List do
				table.insert(List1, (tostring(value)))
			end
			return FetchItemsFunction(List1)
		end,
		getGameIcon = function(p1, Large) --[[ Line: 105 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
			return (if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2).getCachedItem((tostring(p1)))
		end,
		getGameIcons = function(List, Large) --[[ Line: 108 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
			local GetCachedItemsFunction = (if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2).getCachedItems
			local List1 = {}
			
			for _, value in List do
				table.insert(List1, (tostring(value)))
			end
			return GetCachedItemsFunction(List1)
		end,
		getAndFetchGameIcon = function(p1, Large, p2) --[[ Line: 111 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
			return (if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2).getAndFetchItem(tostring(p1), p2)
		end,
		getAndFetchGameIcons = function(List, Large, p1) --[[ Line: 114 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver2_1 (copy), Resolver2 (copy)
			local GetAndFetchItemsFunction = (if Large == GameIconSizeModule.Large then Resolver2_1 else Resolver2).getAndFetchItems
			local List1 = {}
			
			for _, value in List do
				table.insert(List1, (tostring(value)))
			end
			return GetAndFetchItemsFunction(List1, p1)
		end,
		updateGameIcons = function(p2, Large) --[[ Line: 118 ]]
			-- upvalues: GameIconSizeModule (upval), Resolver1 (copy), Resolver (copy)
			(if Large == GameIconSizeModule.Large then Resolver1 else Resolver).updateItems(p2)
		end,
		clear = function() --[[ Line: 122 ]]
			-- upvalues: Resolver2 (copy), Resolver2_1 (copy)
			Resolver2.clear()
			Resolver2_1.clear()
		end,
		dispose = function() --[[ Line: 126 ]]
			-- upvalues: Resolver2 (copy), Resolver2_1 (copy)
			Resolver2.dispose()
			Resolver2_1.dispose()
		end
	}
end