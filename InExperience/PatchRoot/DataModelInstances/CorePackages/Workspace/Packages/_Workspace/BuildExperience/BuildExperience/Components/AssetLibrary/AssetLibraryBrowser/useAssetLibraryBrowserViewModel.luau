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

local function _(p0, p1) --[[ line: 41 | named "getThumbnail" ]]
	return if p0 == "Audio" then nil else `rbxthumb://type=Asset&id={p1}&w=420&h=420`
end

local function useCategoryState(p2, p3, p4, p5, p6, p7) --[[ line: 48 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), getAssetTileSubtitleModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: signalsModule (copy), p5 (ref), p2 (ref), p4 (ref), p3 (ref), getAssetTileSubtitleModule (copy), p7 (ref), p6 (ref)
		return signalsModule.createComputed(function(p8) --[[ line: 57 ]]
			-- upvalues: p5 (copy), p2 (copy), p4 (copy), p3 (copy), getAssetTileSubtitleModule (copy), p7 (copy), p6 (copy)
			local debouncedQuery = p5.getDebouncedQuery(p8)
			local var11 = p5.getPageTokens(p8)[p2]
			local t = {}
			local t_1 = {}
			local var14 = "Ready"
			local nextPageToken = nil
			
			for i, v in var11 do
				local andFetchSearch = p4.getAndFetchSearch({
					maxPageSize = 20,
					universeId = p3,
					assetType = p2,
					query = debouncedQuery,
					pageToken = if v == "" then nil else v
				})
				local var18 = andFetchSearch.status(p8)
				
				if var18 == "Failed" then
					var14 = "Failed"
				elseif var18 == "NotReady" and var14 ~= "Failed" then
					var14 = "Loading"
				end
				local var19 = andFetchSearch.data(p8)
				
				if var19 ~= nil then
					nextPageToken = var19.nextPageToken
					
					for i_1, v_1 in var19.assetIds do
						if not t_1[v_1] then
							t_1[v_1] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local t_2 = {}
			
			for i_1, v_1 in t do
				local var16 = p4.getAsset(p3, v_1).data(p8)
				
				if var16 ~= nil then
					table.insert(t_2, {
						assetId = v_1,
						assetType = p2,
						displayName = var16.displayName,
						subtitle = getAssetTileSubtitleModule(var16, p7),
						thumbnail = if p2 == "Audio" then nil else `rbxthumb://type=Asset&id={v_1}&w=420&h=420`,
						onActivated = p6
					})
				end
			end
			return {
				assets = t_2,
				status = var14,
				nextPageToken = nextPageToken
			}
		end)
	end, {
		p2, p3, p4, p5, p6, p7
	}))
end

