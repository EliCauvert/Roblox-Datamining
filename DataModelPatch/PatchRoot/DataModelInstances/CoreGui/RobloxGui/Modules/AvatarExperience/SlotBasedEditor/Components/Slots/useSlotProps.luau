local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local BatchUnequipByAssetTypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.BatchUnequipByAssetType)
local NormalizeAvatarModule = require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local Constants = AvatarExperienceSlotBasedEditorModule.Constants
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local BuildSlotsFunction = AvatarExperienceSlotBasedEditorModule.Utils.buildSlots
local BuildBodySlotViewportPropsFunction = AvatarExperienceSlotBasedEditorModule.Utils.buildBodySlotViewportProps
local AvatarEditorSubcategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorSubcategories
local SlotCircularGradientFrame = AvatarExperienceSlotBasedEditorModule.Components.SlotCircularGradientFrame
local Categories = AvatarExperienceSlotBasedEditorModule.Enums.Categories
local ClearAllButton = AvatarExperienceSlotBasedEditorModule.Components.ClearAllButton
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SlotItemCardThumbnail = AvatarExperienceSlotBasedEditorModule.Components.SlotItemCardThumbnail
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(script.Parent.Parent.Parent.Services.Analytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local GetAssetTypesByCategoryFunction = AvatarExperienceSlotBasedEditorModule.Utils.getAssetTypesByCategory
local UseSlotItemCardBreakpointsFunction = AvatarExperienceSlotBasedEditorModule.Hooks.useSlotItemCardBreakpoints
local _ = require(script.Parent.Parent.SlotNavigation)
local _ = require(script.Parent.Parent.SlotSubNavigation)
local _ = require(script.Parent.Slots)
local ItemView = AvatarExperienceSlotBasedEditorModule.Enums.ItemView
local NavigationParams = AvatarExperienceSlotBasedEditorModule.Enums.NavigationParams
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local LookViewportModule = require(Modules.AvatarExperience.Common.Components.Looks.LookViewport)
local SlotType = AvatarExperienceSlotBasedEditorModule.Enums.SlotType
local FFlagAXEnableClearAllConfirmationPromptModule = require(Modules.AvatarExperience.Flags.FFlagAXEnableClearAllConfirmationPrompt)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXFixCheckOnEquippedAssetsModule = require(Modules.AvatarExperience.Flags.FFlagAXFixCheckOnEquippedAssets)
local FFlagAXImproveSlotBasedEditorPerformanceModule = require(Modules.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance)
local FFlagAXSlotsDesktopCrashFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopCrashFix
local FFlagAXSlotBasedEditorCategoryTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip
local FFlagAXSlotsDesktopRedesign = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXMigrateSlotsSignals = AvatarExperienceFlagsModule.FFlagAXMigrateSlotsSignals
local FFlagAXSlotsDisableScrollAwayOnLandscape = AvatarExperienceFlagsModule.FFlagAXSlotsDisableScrollAwayOnLandscape
local FFlagAXFixLookLinkToCustomize = AvatarExperienceFlagsModule.FFlagAXFixLookLinkToCustomize
local AXSlotCategoriesNilCheck = game:DefineFastFlag("AXSlotCategoriesNilCheck", false)

local function buildStringsToLocalize(UseSignalStateResult, NameTranslationKey)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), SlotType (copy)
	local Keys = {}
	
	for _, value in UseSignalStateResult do
		if not FFlagAXCustomizeMakeupSupport or value.slotType ~= SlotType.LayeredSlot then
			Keys[value.nameTranslationKey] = value.nameTranslationKey
			continue
		end
		for i = 1, value.layerLimit do
			Keys[value.nameTranslationKey .. "_" .. i] = { value.nameTranslationKey, layerIndex = i }
		end
	end
	Keys[NameTranslationKey] = NameTranslationKey
	
	return Keys
end

