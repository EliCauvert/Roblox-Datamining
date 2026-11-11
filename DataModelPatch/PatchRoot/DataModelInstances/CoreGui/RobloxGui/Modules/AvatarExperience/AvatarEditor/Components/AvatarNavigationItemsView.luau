local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local CategoryContentModule = require(Modules.AvatarExperience.AvatarEditor.Components.CategoryContent)
local NavigationModule = if require(Modules.AvatarExperience.Flags.GetFFlagAXMigrateAENavigationToFunctionalReact)() then require(Modules.AvatarExperience.AvatarEditor.Components.Navigation) else require(Modules.AvatarExperience.AvatarEditor.Components.Navigation_DEPRECATED)
local SelectHasOwnedOrRecommendedAssetsDataModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectHasOwnedOrRecommendedAssetsData)
local GetDataStatusForCategoryModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.GetDataStatusForCategory)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SlotsContainerModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogHeadCategoryCombineIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP)
local FFlagAXItemsViewContentSizeBinding = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemsViewContentSizeBinding
local FFlagAXSlotsPeekViewScrollFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXSlotsDesktopRedesign = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local SubNavigationBarModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.SubNavigationBar.SubNavigationBar)
local NavigationItemsView = RoactModule.PureComponent:extend("NavigationItemsView")
local config = {
	[AvatarScreen.Catalog] = true,
	[AvatarScreen.ProfilePictureEditorEmotes] = true
}
NavigationItemsView.defaultProps = { swipeNavigationEnabled = false }

