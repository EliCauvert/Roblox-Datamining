local coreGuiService = game:GetService("CoreGui")
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
local assetLibraryDetailContainerModule = require(buildExperience.Components.AssetLibrary.AssetLibraryDetail.AssetLibraryDetailContainer)
local assetLibraryDetailViewModule = require(buildExperience.Components.AssetLibrary.AssetLibraryDetail.AssetLibraryDetailView)
local assetLibrarySheetModule = require(buildExperience.Components.AssetLibrary.AssetLibrarySheet)
local _ = require(buildExperience.Components.AssetLibrary.AssetLibraryCategories)
local useAssetLibraryStringsModule = require(buildExperience.Components.AssetLibrary.useAssetLibraryStrings)
local getModelLibraryStoreModule = require(buildExperience.Stores.GetModelLibraryStore)
local collectWorkspaceModelsModule = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local createAssetLibraryBrowseStoreModule = require(buildExperience.Stores.AssetLibrary.createAssetLibraryBrowseStore)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local assetLibraryTypesModule = require(buildExperience.Components.AssetLibrary.AssetLibraryTypes)
local var1 = nil

local function promoteAndFocus(p1)
	local ok, status = pcall(function()
		return game:GetService("ExperienceService")
	end)
	
	if ok and status ~= nil then
		pcall(function()
			-- upvalues: status (ref), p1 (ref)
			status:ExecuteCrossExperienceCall("BuildAssetLibrary.PromoteAndFocus", { itemId = p1 }, function() end, function() end)
		end)
		
		return
	end
end

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

