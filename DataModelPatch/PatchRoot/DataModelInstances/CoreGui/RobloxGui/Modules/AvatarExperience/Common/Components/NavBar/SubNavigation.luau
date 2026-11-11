local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameHorizontal = RoactFitComponents.FitFrameHorizontal
local WithStyleFunction = UIBloxModule.Style.withStyle
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FindValueKeyInRefCacheFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.findValueKeyInRefCache
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateMainNavigationInputBindings = AvatarExperienceFlagsModule.FFlagAXMigrateMainNavigationInputBindings
local ConstantsModule = require(Modules.LuaApp.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local DEPRECATEDCategoryButtonModule = require(Modules.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton)
local NavHighlightModule = require(Modules.AvatarExperience.Common.Components.NavBar.NavHighlight)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local HeadCategoryTooltipStorageModule = require(Modules.AvatarExperience.Common.Util.HeadCategoryTooltipStorage)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogHeadCategoryCombineIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP)
local ScrollingListWithArrowsAndGradientModule = require(Modules.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local UseTabNavigationFocusNavigationBindingsModule = require(script.Parent.useTabNavigationFocusNavigationBindings)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXCategoryUnifiedLogging = AvatarExperienceFlagsModule.FFlagAXCategoryUnifiedLogging
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local SubNavigation = RoactModule.PureComponent:extend("SubNavigation")
local config = {
	Style = true,
	Heads = not AXCatalogHeadCategoryCombineIXPModule.isEnabled() or nil
}
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }

local function _(List, Id)
	if not List or not Id then
		return nil
	end
	for i, value in List do
		if value.Id == Id then
			return i
		end
	end
	return nil
end

SubNavigation.validateProps = TModule.strictInterface({
	layoutOrder = TModule.number,
	navHeight = TModule.number,
	selectedCategoryIndex = TModule.optional(TModule.number),
	selectedSubcategoryIndex = TModule.optional(TModule.number),
	selectSubcategory = TModule.optional(TModule.callback),
	selectedCategoryId = TModule.optional(TModule.string),
	selectedSubcategoryId = TModule.optional(TModule.string),
	selectSubcategoryId = TModule.optional(TModule.callback),
	shouldUseCategoryId = TModule.optional(TModule.boolean),
	subcategories = TModule.optional(TModule.table),
	onSubNavigationPropsDidUpdate = TModule.callback,
	isHidden = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then TModule.optional(TModule.boolean) else nil,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	BackgroundColor3 = if GetFFlagAXEnableSlotBasedEditorModule() then TModule.optional(TModule.Color3) else nil,
	BackgroundTransparency = if GetFFlagAXEnableSlotBasedEditorModule() then TModule.optional(TModule.number) else nil,
	subNavigationRef = TModule.optional(TModule.table),
	lastInputGroup = TModule.string,
	newItemNotifications = TModule.table,
	unifiedLoggingSurface = if FFlagAXCategoryUnifiedLogging then TModule.optional(TModule.integer) else nil,
	navigation = TModule.table,
	frameRef = if FFlagAXMigrateMainNavigationInputBindings then TModule.table else nil,
	navButtonRefs = if FFlagAXMigrateMainNavigationInputBindings then TModule.table else nil
})

local function animatedFrameMapValuesToProps(p1)
	return { Size = UDim2.new(1, 0, 0, p1.height) }
end

function SubNavigation.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXMigrateMainNavigationInputBindings (copy), RoactGamepadModule (copy)
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.navButtonRefs = if FFlagAXMigrateMainNavigationInputBindings then nil else RoactGamepadModule.createRefCache()
	p1.categoryButtonRefs = {}
	p1:setState({
		selectedCategoryButtonInstance = nil,
		renderHighlight = false
	})
	
	function p1.onNavFrameSizeChanged(Frame)
		-- upvalues: p1 (copy)
		if p1.scrollingFrameRef.current then
			p1.scrollingFrameRef.current.CanvasSize = UDim2.new(0, Frame.AbsoluteSize.X, 1, 0)
		end
	end
end