function NavigationItemsView.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXItemsViewContentSizeBinding (copy), Signal (copy), FFlagAXRootSlotBasedEditorFlag (copy), GetAvatarEditorCategoriesModule (copy), FFlagAXSlotsPeekViewScrollFix (copy)
	p1.navBarRef = RoactModule.createRef()
	p1.contentRef = RoactModule.createRef()
	
	if FFlagAXItemsViewContentSizeBinding then
		p1.contentSize, p1.updateContentSize = RoactModule.createBinding(UDim2.fromScale(1, 1))
	end
	p1.backToTopSignal = Signal.new()
	p1.lastScrollStartPosition = 0
	p1.pivotPosition = 0
	p1.scrollingDown = true
	p1.changedPage = not FFlagAXRootSlotBasedEditorFlag and nil
	p1:setState({
		restorePreviousChildFocus = true,
		lastScrollStartPosition = 0,
		scrollingDown = true,
		pivotPosition = 0,
		scrollAwayValue = if FFlagAXRootSlotBasedEditorFlag then 1 else nil
	})
	
	function p1.setCategory(p2)
		-- upvalues: p1 (copy)
		p1.props.setCategoryAndSubcategory(p2, nil, p1.props.analytics)
		p1.props.exit3DFullView(p1.props.axAnalytics, p1.props.navigation.state.routeName)
	end
	
	function p1.setSubcategory(p2)
		-- upvalues: p1 (copy)
		p1.props.setCategoryAndSubcategory(nil, p2, p1.props.analytics)
		p1.props.exit3DFullView(p1.props.axAnalytics, p1.props.navigation.state.routeName)
	end
	
	function p1.navigate(p2)
		-- upvalues: p1 (copy), GetAvatarEditorCategoriesModule (upval)
		if not p1.props.swipeNavigationEnabled then return end
		local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
		local CategoryIndex = p1.props.categoryIndex
		local SubcategoryIndex = p1.props.subcategoryIndex
		local Subcategories = AvatarEditorCategoriesModule[CategoryIndex].Subcategories
		
		if Subcategories and SubcategoryIndex ~= 0 then
			local NewSubcategoryIndex = SubcategoryIndex + p2
			
			if NewSubcategoryIndex > 0 and NewSubcategoryIndex <= #Subcategories then
				p1.setSubcategory(NewSubcategoryIndex)
				
				return
			end
		end
		local NewCategoryIndex = CategoryIndex + p2
		
		if NewCategoryIndex > 0 and NewCategoryIndex <= #AvatarEditorCategoriesModule then
			p1.setCategory(NewCategoryIndex)
		end
	end
	
	function p1.onNavBarSizeChanged(Vector)
		-- upvalues: FFlagAXItemsViewContentSizeBinding (upval), p1 (copy)
		if FFlagAXItemsViewContentSizeBinding then
			p1.updateContentSize(UDim2.new(1, 0, 1, -Vector.Y))
			
			return
		end
		if p1.contentRef.current then
			p1.contentRef.current.Size = UDim2.new(1, 0, 1, -Vector.Y)
		end
	end
	
	function p1.navigateLeft()
		-- upvalues: p1 (copy)
		p1.navigate(-1)
	end
	
	function p1.navigateRight()
		-- upvalues: p1 (copy)
		p1.navigate(1)
	end
	
	p1.onInputBegan = if FFlagAXSlotsPeekViewScrollFix then function(_, Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.Begin then
			p1.props.updateDisableScrollView(true)
		end
	end else nil
	p1.onInputEnded = if FFlagAXSlotsPeekViewScrollFix then function(_, Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.End then
			p1.props.updateDisableScrollView(false)
		end
	end else nil
	
	function p1.onContentScroll(ScrollFrame)
		-- upvalues: p1 (copy)
		if p1.changedPage then
			p1.lastScrollStartPosition = 0
			p1.pivotPosition = 0
			p1.scrollingDown = true
			p1.changedPage = false
			p1:setState({ scrollAwayValue = 1 })
			
			return
		end
		local LastScrollStartPosition = p1.lastScrollStartPosition
		local ScrollingDown = p1.scrollingDown
		local PivotPosition = p1.pivotPosition
		local Smallest = nil
		
		if ScrollFrame.CanvasPosition.Y < 0 then
			Smallest = 1
		elseif ScrollFrame.AbsoluteCanvasSize.Y < ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteWindowSize.Y then
			Smallest = 0
		elseif LastScrollStartPosition - ScrollFrame.CanvasPosition.Y > 0 then
			if not ScrollingDown then
				ScrollingDown = true
				PivotPosition = ScrollFrame.CanvasPosition.Y
			end
			Smallest = math.min(math.max(0, 280 * p1.state.scrollAwayValue + math.abs(PivotPosition - ScrollFrame.CanvasPosition.Y)) / 280, 1)
		else
			if ScrollingDown then
				ScrollingDown = false
				PivotPosition = ScrollFrame.CanvasPosition.Y
			end
			Smallest = math.min(math.max(0, 280 * p1.state.scrollAwayValue - math.abs(PivotPosition - ScrollFrame.CanvasPosition.Y)) / 280, 1)
		end
		p1.lastScrollStartPosition = ScrollFrame.CanvasPosition.Y
		p1.pivotPosition = PivotPosition
		p1.scrollingDown = ScrollingDown
		p1:setState({ scrollAwayValue = Smallest })
	end
end

function NavigationItemsView.render(p1)
	-- upvalues: RetrievalStatusModule (copy), FFlagAXSlotsDesktopRedesign (copy), FFlagAXRootSlotBasedEditorFlag (copy), WithStyleFunction (copy), FFlagAXSlotsPeekViewScrollFix (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), RoactGamepadModule (copy), ReactModule (copy), SlotsContainerModule (copy), NavigationModule (copy), ConstantsModule (copy), FFlagAXCustomizeMakeupSupport (copy), SubNavigationBarModule (copy), CategoryContentModule (copy), FFlagAXItemsViewContentSizeBinding (copy), FFlagLuaAppsDefaultSelection (copy), FullView (copy)
	local Analytics = p1.props.analytics
	local AxAnalytics = p1.props.axAnalytics
	local HasOwnedOrRecommendedAssets = p1.props.hasOwnedOrRecommendedAssets or p1.props.dataStatus == RetrievalStatusModule.Failed
	local IsPortrait = if FFlagAXSlotsDesktopRedesign then nil elseif FFlagAXRootSlotBasedEditorFlag then p1.props.isPortrait else nil
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), FFlagAXSlotsPeekViewScrollFix (upval), FFlagRenameDeprecatedUIBloxTokens (upval), RoactModule (upval), RoactGamepadModule (upval), ReactModule (upval), FFlagAXRootSlotBasedEditorFlag (upval), FFlagAXSlotsDesktopRedesign (upval), IsPortrait (copy), SlotsContainerModule (upval), NavigationModule (upval), Analytics (copy), AxAnalytics (copy), ConstantsModule (upval), HasOwnedOrRecommendedAssets (copy), FFlagAXCustomizeMakeupSupport (upval), SubNavigationBarModule (upval), CategoryContentModule (upval), FFlagAXItemsViewContentSizeBinding (upval), FFlagLuaAppsDefaultSelection (upval), FullView (upval)
		local Theme = p2.Theme
		local NavBarRef = p1.navBarRef
		local Size1000 = if FFlagAXSlotsPeekViewScrollFix then if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_1000 else p2.Tokens.Global.Space_500 else 0
		
		return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			[RoactModule.Ref] = p1.props.defaultChildRef,
			restorePreviousChildFocus = p1.state.restorePreviousChildFocus,
			defaultChild = p1.navBarRef,
			NextSelectionRight = p1.props.NextSelectionRight
		}, if FFlagAXSlotsPeekViewScrollFix then {
			ContainerFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				SlotsContainer = if FFlagAXRootSlotBasedEditorFlag and (if FFlagAXSlotsDesktopRedesign then true else IsPortrait) then ReactModule.createElement(SlotsContainerModule, {
					slotSubNavigationFill = p1.state.scrollAwayValue,
					absoluteSizeChanged = p1.onNavBarSizeChanged
				}) else nil,
				NavBar = if (if FFlagAXSlotsDesktopRedesign then true else IsPortrait) and FFlagAXRootSlotBasedEditorFlag then nil else RoactModule.createElement(NavigationModule, {
					layoutOrderMain = 1,
					layoutOrderSub = 2,
					analytics = Analytics,
					axAnalytics = AxAnalytics,
					navHeightMain = ConstantsModule.MainNavHeight,
					navHeightSub = ConstantsModule.SubNavHeight,
					absoluteSizeChanged = p1.onNavBarSizeChanged,
					backToTopSignal = p1.backToTopSignal,
					navBarRef = p1.navBarRef,
					NextSelectionDown = HasOwnedOrRecommendedAssets and p1.contentRef or nil,
					NextSelectionUp = p1.props.NextSelectionUp
				}),
				SubNavBar = if FFlagAXCustomizeMakeupSupport then ReactModule.createElement(SubNavigationBarModule, { LayoutOrder = 3 }) else nil,
				CategoryContent = RoactModule.createElement(CategoryContentModule, {
					LayoutOrder = if FFlagAXRootSlotBasedEditorFlag then if FFlagAXCustomizeMakeupSupport then 4 else 3 else 2,
					Size = if FFlagAXItemsViewContentSizeBinding then p1.contentSize else UDim2.new(1, 0, 1, 0),
					frameRef = p1.contentRef,
					defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
					backToTopSignal = p1.backToTopSignal,
					onContentScroll = if FFlagAXRootSlotBasedEditorFlag then p1.onContentScroll else nil,
					navigateLeft = p1.navigateLeft,
					navigateRight = p1.navigateRight,
					NextSelectionUp = NavBarRef,
					restorePreviousChildFocus = p1.state.restorePreviousChildFocus
				})
			}),
			CoverFrame = if p1.props.peekViewState == FullView.SceneFullView then nil else ReactModule.createElement("Frame", {
				Position = UDim2.fromOffset(if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_100 else p2.Tokens.Global.Size_50, Size1000),
				Size = UDim2.new(1, (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_100 else p2.Tokens.Global.Size_50) / 2, 1, -Size1000 * 2),
				BackgroundTransparency = 1,
				[RoactModule.Event.InputBegan] = p1.onInputBegan,
				[RoactModule.Event.InputEnded] = p1.onInputEnded
			})
		} else {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 0)
			}),
			SlotsContainer = if FFlagAXRootSlotBasedEditorFlag and (if FFlagAXSlotsDesktopRedesign then true else IsPortrait) then ReactModule.createElement(SlotsContainerModule, {
				slotSubNavigationFill = p1.state.scrollAwayValue,
				absoluteSizeChanged = p1.onNavBarSizeChanged
			}) else nil,
			NavBar = if (if FFlagAXSlotsDesktopRedesign then true else IsPortrait) and FFlagAXRootSlotBasedEditorFlag then nil else RoactModule.createElement(NavigationModule, {
				layoutOrderMain = 1,
				layoutOrderSub = 2,
				analytics = Analytics,
				axAnalytics = AxAnalytics,
				navHeightMain = ConstantsModule.MainNavHeight,
				navHeightSub = ConstantsModule.SubNavHeight,
				absoluteSizeChanged = p1.onNavBarSizeChanged,
				backToTopSignal = p1.backToTopSignal,
				navBarRef = p1.navBarRef,
				NextSelectionDown = HasOwnedOrRecommendedAssets and p1.contentRef or nil,
				NextSelectionUp = p1.props.NextSelectionUp
			}),
			CategoryContent = RoactModule.createElement(CategoryContentModule, {
				LayoutOrder = if FFlagAXRootSlotBasedEditorFlag then 3 else 2,
				Size = if FFlagAXItemsViewContentSizeBinding then p1.contentSize else UDim2.new(1, 0, 1, 0),
				frameRef = p1.contentRef,
				defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
				backToTopSignal = p1.backToTopSignal,
				onContentScroll = if FFlagAXRootSlotBasedEditorFlag then p1.onContentScroll else nil,
				navigateLeft = p1.navigateLeft,
				navigateRight = p1.navigateRight,
				NextSelectionUp = NavBarRef,
				restorePreviousChildFocus = p1.state.restorePreviousChildFocus
			})
		})
	end)
