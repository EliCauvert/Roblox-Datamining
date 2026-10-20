local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local ScreenLayout = AvatarExperienceSlotBasedEditorModule.Enums.ScreenLayout
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RemoveNewAssetNotificationModule = require(Modules.AvatarExperience.Common.Actions.RemoveNewAssetNotification)
local RemoveNewOutfitNotificationModule = require(Modules.AvatarExperience.Common.Actions.RemoveNewOutfitNotification)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local NavigationFrameModule = require(Modules.AvatarExperience.Common.Components.NavBar.NavigationFrame)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local NavigatedToDeepLinkAvatarEditorModule = require(Modules.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local ItemView = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.ItemView
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	[ConstantsModule.PageType.Animation] = "Feature.Avatar.Message.R15AnimationsPrompt",
	[ConstantsModule.PageType.Emotes] = "Feature.Avatar.Message.R15EmotesPrompt",
	[ConstantsModule.PageType.BodyStyle] = "Feature.Avatar.Message.R15StylesPrompt"
}

local function selectAvatarType(p1)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType
end

local function selectSelectedCategoryIndex(p1)
	return p1.AvatarExperience.AvatarEditor.Categories.category
end

local function selectSelectedSubcategoryIndex(p1)
	return p1.AvatarExperience.AvatarEditor.Categories.subcategory
end

local function selectNewItemNotifications(p1)
	return p1.AvatarExperience.AvatarEditor.NewItemNotifications
end

local function selectExternalNavigationRequest(p1)
	return p1.AvatarExperience.ExternalNavigationRequest or {}
end