local function getCategoryIndices(EditorSubcategory)
	-- upvalues: GetAvatarEditorCategoriesModule (copy), FFlagAXEditorSubcategoryFilters (copy)
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.Subcategories then
			for i1, subcategory in value.Subcategories do
				if subcategory.NavigationKey == EditorSubcategory then
					return i, i1, nil
				end
				if FFlagAXEditorSubcategoryFilters and subcategory.SubcategoryFilters then
					for i2, subcategoryFilter in subcategory.SubcategoryFilters do
						if subcategoryFilter.NavigationKey == EditorSubcategory then
							return i, i1, i2
						end
					end
				end
			end
		end
	end
	return nil, nil, nil
end

local function shallowEqual(Current, Current1): boolean
	if Current == Current1 then
		return true
	end
	if type(Current) ~= "table" or type(Current1) ~= "table" then
		return false
	end
	for i, value in Current do
		if Current1[i] ~= value then
			return false
		end
	end
	for i1, _ in Current1 do
		if Current[i1] == nil then
			return false
		end
	end
	return true
end

local v1: ((any) -> any)? = nil
local v2: ((any) -> any)? = nil

if FFlagAXCustomizeMakeupSupport then
	v1 = function(p1)
		return p1.AvatarExperience.AvatarEditor.Categories.category
	end
	
	v2 = function(p1)
		return p1.AvatarExperience.AvatarEditor.Categories.subcategory
	end