end

function NavigationItemsView.didUpdate(p1, p2)
	-- upvalues: AXCatalogHeadCategoryCombineIXPModule (copy), IxpUtilsModule (copy), FFlagAXRootSlotBasedEditorFlag (copy), AvatarScreen (copy), config (copy)
	if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and p1.props.categoryInfo and (p1.props.categoryInfo.Name == "Style" or p1.props.categoryInfo.Name == "HeadAndBody") and IxpUtilsModule.logExperimentExposure then
		IxpUtilsModule.logExperimentExposure(AXCatalogHeadCategoryCombineIXPModule)
	end
	if FFlagAXRootSlotBasedEditorFlag and p1.state.scrollAwayValue and (p2.categoryInfo.Name ~= p1.props.categoryInfo.Name or p2.bodyColorViewSetting ~= p1.props.bodyColorViewSetting) then
		p1.changedPage = true
		p1:setState({ scrollAwayValue = 1 })
	end
	local Name = p1.props.avatarRoute.current.name
	local Name1 = p2.avatarRoute.current.name
	
	if Name == AvatarScreen.AvatarEditor then
		if not p1.state.restorePreviousChildFocus then
			p1:setState({ restorePreviousChildFocus = true })
			
			return
		end
	elseif config[Name] and Name1 == AvatarScreen.AvatarEditor and p1.state.restorePreviousChildFocus then
		p1:setState({ restorePreviousChildFocus = false })
	end
