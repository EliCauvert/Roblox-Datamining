local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local RemoveNewAssetNotificationModule = require(Modules.AvatarExperience.Common.Actions.RemoveNewAssetNotification)
local RemoveNewOutfitNotificationModule = require(Modules.AvatarExperience.Common.Actions.RemoveNewOutfitNotification)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local NavigationFrameModule = require(Modules.AvatarExperience.Common.Components.NavBar.NavigationFrame)
local WithOpaqueAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withOpaqueAvatarRoute)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local NavigatedToDeepLinkAvatarEditorModule = require(Modules.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local Navigation = RoactModule.PureComponent:extend("Navigation")
Navigation.validateProps = TModule.strictInterface({
	analytics = TModule.table,
	axAnalytics = TModule.table,
	layoutOrderMain = TModule.number,
	layoutOrderSub = TModule.number,
	navHeightMain = TModule.number,
	navHeightSub = TModule.number,
	absoluteSizeChanged = TModule.callback,
	navBarRef = TModule.table,
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	backToTopSignal = TModule.optional(TModule.table),
	avatarType = TModule.string,
	selectedCategoryIndex = TModule.number,
	selectedSubcategoryIndex = TModule.number,
	newItemNotifications = TModule.table,
	externalNavigationRequest = TModule.table,
	exit3DFullView = TModule.callback,
	setCategoryAndSubcategory = TModule.callback,
	clearTryOns = TModule.callback,
	removeNewAssetNotification = TModule.callback,
	removeNewOutfitNotification = TModule.callback,
	navigatedToDeepLinkAvatarEditor = TModule.callback,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	navigation = TModule.table,
	opaqueRoute = TModule.table,
	networking = TModule.callback
})

function Navigation.removeNewItemNotificationIfNeeded(p1, SelectedCategoryIndex, SelectedSubcategoryIndex)
	-- upvalues: GetAvatarEditorCategoriesModule (copy), ConstantsModule (copy), ConstantsModule1 (copy)
	local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
	local Subcategories = AvatarEditorCategoriesModule[SelectedCategoryIndex].Subcategories
	local AssetTypeIdStrings = Subcategories and Subcategories[SelectedSubcategoryIndex] and Subcategories[SelectedSubcategoryIndex].AssetTypeIdStrings or AvatarEditorCategoriesModule[SelectedCategoryIndex].AssetTypeIdStrings
	
	if AssetTypeIdStrings then
		for _, assetTypeIdString in AssetTypeIdStrings do
			if p1.props.newItemNotifications[assetTypeIdString] then
				p1.props.removeNewAssetNotification(assetTypeIdString)
			end
		end
		return
	elseif p1.props.newItemNotifications[ConstantsModule.NewOutfitNotificationKey] then
		if Subcategories and Subcategories[SelectedSubcategoryIndex] and Subcategories[SelectedSubcategoryIndex].SearchUuid == ConstantsModule1.PurchasedCharacterKey then
			p1.props.removeNewOutfitNotification(ConstantsModule.OutfitTypes.Avatar)
			
			return
		end
	elseif p1.props.newItemNotifications[ConstantsModule.NewDHOutfitNotificationKey] and Subcategories and Subcategories[SelectedSubcategoryIndex] and Subcategories[SelectedSubcategoryIndex].Name == "Style" then
		p1.props.removeNewOutfitNotification(ConstantsModule.OutfitTypes.DynamicHead)
	end
end

function Navigation.setCategoryAndSubcategory(p2, SelectedCategoryIndex, SelectedSubcategoryIndex)
	local Analytics = p2.props.analytics
	local AxAnalytics = p2.props.axAnalytics
	local Navigation = p2.props.navigation
	local BackToTopSignal = p2.props.backToTopSignal
	
	if BackToTopSignal and (SelectedCategoryIndex == nil or SelectedCategoryIndex == p2.props.selectedCategoryIndex) and (SelectedSubcategoryIndex == nil or SelectedSubcategoryIndex == p2.props.selectedSubcategoryIndex) then
		BackToTopSignal:fire()
	end
	p2.props.setCategoryAndSubcategory(SelectedCategoryIndex, SelectedSubcategoryIndex, Analytics)
	p2.props.exit3DFullView(AxAnalytics, Navigation.state.routeName)
end

function Navigation.init(p2)
	-- upvalues: ConstantsModule (copy), AvatarScreen (copy), GetAvatarEditorCategoriesModule (copy), WasLastInputGamepadFunction (copy), LogOnOverlayClosedFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	local function promptR15UpgradeIfNecessary(PageType)
		-- upvalues: ConstantsModule (upval), p2 (copy), AvatarScreen (upval)
		local Entry = ({
			[ConstantsModule.PageType.Animation] = "Feature.Avatar.Message.R15AnimationsPrompt",
			[ConstantsModule.PageType.Emotes] = "Feature.Avatar.Message.R15EmotesPrompt",
			[ConstantsModule.PageType.BodyStyle] = "Feature.Avatar.Message.R15StylesPrompt"
		})[PageType]
		
		if Entry ~= nil then
			p2.props.navigation.navigate(AvatarScreen.R15UpgradePrompt, {
				onOverlayClosed = p2.onR15PromptClosed,
				bodyTextKey = Entry
			})
		end
	end
	
	function p2.selectCategory(AvatarEditorCategoryParam)
		-- upvalues: p2 (copy), ConstantsModule (upval), GetAvatarEditorCategoriesModule (upval), promptR15UpgradeIfNecessary (copy)
		p2:removeNewItemNotificationIfNeeded(AvatarEditorCategoryParam, 1)
		p2:setCategoryAndSubcategory(AvatarEditorCategoryParam, nil)
		
		if p2.props.avatarType == ConstantsModule.AvatarType.R6 then
			promptR15UpgradeIfNecessary(GetAvatarEditorCategoriesModule()[AvatarEditorCategoryParam].PageType)
		end
	end
	
	function p2.onR15PromptClosed()
		-- upvalues: WasLastInputGamepadFunction (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p2 (copy)
		local WasLastInputGamepadResult = WasLastInputGamepadFunction()
		LogOnOverlayClosedFunction("Navigation", WasLastInputGamepadResult)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and WasLastInputGamepadResult then
			p2.props.focusController.captureFocus()
		end
	end
	
	function p2.selectSubcategory(AvatarEditorCategoryParam, AvatarEditorSubcategoryParam)
		-- upvalues: p2 (copy), ConstantsModule (upval), GetAvatarEditorCategoriesModule (upval), promptR15UpgradeIfNecessary (copy)
		p2:removeNewItemNotificationIfNeeded(AvatarEditorCategoryParam, AvatarEditorSubcategoryParam)
		
		if p2.props.avatarType == ConstantsModule.AvatarType.R6 then
			local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[AvatarEditorCategoryParam]
			
			if AvatarEditorCategoriesModuleEntry then
				local Subcategory = AvatarEditorCategoriesModuleEntry.Subcategories[AvatarEditorSubcategoryParam]
				
				if Subcategory then
					promptR15UpgradeIfNecessary(Subcategory.PageType)
				end
			end
		end
		p2:setCategoryAndSubcategory(nil, AvatarEditorSubcategoryParam)
	end
	
	local AvatarEditorCategoryParam = p2.props.navigation.getParam("avatarEditorCategory")
	
	if AvatarEditorCategoryParam then
		p2.selectCategory(AvatarEditorCategoryParam)
	end
	local AvatarEditorSubcategoryParam = p2.props.navigation.getParam("avatarEditorSubcategory")
	
	if AvatarEditorSubcategoryParam then
		p2.selectSubcategory(AvatarEditorCategoryParam, AvatarEditorSubcategoryParam)
	end
end

function Navigation.onSubNavigationPropsDidUpdate(p2)
	local SelectedCategoryIndex = p2.props.selectedCategoryIndex
	local SelectedSubcategoryIndex = p2.props.selectedSubcategoryIndex
	
	return function(p3, p4)
		-- upvalues: SelectedCategoryIndex (copy), SelectedSubcategoryIndex (copy)
		local IsNotSelectedCategoryIndexMatch = SelectedCategoryIndex ~= p3.selectedCategoryIndex
		local IsNotSelectedSubcategoryIndexMatch = SelectedSubcategoryIndex ~= p3.selectedSubcategoryIndex
		
		if not IsNotSelectedCategoryIndexMatch and not IsNotSelectedSubcategoryIndexMatch then return end
		if IsNotSelectedCategoryIndexMatch and p4.current then
			p4.current.CanvasPosition = Vector2.new()
		end
	end
end

function Navigation.willUpdate(p2, p3)
	-- upvalues: DeepLinkUtilsModule (copy), NavigationUtilsModule (copy)
	if not DeepLinkUtilsModule.avatarEditorDeepLinkExists(p2.props.externalNavigationRequest) and (p3.selectedCategoryIndex ~= p2.props.selectedCategoryIndex or p3.selectedSubcategoryIndex ~= p2.props.selectedSubcategoryIndex) then
		p2.props.clearTryOns()
		NavigationUtilsModule.closeFiltersAndItemDetails(p2.props.navigation)
	end
end

function Navigation.render(p2)
	-- upvalues: GetAvatarEditorCategoriesModule (copy), RoactModule (copy), NavigationFrameModule (copy)
	local LayoutOrderMain = p2.props.layoutOrderMain
	local LayoutOrderSub = p2.props.layoutOrderSub
	local NavHeightMain = p2.props.navHeightMain
	local NavHeightSub = p2.props.navHeightSub
	local SelectedCategoryIndex = p2.props.selectedCategoryIndex
	local SelectedSubcategoryIndex = p2.props.selectedSubcategoryIndex
	local AbsoluteSizeChanged = p2.props.absoluteSizeChanged
	local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
	
	return RoactModule.createElement(NavigationFrameModule, {
		shouldUseCategoryId = false,
		layoutOrderMain = LayoutOrderMain,
		navHeightMain = NavHeightMain,
		layoutOrderSub = LayoutOrderSub,
		navHeightSub = NavHeightSub,
		categoryTable = AvatarEditorCategoriesModule,
		selectedCategoryIndex = SelectedCategoryIndex,
		selectCategory = p2.selectCategory,
		selectedSubcategoryIndex = SelectedSubcategoryIndex,
		subcategoryTable = AvatarEditorCategoriesModule[SelectedCategoryIndex].Subcategories,
		onSubNavigationPropsDidUpdate = p2:onSubNavigationPropsDidUpdate(),
		selectSubcategory = p2.selectSubcategory,
		absoluteSizeChanged = AbsoluteSizeChanged,
		navigationFrameRef = p2.props.navBarRef,
		NextSelectionUp = p2.props.NextSelectionUp,
		NextSelectionDown = p2.props.NextSelectionDown
	})
end

function Navigation.processAvatarEditorDeepLink(p2)
	-- upvalues: DeepLinkUtilsModule (copy)
	local ExternalNavigationRequest = p2.props.externalNavigationRequest
	local Params = ExternalNavigationRequest.params or {}
	
	if DeepLinkUtilsModule.avatarEditorDeepLinkExists(ExternalNavigationRequest) then
		p2.props.navigatedToDeepLinkAvatarEditor({
			category = Params.category,
			subcategory = Params.subcategory
		})
	end
end

function Navigation.didMount(p2)
	p2:processAvatarEditorDeepLink()
end

function Navigation.didUpdate(p2, p3)
	-- upvalues: AvatarScreen (copy)
	p2:processAvatarEditorDeepLink()
	local Name = p2.props.opaqueRoute.name
	
	if Name ~= p3.opaqueRoute.name and Name == AvatarScreen.AvatarEditor then
		p2:removeNewItemNotificationIfNeeded(p2.props.selectedCategoryIndex, p2.props.selectedSubcategoryIndex)
	end
	local AvatarEditorCategoryParam = p3.navigation.getParam("avatarEditorCategory")
	local AvatarEditorCategoryParam1 = p2.props.navigation.getParam("avatarEditorCategory")
	
	if AvatarEditorCategoryParam1 and AvatarEditorCategoryParam1 ~= AvatarEditorCategoryParam then
		p2.selectCategory(AvatarEditorCategoryParam1)
	end
	local AvatarEditorSubcategoryParam = p3.navigation.getParam("avatarEditorSubcategory")
	local AvatarEditorSubcategoryParam1 = p2.props.navigation.getParam("avatarEditorSubcategory")
	
	if AvatarEditorSubcategoryParam1 and AvatarEditorSubcategoryParam1 ~= AvatarEditorSubcategoryParam then
		p2.selectSubcategory(AvatarEditorCategoryParam1, AvatarEditorSubcategoryParam1)
	end
end

local WithOpaqueAvatarRouteModuleResult = WithOpaqueAvatarRouteModule((WithNavigationFunction((RoactRoduxModule.connect(function(p2)
	return {
		avatarType = p2.AvatarExperience.AvatarEditor.Character.AvatarType,
		selectedCategoryIndex = p2.AvatarExperience.AvatarEditor.Categories.category,
		selectedSubcategoryIndex = p2.AvatarExperience.AvatarEditor.Categories.subcategory,
		newItemNotifications = p2.AvatarExperience.AvatarEditor.NewItemNotifications,
		externalNavigationRequest = p2.AvatarExperience.ExternalNavigationRequest or {}
	}
end, function(Callback)
	-- upvalues: SetCategoryAndSubcategoryModule (copy), ClearTryOnsFunction (copy), RemoveNewAssetNotificationModule (copy), RemoveNewOutfitNotificationModule (copy), Exit3DFullViewModule (copy), NavigatedToDeepLinkAvatarEditorModule (copy)
	return {
		setCategoryAndSubcategory = function(p2, p3, p4)
			-- upvalues: Callback (copy), SetCategoryAndSubcategoryModule (upval)
			Callback(SetCategoryAndSubcategoryModule(p2, p3, p4))
		end,
		clearTryOns = function()
			-- upvalues: Callback (copy), ClearTryOnsFunction (upval)
			Callback(ClearTryOnsFunction())
		end,
		removeNewAssetNotification = function(p2)
			-- upvalues: Callback (copy), RemoveNewAssetNotificationModule (upval)
			Callback(RemoveNewAssetNotificationModule(p2))
		end,
		removeNewOutfitNotification = function(p2)
			-- upvalues: Callback (copy), RemoveNewOutfitNotificationModule (upval)
			Callback(RemoveNewOutfitNotificationModule(p2))
		end,
		exit3DFullView = function(p2, p3)
			-- upvalues: Callback (copy), Exit3DFullViewModule (upval)
			Callback(Exit3DFullViewModule(p2, p3))
		end,
		navigatedToDeepLinkAvatarEditor = function(p2)
			-- upvalues: Callback (copy), NavigatedToDeepLinkAvatarEditorModule (upval)
			Callback(NavigatedToDeepLinkAvatarEditorModule(p2))
		end
	}
end)((RoactServices.connect({ networking = RoactNetworkingModule })(Navigation)))))))

return if FFlagAXMigrateAXToGlobalAutofocus then WithOpaqueAvatarRouteModuleResult else function(p2)
	-- upvalues: RoactGamepadModule (copy), RoactModule (copy), WithOpaqueAvatarRouteModuleResult (ref), CryoModule (copy)
	return RoactGamepadModule.withFocusController(function(FocusController)
		-- upvalues: RoactModule (upval), WithOpaqueAvatarRouteModuleResult (upval), CryoModule (upval), p2 (copy)
		return RoactModule.createElement(WithOpaqueAvatarRouteModuleResult, CryoModule.Dictionary.join(p2, { focusController = FocusController }))
	end)
end