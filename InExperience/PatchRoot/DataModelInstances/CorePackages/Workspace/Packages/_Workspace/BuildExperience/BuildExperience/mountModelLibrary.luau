local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signalsReactModule = require(parent.SignalsReact)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local assetLibraryBrowserContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryBrowser.AssetLibraryBrowserContainer)
local assetLibraryCategoryContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryCategory.AssetLibraryCategoryContainer)
local assetLibraryImageCategoryContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryCategory.AssetLibraryImageCategoryContainer)
local assetLibraryModelCategoryContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryCategory.AssetLibraryModelCategoryContainer)
local assetLibraryDetailContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryDetail.AssetLibraryDetailContainer)
local assetLibraryImageDetailContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryDetail.AssetLibraryImageDetailContainer)
local assetLibraryDetailViewModule = require(buildExperience.Components.AssetLibrary.AssetLibraryDetail.AssetLibraryDetailView)
local assetLibrarySheetModule = require(buildExperience.Components.AssetLibrary.AssetLibrarySheet)
local useAssetLibraryStringsModule = require(buildExperience.Components.AssetLibrary.useAssetLibraryStrings)
local getModelLibraryStoreModule = require(buildExperience.Stores.GetModelLibraryStore)
local collectWorkspaceModelsModule = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local createAssetLibraryBrowseStoreModule = require(buildExperience.Stores.AssetLibrary.createAssetLibraryBrowseStore)
local clientDataModelCollectorModule = require(buildExperience.Chat.clientDataModelCollector)
local _ = require(buildExperience.Chat.chatTypes)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local _ = require(buildExperience.Components.AssetLibrary.AssetLibraryTypes)
local var1 = nil

local function focusModel(p1, p2)
	-- upvalues: var1 (write), coreGuiService (ref)
	local boundingBox, boundingBox_1 = p1.model:GetBoundingBox()
	
	if var1 ~= nil then
		var1:Destroy()
	end
	local buildModelLibraryFocusHighlight = Instance.new("Highlight")
	buildModelLibraryFocusHighlight.Name = "BuildModelLibraryFocusHighlight"
	buildModelLibraryFocusHighlight.DepthMode = Enum.HighlightDepthMode.Occluded
	buildModelLibraryFocusHighlight.OutlineColor = Color3.fromRGB(0, 200, 255)
	buildModelLibraryFocusHighlight.FillColor = Color3.fromRGB(0, 170, 255)
	buildModelLibraryFocusHighlight.FillTransparency = 0.75
	buildModelLibraryFocusHighlight.Adornee = p1.model
	buildModelLibraryFocusHighlight.Parent = coreGuiService
	var1 = buildModelLibraryFocusHighlight
	p2.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2)
end

local function getModelReference(p1)
	-- upvalues: clientDataModelCollectorModule (ref)
	local ok, status = pcall(clientDataModelCollectorModule.getInstancePath, p1.model)
	
	return if ok and typeof(status) == "string" and status ~= "" then {
		path = status,
		displayName = p1.name,
		className = p1.model.ClassName
	} else nil
end