function SubNavigation.getCategoryButtonRef(p1, Id)
	-- upvalues: RoactModule (copy)
	if not p1.categoryButtonRefs[Id] then
		p1.categoryButtonRefs[Id] = RoactModule.createRef()
	end
	return p1.categoryButtonRefs[Id]
end

function SubNavigation.tryUpdateScrollingFramePosition(p1, X1: number, X2: number)
	local Value = p1.scrollingFrameRef and p1.scrollingFrameRef:getValue()
	local X = (X1 or 0) - 50
	
	if Value then
		local X3 = Value.AbsoluteWindowSize.X
		
		if not X3 or X3 == 0 then return end
		if (X1 <= 0 or X1 >= X3) and (X1 + X2 <= 0 or X1 + X2 >= X3) then
			Value.CanvasPosition = Vector2.new(X, Value.CanvasPosition.Y)
		end
	end
end

function SubNavigation.setCategoryPositionAndWidthState(p1): boolean
	if p1.props.shouldUseCategoryId then
		if not p1.categoryButtonRefs or not p1.props.selectedSubcategoryId or not p1.categoryButtonRefs[p1.props.selectedSubcategoryId] then
			p1:setState({ renderHighlight = false })
			
			return false
		end
	elseif not p1.categoryButtonRefs or not p1.props.selectedSubcategoryIndex or not p1.categoryButtonRefs[p1.props.selectedSubcategoryIndex] then
		p1:setState({ renderHighlight = false })
		
		return false
	end
	local Value = p1.categoryButtonRefs[if p1.props.shouldUseCategoryId then p1.props.selectedSubcategoryId else p1.props.selectedSubcategoryIndex]:getValue()
	
	if Value == nil then
		p1:setState({ renderHighlight = false })
		
		return false
	else
		p1:tryUpdateScrollingFramePosition(Value.AbsolutePosition.X, Value.AbsoluteSize.X)
		p1:setState({
			renderHighlight = true,
			selectedCategoryButtonInstance = Value
		})
		
		return true
	end
end

function SubNavigation.didMount(p2)
	p2:setCategoryPositionAndWidthState()
	
	if p2.scrollingFrameRef.current then
		p2.scrollingFrameRef.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function()
			-- upvalues: p2 (copy)
			p2:setCategoryPositionAndWidthState()
		end)
	end
end

function SubNavigation.didUpdate(p2, p3)
	p2.props.onSubNavigationPropsDidUpdate(p3, p2.scrollingFrameRef)
	
	if p2.props.shouldUseCategoryId then
		if p2.props.selectedSubcategoryId ~= p3.selectedSubcategoryId or p2.props.selectedCategoryId ~= p3.selectedCategoryId then
			p2:setCategoryPositionAndWidthState()
			
			return
		end
	elseif p2.props.selectedSubcategoryIndex ~= p3.selectedSubcategoryIndex or p2.props.selectedCategoryIndex ~= p3.selectedCategoryIndex then
		p2:setCategoryPositionAndWidthState()
	end
end

function SubNavigation.getRouteName(p2)
	return p2.props.navigation.state.routeName
end

local _ = function(p2, p3)
	-- upvalues: ConstantsModule2 (copy), ConstantsModule1 (copy)
	local v1 = p2.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead and p3[ConstantsModule1.NewDHOutfitNotificationKey]
	
	return p2.SearchUuid == ConstantsModule2.PurchasedCharacterKey and p3[ConstantsModule1.NewOutfitNotificationKey] or v1
end