end

return RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy), FFlagAXSlotsDesktopRedesign (copy), SelectIsPortraitModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), UtilsModule (copy), FFlagAXSlotsPeekViewScrollFix (copy), SelectIsFullViewModule (copy), AvatarScreen (copy), SelectHasOwnedOrRecommendedAssetsDataModule (copy), GetDataStatusForCategoryModule (copy)
	local ViewSetting = if FFlagAXRootSlotBasedEditorFlag then p1.AvatarExperience.AvatarEditor.BodyColorPickerSettings.viewSetting else nil
	local AvatarEditorCategoryInfoFromState = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then UtilsModule.getAvatarEditorCategoryInfoFromState(p1) else nil
	
	return {
		categoryInfo = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then AvatarEditorCategoryInfoFromState else nil,
		categoryIndex = p1.AvatarExperience.AvatarEditor.Categories.category,
		subcategoryIndex = p1.AvatarExperience.AvatarEditor.Categories.subcategory,
		bodyColorViewSetting = if FFlagAXRootSlotBasedEditorFlag then ViewSetting else nil,
		peekViewState = if FFlagAXSlotsPeekViewScrollFix then SelectIsFullViewModule(p1, AvatarScreen.AvatarEditor) else nil,
		hasOwnedOrRecommendedAssets = SelectHasOwnedOrRecommendedAssetsDataModule(p1),
		dataStatus = GetDataStatusForCategoryModule(p1),
		isPortrait = if FFlagAXSlotsDesktopRedesign then nil elseif FFlagAXRootSlotBasedEditorFlag then SelectIsPortraitModule(p1) else nil
	}
end, function(Callback)
	-- upvalues: SetCategoryAndSubcategoryModule (copy), Exit3DFullViewModule (copy)
	return {
		setCategoryAndSubcategory = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetCategoryAndSubcategoryModule (upval)
			Callback(SetCategoryAndSubcategoryModule(p1, p2, p3))
		end,
		exit3DFullView = function(p1, p2)
			-- upvalues: Callback (copy), Exit3DFullViewModule (upval)
			Callback(Exit3DFullViewModule(p1, p2))
		end
	}
end)((RoactNavigationModule.withNavigation((WithAvatarRouteModule((RoactServices.connect({
	analytics = AnalyticsModule,
	axAnalytics = AnalyticsModule1
})(NavigationItemsView)))))))