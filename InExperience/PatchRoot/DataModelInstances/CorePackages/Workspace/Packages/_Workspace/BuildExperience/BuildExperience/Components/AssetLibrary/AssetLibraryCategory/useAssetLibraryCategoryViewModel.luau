local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Parent.AssetLibraryCategories)
local _ = require(script.Parent.AssetLibraryCategoryView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local _ = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local useDataModelAssetLibraryModule = require(script.Parent.Parent.useDataModelAssetLibrary)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local createAssetLibraryBrowseStoreModule = require(buildExperience.Stores.AssetLibrary.createAssetLibraryBrowseStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), useDataModelAssetLibraryModule (ref), signalsReactModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = useAssetLibraryStringsModule()
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
	local var3 = useDataModelAssetLibraryModule({
		dependencies = value.liveModelDependencies,
		placeId = value.placeId
	})
	local var4 = signalsReactModule.useSignalState(var2.getDraftQuery)
	local var5 = signalsReactModule.useSignalState(var2.getDebouncedQuery)
	local categoryKey = value.categoryKey or (if value.assetType == "Model" then "Objects" elseif value.assetType == "Image" then "Textures" else "Sounds")
	local var6, var7 = reactModule.useState({
		status = "Loading",
		hasMore = false,
		nextOffset = 0,
		loadMoreFailed = false,
		items = {}
	})
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var8 (ref), var3 (ref), categoryKey (ref), var5 (ref), var7 (ref)
		if var8.current == p1 then
			return
		end
		var8.current = p1
		var3.requestCategoryPage(categoryKey, p1, 5, var5, function(p3)
			-- upvalues: var8 (copy), var7 (copy), p2 (ref), p1 (ref)
			var8.current = nil
			var7(function(p4)
				-- upvalues: p2 (copy), p3 (ref), p1 (copy)
				local var10 = if p2 then {} else table.clone(p4.items)
				
				for i, v in p3.items do
					table.insert(var10, v)
				end
				return {
					status = "Ready",
					loadMoreFailed = false,
					items = var10,
					hasMore = p3.hasMore == true,
					nextOffset = p3.nextOffset or p1 + #p3.items
				}
			end)
		end, function()
			-- upvalues: var8 (copy), var7 (copy)
			var8.current = nil
			var7(function(p4)
				return {
					items = p4.items,
					status = if #p4.items == 0 then "Failed" else "Ready",
					hasMore = p4.hasMore,
					nextOffset = p4.nextOffset,
					loadMoreFailed = #p4.items > 0
				}
			end)
		end)
	end, { categoryKey, var3.requestCategoryPage, var5 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var7 (ref), var3 (ref), var9 (ref)
		var8.current = nil
		var7({
			status = "Loading",
			hasMore = false,
			nextOffset = 0,
			loadMoreFailed = false,
			items = {}
		})
		
		if var3.status == "Ready" then
			var9(0, true)
		end
	end, { categoryKey, var3.status, var9 })
	local t = {}
	
	for i, v in var6.items do
		table.insert(t, {
			tileKey = `library-item-{v.id}`,
			itemId = v.id,
			assetType = v.kind,
			displayName = v.displayName,
			thumbnail = v.thumbnail,
			model = v.model,
			item = v,
			onActivated = function()
				-- upvalues: value (ref), v (ref)
				value.onOpenItem(v)
			end
		})
	end
	return {
		title = if value.title ~= nil then if value.categoryKey ~= nil then if value.assetType == "Model" then var1.model elseif value.assetType == "Image" then var1.image else var1.audio else value.categoryKey else value.title,
		query = var4,
		assets = t,
		status = var6.status,
		hasMore = var6.hasMore,
		loadMoreFailed = var6.loadMoreFailed,
		strings = var1,
		onBack = value.onBack,
		onLoadMore = reactModule.useCallback(function()
			-- upvalues: var6 (ref), var9 (ref), sendBuildExperienceEventModule (copy), value (ref)
			if var6.hasMore then
				var9(var6.nextOffset, false)
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_LOAD_MORE", { universeId = value.universeId }, { assetType = tostring(value.assetType) })
		end, {
			var6.hasMore,
			var6.nextOffset,
			value.assetType,
			value.universeId,
			var9
		}),
		onQueryChanged = reactModule.useCallback(function(p3)
			-- upvalues: var2 (ref)
			if p3 == "" then
				var2.clearQuery()
				
				return
			end
			var2.setQuery(p3)
		end, { var2 }),
		onSearchReset = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2.clearQuery()
		end, { var2 }),
		onRetry = reactModule.useCallback(function()
			-- upvalues: var6 (ref), var9 (ref), var3 (ref)
			if var6.status == "Failed" or var6.loadMoreFailed then
				var9(if #var6.items == 0 then 0 else var6.nextOffset, #var6.items == 0)
				
				return
			end
			var3.onRetry()
		end, {
			var3.onRetry, var6.items, var6.loadMoreFailed, var6.nextOffset,
			var6.status, var9
		}),
		presentation = value.presentation
	}
end