function SubNavigation.hasNewItemNotification(p2, LayoutOrder, Subcategories)
	-- upvalues: AvatarScreen (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UtilsModule (copy), ConstantsModule2 (copy), ConstantsModule1 (copy)
	if p2:getRouteName() ~= AvatarScreen.AvatarEditor then
		return false
	end
	local NewItemNotifications = p2.props.newItemNotifications
	local Subcategory = Subcategories[LayoutOrder]
	
	if GetFFlagAXEnableSlotBasedEditorModule() then
		return UtilsModule.shouldNotifyCategory(Subcategory, NewItemNotifications)
	end
	local AssetTypeIdStrings = Subcategory.AssetTypeIdStrings
	
	if AssetTypeIdStrings and UtilsModule.shouldNotifyAssetTypes(AssetTypeIdStrings, NewItemNotifications) then
		return true
	else
		local NewItemNotification = Subcategory.SearchUuid == ConstantsModule2.PurchasedCharacterKey and NewItemNotifications[ConstantsModule1.NewOutfitNotificationKey]
		local NewItemNotification1 = Subcategory.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead and NewItemNotifications[ConstantsModule1.NewDHOutfitNotificationKey]
		
		return if NewItemNotification or NewItemNotification1 then true else false
	end
end

function SubNavigation.hasNewItemNotificationV2(p2, p3)
	-- upvalues: AvatarScreen (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UtilsModule (copy), ConstantsModule2 (copy), ConstantsModule1 (copy)
	if p2:getRouteName() ~= AvatarScreen.AvatarEditor then
		return false
	end
	local NewItemNotifications = p2.props.newItemNotifications
	
	if GetFFlagAXEnableSlotBasedEditorModule() then
		return UtilsModule.shouldNotifyCategory(p3, NewItemNotifications)
	end
	local AssetTypeIdStrings = p3.AssetTypeIdStrings
	
	if AssetTypeIdStrings and UtilsModule.shouldNotifyAssetTypes(AssetTypeIdStrings, NewItemNotifications) then
		return true
	else
		local NewItemNotification = p3.SearchUuid == ConstantsModule2.PurchasedCharacterKey and NewItemNotifications[ConstantsModule1.NewOutfitNotificationKey]
		local NewItemNotification1 = p3.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead and NewItemNotifications[ConstantsModule1.NewDHOutfitNotificationKey]
		
		return if NewItemNotification or NewItemNotification1 then true else false
	end
end

function SubNavigation:onTooltipDismiss(p2)
	-- upvalues: config (copy), HeadCategoryTooltipStorageModule (copy)
	if config[p2.Name] then
		HeadCategoryTooltipStorageModule.setSeenTimestamp()
	end
end

function SubNavigation.renderCategoryButton(p2, p3, SelectedCategoryId, SelectedSubcategoryId, LayoutOrder: number, p4)
	-- upvalues: AXCatalogHeadCategoryCombineIXPModule (copy), IxpUtilsModule (copy), FFlagAXMigrateMainNavigationInputBindings (copy), WithLocalizationFunction (copy), config (copy), HeadCategoryTooltipStorageModule (copy), RoactModule (copy), Focusable (copy), DEPRECATEDCategoryButtonModule (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXCategoryUnifiedLogging (copy), SendUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy), RoactGamepadModule (copy)
	local IsSelectedSubcategoryIdMatch: boolean = if p2.props.shouldUseCategoryId then p2.props.selectedSubcategoryId == p4.Id else SelectedSubcategoryId == LayoutOrder
	local Subcategories = p2.props.subcategories
	local SelectSubcategoryFunction = p2.props.selectSubcategory
	local SelectSubcategoryIdFunction = p2.props.selectSubcategoryId
	local TestVariable = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then IxpUtilsModule.readTestVariable(AXCatalogHeadCategoryCombineIXPModule.EnableHeadCategoryCombination) else nil
	local NavButtonRefs = if FFlagAXMigrateMainNavigationInputBindings then p2.props.navButtonRefs else p2.navButtonRefs
	
	return if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then WithLocalizationFunction({
		headCombineTooltipTitle = "Feature.Avatar.Label.HeadRefinement.CombinedCategories.Tooltip"
	})(function(p5)
		-- upvalues: config (upval), p4 (copy), HeadCategoryTooltipStorageModule (upval), RoactModule (upval), Focusable (upval), DEPRECATEDCategoryButtonModule (upval), FFlagAXCatalogCategoriesSDUI (upval), LayoutOrder (copy), IsSelectedSubcategoryIdMatch (ref), p2 (copy), Subcategories (copy), FFlagAXCategoryUnifiedLogging (upval), NavButtonRefs (copy), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval), SelectSubcategoryIdFunction (copy), SelectedCategoryId (copy), SelectSubcategoryFunction (copy)
		return RoactModule.createElement(Focusable[DEPRECATEDCategoryButtonModule], {
			categoryTitle = p4.Title,
			localizedCategoryTitle = if FFlagAXCatalogCategoriesSDUI then p4.LocalizedTitle else nil,
			layoutOrder = LayoutOrder,
			isSelected = IsSelectedSubcategoryIdMatch,
			shouldUseCategoryId = p2.props.shouldUseCategoryId,
			hasNewItemNotification = if p2.props.shouldUseCategoryId then p2:hasNewItemNotificationV2(p4) else p2:hasNewItemNotification(LayoutOrder, Subcategories),
			frameRef = p2:getCategoryButtonRef(if p2.props.shouldUseCategoryId then p4.Id else LayoutOrder),
			onActivate = function()
				-- upvalues: FFlagAXCategoryUnifiedLogging (upval), NavButtonRefs (upval), p2 (upval), p4 (upval), LayoutOrder (upval), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval), SelectSubcategoryIdFunction (upval), SelectedCategoryId (upval), SelectSubcategoryFunction (upval)
				if FFlagAXCategoryUnifiedLogging then
					local NavButtonRef = NavButtonRefs[if p2.props.shouldUseCategoryId then p4.Id else LayoutOrder]
					
					if NavButtonRef and NavButtonRef.current then
						SendUnifiedEventLogForInstanceFunction(NavButtonRef.current, {
							action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
							elementName = "SELECT_SUBCATEGORY_" .. string.upper(p4.Name),
							surface = p2.props.unifiedLoggingSurface
						})
					end
				end
				if p2.props.shouldUseCategoryId then
					SelectSubcategoryIdFunction(SelectedCategoryId, p4.Id)
					
					return
				else
					SelectSubcategoryFunction(SelectedCategoryId, LayoutOrder)
				end
			end,
			tooltipTitle = if config[p4.Name] and HeadCategoryTooltipStorageModule.shouldShowTooltip() then p5.headCombineTooltipTitle else nil,
			isHidden = p2.props.isHidden,
			onTooltipDismiss = function()
				-- upvalues: p2 (upval), p4 (upval)
				p2:onTooltipDismiss(p4)
			end,
			[RoactModule.Ref] = NavButtonRefs[if p2.props.shouldUseCategoryId then p4.Id else LayoutOrder],
			NextSelectionLeft = if LayoutOrder > 1 then NavButtonRefs[if p2.props.shouldUseCategoryId then Subcategories[LayoutOrder - 1].Id else LayoutOrder - 1] else nil,
			NextSelectionRight = if LayoutOrder < #Subcategories then NavButtonRefs[if p2.props.shouldUseCategoryId then Subcategories[LayoutOrder + 1].Id else LayoutOrder + 1] else nil
		})
	end) else RoactModule.createElement(Focusable[DEPRECATEDCategoryButtonModule], {
		shouldUseCategoryId = p2.props.shouldUseCategoryId,
		categoryTitle = p4.Title,
		localizedCategoryTitle = if FFlagAXCatalogCategoriesSDUI then p4.LocalizedTitle else nil,
		layoutOrder = LayoutOrder,
		isSelected = IsSelectedSubcategoryIdMatch,
		hasNewItemNotification = if p2.props.shouldUseCategoryId then p2:hasNewItemNotificationV2(p4) else p2:hasNewItemNotification(LayoutOrder, Subcategories),
		frameRef = p2:getCategoryButtonRef(if p2.props.shouldUseCategoryId then p4.Id else LayoutOrder),
		onActivate = function()
			-- upvalues: FFlagAXCategoryUnifiedLogging (upval), NavButtonRefs (copy), p2 (copy), p4 (copy), LayoutOrder (copy), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval), SelectSubcategoryIdFunction (copy), SelectedCategoryId (copy), SelectSubcategoryFunction (copy)
			if FFlagAXCategoryUnifiedLogging then
				local NavButtonRef = NavButtonRefs[if p2.props.shouldUseCategoryId then p4.Id else LayoutOrder]
				
				if NavButtonRef and NavButtonRef.current then
					SendUnifiedEventLogForInstanceFunction(NavButtonRef.current, {
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
						elementName = "SELECT_SUBCATEGORY_" .. string.upper(p4.Name),
						surface = p2.props.unifiedLoggingSurface
					})
				end
			end
			if p2.props.shouldUseCategoryId then
				SelectSubcategoryIdFunction(SelectedCategoryId, p4.Id)
				
				return
			else
				SelectSubcategoryFunction(SelectedCategoryId, LayoutOrder)
			end
		end,
		[RoactModule.Ref] = NavButtonRefs[if p2.props.shouldUseCategoryId then p4.Id else LayoutOrder],
		NextSelectionLeft = if LayoutOrder > 1 then NavButtonRefs[if p2.props.shouldUseCategoryId then Subcategories[LayoutOrder - 1].Id else LayoutOrder - 1] else nil,
		NextSelectionRight = if LayoutOrder < #Subcategories then NavButtonRefs[if p2.props.shouldUseCategoryId then Subcategories[LayoutOrder + 1].Id else LayoutOrder + 1] else nil,
		inputBindings = if FFlagAXMigrateMainNavigationInputBindings then nil elseif p3 == nil then nil else {
			ShiftLeft = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL1, function()
				-- upvalues: LayoutOrder (copy), p3 (copy)
				if LayoutOrder > 1 then
					p3.moveFocusLeft()
				end
			end),
			ShiftRight = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR1, function()
				-- upvalues: LayoutOrder (copy), Subcategories (copy), p3 (copy)
				if LayoutOrder < #Subcategories then
					p3.moveFocusRight()
				end
			end)
		} or nil
	})
