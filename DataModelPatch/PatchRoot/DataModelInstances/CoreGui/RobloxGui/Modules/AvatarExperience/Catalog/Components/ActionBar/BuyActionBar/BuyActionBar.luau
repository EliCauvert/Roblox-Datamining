local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseFocusControllerFunction = require(CorePackages.Packages.RoactGamepad).useFocusController
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseInputTypeFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useInputType
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local TutilsModule = require(CorePackages.Packages.tutils)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ActionBarModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBar)
local ActionBarWithTimedOptionsModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithTimedOptions)
local ActionBarWithRentalOptionModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithRentalOption)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local AXShareButtonOnActionBarIXPModule = require(Modules.AvatarExperience.Experiments.AXShareButtonOnActionBarIXP)
local UseShareButtonModule = require(Modules.AvatarExperience.Common.Hooks.useShareButton)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ItemStatus = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemStatus
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local GetFaeFeatureAccessStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetFaeFeatureAccessStore)
local ActionBarWithContextualTextContainerModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithContextualText.ActionBarWithContextualTextContainer)
local BuyActionButtonTypeEnumModule = require(script.Parent.BuyActionButtonTypeEnum)
local UseFetchRobuxOnMountModule = require(script.Parent.useFetchRobuxOnMount)
local UseBuyActionBarButtonPropsModule = require(script.Parent.useBuyActionBarButtonProps)
local UseBuyActionBarContextualTextModule = require(script.Parent.useBuyActionBarContextualText)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AXFixItemDetailsMoreButtonHighlighted = game:DefineFastFlag("AXFixItemDetailsMoreButtonHighlighted", false)
local AXNoTimedOptionsForOwnedItems = game:DefineFastFlag("AXNoTimedOptionsForOwnedItems", false)
local FFlagAXShowFaeUpsell = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXShowFaeUpsell
local FFlagAXDurablesForMIS = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS
local FFlagAXDurables2Option = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurables2Option

local function _(p1, p2, p3): boolean
	-- upvalues: ItemDataModule (copy), ItemStatus (copy)
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2, p3)
	
	return if ItemDataModuleResult and ItemDataModuleResult.itemStatus then table.find(ItemDataModuleResult.itemStatus, ItemStatus.IsFAE) ~= nil else false
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: ItemDataModule (copy), ItemStatus (copy)
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2, p3)
	local HasFoundIndex: boolean = if ItemDataModuleResult and ItemDataModuleResult.itemStatus then table.find(ItemDataModuleResult.itemStatus, ItemStatus.IsFAE) ~= nil else false
	
	return {
		showFaeUpsell = p4.showFaeUpsell and HasFoundIndex or false,
		canClaimFaeItem = p4.canClaimFaeItem and HasFoundIndex or false
	}
end

