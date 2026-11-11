local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local LayeredClothingSortUtilsModule = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local LayeredMakeupSortUtilsModule = require(Modules.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils)
local SetCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort)
local ClearRemovedItemsModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems)
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.EquipOutfit)
local SetOrderForTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetOrderForTryOns
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local ResetLayeredItemsSortPrompt = RoactModule.PureComponent:extend("ResetLayeredItemsSortPrompt")
ResetLayeredItemsSortPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	lastSavedSort = TModule.table,
	equippedAssets = TModule.optional(TModule.table),
	tryOnItems = if FFlagAXCustomizeMakeupSupport then TModule.optional(TModule.table) else nil,
	removedList = if FFlagAXCustomizeMakeupSupport then TModule.optional(TModule.table) else nil,
	setCurrentSort = TModule.callback,
	equipOutfit = TModule.callback,
	clearRemovedItems = TModule.callback,
	sendAnalytics = TModule.callback,
	setOrderForTryOns = if FFlagAXCustomizeMakeupSupport then TModule.callback else nil,
	analytics = TModule.table,
	navigation = TModule.table,
	avatarRoute = if FFlagAXCustomizeMakeupSupport then TModule.table else nil,
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback)
})

function ResetLayeredItemsSortPrompt.init(p1)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), AvatarScreen (copy), LayeredMakeupSortUtilsModule (copy), LayeredClothingSortUtilsModule (copy), NavigationUtilsModule (copy)
	function p1.resetToDefault()
		-- upvalues: p1 (copy), FFlagAXCustomizeMakeupSupport (upval), AvatarScreen (upval), LayeredMakeupSortUtilsModule (upval), LayeredClothingSortUtilsModule (upval)
		p1.props.sendAnalytics(p1.props.analytics.avatarRefineLayersResetConfirm)
		
		if FFlagAXCustomizeMakeupSupport and p1.props.avatarRoute.current.name == AvatarScreen.LayeredMakeupSort then
			local TryOnItemsOrderBasedOnSortTable = LayeredMakeupSortUtilsModule.getTryOnItemsOrderBasedOnSortTable(p1.props.lastSavedSort, p1.props.tryOnItems)
			p1.props.equipOutfit((LayeredMakeupSortUtilsModule.getEquippedAssetsBasedOnSortTable(p1.props.lastSavedSort, p1.props.equippedAssets, p1.props.tryOnItems, p1.props.removedList)))
			p1.props.setOrderForTryOns(TryOnItemsOrderBasedOnSortTable)
		else
			p1.props.equipOutfit((LayeredClothingSortUtilsModule.formatForEquipOutfit(p1.props.lastSavedSort, p1.props.equippedAssets)))
		end
		p1.props.setCurrentSort(p1.props.lastSavedSort)
		p1.props.clearRemovedItems()
		p1.closePrompt()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function ResetLayeredItemsSortPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.title,
		bodyText = p2.body,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.resetToDefault,
						text = p2.resetButtonText
					}
				}
			}
		},
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function ResetLayeredItemsSortPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		title = "Feature.Avatar.Title.LCSortReset",
		body = "Feature.Avatar.Message.LCSortResetBody",
		cancelButtonText = "Feature.Catalog.Action.Cancel",
		resetButtonText = "CommonUI.Messages.Action.Reset"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

local WithMappedNavigationParamsModuleResult = WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({ analytics = AnalyticsModule })((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy)
	return {
		screenSize = p1.ScreenSize,
		equippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		tryOnItems = if FFlagAXCustomizeMakeupSupport then p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil,
		lastSavedSort = p1.AvatarExperience.LayeredClothingSort.LastSavedSort,
		removedList = if FFlagAXCustomizeMakeupSupport then p1.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList else nil
	}
end, function(Callback)
	-- upvalues: SetCurrentSortModule (copy), ClearRemovedItemsModule (copy), EquipOutfitModule (copy), FFlagAXCustomizeMakeupSupport (copy), SetOrderForTryOnsFunction (copy), SendRefinementAnalyticsModule (copy)
	return {
		setCurrentSort = function(p1)
			-- upvalues: Callback (copy), SetCurrentSortModule (upval)
			Callback(SetCurrentSortModule(p1))
		end,
		clearRemovedItems = function()
			-- upvalues: Callback (copy), ClearRemovedItemsModule (upval)
			Callback(ClearRemovedItemsModule())
		end,
		equipOutfit = function(p1)
			-- upvalues: Callback (copy), EquipOutfitModule (upval)
			Callback(EquipOutfitModule(p1, false))
		end,
		setOrderForTryOns = if FFlagAXCustomizeMakeupSupport then function(p1)
			-- upvalues: Callback (copy), SetOrderForTryOnsFunction (upval)
			Callback(SetOrderForTryOnsFunction(p1))
		end else nil,
		sendAnalytics = function(p1)
			-- upvalues: Callback (copy), SendRefinementAnalyticsModule (upval)
			Callback(SendRefinementAnalyticsModule(p1))
		end
	}
end)(ResetLayeredItemsSortPrompt)))))))

if FFlagAXCustomizeMakeupSupport then
	WithMappedNavigationParamsModuleResult = WithAvatarRouteModule(WithMappedNavigationParamsModuleResult)
end
return WithMappedNavigationParamsModuleResult