local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local libraryBrowserContainerModule = require(script.Parent.LibraryBrowser.LibraryBrowserContainer)
local libraryCategoryContainerModule = require(script.Parent.LibraryCategory.LibraryCategoryContainer)
local libraryDetailContainerModule = require(script.Parent.LibraryDetail.LibraryDetailContainer)
local _ = require(script.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryDataStore)
local _ = require(script.Parent.LibraryTypes)
local focusLibraryItemModule = require(script.Parent.focusLibraryItem)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local useBuildPageLayoutModule = require(buildExperience.utils.useBuildPageLayout)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local view = foundationModule.View

local function _(vectorA)
	return { kind = "CrossExperience", placeId = vectorA or 0 }
end

local t = {
	Browser = "BuildLibrary",
	Category = "BuildLibraryCategory",
	Detail = "BuildLibraryDetail"
}

local function FullscreenLibraryPage(p1)
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var1 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var1.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var1.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var1.shouldIncludeBottomBar
	}, { Page = p1.page })
end

local function wrapPage(p1, p2)
	-- upvalues: reactModule (ref), view (ref), FullscreenLibraryPage (ref)
	return if p2 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, { Page = p1 }) else reactModule.createElement(FullscreenLibraryPage, { page = p1 })
end

return {
	Screens = t,
	BrowserScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), wrapPage (ref), libraryBrowserContainerModule (ref)
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
			sendBuildExperienceEventModule("LIBRARY_CATEGORY_CLICK", { universeId = target.universeId }, { itemKind = tostring(p2) })
			navigation.navigate(t.Category, {
				query = "",
				target = target,
				itemKind = p2,
				categoryKey = p3,
				categoryTitle = p4
			})
		end, { navigation, target })
		local var4 = reactModule.useCallback(function(p2, p3)
			-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
			if target == nil then
				return
			end
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { itemId = p2 })
			navigation.navigate(t.Detail, { target = target, itemId = p2, itemKind = p3 })
		end, { navigation, target })
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), sendBuildExperienceEventModule (copy)
			if var1 == nil then
				return
			end
			sendBuildExperienceEventModule("LIBRARY_IMPRESSION", { universeId = var1 })
		end, { var1 })
		
		return if target == nil or target.universeId == nil then nil else wrapPage(reactModule.createElement(libraryBrowserContainerModule, {
			universeId = target.universeId,
			placeId = target.placeId,
			source = { kind = "CrossExperience", placeId = target.placeId or 0 },
			sessionId = target.sessionId,
			onBack = var2,
			onOpenCategory = var3,
			onOpenItem = var4
		}), screenProps.isPillMenu)
	end,
	CategoryScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), t (ref), libraryCategoryContainerModule (ref), wrapPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local itemKind = navigation.getParam("itemKind")
		
		return if target == nil or target.universeId == nil or itemKind == nil then nil else wrapPage(reactModule.createElement(libraryCategoryContainerModule, {
			universeId = target.universeId,
			placeId = target.placeId,
			source = { kind = "CrossExperience", placeId = target.placeId or 0 },
			itemKind = itemKind,
			categoryKey = navigation.getParam("categoryKey"),
			title = navigation.getParam("categoryTitle"),
			query = navigation.getParam("query") or "",
			onBack = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			onOpenItem = reactModule.useCallback(function(p2, p3)
				-- upvalues: target (ref), sendBuildExperienceEventModule (copy), navigation (ref), t (copy)
				if target == nil then
					return
				end
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", { universeId = target.universeId }, { itemId = p2 })
				navigation.navigate(t.Detail, { target = target, itemId = p2, itemKind = p3 })
			end, { navigation, target })
		}), screenProps.isPillMenu)
	end,
	DetailScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), getLibraryStoreModule (ref), signalsReactModule (ref), reactModule (ref), libraryDetailContainerModule (ref), focusLibraryItemModule (ref), wrapPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local itemKind = navigation.getParam("itemKind")
		local itemId = navigation.getParam("itemId")
		local var1 = getLibraryStoreModule()
		local var2 = signalsReactModule.useSignalState(var1.getChatComposerState)
		local var3 = if var2 ~= nil then nil else var2.onAddReference
		local var4 = if var2 ~= nil then nil else var2.onRemoveReferenceByPath
		
		return if target == nil or target.universeId == nil or (itemKind == nil or itemId == nil) then nil else wrapPage(reactModule.createElement(libraryDetailContainerModule, {
			unavailableText = "This asset is no longer available.",
			itemId = itemId,
			itemKind = itemKind,
			source = { kind = "CrossExperience", placeId = target.placeId or 0 },
			onBack = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			onSeeInWorld = function(p2)
				-- upvalues: focusLibraryItemModule (copy), navigation (ref)
				focusLibraryItemModule(p2.id, function()
					-- upvalues: navigation (copy)
					navigation.navigate("BuildHome")
				end)
			end,
			chatActions = var2,
			referenceActions = reactModule.useMemo(function()
				-- upvalues: var3 (ref), var4 (ref), var1 (ref)
				return if var3 == nil or var4 == nil then {
					onAddReference = function(p2)
						-- upvalues: var1 (copy)
						var1.requestAddToChat(p2)
						
						return true
					end,
					onRemoveReference = var1.requestRemoveFromChat
				} else {
					onAddReference = var3,
					onRemoveReference = function(p2)
						-- upvalues: var4 (copy)
						var4(p2.path)
					end
				}
			end, { var3 or false, var4 or false, var1 }),
			presentation = if screenProps.isPillMenu then "Sheet" else "Page"
		}), screenProps.isPillMenu)
	end
}