end

function SubNavigation.renderSubNavFrameChildren(p6, p7)
	local Subcategories = p6.props.subcategories
	local SelectedSubcategoryIndex = p6.props.selectedSubcategoryIndex
	local SelectedCategoryIndex = p6.props.selectedCategoryIndex
	local RenderCategoryButtonResults = {}
	
	if Subcategories then
		for i, subcategory in Subcategories do
			RenderCategoryButtonResults[if p6.props.shouldUseCategoryId then tostring(subcategory.Id) else subcategory.Name] = p6:renderCategoryButton(p7, if p6.props.shouldUseCategoryId then p6.props.selectedCategoryId else SelectedCategoryIndex, if p6.props.shouldUseCategoryId then p6.props.selectedSubcategoryId else SelectedSubcategoryIndex, i, subcategory)
		end
	end
	return RenderCategoryButtonResults
end

function SubNavigation.getScrollingListChildren(p8)
	-- upvalues: ConstantsModule (copy), RoactFitComponents (copy), FFlagAXMigrateMainNavigationInputBindings (copy), RoactModule (copy), Focusable (copy), FitFrameHorizontal (copy), NavHighlightModule (copy)
	local SubNavigationRef = p8.props.subNavigationRef
	local RenderHighlight = not (p8.props.lastInputGroup == ConstantsModule.InputType.Gamepad) and p8.state.renderHighlight
	local SelectedSubcategoryIndex = p8.props.selectedSubcategoryIndex
	local _UDim = UDim.new(0, 15)
	local RectangleResult = RoactFitComponents.Rect.rectangle(10, 0)
	local NavButtonRefs = if FFlagAXMigrateMainNavigationInputBindings then p8.props.navButtonRefs else p8.navButtonRefs
	local SelectedSubcategoryIndex1 = if SelectedSubcategoryIndex == 0 or SelectedSubcategoryIndex == nil then 1 else SelectedSubcategoryIndex
	
	if p8.props.shouldUseCategoryId then
		local Subcategories = p8.props.subcategories
		SelectedSubcategoryIndex1 = if p8.props.selectedSubcategoryId then p8.props.selectedSubcategoryId elseif Subcategories and #Subcategories > 0 then Subcategories[1].Id else nil
	end
	return {
		SubNavFrame = RoactModule.createElement(Focusable[FitFrameHorizontal], {
			height = UDim.new(1, 0),
			contentPadding = _UDim,
			margin = RectangleResult,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			FillDirection = Enum.FillDirection.Horizontal,
			BackgroundTransparency = 1,
			[RoactModule.Change.AbsoluteSize] = p8.onNavFrameSizeChanged,
			[RoactModule.Ref] = SubNavigationRef,
			NextSelectionUp = p8.props.NextSelectionUp,
			NextSelectionDown = p8.props.NextSelectionDown,
			defaultChild = if SelectedSubcategoryIndex1 then NavButtonRefs[SelectedSubcategoryIndex1] else nil
		}, p8:renderSubNavFrameChildren()),
		Highlight = RenderHighlight and RoactModule.createElement(NavHighlightModule, {
			scrollingFrameRef = p8.scrollingFrameRef,
			selectedCategoryButtonInstance = p8.state.selectedCategoryButtonInstance
		})
	}
