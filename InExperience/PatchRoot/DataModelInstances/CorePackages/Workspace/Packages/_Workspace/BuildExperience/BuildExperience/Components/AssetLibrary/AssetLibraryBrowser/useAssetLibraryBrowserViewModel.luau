local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorInventoryModule = require(parent.DataHydration.CreatorInventory)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryBrowserView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local _ = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local getAssetTileSubtitleModule = require(script.Parent.Parent.getAssetTileSubtitle)
local useExperienceImagesModule = require(script.Parent.Parent.useExperienceImages)
local useLiveWorkspaceModelsModule = require(script.Parent.Parent.useLiveWorkspaceModels)
local useSessionModelsModule = require(script.Parent.Parent.useSessionModels)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local createAssetLibraryBrowseStoreModule = require(buildExperience.Stores.AssetLibrary.createAssetLibraryBrowseStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

local function _(p1, p2)
	return if p1 == "Audio" then nil else `rbxthumb://type=Asset&id={p2}&w=420&h=420`
end

local function useCategoryState(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), signalsModule (ref), getAssetTileSubtitleModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p7 (ref), p4 (ref), p1 (ref), p3 (ref), p2 (ref), getAssetTileSubtitleModule (copy), p6 (ref), p5 (ref)
		return signalsModule.createComputed(function(p8)
			-- upvalues: p7 (copy), p4 (copy), p1 (copy), p3 (copy), p2 (copy), getAssetTileSubtitleModule (copy), p6 (copy), p5 (copy)
			if p7 == false then
				return { status = "Ready", nextPageToken = nil, assets = {} }
			end
			local debouncedQuery = p4.getDebouncedQuery(p8)
			local var1 = p4.getPageTokens(p8)[p1]
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
				local var3 = andFetchSearch.status(p8)
				
				if var3 == "Failed" then
					var2 = "Failed"
				elseif var3 == "NotReady" and var2 ~= "Failed" then
					var2 = "Loading"
				end
				local var4 = andFetchSearch.data(p8)
				
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
				local var5 = p3.getAsset(p2, v_1).data(p8)
				
				if var5 ~= nil then
					table.insert(t_2, {
						assetId = v_1,
						assetType = p1,
						displayName = var5.displayName,
						subtitle = getAssetTileSubtitleModule(var5, p6),
						thumbnail = if p1 == "Audio" then nil else `rbxthumb://type=Asset&id={v_1}&w=420&h=420`,
						onActivated = if p5 == nil then nil else function()
							-- upvalues: p5 (copy), v_1 (ref), p1 (copy)
							p5(v_1, p1)
						end
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
		p1, p2, p3, p4, p5, p6, p7 == false
	}))
end

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), signalsReactModule (ref), useLiveWorkspaceModelsModule (ref), useSessionModelsModule (ref), useExperienceImagesModule (ref), useCategoryState (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
	local var6 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var7 = reactModule.useMemo(function()
		-- upvalues: value (ref), createAssetLibraryBrowseStoreModule (copy)
		return if value.browseStore == nil then createAssetLibraryBrowseStoreModule() else value.browseStore
	end, { value.browseStore })
	local var8 = signalsReactModule.useSignalState(var7.getDraftQuery)
	local var9 = signalsReactModule.useSignalState(var7.getDebouncedQuery)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var7 (ref)
		return function()
			-- upvalues: value (copy), var7 (copy)
			if value.browseStore == nil then
				var7.destroy()
			end
		end
	end, { var7, value.browseStore })
	local var13 = if value.isViewingCloudEdit ~= nil then game:GetEngineFeature("IsViewingCloudEdit") else value.isViewingCloudEdit
	local var14 = useLiveWorkspaceModelsModule({
		onOpenModel = value.onOpenModel,
		dependencies = value.liveModelDependencies,
		isAvailable = var13,
		query = var9
	})
	local var15 = useSessionModelsModule({
		sessionId = value.sessionId,
		universeId = value.universeId,
		enabled = not var13,
		query = var9,
		onOpenModel = value.onOpenApiModel
	})
	local var16 = if var13 then {
		nextPageToken = nil,
		coverage = "Complete",
		assets = var14.assets,
		status = var14.status,
		onRetry = var14.onRetry
	} else {
		assets = var15.assets,
		status = var15.status,
		nextPageToken = var15.nextPageToken,
		onRetry = var15.onRetry,
		coverage = var15.coverage,
		notice = var6.limited
	}
	local var17 = useExperienceImagesModule({
		universeId = value.universeId,
		query = var7.getDebouncedQuery,
		iconDisplayName = var6.icon,
		thumbnailDisplayName = var6.thumbnail,
		onOpenAsset = if value.onOpenAsset ~= nil then nil else reactModule.useCallback(function(p9)
			-- upvalues: value (ref)
			if value.onOpenAsset ~= nil then
				value.onOpenAsset(p9, "Image")
			end
		end, { value.onOpenAsset })
	})
	local t = {
		nextPageToken = nil,
		assets = var17.assets,
		status = var17.status,
		onRetry = var17.onRetry
	}
	local var18 = useCategoryState("Audio", value.universeId, inventoryStore, var7, value.onOpenAsset, var6, true)
	local status = var16.status
	local status_1 = t.status
	local status_2 = var18.status
	local var19 = reactModule.useRef({
		Model = "NotReady",
		Image = "NotReady",
		Audio = "NotReady"
	})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var7 (ref), sendBuildExperienceEventModule (copy), value (ref)
		return signalsModule.createEffect(function(p9)
			-- upvalues: var7 (copy), sendBuildExperienceEventModule (copy), value (copy)
			local debouncedQuery = var7.getDebouncedQuery(p9)
			
			if debouncedQuery ~= "" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_SEARCH", { universeId = value.universeId }, { queryLength = tostring(string.len(debouncedQuery)) })
			end
		end)
	end, { var7, value.universeId })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), sendBuildExperienceEventModule (copy), value (ref), status (ref), status_1 (ref), status_2 (ref)
		local function reportFailure(p9, p10)
			-- upvalues: var19 (copy), sendBuildExperienceEventModule (copy), value (copy)
			if p10 == "Failed" and var19.current[p9] ~= "Failed" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_FETCH_FAILED", { universeId = value.universeId }, { assetType = tostring(p9) })
			end
			var19.current[p9] = p10
		end
		
		reportFailure("Model", status)
		reportFailure("Image", status_1)
		reportFailure("Audio", status_2)
	end, { status, status_1, status_2, value.universeId })
	local t_1 = { Model = var16, Image = t, Audio = var18 }
	
	local function makeCategory(p9)
		-- upvalues: t_1 (ref), var6 (ref), value (ref), var7 (ref), inventoryStore (ref)
		local var20 = t_1[p9]
		
		return {
			assetType = p9,
			title = if p9 == "Model" then var6.model elseif p9 == "Image" then var6.image else var6.audio,
			assets = var20.assets,
			status = var20.status,
			hasMore = var20.coverage ~= "Incomplete" and (var20.nextPageToken ~= nil and var20.nextPageToken ~= ""),
			coverage = var20.coverage,
			notice = var20.notice,
			onOpenCategory = if var20.coverage == "Incomplete" or value.onOpenCategory == nil then nil else function()
				-- upvalues: value (copy), p9 (ref), var7 (copy)
				value.onOpenCategory(p9, var7.getDebouncedQuery(false))
			end,
			onRetry = function()
				-- upvalues: var20 (ref), var7 (copy), p9 (ref), inventoryStore (copy), value (copy)
				if var20.onRetry ~= nil then
					var20.onRetry()
					
					return
				end
				local debouncedQuery = var7.getDebouncedQuery(false)
				
				for i, v in var7.getPageTokens(false)[p9] do
					inventoryStore.fetchSearch({
						maxPageSize = 20,
						universeId = value.universeId,
						assetType = p9,
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
	local var21 = reactModule.useCallback(function(p10)
		-- upvalues: var7 (ref)
		if p10 == "" then
			var7.clearQuery()
			
			return
		end
		var7.setQuery(p10)
	end, { var7 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11(true)
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var7 (ref), var11 (ref)
		local current = var12.current
		
		if current ~= nil then
			local var24 = if current:IsA("TextBox") then current else current:FindFirstChildWhichIsA("TextBox", true)
			
			if var24 ~= nil then
				var24:ReleaseFocus()
			end
		end
		var7.clearQuery()
		var11(false)
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var12 (ref)
		if var10 then
			task.defer(function()
				-- upvalues: var12 (copy)
				local current = var12.current
				
				if current == nil then return end
				local var24 = if current:IsA("TextBox") then current else current:FindFirstChildWhichIsA("TextBox", true)
				
				if var24 ~= nil then
					var24:CaptureFocus()
				end
			end)
			
			return
		end
	end, { var10 })
	
	return {
		query = var8,
		isSearchExpanded = var10,
		categories = list,
		strings = var6,
		searchInputRef = var12,
		onQueryChanged = var21,
		onSearchActivated = var22,
		onSearchCancelled = var23,
		onBack = value.onBack,
		presentation = value.presentation
	}
end