return function(value) --[[ line: 119 | named "useAssetLibraryBrowserViewModel" ]]
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), signalsReactModule (ref), useCategoryState (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
	local var20 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var22 = reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: value (ref), createAssetLibraryBrowseStoreModule (copy)
		return if value.browseStore == nil then createAssetLibraryBrowseStoreModule() else value.browseStore
	end, { value.browseStore })
	local var23 = signalsReactModule.useSignalState(var22.getDraftQuery)
	local var24, var25 = reactModule.useState(false)
	local var26 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 132 ]]
		-- upvalues: value (ref), var22 (ref)
		return function() --[[ line: 133 ]]
			-- upvalues: value (copy), var22 (copy)
			if value.browseStore == nil then
				var22.destroy()
			end
		end
	end, { var22, value.browseStore })
	local var27 = useCategoryState("Model", value.universeId, inventoryStore, var22, value.onOpenAsset, var20)
	local var28 = useCategoryState("Image", value.universeId, inventoryStore, var22, value.onOpenAsset, var20)
	local var29 = useCategoryState("Audio", value.universeId, inventoryStore, var22, value.onOpenAsset, var20)
	local status = var27.status
	local status_1 = var28.status
	local status_2 = var29.status
	local var30 = reactModule.useRef({
		Model = "NotReady",
		Image = "NotReady",
		Audio = "NotReady"
	})
	reactModule.useEffect(function() --[[ line: 155 ]]
		-- upvalues: signalsModule (copy), var22 (ref), sendBuildExperienceEventModule (copy), value (ref)
		return signalsModule.createEffect(function(p9) --[[ line: 156 ]]
			-- upvalues: var22 (copy), sendBuildExperienceEventModule (copy), value (copy)
			local debouncedQuery = var22.getDebouncedQuery(p9)
			
			if debouncedQuery ~= "" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_SEARCH", { universeId = value.universeId }, { queryLength = tostring(string.len(debouncedQuery)) })
			end
		end)
	end, { var22, value.universeId })
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: var30 (ref), sendBuildExperienceEventModule (copy), value (ref), status (ref), status_1 (ref), status_2 (ref)
		local function reportFailure(p10, p11) --[[ line: 169 ]]
			-- upvalues: var30 (copy), sendBuildExperienceEventModule (copy), value (copy)
			if p11 == "Failed" and var30.current[p10] ~= "Failed" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_FETCH_FAILED", { universeId = value.universeId }, { assetType = tostring(p10) })
			end
			var30.current[p10] = p11
		end
		
		reportFailure("Model", status)
		reportFailure("Image", status_1)
		reportFailure("Audio", status_2)
	end, { status, status_1, status_2, value.universeId })
	local t = { Model = var27, Image = var28, Audio = var29 }
	
	local function makeCategory(p12) --[[ line: 190 ]]
		-- upvalues: t (ref), var20 (ref), value (ref), var22 (ref), inventoryStore (ref)
		local var39 = t[p12]
		
		return {
			assetType = p12,
			title = if p12 == "Model" then var20.model elseif p12 == "Image" then var20.image else var20.audio,
			assets = var39.assets,
			status = var39.status,
			hasMore = var39.nextPageToken ~= nil and var39.nextPageToken ~= "",
			onOpenCategory = function() --[[ line: 202 ]]
				-- upvalues: value (copy), p12 (ref), var22 (copy)
				value.onOpenCategory(p12, var22.getDebouncedQuery(false))
			end,
			onRetry = function() --[[ line: 205 ]]
				-- upvalues: var22 (copy), p12 (ref), inventoryStore (copy), value (copy)
				local debouncedQuery = var22.getDebouncedQuery(false)
				
				for i, v in var22.getPageTokens(false)[p12] do
					inventoryStore.fetchSearch({
						maxPageSize = 20,
						universeId = value.universeId,
						assetType = p12,
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
	local var34 = reactModule.useCallback(function(p13) --[[ line: 226 ]]
		-- upvalues: var22 (ref)
		if p13 == "" then
			var22.clearQuery()
			
			return
		end
		var22.setQuery(p13)
	end, { var22 })
	local var35 = reactModule.useCallback(function() --[[ line: 233 ]]
		-- upvalues: var25 (ref)
		var25(true)
	end, {})
	local var36 = reactModule.useCallback(function() --[[ line: 236 ]]
		-- upvalues: var26 (ref), var22 (ref), var25 (ref)
		local current = var26.current
		
		if current ~= nil then
			local var41 = if current:IsA("TextBox") then current else current:FindFirstChildWhichIsA("TextBox", true)
			
			if var41 ~= nil then
				var41:ReleaseFocus()
			end
		end
		var22.clearQuery()
		var25(false)
	end, { var22 })
	reactModule.useEffect(function() --[[ line: 250 ]]
		-- upvalues: var24 (ref), var26 (ref)
		if var24 then
			task.defer(function() --[[ line: 254 ]]
				-- upvalues: var26 (copy)
				local current = var26.current
				
				if current == nil then return end
				local var42 = if current:IsA("TextBox") then current else current:FindFirstChildWhichIsA("TextBox", true)
				
				if var42 ~= nil then
					var42:CaptureFocus()
				end
			end)
			
			return
		end
	end, { var24 })
	
	return {
		query = var23,
		isSearchExpanded = var24,
		categories = list,
		strings = var20,
		searchInputRef = var26,
		onQueryChanged = var34,
		onSearchActivated = var35,
		onSearchCancelled = var36,
		onBack = value.onBack
	}
end