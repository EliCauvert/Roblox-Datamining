local httpService = game:GetService("HttpService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local assetLibraryBrowserContainerModule = require(script.Parent.AssetLibraryBrowser.AssetLibraryBrowserContainer)
local assetLibraryCategoryContainerModule = require(script.Parent.AssetLibraryCategory.AssetLibraryCategoryContainer)
local assetLibraryImageCategoryContainerModule = require(script.Parent.AssetLibraryCategory.AssetLibraryImageCategoryContainer)
local assetLibraryDetailContainerModule = require(script.Parent.AssetLibraryDetail.AssetLibraryDetailContainer)
local assetLibraryImageDetailContainerModule = require(script.Parent.AssetLibraryDetail.AssetLibraryImageDetailContainer)
local assetLibraryDetailViewModule = require(script.Parent.AssetLibraryDetail.AssetLibraryDetailView)
local _ = require(script.Parent.AssetLibraryTypes)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local useBuildPageLayoutModule = require(buildExperience.utils.useBuildPageLayout)
local getModelLibraryStoreModule = require(buildExperience.Stores.GetModelLibraryStore)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local view = foundationModule.View
local t = {
	Browser = "BuildAssetLibrary",
	Category = "BuildAssetLibraryCategory",
	Detail = "BuildAssetLibraryDetail"
}

local function FullscreenAssetLibraryPage(value)
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var1 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var1.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var1.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var1.shouldIncludeBottomBar
	}, { Page = value.page })
end

local function wrapPage(p1, p2)
	-- upvalues: reactModule (ref), view (ref), FullscreenAssetLibraryPage (ref)
	return if p2 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, { Page = p1 }) else reactModule.createElement(FullscreenAssetLibraryPage, { page = p1 })
end

return {
	Screens = t,
	BrowserScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), wrapPage (ref), assetLibraryBrowserContainerModule (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var1 = if target ~= nil then nil else target.universeId
		local var2 = reactModule.useCallback(function()
			-- upvalues: screenProps (ref), navigation (ref)
			if screenProps.onClose == nil then
				navigation.goBack()
				
				return
			end
			screenProps.onClose()
		end, { navigation, screenProps.onClose })
		local var3 = reactModule.useCallback(function(p2, p3)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = tostring(p2) })
			navigation.navigate(t.Detail, { target = target, assetId = p2, assetType = p3 })
		end, { navigation, target })
		local var4 = reactModule.useCallback(function(p2, p3)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_CATEGORY_CLICK", { universeId = target.universeId }, { assetType = tostring(p2) })
			navigation.navigate(t.Category, { target = target, assetType = p2, query = p3 })
		end, { navigation, target })
		local var5 = reactModule.useCallback(function(p2)
			-- upvalues: target (ref), navigation (ref), t (copy)
			if target == nil then
				return
			end
			navigation.navigate(t.Detail, { assetType = "Model", target = target, modelIdentity = p2 })
		end, { navigation, target })
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), sendBuildExperienceEventModule (copy)
			if var1 == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_IMPRESSION", { universeId = var1 })
		end, { var1 })
		
		return if target == nil or target.universeId == nil then nil else wrapPage(reactModule.createElement(assetLibraryBrowserContainerModule, {
			universeId = target.universeId,
			sessionId = target.sessionId,
			onBack = var2,
			onOpenAsset = var3,
			onOpenApiModel = var5,
			onOpenCategory = var4
		}), screenProps.isPillMenu)
	end,
	CategoryScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), assetLibraryImageCategoryContainerModule (ref), assetLibraryCategoryContainerModule (ref), wrapPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetType = navigation.getParam("assetType")
		local var1 = reactModule.useCallback(function()
			-- upvalues: navigation (ref)
			navigation.goBack()
		end, { navigation })
		local var2 = reactModule.useCallback(function(p2)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy), assetType (ref)
			if target == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = tostring(p2) })
			navigation.navigate(t.Detail, { target = target, assetId = p2, assetType = assetType })
		end, { assetType, navigation, target })
		
		return if target == nil or target.universeId == nil or assetType == nil then nil else wrapPage(if assetType == "Image" then reactModule.createElement(assetLibraryImageCategoryContainerModule, {
			universeId = target.universeId,
			query = navigation.getParam("query") or "",
			onBack = var1,
			onOpenAsset = var2
		}) else reactModule.createElement(assetLibraryCategoryContainerModule, {
			universeId = target.universeId,
			assetType = assetType,
			query = navigation.getParam("query") or "",
			onBack = var1,
			onOpenAsset = var2
		}), screenProps.isPillMenu)
	end,
	DetailScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), getModelLibraryStoreModule (ref), signalsReactModule (ref), reactModule (ref), assetLibraryDetailViewModule (ref), launchPlaytestWithLoadingStateModule (ref), httpService (ref), assetLibraryImageDetailContainerModule (ref), assetLibraryDetailContainerModule (ref), wrapPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetId = navigation.getParam("assetId")
		local assetType = navigation.getParam("assetType")
		local modelIdentity = navigation.getParam("modelIdentity")
		local var1 = getModelLibraryStoreModule()
		local var2 = signalsReactModule.useSignalState(var1.getChatComposerState)
		local var3 = reactModule.useCallback(function()
			-- upvalues: navigation (ref)
			navigation.goBack()
		end, { navigation })
		reactModule.useEffect(function()
			-- upvalues: modelIdentity (ref), var1 (ref)
			if modelIdentity ~= nil then
				var1.requestAddToChat({
					className = "Model",
					path = modelIdentity.path,
					displayName = modelIdentity.name
				})
			end
		end, { modelIdentity, var1 })
		
		return if target == nil or target.universeId == nil or assetType == nil then nil else wrapPage(if modelIdentity ~= nil then if assetId == nil then nil elseif assetType == "Image" then reactModule.createElement(assetLibraryImageDetailContainerModule, {
			universeId = target.universeId,
			assetId = assetId,
			onBack = var3
		}) else reactModule.createElement(assetLibraryDetailContainerModule, {
			universeId = target.universeId,
			assetId = assetId,
			onBack = var3
		}) else reactModule.createElement(assetLibraryDetailViewModule, {
			asset = nil,
			liveModel = nil,
			status = "Ready",
			presentation = "Page",
			apiModel = modelIdentity,
			strings = { assetUnavailable = "", title = "", updated = "" },
			onBack = var3,
			onViewApiModelInWorld = function(p2)
				-- upvalues: target (ref), launchPlaytestWithLoadingStateModule (copy), httpService (copy)
				if target.placeId ~= nil then
					launchPlaytestWithLoadingStateModule(target.placeId, "AssetLibraryViewInWorld", false, nil, true, httpService:JSONEncode({ path = p2.path, name = p2.name }))
				end
			end,
			chatActions = var2
		}), screenProps.isPillMenu)
	end
}