end

function SubNavigation.getSubNavigationChildren(p8, _, ListHeight)
	-- upvalues: RoactModule (copy), ScrollingListWithArrowsAndGradientModule (copy)
	local SelectedCategoryIndex = p8.props.selectedCategoryIndex
	
	return {
		ScrollingListWithArrowsAndGradient = RoactModule.createElement(ScrollingListWithArrowsAndGradientModule, {
			useIntroScroll = true,
			buttonPadding = 15,
			getScollingListContent = function()
				-- upvalues: p8 (copy)
				return p8:getScrollingListChildren()
			end,
			listHeight = ListHeight,
			scrollingFrameRef = p8.scrollingFrameRef,
			buttonRefs = p8.categoryButtonRefs,
			childWidgetIndex = if p8.props.shouldUseCategoryId then p8.props.selectedCategoryId else tostring(SelectedCategoryIndex)
		})
	}
end

function SubNavigation.render(p8)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), SpringAnimatedItem (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXMigrateMainNavigationInputBindings (copy), animatedFrameMapValuesToProps (copy), SpringOptions (copy)
	local LayoutOrder = p8.props.layoutOrder
	local NavHeight = if p8.props.subcategories then p8.props.navHeight else 0
	
	return (WithStyleFunction(function(p9)
		-- upvalues: RoactModule (upval), SpringAnimatedItem (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), p8 (copy), LayoutOrder (copy), FFlagAXMigrateMainNavigationInputBindings (upval), NavHeight (ref), animatedFrameMapValuesToProps (upval), SpringOptions (upval)
		local Theme = p9.Theme
		
		return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
			regularProps = {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundColor3 = if GetFFlagAXEnableSlotBasedEditorModule() and p8.props.BackgroundColor3 then p8.props.BackgroundColor3 else Theme.BackgroundContrast.Color,
				BackgroundTransparency = if GetFFlagAXEnableSlotBasedEditorModule() and p8.props.BackgroundTransparency then p8.props.BackgroundTransparency else Theme.BackgroundContrast.Transparency,
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder,
				ClipsDescendants = true,
				[RoactModule.Ref] = if FFlagAXMigrateMainNavigationInputBindings then p8.props.frameRef else nil
			},
			animatedValues = { height = NavHeight },
			mapValuesToProps = animatedFrameMapValuesToProps,
			springOptions = SpringOptions
		}, p8:getSubNavigationChildren(Theme, NavHeight))
	end))