local function ConnectedAssetLibrary(value)
	-- upvalues: getModelLibraryStoreModule (ref), signalsReactModule (ref), useAssetLibraryStringsModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), getModelReference (ref), focusModel (ref), launchPlaytestWithLoadingStateModule (ref), httpService (ref), collectWorkspaceModelsModule (ref), assetLibraryDetailViewModule (ref), assetLibraryImageDetailContainerModule (ref), assetLibraryDetailContainerModule (ref), assetLibraryModelCategoryContainerModule (ref), assetLibraryImageCategoryContainerModule (ref), assetLibraryCategoryContainerModule (ref), assetLibraryBrowserContainerModule (ref), assetLibrarySheetModule (ref)
	local var2 = getModelLibraryStoreModule()
	local var3 = var2.useIsOpen()
	local var4 = signalsReactModule.useSignalState(var2.getChatComposerState)
	local var5 = useAssetLibraryStringsModule()
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useMemo(function()
		-- upvalues: createAssetLibraryBrowseStoreModule (copy)
		return createAssetLibraryBrowseStoreModule()
	end, {})
	signalsReactModule.useSignalState(var14.getDebouncedQuery)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var9 (ref), var11 (ref), var13 (ref), var2 (ref)
		var7(false)
		var9(false)
		var11(false)
		var13(false)
		var2.setIsOpen(false)
	end, { var2 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var9 (ref), var11 (ref), var6 (ref), var10 (ref), var13 (ref)
		var7(false)
		var9(false)
		var11(false)
		
		if var6 == false and var10 == false then
			var13(false)
		end
	end, { var6, var10 })
	local var17 = reactModule.useCallback(function(p1)
		-- upvalues: var13 (ref)
		var13(p1)
	end, {})
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var11 (ref), var7 (ref), getModelReference (copy), var2 (ref)
		var9(false)
		var11(false)
		var7(p1)
		local var19 = getModelReference(p1)
		
		if var19 ~= nil then
			var2.requestAddToChat(var19)
		end
	end, { var2 })
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), var11 (ref), var9 (ref), var2 (ref)
		var7(false)
		var11(false)
		var9(p1)
		var2.requestAddToChat({
			className = "Model",
			path = p1.path,
			displayName = p1.name
		})
	end, { var2 })
	local var20 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var7 (ref), var11 (ref)
		var7(false)
		var11({ assetId = p1, assetType = p2 })
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var14 (ref)
		return function()
			-- upvalues: var14 (copy)
			var14.destroy()
		end
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var16 (ref)
		if var6 == false then
			return nil
		end
		local destroyingConnection = var6.model.Destroying:Connect(var16)
		
		return function()
			-- upvalues: destroyingConnection (ref)
			destroyingConnection:Disconnect()
		end
	end, { var6 or false, var16 })
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: focusModel (copy), var2 (ref)
		focusModel(p1, var2)
	end, { var2 })
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: launchPlaytestWithLoadingStateModule (copy), httpService (copy)
		launchPlaytestWithLoadingStateModule(game.PlaceId, "AssetLibraryViewInWorld", false, nil, true, httpService:JSONEncode({ path = p1.path, name = p1.name }))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: value (ref), collectWorkspaceModelsModule (copy), var7 (ref), var2 (ref), focusModel (copy)
		local initialModelIdentity = value.initialModelIdentity
		
		if initialModelIdentity == nil or not game:GetEngineFeature("IsViewingCloudEdit") then
			return nil
		end
		local var23 = false
		local var24 = false
		
		local function resolve()
			-- upvalues: var23 (write), var24 (write), collectWorkspaceModelsModule (copy), initialModelIdentity (ref), var7 (copy), var2 (copy), focusModel (copy)
			if var23 or var24 then return end
			local var25 = nil
			
			for i, v in collectWorkspaceModelsModule.collectWorkspaceModels() do
				if v.model:GetFullName() == initialModelIdentity.path then
					var25 = v
					break
				end
			end
			if var25 ~= nil then
				var24 = true
				var7(var25)
				var2.setIsOpen(true)
				focusModel(var25, var2)
			end
		end
		
		resolve()
		local descendantAddedConnection = workspace.DescendantAdded:Connect(resolve)
		
		return function()
			-- upvalues: var23 (write), descendantAddedConnection (ref)
			var23 = true
			descendantAddedConnection:Disconnect()
		end
	end, { value.initialModelIdentity, var2 })
	
	return reactModule.createElement(assetLibrarySheetModule, { isOpen = var3, onClose = var15 }, if var6 ~= false then if var8 ~= false then if var10 ~= false then if var12 ~= false then reactModule.createElement(assetLibraryBrowserContainerModule, {
		sessionId = nil,
		presentation = "Sheet",
		universeId = game.GameId,
		onBack = var15,
		onOpenAsset = var20,
		onOpenModel = var18,
		onOpenApiModel = var19,
		onOpenCategory = var17,
		browseStore = var14
	}) elseif var12 == "Model" then reactModule.createElement(assetLibraryModelCategoryContainerModule, {
		onBack = var16,
		onOpenModel = var18,
		query = var14.getDebouncedQuery(false)
	}) elseif var12 == "Image" then reactModule.createElement(assetLibraryImageCategoryContainerModule, {
		presentation = "Sheet",
		universeId = game.GameId,
		query = var14.getDebouncedQuery(false),
		onBack = var16,
		onOpenAsset = function(value)
			-- upvalues: var20 (ref)
			var20(value, "Image")
		end
	}) else reactModule.createElement(assetLibraryCategoryContainerModule, {
		assetType = "Audio",
		presentation = "Sheet",
		universeId = game.GameId,
		query = var14.getDebouncedQuery(false),
		onBack = var16,
		onOpenAsset = function(value)
			-- upvalues: var20 (ref)
			var20(value, "Audio")
		end,
		browseStore = var14
	}) elseif var10.assetType == "Image" then reactModule.createElement(assetLibraryImageDetailContainerModule, {
		presentation = "Sheet",
		universeId = game.GameId,
		assetId = var10.assetId,
		onBack = var16
	}) else reactModule.createElement(assetLibraryDetailContainerModule, {
		presentation = "Sheet",
		universeId = game.GameId,
		assetId = var10.assetId,
		onBack = var16
	}) else reactModule.createElement(assetLibraryDetailViewModule, {
		asset = nil,
		liveModel = nil,
		status = "Ready",
		presentation = "Sheet",
		apiModel = var8,
		strings = {
			assetUnavailable = var5.assetUnavailable,
			title = var5.title,
			updated = var5.updated
		},
		onBack = var16,
		onViewApiModelInWorld = var22,
		chatActions = var4
	}) else reactModule.createElement(assetLibraryDetailViewModule, {
		asset = nil,
		status = "Ready",
		presentation = "Sheet",
		liveModel = var6,
		strings = {
			assetUnavailable = var5.assetUnavailable,
			title = var5.title,
			updated = var5.updated
		},
		onBack = var16,
		onSeeInWorld = var21,
		chatActions = var4
	}))
end

local function decodeModelIdentity(p1)
	-- upvalues: httpService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p1)
	
	return if ok and typeof(status) == "table" and (typeof(status.path) == "string" and status.path ~= "") and typeof(status.name) == "string" then { thumbnail = nil, path = status.path, name = status.name } else nil
end

return function(p1)
	-- upvalues: decodeModelIdentity (ref), getModelLibraryStoreModule (ref), coreGuiService (ref), reactRobloxModule (ref), localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), ConnectedAssetLibrary (ref)
	local var23 = decodeModelIdentity(p1)
	getModelLibraryStoreModule().setIsOpen(var23 ~= nil)
	local buildExperienceAssetLibrary = Instance.new("ScreenGui")
	buildExperienceAssetLibrary.Name = "BuildExperienceAssetLibrary"
	buildExperienceAssetLibrary.IgnoreGuiInset = true
	buildExperienceAssetLibrary.ResetOnSpawn = false
	buildExperienceAssetLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceAssetLibrary.DisplayOrder = 8
	buildExperienceAssetLibrary.Parent = coreGuiService
	local var24 = reactRobloxModule.createRoot(buildExperienceAssetLibrary)
	var24:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			overlayGui = { DisplayOrder = 8 }
		}, {
			CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
			Library = reactModule.createElement(ConnectedAssetLibrary, { initialModelIdentity = var23 })
		})
	}))
	
	return var24
end