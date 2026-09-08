local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorInventoryModule = require(parent.DataHydration.CreatorInventory)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryCategoryView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local getAssetTileSubtitleModule = require(script.Parent.Parent.getAssetTileSubtitle)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local createAssetLibraryBrowseStoreModule = require(buildExperience.Stores.AssetLibrary.createAssetLibraryBrowseStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), signalsModule (ref), getAssetTileSubtitleModule (ref), signalsReactModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var2 = reactModule.useMemo(function()
		-- upvalues: value (ref), createAssetLibraryBrowseStoreModule (copy)
		return if value.browseStore == nil then createAssetLibraryBrowseStoreModule({ initialQuery = value.query }) else value.browseStore
	end, { value.browseStore, value.query })
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref)
		return function()
			-- upvalues: value (copy), var2 (copy)
			if value.browseStore == nil then
				var2.destroy()
			end
		end
	end, { var2, value.browseStore })
	local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (ref), value (ref), inventoryStore (ref), getAssetTileSubtitleModule (copy), var1 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var2 (copy), value (copy), inventoryStore (copy), getAssetTileSubtitleModule (copy), var1 (copy)
			local debouncedQuery = var2.getDebouncedQuery(p1)
			local assetType = var2.getPageTokens(p1)[value.assetType]
			local t = {}
			local t_1 = {}
			local var4 = "Ready"
			local nextPageToken = nil
			local var5 = false
			local t_2 = {}
			
			for i, v in assetType do
				local andFetchSearch = inventoryStore.getAndFetchSearch({
					maxPageSize = 30,
					universeId = value.universeId,
					assetType = value.assetType,
					query = debouncedQuery,
					pageToken = if v == "" then nil else v
				})
				local var6 = andFetchSearch.status(p1)
				
				if var6 == "Failed" then
					table.insert(t_2, v)
					
					if #t == 0 then
						var4 = "Failed"
					else
						var5 = true
					end
				elseif var6 == "NotReady" and #t == 0 and var4 ~= "Failed" then
					var4 = "Loading"
				end
				local var7 = andFetchSearch.data(p1)
				
				if var7 ~= nil then
					nextPageToken = var7.nextPageToken
					
					for i_1, v_1 in var7.assetIds do
						if not t_1[v_1] then
							t_1[v_1] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local t_3 = {}
			
			for i_1, v_1 in t do
				local var8 = inventoryStore.getAsset(value.universeId, v_1).data(p1)
				
				if var8 ~= nil then
					table.insert(t_3, {
						assetId = v_1,
						assetType = value.assetType,
						displayName = var8.displayName,
						subtitle = getAssetTileSubtitleModule(var8, var1),
						thumbnail = if value.assetType == "Audio" then nil else `rbxthumb://type=Asset&id={v_1}&w=420&h=420`,
						onActivated = value.onOpenAsset
					})
				end
			end
			return {
				assets = t_3,
				status = var4,
				nextPageToken = nextPageToken,
				loadMoreFailed = var5,
				failedPageTokens = t_2
			}
		end)
	end, {
		var2, inventoryStore, value.assetType, value.onOpenAsset, value.universeId,
		var1
	}))
	
	return {
		title = if value.assetType == "Model" then var1.model elseif value.assetType == "Image" then var1.image else var1.audio,
		assets = var3.assets,
		status = var3.status,
		hasMore = not var3.loadMoreFailed and (var3.nextPageToken ~= nil and var3.nextPageToken ~= ""),
		loadMoreFailed = var3.loadMoreFailed,
		strings = var1,
		onBack = value.onBack,
		onLoadMore = reactModule.useCallback(function()
			-- upvalues: var3 (ref), sendBuildExperienceEventModule (copy), value (ref), var2 (ref)
			if var3.nextPageToken ~= nil then
				sendBuildExperienceEventModule("ASSET_LIBRARY_LOAD_MORE", { universeId = value.universeId }, { assetType = tostring(value.assetType) })
				var2.addPageToken(value.assetType, var3.nextPageToken)
			end
		end, {
			var2,
			value.assetType,
			value.universeId,
			var3.nextPageToken
		}),
		onRetry = reactModule.useCallback(function()
			-- upvalues: var3 (ref), inventoryStore (ref), value (ref), var2 (ref)
			for i, v in var3.failedPageTokens do
				inventoryStore.fetchSearch({
					maxPageSize = 30,
					universeId = value.universeId,
					assetType = value.assetType,
					query = var2.getDebouncedQuery(false),
					pageToken = if v == "" then nil else v
				})
			end
		end, {
			var2,
			inventoryStore,
			value.assetType,
			value.universeId,
			var3.failedPageTokens
		})
	}
end