return ReactModule.memo(function(p1)
	-- upvalues: UseFetchRobuxOnMountModule (copy), FFlagAXShowFaeUpsell (copy), GetFaeFeatureAccessStoreModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseFocusControllerFunction (copy), ReactModule (copy), UseNavigationFunction (copy), UseInputTypeFunction (copy), UseDispatchFunction (copy), AXFixItemDetailsMoreButtonHighlighted (copy), ConstantsModule (copy), LogOnOverlayClosedFunction (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), AXShareButtonOnActionBarIXPModule (copy), IxpUtilsModule (copy), SendAXCounterV2Function (copy), ConstantsModule1 (copy), UseShareButtonModule (copy), UseSelectorFunction (copy), ItemDataModule (copy), ItemStatus (copy), TutilsModule (copy), UseBuyActionBarButtonPropsModule (copy), FFlagAXDurables2Option (copy), UseBuyActionBarContextualTextModule (copy), AXNoTimedOptionsForOwnedItems (copy), ActionBarWithContextualTextContainerModule (copy), BuyActionButtonTypeEnumModule (copy), ActionBarWithRentalOptionModule (copy), ActionBarWithTimedOptionsModule (copy), FFlagAXDurablesForMIS (copy), ActionBarModule (copy)
	UseFetchRobuxOnMountModule()
	local UseFaeFeatureAccessResult = if FFlagAXShowFaeUpsell then GetFaeFeatureAccessStoreModule.useFaeFeatureAccess() else nil
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseNavigationResult = UseNavigationFunction()
	local UseInputTypeResult = UseInputTypeFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AXFixItemDetailsMoreButtonHighlighted (upval), UseStateResult2 (copy), UseInputTypeResult (copy), ConstantsModule (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusControllerResult (copy)
		if AXFixItemDetailsMoreButtonHighlighted then
			UseStateResult2(false)
		else
			UseStateResult2(true)
		end
		local IsUseInputTypeResultMatch = UseInputTypeResult == ConstantsModule.InputType.Gamepad
		LogOnOverlayClosedFunction("BuyActionBar", IsUseInputTypeResultMatch)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and IsUseInputTypeResultMatch then
			UseFocusControllerResult.captureFocus()
		end
	end, {
		if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerResult,
		UseInputTypeResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), p1 (copy), UseResult (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseStateResult2 (copy)
		local IsRouteNameMatch = UseNavigationResult.state.routeName == AvatarScreen.TryOnItem
		local FromProfileParam = UseNavigationResult.getParam("fromProfile") or IsRouteNameMatch
		UseDispatchResult(NavigateWithLockFunction(function()
			-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), p1 (upval), UseResult (upval), FromProfileParam (copy), IsRouteNameMatch (copy)
			UseNavigationResult.navigate(AvatarScreen.CatalogContextMenu, {
				itemId = p1.itemId,
				itemType = p1.itemType,
				onOverlayClosed = UseResult,
				centered = FromProfileParam,
				hideItemDetailsButtonVisible = IsRouteNameMatch,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs
			})
		end))
		UseStateResult2(true)
	end, {
		UseDispatchResult, p1.itemDetailsPeekViewRefs, UseResult, p1.itemType,
		p1.itemId, UseNavigationResult
	})
	local UseShareButtonModuleResult = if AXShareButtonOnActionBarIXPModule.isEnabled() and IxpUtilsModule.readTestVariable(AXShareButtonOnActionBarIXPModule.ShowShareButtonOnActionBar) then UseShareButtonModule(p1.itemId, p1.itemType, false, (ReactModule.useCallback(function()
		-- upvalues: SendAXCounterV2Function (upval), ConstantsModule1 (upval), p1 (copy)
		SendAXCounterV2Function(ConstantsModule1.Counter.ShareButtonProfileration.ShareButtonClicked, { itemId = p1.itemId, itemType = p1.itemType })
	end, { p1.itemId, p1.itemType }))) else nil
	local UseSelectorResult = if FFlagAXShowFaeUpsell then UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), UseFaeFeatureAccessResult (ref), ItemDataModule (upval), ItemStatus (upval)
		local UseFaeFeatureAccessResult1 = UseFaeFeatureAccessResult
		local ItemDataModuleResult = ItemDataModule(p2.AvatarExperience.Common, p1.itemId, p1.itemType)
		local HasFoundIndex: boolean = if ItemDataModuleResult and ItemDataModuleResult.itemStatus then table.find(ItemDataModuleResult.itemStatus, ItemStatus.IsFAE) ~= nil else false
		
		return {
			showFaeUpsell = UseFaeFeatureAccessResult1.showFaeUpsell and HasFoundIndex or false,
			canClaimFaeItem = UseFaeFeatureAccessResult1.canClaimFaeItem and HasFoundIndex or false
		}
	end, TutilsModule.shallowEqual) else nil
	local UseBuyActionBarButtonPropsModuleResult = UseBuyActionBarButtonPropsModule(UseResult, p1.itemId, p1.itemType, p1.selectedTimedOptionDays, p1.hidePrice, p1.showTimedOptionInBuyButton, if FFlagAXShowFaeUpsell then UseSelectorResult else nil)
	local UseBuyActionBarButtonPropsModuleResult1 = if FFlagAXDurables2Option then UseBuyActionBarButtonPropsModule(UseResult, p1.itemId, p1.itemType, 3, false, true) else nil
	local UseBuyActionBarContextualTextModuleResult = if FFlagAXShowFaeUpsell then UseBuyActionBarContextualTextModule(UseFaeFeatureAccessResult.showFaeUpsell, UseFaeFeatureAccessResult.canClaimFaeItem) else nil
	local UseResult2 = ReactModule.useCallback(function(p2): boolean
		-- upvalues: ItemDataModule (upval), p1 (copy)
		local ItemDataModuleResult = ItemDataModule(p2.AvatarExperience.Common, p1.itemId, p1.itemType)
		
		return ItemDataModuleResult and ItemDataModuleResult.isOwned and not ItemDataModuleResult.expirationTime or false
	end, { p1.itemId, p1.itemType })
	local UseSelectorResult1 = if AXNoTimedOptionsForOwnedItems or FFlagAXShowFaeUpsell then UseSelectorFunction(UseResult2) else nil
	
	if FFlagAXShowFaeUpsell and UseBuyActionBarContextualTextModuleResult and UseSelectorResult and (UseSelectorResult.showFaeUpsell or UseSelectorResult.canClaimFaeItem) and not UseSelectorResult1 then
		return (ReactModule.createElement(ActionBarWithContextualTextContainerModule, {
			titleText = UseBuyActionBarContextualTextModuleResult,
			actionButtonText = UseBuyActionBarButtonPropsModuleResult.buttonText,
			onActionActivated = UseBuyActionBarButtonPropsModuleResult.onActivated,
			onMoreActivated = UseResult1,
			isActionDisabled = UseBuyActionBarButtonPropsModuleResult.buttonIsDisabled,
			isActionLoading = UseBuyActionBarButtonPropsModuleResult.buttonIsLoading
		}))
	else
		local NoUseSelectorResult1 = if AXNoTimedOptionsForOwnedItems then p1.timedOptions and not UseSelectorResult1 else p1.timedOptions
		
		return if NoUseSelectorResult1 and (not FFlagAXDurables2Option or UseBuyActionBarButtonPropsModuleResult.buttonActionType == BuyActionButtonTypeEnumModule.PurchaseFromRoblox or UseBuyActionBarButtonPropsModuleResult.buttonActionType == BuyActionButtonTypeEnumModule.Loading) then ReactModule.createElement(if FFlagAXDurables2Option then ActionBarWithRentalOptionModule else ActionBarWithTimedOptionsModule, {
			timedOptions = p1.timedOptions,
			itemId = if FFlagAXDurablesForMIS then p1.itemId else nil,
			itemType = if FFlagAXDurablesForMIS then p1.itemType else nil,
			buttonProps = UseBuyActionBarButtonPropsModuleResult,
			rentalButtonProps = if FFlagAXDurables2Option then UseBuyActionBarButtonPropsModuleResult1 else nil,
			onSelectedDaysChanged = p1.setSelectedTimedOptionDays,
			selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil
		}) else ReactModule.createElement(ActionBarModule, {
			ZIndex = p1.ZIndex,
			leftPadding = p1.leftPadding,
			rightPadding = p1.rightPadding,
			topPadding = p1.topPadding,
			bottomPadding = p1.bottomPadding or 0,
			showMoreButton = p1.showMoreButton or true,
			showMiddleButton = if UseShareButtonModuleResult then true else nil,
			onMiddleButtonActivated = if UseShareButtonModuleResult then UseShareButtonModuleResult.onActivated else nil,
			middleButtonIcon = if UseShareButtonModuleResult then UseShareButtonModuleResult.icon else nil,
			buttonProps = UseBuyActionBarButtonPropsModuleResult,
			onMoreButtonActivated = UseResult1,
			isMoreButtonSelected = UseStateResult,
			hideGradient = p1.hideGradient,
			showSecondaryButton = if FFlagAXDurablesForMIS then p1.showSecondaryButton else nil,
			secondaryButtonText = if FFlagAXDurablesForMIS then p1.secondaryButtonText else nil,
			onSecondaryButtonActivated = if FFlagAXDurablesForMIS then p1.onSecondaryButtonActivated else nil
		})
	end
end)