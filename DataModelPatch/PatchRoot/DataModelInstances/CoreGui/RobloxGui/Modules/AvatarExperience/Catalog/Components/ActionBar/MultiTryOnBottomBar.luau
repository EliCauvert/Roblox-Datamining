local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local BuyActionBarModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local ConstantsModule = require(Modules.LuaApp.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ItemDataValidatorModule = require(Modules.AvatarExperience.Common.Validators.ItemDataValidator)
local _ = require(Modules.AvatarExperience.Common.Types)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local AXShareButtonOnActionBarIXPModule = require(Modules.AvatarExperience.Experiments.AXShareButtonOnActionBarIXP)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXRecentlyViewedSearchItemsIXPTest = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local BuyActionBarShouldNotUnrenderInFullscreenMode = game:DefineFastFlag("BuyActionBarShouldNotUnrenderInFullscreenMode", false)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagStackedBottomNavMarketplaceCTA = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStackedBottomNavMarketplaceCTA
local ActionBarHeight = require(Modules.AvatarExperience.Catalog.CatalogConstants).ActionBar.ActionBarHeight
local v1: number? = nil
local v2: number? = nil

if FFlagAXMISEnableMultiShopping then
	v1 = 16
	v2 = 20
end
local MultiTryOnBottomBar = RoactModule.PureComponent:extend("MultiTryOnBottomBar")
MultiTryOnBottomBar.validateProps = TModule.strictInterface({
	bottomBarRef = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	Visible = TModule.optional(TModule.boolean),
	isConsoleWithGamepad = TModule.optional(TModule.boolean),
	itemDetailsPeekViewRefs = TModule.optional(TModule.table),
	onAbsoluteSizeChanged = if FFlagAXMISEnableMultiShopping then TModule.optional(TModule.callback) else nil,
	footerVisibilityBinding = if FFlagStackedBottomNavMarketplaceCTA then TModule.optional(TModule.table) else nil,
	lastToggledItem = TModule.table,
	isPortrait = TModule.boolean,
	tryOnItems = TModule.optional(TModule.table),
	itemData = TModule.optional(ItemDataValidatorModule),
	itemId = TModule.optional(TModule.string),
	itemType = TModule.optional(TModule.string),
	boundInputs = TModule.optional(TModule.table),
	currentTryOnItem = if FFlagAXDurablesForMIS then TModule.optional(TModule.table) else nil,
	fetchItemData = TModule.callback,
	networking = TModule.callback,
	appAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	localization = TModule.table,
	navigation = TModule.table,
	deviceSafePadding = if FFlagEnableLeftNavOnConsole then TModule.table else nil
})
MultiTryOnBottomBar.defaultProps = { Visible = true, lastToggledItem = {} }

function MultiTryOnBottomBar.init(p1)
	-- upvalues: AXRecentlyViewedSearchItemsIXPTest (copy), RoactModule (copy)
	function p1.fetchItemData()
		-- upvalues: p1 (copy), AXRecentlyViewedSearchItemsIXPTest (upval)
		local LastToggledItem = p1.props.lastToggledItem
		
		if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then
			if not LastToggledItem.isUnequipped and LastToggledItem.itemId and LastToggledItem.itemType then
				p1.props.fetchItemData(p1.props.networking, p1.props.appAnalytics, LastToggledItem.itemId, LastToggledItem.itemType)
				
				return
			end
		elseif not LastToggledItem.isUnequipped then
			p1.props.fetchItemData(p1.props.networking, p1.props.appAnalytics, LastToggledItem.itemId, LastToggledItem.itemType)
		end
	end
	
	p1.state = {}
	
	function p1.onTimedOptionSelected(SelectedTimedOptionDays)
		-- upvalues: p1 (copy), RoactModule (upval)
		if SelectedTimedOptionDays then
			p1:setState({ selectedTimedOptionDays = SelectedTimedOptionDays })
			
			return
		else
			p1:setState({ selectedTimedOptionDays = RoactModule.None })
		end
	end
end

function MultiTryOnBottomBar.getGamepadBottomBarHeight(p1)
	-- upvalues: CryoModule (copy), ConstantsModule (copy), FFlagEnableLeftNavOnConsole (copy)
	return if p1.props.isConsoleWithGamepad and not CryoModule.isEmpty(p1.props.boundInputs) then ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE + (FFlagEnableLeftNavOnConsole and p1.props.deviceSafePadding.bottom or 0) else 0
end

function MultiTryOnBottomBar.renderActionBar(p1)
	-- upvalues: RoactModule (copy), BuyActionBarShouldNotUnrenderInFullscreenMode (copy), FFlagAXMISEnableMultiShopping (copy), BuyActionBarModule (copy), FFlagAXDurablesForMIS (copy), v2 (ref), v1 (ref)
	local TimedOptions = if p1.props.itemData and p1.props.itemData.timedOptions then p1.props.itemData.timedOptions else nil
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 1, -p1:getGamepadBottomBarHeight()),
		AnchorPoint = Vector2.new(0, 1),
		ZIndex = 3,
		Visible = if BuyActionBarShouldNotUnrenderInFullscreenMode then p1.props.Visible else nil,
		[RoactModule.Change.AbsoluteSize] = if FFlagAXMISEnableMultiShopping then p1.props.onAbsoluteSizeChanged else nil
	}, {
		BuyActionBar = RoactModule.createElement(BuyActionBarModule, {
			hideGradient = true,
			headerPadding = 24,
			bottomPadding = 20,
			ZIndex = 1,
			itemId = p1.props.itemId,
			itemType = p1.props.itemType,
			timedOptions = TimedOptions,
			hidePrice = if TimedOptions then true else nil,
			selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS and p1.props.currentTryOnItem then p1.props.currentTryOnItem.selectedTimedOptionIndex else nil,
			selectedTimedOptionDays = if p1.state then p1.state.selectedTimedOptionDays else nil,
			setSelectedTimedOptionDays = p1.onTimedOptionSelected,
			leftPadding = if FFlagAXMISEnableMultiShopping then v2 else 10,
			rightPadding = if FFlagAXMISEnableMultiShopping then v2 else 10,
			topPadding = if FFlagAXMISEnableMultiShopping then v1 else 10,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs
		})
	})
