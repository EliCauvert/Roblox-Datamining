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

local function FullscreenAssetLibraryPage(value) --[[ line: 31 ]]
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var12 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var12.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var12.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var12.shouldIncludeBottomBar
	}, { Page = value.page })
end

local function wrapPage(p0, p1) --[[ line: 46 ]]
	-- upvalues: reactModule (ref), view (ref), FullscreenAssetLibraryPage (ref)
	return if p1 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, { Page = p0 }) else reactModule.createElement(FullscreenAssetLibraryPage, { page = p0 })
end

return {
	Screens = t,
	BrowserScreen = function(p2) --[[ line: 60 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), wrapPage (ref), assetLibraryBrowserContainerModule (ref)
		local navigation = p2.navigation
		local screenProps = p2.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var15 = if target ~= nil then nil else target.universeId
		local var16 = reactModule.useCallback(function() --[[ line: 66 ]]
			-- upvalues: screenProps (ref), navigation (ref)
			if screenProps.onClose == nil then
				navigation.goBack()
				
				return
			end
			screenProps.onClose()
		end, { navigation, screenProps.onClose })
		local var17 = reactModule.useCallback(function(p3) --[[ line: 73 ]]
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = tostring(p3) })
			navigation.navigate(t.Detail, { target = target, assetId = p3 })
		end, { navigation, target })
		local var18 = reactModule.useCallback(function(p4, p5) --[[ line: 87 ]]
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_CATEGORY_CLICK", { universeId = target.universeId }, { assetType = tostring(p4) })
			navigation.navigate(t.Category, { target = target, assetType = p4, query = p5 })
		end, { navigation, target })
		reactModule.useEffect(function() --[[ line: 103 ]]
			-- upvalues: var15 (ref), sendBuildExperienceEventModule (copy)
			if var15 == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_IMPRESSION", { universeId = var15 })
		end, { var15 })
		
		return if target == nil or target.universeId == nil then nil else wrapPage(reactModule.createElement(assetLibraryBrowserContainerModule, {
			universeId = target.universeId,
			onBack = var16,
			onOpenAsset = var17,
			onOpenCategory = var18
		}), screenProps.isPillMenu)
	end,
	CategoryScreen = function(p6) --[[ line: 127 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), wrapPage (ref), assetLibraryCategoryContainerModule (ref)
		local navigation = p6.navigation
		local screenProps = p6.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetType = navigation.getParam("assetType")
		
		return if target == nil or target.universeId == nil or assetType == nil then nil else wrapPage(reactModule.createElement(assetLibraryCategoryContainerModule, {
			universeId = target.universeId,
			assetType = assetType,
			query = navigation.getParam("query") or "",
			onBack = reactModule.useCallback(function() --[[ line: 133 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			onOpenAsset = reactModule.useCallback(function(p7) --[[ line: 136 ]]
				-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
				if target == nil then
					return
				end
				sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = tostring(p7) })
				navigation.navigate(t.Detail, { target = target, assetId = p7 })
			end, { navigation, target })
		}), screenProps.isPillMenu)
	end,
	DetailScreen = function(p8) --[[ line: 167 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), wrapPage (ref), assetLibraryDetailContainerModule (ref)
		local navigation = p8.navigation
		local screenProps = p8.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetId = navigation.getParam("assetId")
		
		return if target == nil or target.universeId == nil or assetId == nil then nil else wrapPage(reactModule.createElement(assetLibraryDetailContainerModule, {
			universeId = target.universeId,
			assetId = assetId,
			onBack = reactModule.useCallback(function() --[[ line: 173 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation })
		}), screenProps.isPillMenu)
	end
}