end

local v1 = if FFlagSignalsNavP3gAvatarExperience then function(p8)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), AvatarScreenProperties (copy), FFlagAXCategoryUnifiedLogging (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	local v2 = UseSignalState(GetLegacyNavigationStore(false).getCurrentRoute)
	local v3 = v2 and AvatarScreenProperties[v2.routeName]
	
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p8, {
		unifiedLoggingSurface = if FFlagAXCategoryUnifiedLogging and v3 and v3.analyticsData then v3.analyticsData.unifiedLoggingSurface else nil
	}))
end else RoactRoduxModule.connect(function(p8, _)
	-- upvalues: FFlagAXCategoryUnifiedLogging (copy), FFlagSignalsNavP3gAvatarExperience (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreenProperties (copy)
	local SelectCurrentRoactNavigationRouteResult = nil
	local v2 = nil
	
	if FFlagAXCategoryUnifiedLogging then
		if not FFlagSignalsNavP3gAvatarExperience then
			SelectCurrentRoactNavigationRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p8) else p8.Navigation and p8.Navigation.currentRoute
		end
		v2 = SelectCurrentRoactNavigationRouteResult and AvatarScreenProperties[SelectCurrentRoactNavigationRouteResult.routeName]
	end
	return {
		newItemNotifications = p8.AvatarExperience.AvatarEditor.NewItemNotifications,
		unifiedLoggingSurface = if FFlagAXCategoryUnifiedLogging and v2 and v2.analyticsData then v2.analyticsData.unifiedLoggingSurface else nil
	}
end, nil)(SubNavigation)
local WithNavigationResult = RoactNavigationModule.withNavigation((WithLastInputGroupModule(v1)))