end

function MultiTryOnBottomBar.renderWithProviders(p1, _)
	-- upvalues: ActionBarHeight (copy), BuyActionBarShouldNotUnrenderInFullscreenMode (copy), FFlagStackedBottomNavMarketplaceCTA (copy), ConstantsModule (copy), RoactModule (copy), RoactGamepadModule (copy)
	local XScale: number = if p1.props.isPortrait then 0 else 0.6
	local NewActionBarHeight = ActionBarHeight + 20 + p1:getGamepadBottomBarHeight()
	local v3 = if FFlagStackedBottomNavMarketplaceCTA then if p1.props.itemData and p1.props.itemData.timedOptions then 0 else 8 else nil
	
	return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.new(if p1.props.isPortrait then 1 else 0.4, 0, 0, NewActionBarHeight),
		Position = if FFlagStackedBottomNavMarketplaceCTA and p1.props.footerVisibilityBinding then p1.props.footerVisibilityBinding:map(function(p2): UDim2
			-- upvalues: XScale (copy), NewActionBarHeight (copy), ConstantsModule (upval), v3 (copy)
			return UDim2.new(XScale, 0, 1, -NewActionBarHeight - (ConstantsModule.BOTTOM_BAR_SIZE - v3) * p2)
		end) else UDim2.new(XScale, 0, 1, -NewActionBarHeight),
		ref = p1.props.bottomBarRef,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		Visible = p1.props.Visible
	}, {
		BottomBar = if BuyActionBarShouldNotUnrenderInFullscreenMode then p1:renderActionBar() elseif p1.props.Visible then p1:renderActionBar() else nil
	})
end

function MultiTryOnBottomBar.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function MultiTryOnBottomBar.didUpdate(p1, DefaultProps)
	-- upvalues: AXShareButtonOnActionBarIXPModule (copy), IxpUtilsModule (copy)
	if not p1.props.itemData or not p1.props.itemData.timedOptions then
		p1.onTimedOptionSelected()
	end
	if p1.props.Visible and (p1.props.lastToggledItem ~= DefaultProps.lastToggledItem and not p1.props.lastToggledItem.isUnequipped or not DefaultProps.Visible) then
		p1.fetchItemData()
	end
	if AXShareButtonOnActionBarIXPModule.isEnabled() and p1.props.Visible and not DefaultProps.Visible and IxpUtilsModule.logExperimentExposure then
		IxpUtilsModule.logExperimentExposure(AXShareButtonOnActionBarIXPModule)
	end
end

local v3 = RoactServices.connect({
	catalogAnalytics = AnalyticsModule,
	appAnalytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(function(p1)
	-- upvalues: TutilsModule (copy), FFlagAXDurablesForMIS (copy), ItemDataModule (copy), DeviceOrientationMode (copy)
	local TryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local ItemData = nil
	local ItemType = nil
	local ItemId: string? = nil
	local v4 = nil
	
	if TutilsModule.fieldCount(TryOnItems) == 1 then
		local _, Value = next(TryOnItems, nil)
		
		if FFlagAXDurablesForMIS then
			v4 = Value
		end
		ItemId = tostring(Value.itemId)
		ItemType = Value.itemType
		ItemData = ItemDataModule(p1.AvatarExperience.Common, ItemId, ItemType)
	end
	return {
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		tryOnItems = TryOnItems,
		lastToggledItem = p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem,
		currentTryOnItem = if FFlagAXDurablesForMIS then v4 else nil,
		itemData = ItemData,
		itemId = ItemId,
		itemType = ItemType,
		boundInputs = p1.GamepadBottomBar.boundInputs
	}
end, function(Callback)
	-- upvalues: FetchAssetOrBundleInfoModule (copy)
	return {
		fetchItemData = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), FetchAssetOrBundleInfoModule (upval)
			return Callback(FetchAssetOrBundleInfoModule(p1, p2, p3, p4))
		end
	}
end)((WithNavigationFunction(MultiTryOnBottomBar, nil)))))

return if FFlagEnableLeftNavOnConsole then function(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), RoactModule (copy), v3 (ref), CryoModule (copy)
	return RoactModule.createElement(v3, CryoModule.Dictionary.join(p1, {
		deviceSafePadding = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	}))
end else v3