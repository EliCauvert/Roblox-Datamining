local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local assetLibraryBrowserContainerModule = require(script.Parent.AssetLibraryBrowser.AssetLibraryBrowserContainer)
local assetLibraryCategoryContainerModule = require(script.Parent.AssetLibraryCategory.AssetLibraryCategoryContainer)
local assetLibraryDetailContainerModule = require(script.Parent.AssetLibraryDetail.AssetLibraryDetailContainer)
local assetLibraryDetailViewModule = require(script.Parent.AssetLibraryDetail.AssetLibraryDetailView)
local _ = require(script.Parent.AssetLibraryCategories)
local assetLibraryTypesModule = require(script.Parent.AssetLibraryTypes)
local useDataModelAssetLibraryModule = require(script.Parent.useDataModelAssetLibrary)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local useBuildPageLayoutModule = require(buildExperience.utils.useBuildPageLayout)
local getModelLibraryStoreModule = require(buildExperience.Stores.GetModelLibraryStore)
local view = foundationModule.View

local function executePromoteAndFocus(p1, p2)
	local ok, status = pcall(function()
		return game:GetService("ExperienceService")
	end)
	
	if ok and status ~= nil then
		pcall(function()
			-- upvalues: status (ref), p1 (ref), p2 (ref)
			status:ExecuteCrossExperienceCall("BuildAssetLibrary.PromoteAndFocus", { itemId = p1 }, function()
				-- upvalues: p2 (copy)
				p2()
			end, function()
				-- upvalues: p2 (copy)
				p2()
			end)
		end)
		
		return
	end
	p2()
end

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
		local var3 = reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil or target.universeId == nil then
				return
			end
			sendBuildExperienceEventModule("ASSET_LIBRARY_CATEGORY_CLICK", { universeId = target.universeId }, { assetType = tostring(p2) })
			navigation.navigate(t.Category, {
				query = "",
				target = target,
				assetType = p2,
				categoryKey = p3,
				categoryTitle = p4
			})
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
			placeId = target.placeId,
			sessionId = target.sessionId,
			onBack = var2,
			onOpenCategory = var3
		}), screenProps.isPillMenu)
	end,
	CategoryScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), assetLibraryCategoryContainerModule (ref), wrapPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetType = navigation.getParam("assetType")
		
		return if target == nil or target.universeId == nil or assetType == nil then nil else wrapPage(reactModule.createElement(assetLibraryCategoryContainerModule, {
			universeId = target.universeId,
			placeId = target.placeId,
			assetType = assetType,
			categoryKey = navigation.getParam("categoryKey"),
			title = navigation.getParam("categoryTitle"),
			query = navigation.getParam("query") or "",
			onBack = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			onOpenItem = reactModule.useCallback(function(p2)
				-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
				if target == nil then
					return
				end
				sendBuildExperienceEventModule("ASSET_LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { assetId = p2.id })
				navigation.navigate(t.Detail, { target = target, item = p2, assetType = p2.kind })
			end, { navigation, target })
		}), screenProps.isPillMenu)
	end,
	DetailScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), getModelLibraryStoreModule (ref), signalsReactModule (ref), reactModule (ref), useDataModelAssetLibraryModule (ref), assetLibraryTypesModule (ref), assetLibraryDetailViewModule (ref), executePromoteAndFocus (ref), assetLibraryDetailContainerModule (ref), wrapPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local assetType = navigation.getParam("assetType")
		local item = navigation.getParam("item")
		local var1 = getModelLibraryStoreModule()
		local var2 = signalsReactModule.useSignalState(var1.getChatComposerState)
		local var3 = if var2 ~= nil then nil else var2.onAddReference
		local var4 = if var2 ~= nil then nil else var2.onRemoveReferenceByPath
		local var5 = reactModule.useRef(nil)
		local var6 = useDataModelAssetLibraryModule({ placeId = if target ~= nil then nil else target.placeId })
		local var7, var8 = reactModule.useState(item)
		local var9 = reactModule.useCallback(function()
			-- upvalues: navigation (ref)
			navigation.goBack()
		end, { navigation })
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), item (ref), var6 (ref)
			var8(item)
			
			if item == nil or item.kind ~= "Model" or item.model ~= nil then
				return
			end
			var6.requestPreview(item.id, function(p2)
				-- upvalues: var8 (copy)
				var8(p2)
			end, function() end)
		end, { var6.requestPreview, item })
		reactModule.useEffect(function()
			-- upvalues: item (ref), screenProps (ref), var3 (ref), assetLibraryTypesModule (copy), var4 (ref), var5 (ref), var1 (ref)
			if item == nil or screenProps.isPillMenu and var3 == nil then return end
			local var10 = assetLibraryTypesModule.toChatReference(item)
			
			if var3 ~= nil then
				local var11 = var3(var10) == true
				
				return function()
					-- upvalues: var11 (ref), var4 (copy), var10 (ref)
					if var11 and var4 ~= nil then
						var4(var10.path)
					end
				end
			elseif var5.current == item.id then
				return
			end
			var5.current = item.id
			var1.requestAddToChat(var10)
			
			return function()
				-- upvalues: var1 (copy), var10 (ref)
				var1.requestRemoveFromChat(var10)
			end
		end, {
			item,
			var1,
			var3,
			var4,
			screenProps.isPillMenu
		})
		
		return if target == nil or target.universeId == nil or assetType == nil then nil else wrapPage(if var7 == nil then nil elseif var7.kind == "Model" and var7.model ~= nil then reactModule.createElement(assetLibraryDetailViewModule, {
			asset = nil,
			status = "Ready",
			liveModel = {
				id = var7.id,
				path = var7.path,
				name = var7.displayName,
				model = var7.model
			},
			strings = { assetUnavailable = "", title = "", updated = "" },
			onBack = var9,
			onSeeInWorld = function(p2)
				-- upvalues: executePromoteAndFocus (copy)
				executePromoteAndFocus(p2.id, function() end)
			end,
			chatActions = var2,
			presentation = if screenProps.isPillMenu then "Sheet" else "Page"
		}) else reactModule.createElement(assetLibraryDetailContainerModule, {
			universeId = target.universeId,
			item = var7,
			onBack = var9,
			chatActions = var2,
			presentation = if screenProps.isPillMenu then "Sheet" else "Page"
		}), screenProps.isPillMenu)
	end
}