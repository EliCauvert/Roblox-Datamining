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

return function(value) --[[ line: 43 | named "useAssetLibraryCategoryViewModel" ]]
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), signalsModule (ref), getAssetTileSubtitleModule (ref), signalsReactModule (ref), sendBuildExperienceEventModule (ref)
	local var9 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var11 = reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: value (ref), createAssetLibraryBrowseStoreModule (copy)
		return if value.browseStore == nil then createAssetLibraryBrowseStoreModule({ initialQuery = value.query }) else value.browseStore
	end, { value.browseStore, value.query })
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: value (ref), var11 (ref)
		return function() --[[ line: 56 ]]
			-- upvalues: value (copy), var11 (copy)
			if value.browseStore == nil then
				var11.destroy()
			end
		end
	end, { var11, value.browseStore })
	local var12 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: signalsModule (copy), var11 (ref), value (ref), inventoryStore (ref), getAssetTileSubtitleModule (copy), var9 (ref)
		return signalsModule.createComputed(function(p0) --[[ line: 65 ]]
			-- upvalues: var11 (copy), value (copy), inventoryStore (copy), getAssetTileSubtitleModule (copy), var9 (copy)
			local debouncedQuery = var11.getDebouncedQuery(p0)
			local assetType = var11.getPageTokens(p0)[value.assetType]
			local t = {}
			local t_1 = {}
			local var16 = "Ready"
			local nextPageToken = nil
			local var17 = false
			local t_2 = {}
			
			for i, v in assetType do
				local andFetchSearch = inventoryStore.getAndFetchSearch({
					maxPageSize = 30,
					universeId = value.universeId,
					assetType = value.assetType,
					query = debouncedQuery,
					pageToken = if v == "" then nil else v
				})
				local var22 = andFetchSearch.status(p0)
				
				if var22 == "Failed" then
					table.insert(t_2, v)
					
					if #t == 0 then
						var16 = "Failed"
					else
						var17 = true
					end
				elseif var22 == "NotReady" and #t == 0 and var16 ~= "Failed" then
					var16 = "Loading"
				end
				local var23 = andFetchSearch.data(p0)
				
				if var23 ~= nil then
					nextPageToken = var23.nextPageToken
					
					for i_1, v_1 in var23.assetIds do
						if not t_1[v_1] then
							t_1[v_1] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local t_3 = {}
			
			for i_1, v_1 in t do
				local var20 = inventoryStore.getAsset(value.universeId, v_1).data(p0)
				
				if var20 ~= nil then
					table.insert(t_3, {
						assetId = v_1,
						assetType = value.assetType,
						displayName = var20.displayName,
						subtitle = getAssetTileSubtitleModule(var20, var9),
						thumbnail = if value.assetType == "Audio" then nil else `rbxthumb://type=Asset&id={v_1}&w=420&h=420`,
						onActivated = value.onOpenAsset
					})
				end
			end
			return {
				assets = t_3,
				status = var16,
				nextPageToken = nextPageToken,
				loadMoreFailed = var17,
				failedPageTokens = t_2
			}
		end)
	end, {
		var11, inventoryStore, value.assetType, value.onOpenAsset, value.universeId,
		var9
	}))
	
	return {
		title = if value.assetType == "Model" then var9.model elseif value.assetType == "Image" then var9.image else var9.audio,
		assets = var12.assets,
		status = var12.status,
		hasMore = not var12.loadMoreFailed and (var12.nextPageToken ~= nil and var12.nextPageToken ~= ""),
		loadMoreFailed = var12.loadMoreFailed,
		strings = var9,
		onBack = value.onBack,
		onLoadMore = reactModule.useCallback(function() --[[ line: 144 ]]
			-- upvalues: var12 (ref), sendBuildExperienceEventModule (copy), value (ref), var11 (ref)
			if var12.nextPageToken ~= nil then
				sendBuildExperienceEventModule("ASSET_LIBRARY_LOAD_MORE", { universeId = value.universeId }, { assetType = tostring(value.assetType) })
				var11.addPageToken(value.assetType, var12.nextPageToken)
			end
		end, {
			var11,
			value.assetType,
			value.universeId,
			var12.nextPageToken
		}),
		onRetry = reactModule.useCallback(function() --[[ line: 155 ]]
			-- upvalues: var12 (ref), inventoryStore (ref), value (ref), var11 (ref)
			for i, v in var12.failedPageTokens do
				inventoryStore.fetchSearch({
					maxPageSize = 30,
					universeId = value.universeId,
					assetType = value.assetType,
					query = var11.getDebouncedQuery(false),
					pageToken = if v == "" then nil else v
				})
			end
		end, {
			var11,
			inventoryStore,
			value.assetType,
			value.universeId,
			var12.failedPageTokens
		})
	}
end