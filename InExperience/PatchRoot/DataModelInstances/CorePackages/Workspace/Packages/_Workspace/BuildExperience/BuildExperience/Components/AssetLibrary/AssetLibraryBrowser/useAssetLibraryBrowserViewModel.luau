local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorInventoryModule = require(parent.DataHydration.CreatorInventory)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryBrowserView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local getAssetTileSubtitleModule = require(script.Parent.Parent.getAssetTileSubtitle)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local createAssetLibraryBrowseStoreModule = require(buildExperience.Stores.AssetLibrary.createAssetLibraryBrowseStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

local function _(p1, p2)
	return if p1 == "Audio" then nil else `rbxthumb://type=Asset&id={p2}&w=420&h=420`
end

local function useCategoryState(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), signalsModule (ref), getAssetTileSubtitleModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p4 (ref), p1 (ref), p3 (ref), p2 (ref), getAssetTileSubtitleModule (copy), p6 (ref), p5 (ref)
		return signalsModule.createComputed(function(p7)
			-- upvalues: p4 (copy), p1 (copy), p3 (copy), p2 (copy), getAssetTileSubtitleModule (copy), p6 (copy), p5 (copy)
			local debouncedQuery = p4.getDebouncedQuery(p7)
			local var1 = p4.getPageTokens(p7)[p1]
			local t = {}
			local t_1 = {}
			local var2 = "Ready"
			local nextPageToken = nil
			
			for i, v in var1 do
				local andFetchSearch = p3.getAndFetchSearch({
					maxPageSize = 20,
					universeId = p2,
					assetType = p1,
					query = debouncedQuery,
					pageToken = if v == "" then nil else v
				})
				local var3 = andFetchSearch.status(p7)
				
				if var3 == "Failed" then
					var2 = "Failed"
				elseif var3 == "NotReady" and var2 ~= "Failed" then
					var2 = "Loading"
				end
				local var4 = andFetchSearch.data(p7)
				
				if var4 ~= nil then
					nextPageToken = var4.nextPageToken
					
					for i_1, v_1 in var4.assetIds do
						if not t_1[v_1] then
							t_1[v_1] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local t_2 = {}
			
			for i_1, v_1 in t do
				local var5 = p3.getAsset(p2, v_1).data(p7)
				
				if var5 ~= nil then
					table.insert(t_2, {
						assetId = v_1,
						assetType = p1,
						displayName = var5.displayName,
						subtitle = getAssetTileSubtitleModule(var5, p6),
						thumbnail = if p1 == "Audio" then nil else `rbxthumb://type=Asset&id={v_1}&w=420&h=420`,
						onActivated = p5
					})
				end
			end
			return {
				assets = t_2,
				status = var2,
				nextPageToken = nextPageToken
			}
		end)
	end, {
		p1, p2, p3, p4, p5, p6
	}))
end

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), signalsReactModule (ref), useCategoryState (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
	local var6 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var7 = reactModule.useMemo(function()
		-- upvalues: value (ref), createAssetLibraryBrowseStoreModule (copy)
		return if value.browseStore == nil then createAssetLibraryBrowseStoreModule() else value.browseStore
	end, { value.browseStore })
	local var8 = signalsReactModule.useSignalState(var7.getDraftQuery)
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var7 (ref)
		return function()
			-- upvalues: value (copy), var7 (copy)
			if value.browseStore == nil then
				var7.destroy()
			end
		end
	end, { var7, value.browseStore })
	local var12 = useCategoryState("Model", value.universeId, inventoryStore, var7, value.onOpenAsset, var6)
	local var13 = useCategoryState("Image", value.universeId, inventoryStore, var7, value.onOpenAsset, var6)
	local var14 = useCategoryState("Audio", value.universeId, inventoryStore, var7, value.onOpenAsset, var6)
	local status = var12.status
	local status_1 = var13.status
	local status_2 = var14.status
	local var15 = reactModule.useRef({
		Model = "NotReady",
		Image = "NotReady",
		Audio = "NotReady"
	})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var7 (ref), sendBuildExperienceEventModule (copy), value (ref)
		return signalsModule.createEffect(function(p8)
			-- upvalues: var7 (copy), sendBuildExperienceEventModule (copy), value (copy)
			local debouncedQuery = var7.getDebouncedQuery(p8)
			
			if debouncedQuery ~= "" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_SEARCH", { universeId = value.universeId }, { queryLength = tostring(string.len(debouncedQuery)) })
			end
		end)
	end, { var7, value.universeId })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), sendBuildExperienceEventModule (copy), value (ref), status (ref), status_1 (ref), status_2 (ref)
		local function reportFailure(p8, p9)
			-- upvalues: var15 (copy), sendBuildExperienceEventModule (copy), value (copy)
			if p9 == "Failed" and var15.current[p8] ~= "Failed" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_FETCH_FAILED", { universeId = value.universeId }, { assetType = tostring(p8) })
			end
			var15.current[p8] = p9
		end
		
		reportFailure("Model", status)
		reportFailure("Image", status_1)
		reportFailure("Audio", status_2)
	end, { status, status_1, status_2, value.universeId })
	local t = { Model = var12, Image = var13, Audio = var14 }
	
	local function makeCategory(p8)
		-- upvalues: t (ref), var6 (ref), value (ref), var7 (ref), inventoryStore (ref)
		local var16 = t[p8]
		
		return {
			assetType = p8,
			title = if p8 == "Model" then var6.model elseif p8 == "Image" then var6.image else var6.audio,
			assets = var16.assets,
			status = var16.status,
			hasMore = var16.nextPageToken ~= nil and var16.nextPageToken ~= "",
			onOpenCategory = function()
				-- upvalues: value (copy), p8 (ref), var7 (copy)
				value.onOpenCategory(p8, var7.getDebouncedQuery(false))
			end,
			onRetry = function()
				-- upvalues: var7 (copy), p8 (ref), inventoryStore (copy), value (copy)
				local debouncedQuery = var7.getDebouncedQuery(false)
				
				for i, v in var7.getPageTokens(false)[p8] do
					inventoryStore.fetchSearch({
						maxPageSize = 20,
						universeId = value.universeId,
						assetType = p8,
						query = debouncedQuery,
						pageToken = if v == "" then nil else v
					})
				end
			end
		}
	end
	
	local list = {
		makeCategory("Model"),
		makeCategory("Image"),
		makeCategory("Audio")
	}
	local var17 = reactModule.useCallback(function(p9)
		-- upvalues: var7 (ref)
		if p9 == "" then
			var7.clearQuery()
			
			return
		end
		var7.setQuery(p9)
	end, { var7 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(true)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var7 (ref), var10 (ref)
		local current = var11.current
		
		if current ~= nil then
			local var20 = if current:IsA("TextBox") then current else current:FindFirstChildWhichIsA("TextBox", true)
			
			if var20 ~= nil then
				var20:ReleaseFocus()
			end
		end
		var7.clearQuery()
		var10(false)
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref)
		if var9 then
			task.defer(function()
				-- upvalues: var11 (copy)
				local current = var11.current
				
				if current == nil then return end
				local var20 = if current:IsA("TextBox") then current else current:FindFirstChildWhichIsA("TextBox", true)
				
				if var20 ~= nil then
					var20:CaptureFocus()
				end
			end)
			
			return
		end
	end, { var9 })
	
	return {
		query = var8,
		isSearchExpanded = var9,
		categories = list,
		strings = var6,
		searchInputRef = var11,
		onQueryChanged = var17,
		onSearchActivated = var18,
		onSearchCancelled = var19,
		onBack = value.onBack
	}
end