local function ConnectedAssetLibrary(value)
	-- upvalues: getModelLibraryStoreModule (ref), signalsReactModule (ref), useAssetLibraryStringsModule (ref), reactModule (ref), createAssetLibraryBrowseStoreModule (ref), assetLibraryTypesModule (ref), collectWorkspaceModelsModule (ref), focusModel (ref), promoteAndFocus (ref), assetLibraryDetailViewModule (ref), assetLibraryDetailContainerModule (ref), assetLibraryCategoryContainerModule (ref), assetLibraryBrowserContainerModule (ref), assetLibrarySheetModule (ref)
	local var2 = getModelLibraryStoreModule()
	local var3 = var2.useIsOpen()
	local var4 = signalsReactModule.useSignalState(var2.getChatComposerState)
	local var5 = if var4 ~= nil then nil else var4.onAddReference
	local var6 = if var4 ~= nil then nil else var4.onRemoveReferenceByPath
	local var7 = useAssetLibraryStringsModule()
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useMemo(function()
		-- upvalues: createAssetLibraryBrowseStoreModule (copy)
		return createAssetLibraryBrowseStoreModule()
	end, {})
	signalsReactModule.useSignalState(var12.getDebouncedQuery)
	local var13 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var11 (ref), var2 (ref)
		var9(false)
		var11(false)
		var2.setIsOpen(false)
	end, { var2 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var8 (ref), var11 (ref)
		var9(false)
		
		if var8 == false then
			var11(false)
		end
	end, { var8 })
	local var15 = reactModule.useCallback(function(p1, _, p2, p3)
		-- upvalues: var11 (ref)
		var11({ assetType = p1, categoryKey = p2, title = p3 })
	end, {})
	local var16 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref)
		var9(p1)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var5 (ref), assetLibraryTypesModule (copy), var6 (ref)
		if var8 == false or var5 == nil then
			return
		end
		local var17 = assetLibraryTypesModule.toChatReference(var8)
		local var18 = var5(var17) == true
		
		return function()
			-- upvalues: var18 (ref), var6 (copy), var17 (ref)
			if var18 and var6 ~= nil then
				var6(var17.path)
			end
		end
	end, { var8 or false, var5 or false, var6 or false })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		return function()
			-- upvalues: var12 (copy)
			var12.destroy()
		end
	end, { var12 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var14 (ref)
		if var8 == false then
			return nil
		end
		local instance = var8.instance
		
		if instance == nil then
			return nil
		end
		local destroyingConnection = instance.Destroying:Connect(var14)
		
		return function()
			-- upvalues: destroyingConnection (ref)
			destroyingConnection:Disconnect()
		end
	end, { var8 or false, var14 })
	reactModule.useEffect(function()
		-- upvalues: collectWorkspaceModelsModule (copy), value (ref), var11 (ref), var9 (ref), var2 (ref), focusModel (copy)
		local function applyPromotionCommand()
			-- upvalues: collectWorkspaceModelsModule (copy), value (copy), var11 (copy), var9 (copy), var2 (copy), focusModel (copy)
			if game:GetAttribute("BuildAssetLibraryOpen") ~= true then return end
			local buildAssetLibrarySelectedItemIdAttribute = game:GetAttribute("BuildAssetLibrarySelectedItemId")
			local buildAssetLibrarySelectedPathAttribute = game:GetAttribute("BuildAssetLibrarySelectedPath")
			
			if type(buildAssetLibrarySelectedItemIdAttribute) ~= "string" or type(buildAssetLibrarySelectedPathAttribute) ~= "string" then return end
			local var17 = nil
			
			for i, v in collectWorkspaceModelsModule.collectWorkspaceModels(value.liveModelDependencies) do
				if v.path == buildAssetLibrarySelectedPathAttribute or v.id == buildAssetLibrarySelectedItemIdAttribute or `Model:{v.id}` == buildAssetLibrarySelectedItemIdAttribute then
					var17 = v
					break
				end
			end
			if var17 == nil then
				return
			end
			var17.id = buildAssetLibrarySelectedItemIdAttribute
			var11({
				assetType = "Model",
				categoryKey = "Objects",
				title = "Objects"
			})
			var9({
				kind = "Model",
				thumbnail = nil,
				contentId = nil,
				id = var17.id,
				displayName = var17.name,
				instance = var17.model,
				path = var17.path,
				model = var17.model
			})
			var2.setIsOpen(true)
			focusModel(var17, var2)
		end
		
		applyPromotionCommand()
		local list = {
			game:GetAttributeChangedSignal("BuildAssetLibraryOpen"):Connect(applyPromotionCommand),
			game:GetAttributeChangedSignal("BuildAssetLibrarySelectedItemId"):Connect(applyPromotionCommand),
			game:GetAttributeChangedSignal("BuildAssetLibrarySelectedPath"):Connect(applyPromotionCommand)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { value.liveModelDependencies or false, var2 })
	local _ = nil
	
	return reactModule.createElement(assetLibrarySheetModule, { isOpen = var3, onClose = var13 }, if var8 == false or var8.kind ~= "Model" or var8.model == nil then if var8 ~= false then if var10 ~= false then reactModule.createElement(assetLibraryBrowserContainerModule, {
		sessionId = nil,
		presentation = "Sheet",
		universeId = game.GameId,
		placeId = game.PlaceId,
		onBack = var13,
		onOpenItem = var16,
		onOpenCategory = var15,
		liveModelDependencies = value.liveModelDependencies,
		browseStore = var12
	}) else reactModule.createElement(assetLibraryCategoryContainerModule, {
		presentation = "Sheet",
		universeId = game.GameId,
		placeId = game.PlaceId,
		assetType = var10.assetType,
		categoryKey = var10.categoryKey,
		title = var10.title,
		query = var12.getDebouncedQuery(false),
		onBack = var14,
		onOpenItem = var16,
		liveModelDependencies = value.liveModelDependencies,
		browseStore = var12
	}) else reactModule.createElement(assetLibraryDetailContainerModule, {
		presentation = "Sheet",
		universeId = game.GameId,
		item = var8,
		onBack = var14,
		chatActions = var4
	}) else reactModule.createElement(assetLibraryDetailViewModule, {
		asset = nil,
		status = "Ready",
		presentation = "Sheet",
		liveModel = {
			id = var8.id,
			path = var8.path,
			name = var8.displayName,
			model = var8.model
		},
		strings = {
			assetUnavailable = var7.assetUnavailable,
			title = var7.title,
			updated = var7.updated
		},
		onBack = var14,
		onSeeInWorld = reactModule.useCallback(function(p1)
			-- upvalues: focusModel (copy), var2 (ref), promoteAndFocus (copy)
			if p1.model:IsDescendantOf(workspace) then
				focusModel(p1, var2)
				
				return
			end
			promoteAndFocus(p1.id)
		end, { var2 }),
		chatActions = var4
	}))
end

return function(_, p1)
	-- upvalues: getModelLibraryStoreModule (ref), collectWorkspaceModelsModule (ref), coreGuiService (ref), reactRobloxModule (ref), localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), ConnectedAssetLibrary (ref)
	getModelLibraryStoreModule().setIsOpen(false)
	local var17 = p1
	
	if var17 == nil and game:GetEngineFeature("IsViewingCloudEdit") then
		var17 = collectWorkspaceModelsModule.defaultDependencies()
	end
	local buildExperienceAssetLibrary = Instance.new("ScreenGui")
	buildExperienceAssetLibrary.Name = "BuildExperienceAssetLibrary"
	buildExperienceAssetLibrary.IgnoreGuiInset = true
	buildExperienceAssetLibrary.ResetOnSpawn = false
	buildExperienceAssetLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceAssetLibrary.DisplayOrder = 8
	buildExperienceAssetLibrary.Parent = coreGuiService
	local var18 = reactRobloxModule.createRoot(buildExperienceAssetLibrary)
	var18:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			overlayGui = { DisplayOrder = 8 }
		}, {
			CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
			Library = reactModule.createElement(ConnectedAssetLibrary, { liveModelDependencies = var17 })
		})
	}))
	
	return var18
end