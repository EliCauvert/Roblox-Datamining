local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local assetLibraryBrowserContainerModule = require(script.Parent.AssetLibraryBrowser.AssetLibraryBrowserContainer)
local assetLibraryCategoryContainerModule = require(script.Parent.AssetLibraryCategory.AssetLibraryCategoryContainer)
local assetLibraryDetailContainerModule = require(script.Parent.AssetLibraryDetail.AssetLibraryDetailContainer)
local _ = require(script.Parent.AssetLibraryTypes)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local useBuildPageLayoutModule = require(buildExperience.utils.useBuildPageLayout)
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
		local var3 = reactModule.useCallback(function(p2)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = tostring(p2) })
			navigation.navigate(t.Detail, { target = target, assetId = p2 })
		end, { navigation, target })
		local var4 = reactModule.useCallback(function(p2, p3)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_CATEGORY_CLICK", { universeId = target.universeId }, { assetType = tostring(p2) })
			navigation.navigate(t.Category, { target = target, assetType = p2, query = p3 })
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
			onBack = var2,
			onOpenAsset = var3,
			onOpenCategory = var4
		}), screenProps.isPillMenu)
	end,
	CategoryScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), wrapPage (ref), assetLibraryCategoryContainerModule (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetType = navigation.getParam("assetType")
		
		return if target == nil or target.universeId == nil or assetType == nil then nil else wrapPage(reactModule.createElement(assetLibraryCategoryContainerModule, {
			universeId = target.universeId,
			assetType = assetType,
			query = navigation.getParam("query") or "",
			onBack = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			onOpenAsset = reactModule.useCallback(function(p2)
				-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
				if target == nil then
					return
				end
				sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = tostring(p2) })
				navigation.navigate(t.Detail, { target = target, assetId = p2 })
			end, { navigation, target })
		}), screenProps.isPillMenu)
	end,
	DetailScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), wrapPage (ref), assetLibraryDetailContainerModule (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetId = navigation.getParam("assetId")
		
		return if target == nil or target.universeId == nil or assetId == nil then nil else wrapPage(reactModule.createElement(assetLibraryDetailContainerModule, {
			universeId = target.universeId,
			assetId = assetId,
			onBack = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation })
		}), screenProps.isPillMenu)
	end
}