return if FFlagAXMigrateMainNavigationInputBindings then function(Tbl)
	-- upvalues: RoactGamepadModule (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), FindValueKeyInRefCacheFunction (copy), GuiService (copy), UseTabNavigationFocusNavigationBindingsModule (copy), UseTableWrappedCallbackRefFunction (copy), WithNavigationResult (ref)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local Copy = table.clone(Tbl)
	Copy.frameRef = UseTableWrappedCallbackRefFunction((UseTabNavigationFocusNavigationBindingsModule({
		onTabBackward = ReactModule.useCallback(function(p8)
			-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), Tbl (copy), UseFocusGuiObjectResult (copy)
			p8.cancelled = true
			local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
			
			if Tbl.shouldUseCategoryId then
				local Subcategories = Tbl.subcategories
				local v2 = nil
				
				if Subcategories and ValueKeyInRefCache then
					v2 = nil
					
					for i, subcategory in Subcategories do
						if subcategory.Id == ValueKeyInRefCache then
							v2 = i
							break
						end
					end
				else
					v2 = nil
				end
				if v2 and v2 > 1 then
					local Id = Tbl.subcategories[v2 - 1].Id
					
					if UseFocusGuiObjectResult and UseRefCacheResult[Id] then
						UseFocusGuiObjectResult(UseRefCacheResult[Id].current)
						
						return
					end
				end
			elseif ValueKeyInRefCache and ValueKeyInRefCache > 1 and UseFocusGuiObjectResult then
				UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache - 1].current)
			end
		end, {
			UseFocusGuiObjectResult,
			Tbl.shouldUseCategoryId,
			Tbl.subcategories
		}),
		onTabForward = ReactModule.useCallback(function(p9)
			-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), Tbl (copy), UseFocusGuiObjectResult (copy)
			p9.cancelled = true
			local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
			
			if Tbl.shouldUseCategoryId then
				local Subcategories = Tbl.subcategories
				local v3 = nil
				
				if Subcategories and ValueKeyInRefCache then
					v3 = nil
					
					for i, subcategory in Subcategories do
						if subcategory.Id == ValueKeyInRefCache then
							v3 = i
							break
						end
					end
				else
					v3 = nil
				end
				if v3 and Subcategories and v3 < #Subcategories then
					local Id = Subcategories[v3 + 1].Id
					
					if UseFocusGuiObjectResult and UseRefCacheResult[Id] then
						UseFocusGuiObjectResult(UseRefCacheResult[Id].current)
						
						return
					end
				end
			elseif ValueKeyInRefCache and ValueKeyInRefCache < #UseRefCacheResult and UseFocusGuiObjectResult then
				UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache + 1].current)
			end
		end, {
			UseFocusGuiObjectResult,
			Tbl.shouldUseCategoryId,
			Tbl.subcategories
		}),
		onNavigateBack = ReactModule.useCallback(function(p10)
			-- upvalues: UseFocusGuiObjectResult (copy), Tbl (copy)
			p10.cancelled = true
			
			if UseFocusGuiObjectResult and Tbl.NextSelectionUp and Tbl.NextSelectionUp.current then
				UseFocusGuiObjectResult(Tbl.NextSelectionUp.current)
			end
		end, { UseFocusGuiObjectResult, Tbl.NextSelectionUp })
	})))
	Copy.navButtonRefs = UseRefCacheResult
	
	return ReactModule.createElement(WithNavigationResult, Copy)
end else WithNavigationResult