return ReactModule.memo(function(Gui)
	-- upvalues: GetAvatarEditorCategoriesModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseSelectorFunction (copy), selectAvatarType (copy), selectSelectedCategoryIndex (copy), selectSelectedSubcategoryIndex (copy), selectNewItemNotifications (copy), selectExternalNavigationRequest (copy), UseSlotBasedEditorContextFunction (copy), ScreenLayout (copy), ItemView (copy), ReactModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UtilsModule (copy), RemoveNewAssetNotificationModule (copy), ConstantsModule (copy), ConstantsModule1 (copy), RemoveNewOutfitNotificationModule (copy), WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy), config (copy), AvatarScreen (copy), SetCategoryAndSubcategoryModule (copy), Exit3DFullViewModule (copy), DeepLinkUtilsModule (copy), NavigatedToDeepLinkAvatarEditorModule (copy), UsePreviousFunction (copy), ClearTryOnsFunction (copy), NavigationUtilsModule (copy), UseAvatarRouteFunction (copy), NavigationFrameModule (copy)
	local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local UseSelectorResult = UseSelectorFunction(selectAvatarType)
	local UseSelectorResult1 = UseSelectorFunction(selectSelectedCategoryIndex)
	local UseSelectorResult2 = UseSelectorFunction(selectSelectedSubcategoryIndex)
	local UseSelectorResult3 = UseSelectorFunction(selectNewItemNotifications)
	local UseSelectorResult4 = UseSelectorFunction(selectExternalNavigationRequest)
	local UseSlotBasedEditorContextResult = UseSlotBasedEditorContextFunction()
	local IsItemViewMatch: boolean = if UseSlotBasedEditorContextResult then UseSlotBasedEditorContextResult.screenLayout == ScreenLayout.PortraitItems and UseSlotBasedEditorContextResult.itemView == ItemView.SlotItems else false
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSlotBasedEditorContextResult (copy)
		if UseSlotBasedEditorContextResult and UseSlotBasedEditorContextResult.handleExitPortraitItems then
			UseSlotBasedEditorContextResult.handleExitPortraitItems()
		end
	end, { UseSlotBasedEditorContextResult })
	local UseResult1 = ReactModule.useCallback(function(p1, p2)
		-- upvalues: GetAvatarEditorCategoriesModule (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), UtilsModule (upval), UseSelectorResult3 (copy), UseDispatchResult (copy), RemoveNewAssetNotificationModule (upval), ConstantsModule (upval), ConstantsModule1 (upval), RemoveNewOutfitNotificationModule (upval)
		local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
		
		if GetFFlagAXEnableSlotBasedEditorModule() then
			local AvatarEditorCategoriesModuleEntry = AvatarEditorCategoriesModule[p1]
			
			if AvatarEditorCategoriesModuleEntry then
				local Subcategory = if AvatarEditorCategoriesModuleEntry.Subcategories then AvatarEditorCategoriesModuleEntry.Subcategories[p2] else nil
				for _, value in UtilsModule.getNotificationItemTypesForCategory(Subcategory or AvatarEditorCategoriesModuleEntry, UseSelectorResult3) do
					if UseSelectorResult3[value] then
						UseDispatchResult(RemoveNewAssetNotificationModule(value))
					end
				end
			end
			return
		else
			local Subcategories = AvatarEditorCategoriesModule[p1].Subcategories
			local AssetTypeIdStrings = Subcategories and Subcategories[p2] and Subcategories[p2].AssetTypeIdStrings or AvatarEditorCategoriesModule[p1].AssetTypeIdStrings
			
			if AssetTypeIdStrings then
				for _, assetTypeIdString in AssetTypeIdStrings do
					if UseSelectorResult3[assetTypeIdString] then
						UseDispatchResult(RemoveNewAssetNotificationModule(assetTypeIdString))
					end
				end
				return
			elseif UseSelectorResult3[ConstantsModule.NewOutfitNotificationKey] then
				if Subcategories and Subcategories[p2] and Subcategories[p2].SearchUuid == ConstantsModule1.PurchasedCharacterKey then
					UseDispatchResult(RemoveNewOutfitNotificationModule(ConstantsModule.OutfitTypes.Avatar))
					
					return
				end
			elseif UseSelectorResult3[ConstantsModule.NewDHOutfitNotificationKey] and Subcategories and Subcategories[p2] and Subcategories[p2].Name == "Style" then
				UseDispatchResult(RemoveNewOutfitNotificationModule(ConstantsModule.OutfitTypes.DynamicHead))
			end
		end
	end, { UseSelectorResult3, UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusControllerResult (copy)
		local WasLastInputGamepadResult = WasLastInputGamepadFunction()
		LogOnOverlayClosedFunction("Navigation", WasLastInputGamepadResult)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and WasLastInputGamepadResult then
			UseFocusControllerResult.captureFocus()
		end
	end, {
		if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerResult
	})
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: config (upval), UseNavigationResult (copy), AvatarScreen (upval), UseResult2 (copy)
		local Entry = config[p3]
		
		if Entry ~= nil then
			UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, { onOverlayClosed = UseResult2, bodyTextKey = Entry })
		end
	end, { UseNavigationResult, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(SelectedCategoryIndex, SelectedSubcategoryIndex)
		-- upvalues: Gui (copy), UseSelectorResult1 (copy), UseSelectorResult2 (copy), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), Exit3DFullViewModule (upval), UseNavigationResult (copy)
		if Gui.backToTopSignal and (SelectedCategoryIndex == nil or SelectedCategoryIndex == UseSelectorResult1) and (SelectedSubcategoryIndex == nil or SelectedSubcategoryIndex == UseSelectorResult2) then
			Gui.backToTopSignal:fire()
		end
		UseDispatchResult(SetCategoryAndSubcategoryModule(SelectedCategoryIndex, SelectedSubcategoryIndex, Gui.analytics))
		UseDispatchResult(Exit3DFullViewModule(Gui.axAnalytics, UseNavigationResult.state.routeName))
	end, {
		Gui.backToTopSignal, UseSelectorResult1, UseSelectorResult2, Gui.analytics,
		Gui.axAnalytics, UseNavigationResult.state.routeName, UseDispatchResult
	})
	local UseResult5 = ReactModule.useCallback(function(p3)
		-- upvalues: UseResult1 (copy), UseResult4 (copy), UseSelectorResult (copy), ConstantsModule (upval), GetAvatarEditorCategoriesModule (upval), UseResult3 (copy)
		UseResult1(p3, 1)
		UseResult4(p3, nil)
		
		if UseSelectorResult == ConstantsModule.AvatarType.R6 then
			UseResult3(GetAvatarEditorCategoriesModule()[p3].PageType)
		end
	end, { UseResult1, UseResult4, UseSelectorResult })
	local UseResult6 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult2 (copy)
		local IsNotUseSelectorResultMatch = UseSelectorResult1 ~= p3.selectedCategoryIndex
		local IsNotUseSelectorResultMatch1 = UseSelectorResult2 ~= p3.selectedSubcategoryIndex
		
		if not IsNotUseSelectorResultMatch and not IsNotUseSelectorResultMatch1 then return end
		if IsNotUseSelectorResultMatch and p4.current then
			p4.current.CanvasPosition = Vector2.new()
		end
	end, { UseSelectorResult1, UseSelectorResult2 })
	local UseResult7 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseResult1 (copy), UseSelectorResult (copy), ConstantsModule (upval), GetAvatarEditorCategoriesModule (upval), UseResult3 (copy), UseResult4 (copy)
		UseResult1(p3, p4)
		
		if UseSelectorResult == ConstantsModule.AvatarType.R6 then
			local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[p3]
			
			if AvatarEditorCategoriesModuleEntry then
				local Subcategory = AvatarEditorCategoriesModuleEntry.Subcategories[p4]
				
				if Subcategory then
					UseResult3(Subcategory.PageType)
				end
			end
		end
		UseResult4(nil, p4)
	end, { UseResult1, UseSelectorResult, UseResult3, UseResult4 })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult4 (copy), DeepLinkUtilsModule (upval), UseDispatchResult (copy), NavigatedToDeepLinkAvatarEditorModule (upval)
		local Params = UseSelectorResult4.params or {}
		
		if DeepLinkUtilsModule.avatarEditorDeepLinkExists(UseSelectorResult4) then
			UseDispatchResult(NavigatedToDeepLinkAvatarEditorModule({
				category = Params.category,
				subcategory = Params.subcategory
			}))
		end
	end, { UseSelectorResult4, UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationResult (copy), UseResult5 (copy), UseResult7 (copy)
		local AvatarEditorCategoryParam = UseNavigationResult.getParam("avatarEditorCategory")
		
		if AvatarEditorCategoryParam then
			UseResult5(AvatarEditorCategoryParam)
		end
		local AvatarEditorSubcategoryParam = UseNavigationResult.getParam("avatarEditorSubcategory")
		
		if AvatarEditorSubcategoryParam then
			UseResult7(AvatarEditorCategoryParam, AvatarEditorSubcategoryParam)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult8 (copy)
		UseResult8()
	end)
	local UsePreviousResult = UsePreviousFunction(UseSelectorResult1)
	local UsePreviousResult1 = UsePreviousFunction(UseSelectorResult2)
	local UseRefResult = ReactModule.useRef(true)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseSelectorResult1 (copy), UsePreviousResult (copy), UseSelectorResult2 (copy), UsePreviousResult1 (copy), DeepLinkUtilsModule (upval), UseSelectorResult4 (copy), UseDispatchResult (copy), ClearTryOnsFunction (upval), NavigationUtilsModule (upval), UseNavigationResult (copy)
		if UseRefResult.current then
			UseRefResult.current = false
			
			return
		end
		if not DeepLinkUtilsModule.avatarEditorDeepLinkExists(UseSelectorResult4) and (UseSelectorResult1 ~= UsePreviousResult or UseSelectorResult2 ~= UsePreviousResult1) then
			UseDispatchResult(ClearTryOnsFunction())
			NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
		end
	end, {
		UseSelectorResult1,
		UseSelectorResult2,
		UseSelectorResult4,
		UseDispatchResult,
		UseNavigationResult
	})
	local Name = UseAvatarRouteFunction().opaque.name
	local UsePreviousResult2 = UsePreviousFunction(Name)
	ReactModule.useEffect(function()
		-- upvalues: Name (copy), AvatarScreen (upval), UsePreviousResult2 (copy), UseResult1 (copy), UseSelectorResult1 (copy), UseSelectorResult2 (copy)
		local IsNameMatch = Name == AvatarScreen.AvatarEditor
		
		if Name ~= UsePreviousResult2 and IsNameMatch then
			UseResult1(UseSelectorResult1, UseSelectorResult2)
		end
	end, { Name, UseSelectorResult1, UseSelectorResult2, UseResult1 })
	local AvatarEditorCategoryParam = UseNavigationResult.getParam("avatarEditorCategory")
	local UsePreviousResult3 = UsePreviousFunction(AvatarEditorCategoryParam)
	ReactModule.useEffect(function()
		-- upvalues: AvatarEditorCategoryParam (copy), UsePreviousResult3 (copy), UseResult5 (copy)
		if AvatarEditorCategoryParam and AvatarEditorCategoryParam ~= UsePreviousResult3 then
			UseResult5(AvatarEditorCategoryParam)
		end
	end, { AvatarEditorCategoryParam, UseResult5 })
	local AvatarEditorSubcategoryParam = UseNavigationResult.getParam("avatarEditorSubcategory")
	local UsePreviousResult4 = UsePreviousFunction(AvatarEditorSubcategoryParam)
	ReactModule.useEffect(function()
		-- upvalues: AvatarEditorSubcategoryParam (copy), UsePreviousResult4 (copy), UseResult7 (copy), AvatarEditorCategoryParam (copy)
		if AvatarEditorSubcategoryParam and AvatarEditorSubcategoryParam ~= UsePreviousResult4 then
			UseResult7(AvatarEditorCategoryParam, AvatarEditorSubcategoryParam)
		end
	end, {
		AvatarEditorCategoryParam,
		AvatarEditorSubcategoryParam,
		UseResult7
	})
	
	return ReactModule.createElement(NavigationFrameModule, {
		shouldUseCategoryId = false,
		selectCategoryId = nil,
		selectedSubcategoryId = nil,
		selectSubcategoryId = nil,
		layoutOrderMain = Gui.layoutOrderMain,
		navHeightMain = Gui.navHeightMain,
		layoutOrderSub = Gui.layoutOrderSub,
		navHeightSub = Gui.navHeightSub,
		categoryTable = AvatarEditorCategoriesModule,
		selectedCategoryIndex = UseSelectorResult1,
		selectCategory = UseResult5,
		selectedSubcategoryIndex = UseSelectorResult2,
		subcategoryTable = AvatarEditorCategoriesModule[UseSelectorResult1].Subcategories,
		onSubNavigationPropsDidUpdate = UseResult6,
		selectSubcategory = UseResult7,
		absoluteSizeChanged = Gui.absoluteSizeChanged,
		replaceMainNavigationWithCloseableHeader = IsItemViewMatch,
		onCloseableHeaderClosed = UseResult,
		navigationFrameRef = Gui.navBarRef,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown
	})
end)