end
return function(p1)
	-- upvalues: UseSlotBasedEditorContextFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseTokensFunction (copy), RoactLocalizationModule (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), UseSelectorFunction (copy), DeviceOrientationMode (copy), FFlagAXCustomizeMakeupSupport (copy), v1 (ref), v2 (ref), UseSlotItemCardBreakpointsFunction (copy), FFlagAXFixCheckOnEquippedAssetsModule (copy), FFlagAXImproveSlotBasedEditorPerformanceModule (copy), CryoModule (copy), FFlagAXMigrateSlotsSignals (copy), SignalsReactModule (copy), BuildSlotsFunction (copy), Constants (copy), UseLocalizationFunction (copy), buildStringsToLocalize (copy), shallowEqual (copy), GetAvatarEditorCategoriesModule (copy), AXSlotCategoriesNilCheck (copy), getCategoryIndices (copy), SetCategoryAndSubcategoryModule (copy), FFlagAXEditorSubcategoryFilters (copy), FFlagAXSlotsDesktopRedesign (copy), NormalizeAvatarModule (copy), Categories (copy), FFlagAXSlotsDesktopCrashFix (copy), FFlagAXSlotsDisableScrollAwayOnLandscape (copy), FFlagAXSlotBasedEditorCategoryTooltip (copy), FFlagAXFixLookLinkToCustomize (copy), FFlagAXEnableClearAllConfirmationPromptModule (copy), GetAssetTypesByCategoryFunction (copy), BatchUnequipByAssetTypeModule (copy), AvatarScreen (copy), ClearAllButton (copy), AvatarEditorSubcategories (copy), LookViewportModule (copy), BuildBodySlotViewportPropsFunction (copy), ConstantsModule (copy), SlotCircularGradientFrame (copy), SlotItemCardThumbnail (copy), SlotType (copy), NavigationParams (copy), ItemView (copy)
	local UseSlotBasedEditorContextResult = UseSlotBasedEditorContextFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local UseTokensResult = UseTokensFunction()
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(RoactLocalizationModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: DeviceOrientationMode (upval)
		return p2.DeviceOrientation == DeviceOrientationMode.Portrait
	end)
	local v3 = nil
	local v4 = nil
	
	if FFlagAXCustomizeMakeupSupport then
		v3 = UseSelectorFunction(v1)
		v4 = UseSelectorFunction(v2)
	end
	local UseSlotItemCardBreakpointsResult = UseSlotItemCardBreakpointsFunction(UseRefResult.current and UseRefResult.current.AbsoluteSize)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: FFlagAXFixCheckOnEquippedAssetsModule (upval)
		return if FFlagAXFixCheckOnEquippedAssetsModule then p2.AvatarExperience.AvatarEditor.Character.EquippedAssets or {} else p2.AvatarExperience.AvatarEditor.Character.EquippedAssets
	end)
	local UseMemoResult = nil
	
	if FFlagAXImproveSlotBasedEditorPerformanceModule then
		local UseSelectorResult2 = UseSelectorFunction(function(p2)
			return p2.AvatarExperience.AvatarEditor.Character.BodyColor3s
		end)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CryoModule (upval), UseSelectorResult2 (copy)
			return CryoModule.Dictionary.values(UseSelectorResult2)
		end, { UseSelectorResult2 })
	else
		UseMemoResult = UseSelectorFunction(function(p2)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.values(p2.AvatarExperience.AvatarEditor.Character.BodyColor3s)
		end)
	end
	assert(UseSlotBasedEditorContextResult ~= nil, "useSlotProps must be used within a SlotBasedEditorContextProvider")
	local UseSignalStateResult = if FFlagAXMigrateSlotsSignals then SignalsReactModule.useSignalState(UseSlotBasedEditorContextResult.signalStore.getSlotCategory) else UseSlotBasedEditorContextResult.slotCategory
	local SetSlotCategory = if FFlagAXMigrateSlotsSignals then UseSlotBasedEditorContextResult.signalStore.setSlotCategory else UseSlotBasedEditorContextResult.setSlotCategory
	local UseSignalStateResult1 = if FFlagAXMigrateSlotsSignals then SignalsReactModule.useSignalState(UseSlotBasedEditorContextResult.signalStore.getSlotIndex) else UseSlotBasedEditorContextResult.slotIndex
	local SetSlotIndex = if FFlagAXMigrateSlotsSignals then UseSlotBasedEditorContextResult.signalStore.setSlotIndex else UseSlotBasedEditorContextResult.setSlotIndex
	local UseSignalStateResult2 = nil
	UseSignalStateResult2 = if FFlagAXMigrateSlotsSignals then SignalsReactModule.useSignalState(UseSlotBasedEditorContextResult.signalStore.getSlots) elseif FFlagAXImproveSlotBasedEditorPerformanceModule then ReactModule.useMemo(function()
		-- upvalues: BuildSlotsFunction (upval), Constants (upval), UseSignalStateResult (copy), UseSelectorResult1 (copy)
		return BuildSlotsFunction(Constants.SlotEditorCategories[UseSignalStateResult].slots, UseSelectorResult1)
	end, { UseSignalStateResult, UseSelectorResult1 }) else BuildSlotsFunction(Constants.SlotEditorCategories[UseSignalStateResult].slots, UseSelectorResult1)
	local NameTranslationKey = Constants.SlotEditorCategories[UseSignalStateResult].nameTranslationKey
	local UseMemoResult1 = nil
	
	if FFlagAXImproveSlotBasedEditorPerformanceModule then
		local UseLocalizationResult = UseLocalizationFunction((buildStringsToLocalize(UseSignalStateResult2, NameTranslationKey)))
		local UseRefResult1 = ReactModule.useRef(nil)
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: UseRefResult1 (copy), shallowEqual (upval), UseLocalizationResult (copy)
			if UseRefResult1.current and shallowEqual(UseLocalizationResult, UseRefResult1.current) then
				return UseRefResult1.current
			else
				UseRefResult1.current = UseLocalizationResult
				
				return UseLocalizationResult
			end
		end, { UseLocalizationResult })
	else
		UseMemoResult1 = UseLocalizationFunction((buildStringsToLocalize(UseSignalStateResult2, NameTranslationKey)))
	end
	local AvatarEditorCategoriesModule = if FFlagAXCustomizeMakeupSupport then GetAvatarEditorCategoriesModule() else nil
	local UseResult = if FFlagAXCustomizeMakeupSupport then ReactModule.useCallback(function(p2)
		-- upvalues: AXSlotCategoriesNilCheck (upval), AvatarEditorCategoriesModule (copy), v3 (ref), v4 (ref), getCategoryIndices (upval), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult (copy), FFlagAXEditorSubcategoryFilters (upval)
		local v5 = nil
		local v6 = nil
		local v7 = nil
		
		if p2.eligibleSubcategories ~= nil and (not AXSlotCategoriesNilCheck or AvatarEditorCategoriesModule[v3].Subcategories ~= nil) then
			if p2.currentAssetType == nil then
				if table.find(p2.eligibleSubcategories, AvatarEditorCategoriesModule[v3].Subcategories[v4].NavigationKey) then
					v5 = v3
					v6 = v4
					v7 = nil
				end
			else
				for i, subcategory in AvatarEditorCategoriesModule[v3].Subcategories do
					if table.find(p2.eligibleSubcategories, subcategory.NavigationKey) and subcategory.AssetTypeIdStrings ~= nil and table.find(subcategory.AssetTypeIdStrings, (tostring(p2.currentAssetType.Value))) then
						v5 = v3
						v6 = i
						v7 = nil
						break
					end
				end
			end
		end
		if v5 == nil then
			v5, v6, v92 = getCategoryIndices(p2.editorSubcategory)
		end
		if v5 and v6 then
			UseDispatchResult(SetCategoryAndSubcategoryModule(v5, v6, UseRoactServiceModuleResult, if FFlagAXEditorSubcategoryFilters then v7 else nil))
		end
	end, { v3, v4, UseDispatchResult, UseRoactServiceModuleResult }) else nil
	local UseResult1 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: SetSlotCategory (copy), SetSlotIndex (copy), FFlagAXSlotsDesktopRedesign (upval), UseSelectorResult (copy), FFlagAXCustomizeMakeupSupport (upval), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult (copy), NormalizeAvatarModule (upval)
		SetSlotCategory(p3)
		SetSlotIndex(1)
		
		if FFlagAXSlotsDesktopRedesign or UseSelectorResult or FFlagAXCustomizeMakeupSupport then
			UseDispatchResult(SetCategoryAndSubcategoryModule(p4.index + 1, 1, UseRoactServiceModuleResult))
		end
		if FFlagAXCustomizeMakeupSupport then
			UseDispatchResult(NormalizeAvatarModule())
		end
	end, {
		SetSlotCategory,
		SetSlotIndex,
		UseDispatchResult,
		if FFlagAXImproveSlotBasedEditorPerformanceModule and not FFlagAXSlotsDesktopRedesign then UseSelectorResult else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseRoactServiceModuleResult else nil
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSlotItemCardBreakpointsResult (copy), Constants (upval), UseResult1 (copy), UseSignalStateResult (copy), FFlagAXSlotsDesktopRedesign (upval), Categories (upval), UseSelectorResult (copy), FFlagAXSlotsDesktopCrashFix (upval)
		local config = {
			enableSnapToSelectedItem = true,
			LayoutOrder = 2,
			navHeight = UseSlotItemCardBreakpointsResult.navHeight,
			categories = table.clone(Constants.SlotEditorCategories),
			onSlotCategorySelected = UseResult1,
			slotCategory = UseSignalStateResult
		}
		
		if FFlagAXSlotsDesktopRedesign then
			config.categories[Categories.All].hide = UseSelectorResult
		end
		if FFlagAXSlotsDesktopCrashFix then
			config.categories[Categories.Avatars].hide = not (FFlagAXSlotsDesktopRedesign or UseSelectorResult)
			config.categories[Categories.Emotes].hide = not (FFlagAXSlotsDesktopRedesign or UseSelectorResult)
			
			return config
		end
		if not FFlagAXSlotsDesktopRedesign and not UseSelectorResult then
			config.categories[Categories.Avatars] = nil
			config.categories[Categories.Emotes] = nil
		end
		return config
	end, {
		UseSelectorResult,
		UseSignalStateResult,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseSlotItemCardBreakpointsResult else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseResult1 else nil
	})
	local NoUseSelectorResult = if FFlagAXSlotsDisableScrollAwayOnLandscape then not UseSelectorResult or Constants.SlotEditorCategories[UseSignalStateResult].disableScrollAway else nil
	local UseMemoResult3 = nil
	
	if FFlagAXSlotBasedEditorCategoryTooltip then
		local UseSelectorResult3 = UseSelectorFunction(function(p3)
			return p3.AvatarExperience.Common.FullView.AvatarEditor
		end)
		UseMemoResult3 = ReactModule.useMemo(function()
			-- upvalues: UseSelectorResult3 (copy), p1 (copy), FFlagAXSlotsDisableScrollAwayOnLandscape (upval), NoUseSelectorResult (copy)
			local IsSlotSubNavigationFillMatch = p1.slotSubNavigationFill == 1 or (p1.slotSubNavigationFill == nil or FFlagAXSlotsDisableScrollAwayOnLandscape and NoUseSelectorResult)
			
			return tostring(UseSelectorResult3) ~= "FullView.SceneFullView" and IsSlotSubNavigationFillMatch
		end, {
			UseSelectorResult3,
			p1.slotSubNavigationFill,
			if FFlagAXSlotsDisableScrollAwayOnLandscape then NoUseSelectorResult else nil
		})
	end
	if FFlagAXCustomizeMakeupSupport then
		ReactModule.useEffect(function()
			-- upvalues: FFlagAXFixLookLinkToCustomize (upval), SetSlotCategory (copy), AvatarEditorCategoriesModule (copy), v3 (ref), UseSignalStateResult1 (copy), UseSignalStateResult2 (ref), v4 (ref), SetSlotIndex (copy)
			if FFlagAXFixLookLinkToCustomize then
				SetSlotCategory(AvatarEditorCategoriesModule[v3].NavigationKey)
			end
			if AvatarEditorCategoriesModule[v3].Subcategories ~= nil then
				if not FFlagAXFixLookLinkToCustomize then
					SetSlotCategory(AvatarEditorCategoriesModule[v3].NavigationKey)
				end
				if UseSignalStateResult1 ~= nil and UseSignalStateResult2[UseSignalStateResult1] ~= nil and UseSignalStateResult2[UseSignalStateResult1].eligibleSubcategories ~= nil and table.find(UseSignalStateResult2[UseSignalStateResult1].eligibleSubcategories, AvatarEditorCategoriesModule[v3].Subcategories[v4].NavigationKey) then return end
				for i, value in UseSignalStateResult2 do
					if if value.eligibleSubcategories == nil then value.editorSubcategory == AvatarEditorCategoriesModule[v3].Subcategories[v4].NavigationKey else table.find(value.eligibleSubcategories, AvatarEditorCategoriesModule[v3].Subcategories[v4].NavigationKey) then
						SetSlotIndex(i)
						break
					end
				end
			end
		end, {
			v3, v4, SetSlotIndex, SetSlotCategory, AvatarEditorCategoriesModule,
			UseSignalStateResult2,
			if FFlagAXFixLookLinkToCustomize then UseSignalStateResult1 else nil
		})
	end
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), Constants (upval), UseSlotItemCardBreakpointsResult (copy), FFlagAXSlotBasedEditorCategoryTooltip (upval), UseMemoResult3 (ref), Categories (upval), FFlagAXEnableClearAllConfirmationPromptModule (upval), GetAssetTypesByCategoryFunction (upval), UseSignalStateResult2 (ref), UseDispatchResult (copy), BatchUnequipByAssetTypeModule (upval), FFlagAXCustomizeMakeupSupport (upval), SetSlotIndex (copy), UseResult (copy), UseNavigationResult (copy), AvatarScreen (upval), ReactModule (upval), ClearAllButton (upval), UseRoactServiceModuleResult2 (copy), AvatarEditorSubcategories (upval), LookViewportModule (upval), BuildBodySlotViewportPropsFunction (upval), ConstantsModule (upval), UseSelectorResult1 (copy), SlotCircularGradientFrame (upval), UseMemoResult (ref), SlotItemCardThumbnail (upval), SlotType (upval), UseMemoResult1 (ref), FFlagAXMigrateSlotsSignals (upval), UseSlotBasedEditorContextResult (copy), UseRoactServiceModuleResult1 (copy), NormalizeAvatarModule (upval), UseAvatarRouteResult (copy), NavigationParams (upval), ItemView (upval), getCategoryIndices (upval), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult (copy), FFlagAXEditorSubcategoryFilters (upval)
		local config = {
			enableIntroScroll = true,
			slotCategory = UseSignalStateResult,
			slotIndex = UseSignalStateResult1,
			index = Constants.SlotEditorCategories[UseSignalStateResult].index,
			slots = {},
			buttonPadding = UseSlotItemCardBreakpointsResult.scrollingFramePadding.buttonPadding,
			contentPadding = UseSlotItemCardBreakpointsResult.scrollingFramePadding.contentPadding,
			enableSnapToSelectedItem = UseSlotItemCardBreakpointsResult.enableSnapToSelectedSlot,
			AutomaticSize = Enum.AutomaticSize.Y,
			slotSubNavigationFrameHeight = UseSlotItemCardBreakpointsResult.slotCardTotalHeight,
			canShowTooltip = if FFlagAXSlotBasedEditorCategoryTooltip then UseMemoResult3 else nil
		}
		
		if UseSignalStateResult ~= Categories.Body then
			config.clearAllButton = {
				onActivated = function()
					-- upvalues: FFlagAXEnableClearAllConfirmationPromptModule (upval), GetAssetTypesByCategoryFunction (upval), UseSignalStateResult (upval), UseSignalStateResult2 (upval), UseDispatchResult (upval), BatchUnequipByAssetTypeModule (upval), FFlagAXCustomizeMakeupSupport (upval), Constants (upval), SetSlotIndex (upval), UseResult (upval), UseNavigationResult (upval), AvatarScreen (upval)
					if FFlagAXEnableClearAllConfirmationPromptModule then
						UseNavigationResult.navigate(AvatarScreen.SlotEditorClearAllConfirmationPrompt, {
							slotCategory = UseSignalStateResult,
							clearAll = function()
								-- upvalues: GetAssetTypesByCategoryFunction (upval), UseSignalStateResult (upval), UseSignalStateResult2 (upval), UseDispatchResult (upval), BatchUnequipByAssetTypeModule (upval), FFlagAXCustomizeMakeupSupport (upval), Constants (upval), SetSlotIndex (upval), UseResult (upval)
								local AssetTypesByCategory = GetAssetTypesByCategoryFunction(UseSignalStateResult, UseSignalStateResult2)
								
								if #AssetTypesByCategory > 0 then
									UseDispatchResult(BatchUnequipByAssetTypeModule(AssetTypesByCategory))
								end
								if FFlagAXCustomizeMakeupSupport and Constants.SlotEditorCategories[UseSignalStateResult].resetSlotOnClearAll then
									SetSlotIndex(1)
									UseResult(UseSignalStateResult2[1])
								end
							end
						})
						
						return
					end
					local AssetTypesByCategory = GetAssetTypesByCategoryFunction(UseSignalStateResult, UseSignalStateResult2)
					
					if #AssetTypesByCategory > 0 then
						UseDispatchResult(BatchUnequipByAssetTypeModule(AssetTypesByCategory))
					end
				end,
				renderHeaderSlot = function()
					-- upvalues: ReactModule (upval), ClearAllButton (upval)
					return ReactModule.createElement(ClearAllButton)
				end,
				Size = UseSlotItemCardBreakpointsResult.itemCardSize,
				text = UseRoactServiceModuleResult2:Format("Feature.Avatar.Action.Clear")
			}
		end
		for i, value in UseSignalStateResult2 do
			table.insert(config.slots, {
				renderHeaderSlot = function()
					-- upvalues: value (copy), AvatarEditorSubcategories (upval), ReactModule (upval), LookViewportModule (upval), BuildBodySlotViewportPropsFunction (upval), ConstantsModule (upval), UseSelectorResult1 (upval), SlotCircularGradientFrame (upval), UseMemoResult (upval), SlotItemCardThumbnail (upval), UseSlotItemCardBreakpointsResult (upval)
					if value.editorSubcategory == AvatarEditorSubcategories.PurchasedCharacters then
						return ReactModule.createElement(LookViewportModule, BuildBodySlotViewportPropsFunction(ConstantsModule.DefaultBodyColor3, UseSelectorResult1))
					end
					if value.editorSubcategory == AvatarEditorSubcategories.Skin then
						return ReactModule.createElement(SlotCircularGradientFrame, { Colors = UseMemoResult })
					end
					if value.editorSubcategory == AvatarEditorSubcategories.Build then
						return ReactModule.createElement(SlotItemCardThumbnail, {
							ignoredUrl = true,
							icon = value.icon,
							iconFrameStyles = UseSlotItemCardBreakpointsResult.slotItemCardThumbnailStyles.iconFrameStyles
						})
					end
					local EnableThumbnailOverlay = false
					
					if table.find(value.assetTypes, Enum.AvatarAssetType.Face) then
						local UseSelectorResultEntry = UseSelectorResult1[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
						
						if UseSelectorResultEntry ~= nil and next(UseSelectorResultEntry) then
							EnableThumbnailOverlay = true
						end
					end
					return ReactModule.createElement(SlotItemCardThumbnail, {
						url = value.thumbnailUrl,
						icon = value.icon,
						enableThumbnailOverlay = EnableThumbnailOverlay,
						iconFrameStyles = UseSlotItemCardBreakpointsResult.slotItemCardThumbnailStyles.iconFrameStyles
					})
				end,
				BackgroundTransparency = if value.thumbnailUrl or value.editorSubcategory == AvatarEditorSubcategories.Skin or value.editorSubcategory == AvatarEditorSubcategories.Build or value.editorSubcategory == AvatarEditorSubcategories.PurchasedCharacters then nil else 1,
				title = if FFlagAXCustomizeMakeupSupport and value.slotType == SlotType.LayeredSlot then UseMemoResult1[value.nameTranslationKey .. "_" .. value.layerIndex + 1] else UseMemoResult1[value.nameTranslationKey],
				Size = UseSlotItemCardBreakpointsResult.itemCardSize,
				isActive = i == (if FFlagAXMigrateSlotsSignals then UseSignalStateResult1 else UseSlotBasedEditorContextResult.slotIndex),
				editorSubcategory = value.editorSubcategory,
				slotType = if FFlagAXCustomizeMakeupSupport then value.slotType or SlotType.BaseSlot else nil,
				onActivated = function()
					-- upvalues: UseRoactServiceModuleResult1 (upval), value (copy), FFlagAXCustomizeMakeupSupport (upval), i (copy), UseSignalStateResult1 (upval), SetSlotIndex (upval), UseResult (upval), UseSignalStateResult2 (upval), UseDispatchResult (upval), NormalizeAvatarModule (upval), UseAvatarRouteResult (upval), AvatarScreen (upval), UseNavigationResult (upval), NavigationParams (upval), ItemView (upval), getCategoryIndices (upval), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult (upval), FFlagAXEditorSubcategoryFilters (upval)
					UseRoactServiceModuleResult1.slotClick(value)
					local v8 = nil
					local v9 = nil
					local v10 = nil
					
					if FFlagAXCustomizeMakeupSupport then
						if value.deselectable and i == UseSignalStateResult1 then
							SetSlotIndex(1)
							UseResult(UseSignalStateResult2[1])
							UseDispatchResult(NormalizeAvatarModule())
							
							return
						end
						UseResult(value)
						local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.LookDetails
						UseNavigationResult.navigate(AvatarScreen.AvatarEditor, { [NavigationParams.itemView] = ItemView.SlotItems })
						
						if IsNameMatch then
							UseNavigationResult.navigate(AvatarScreen.LookDetails)
						end
						if not UseSignalStateResult2[i].deselectable or i ~= UseSignalStateResult1 then
							SetSlotIndex(i)
							
							return
						end
					else
						if v8 == nil then
							v8, v9, v102 = getCategoryIndices(value.editorSubcategory)
						end
						if v8 and v9 then
							UseDispatchResult(SetCategoryAndSubcategoryModule(v8, v9, UseRoactServiceModuleResult, if FFlagAXEditorSubcategoryFilters then v10 else nil))
							local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.LookDetails
							UseNavigationResult.navigate(AvatarScreen.AvatarEditor, { [NavigationParams.itemView] = ItemView.SlotItems })
							
							if IsNameMatch then
								UseNavigationResult.navigate(AvatarScreen.LookDetails)
							end
							if not UseSignalStateResult2[i].deselectable or i ~= UseSignalStateResult1 then
								SetSlotIndex(i)
							end
						end
					end
				end,
				hide = if FFlagAXCustomizeMakeupSupport then value.hide else nil
			})
		end
		return config
	end, {
		UseSignalStateResult1, UseSignalStateResult, UseTokensResult, UseMemoResult1,
		UseDispatchResult, UseRoactServiceModuleResult1, UseRoactServiceModuleResult,
		UseNavigationResult,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseSignalStateResult2 else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseSlotItemCardBreakpointsResult else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseSelectorResult1 else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseMemoResult else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseSlotBasedEditorContextResult else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseAvatarRouteResult else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then SetSlotIndex else nil,
		if FFlagAXImproveSlotBasedEditorPerformanceModule then UseRoactServiceModuleResult2 else nil,
		if FFlagAXSlotBasedEditorCategoryTooltip then UseMemoResult3 else nil,
		if FFlagAXCustomizeMakeupSupport then AvatarEditorCategoriesModule else nil
	})
	local NavHeight = UseSlotItemCardBreakpointsResult.navHeight
	
	if #UseMemoResult4.slots > 0 then
		NavHeight += UseSlotItemCardBreakpointsResult.slotCardTotalHeight
	end
	local AvatarEditorCategoriesModuleEntry = AvatarEditorCategoriesModule and AvatarEditorCategoriesModule[v3]
	local Subcategory = AvatarEditorCategoriesModuleEntry and (AvatarEditorCategoriesModuleEntry.Subcategories and AvatarEditorCategoriesModuleEntry.Subcategories[v4])
	local HideFilter = Subcategory and Subcategory.hideFilter
	
	return {
		slotNavigationProps = UseMemoResult2,
		slotSubNavigationProps = UseMemoResult4,
		ref = UseRefResult,
		navigationFrameHeight = NavHeight,
		slotSubNavigationFill = FFlagAXSlotsDisableScrollAwayOnLandscape and p1.slotSubNavigationFill or 1,
		slotCardTotalHeight = UseSlotItemCardBreakpointsResult.slotCardTotalHeight,
		navHeight = UseSlotItemCardBreakpointsResult.navHeight,
		disableScrollAway = if FFlagAXSlotsDisableScrollAwayOnLandscape then NoUseSelectorResult else nil,
		absoluteSizeChanged = if FFlagAXSlotsDisableScrollAwayOnLandscape then p1.absoluteSizeChanged else nil,
		hideFilter = AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.hideFilter or HideFilter
	}
end