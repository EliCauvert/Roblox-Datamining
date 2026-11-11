local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.useAdaptiveScrolling
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local ImpressionsUtil = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents

local function selectEquippedEmotes(p1)
	return p1.AvatarExperience.AvatarEditor.EquippedEmotes
end

local function selectAvatarType(p1)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType
end

return function(p1, p2)
	-- upvalues: UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseAdaptiveScrollingFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), ReactFocusNavigationModule (copy), ResponsiveModule (copy), UseSelectorFunction (copy), selectAvatarType (copy), selectEquippedEmotes (copy), ReactModule (copy), ItemDataModule (copy), ConstantsModule (copy), SetFullViewModule (copy), FullView (copy), SendAnalyticsModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), ToggleEquipAssetModule (copy), CryoModule (copy), ImpressionEnums (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogConstants (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseSelectorResult = UseSelectorFunction(selectAvatarType)
	local UseSelectorResult1 = UseSelectorFunction(selectEquippedEmotes)
	local SelectedSlot = UseSelectorResult1.selectedSlot
	local SlotInfo = UseSelectorResult1.slotInfo
	local Slot = SlotInfo and SlotInfo[SelectedSlot]
	local IsAssetIdMatch: boolean = Slot and Slot.assetId == p1.itemId
	local UseSelectorResult2 = UseSelectorFunction((ReactModule.useCallback(function(p3)
		-- upvalues: ItemDataModule (upval), p1 (copy), ConstantsModule (upval)
		return ItemDataModule(p3.AvatarExperience.Common, p1.itemId, ConstantsModule.ItemType.Asset)
	end, { p1.itemId })))
	local UseResult = ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseAdaptiveScrollingResult (copy), p2 (copy), UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceModuleResult1 (copy), UseAvatarRouteResult (copy), FullView (upval), UseRoactServiceModuleResult (copy), SendAnalyticsModule (upval), p1 (copy), ConstantsModule (upval)
		if UseAdaptiveScrollingResult then
			if p3 then
				UseAdaptiveScrollingResult.setSelectedItemInstance(nil)
			else
				local Current = p2.current
				
				if Current and p4 then
					UseAdaptiveScrollingResult.setSelectedItemInstance(Current)
				end
			end
		end
		if not p3 and p4 then
			UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult1, UseAvatarRouteResult.opaque.name, FullView.None))
		end
		UseDispatchResult(SendAnalyticsModule(if p4 then UseRoactServiceModuleResult.equipAsset else UseRoactServiceModuleResult.unequipAsset, p1.itemId, ConstantsModule.AssetTypeIdStrings.EmoteAnimation))
	end, {
		UseAdaptiveScrollingResult,
		UseDispatchResult,
		UseRoactServiceModuleResult1,
		UseAvatarRouteResult,
		p1.itemId
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseFocusGuiObjectResult (copy), p2 (copy)
		if UsePreferredInputResult == ResponsiveModule.Input.Directional then
			UseFocusGuiObjectResult(p2.current)
		end
	end, { UsePreferredInputResult, UseFocusGuiObjectResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), ConstantsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseResult1 (copy)
		if UseSelectorResult == ConstantsModule.AvatarType.R6 then
			UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt",
				onOverlayClosed = UseResult1
			})
		end
	end, { UseSelectorResult, UseNavigationResult, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), ConstantsModule (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseResult2 (copy), ToggleEquipAssetModule (upval), p1 (copy), UseNavigationResult (copy), UseResult (copy), IsAssetIdMatch (copy)
		if UseSelectorResult == ConstantsModule.AvatarType.R6 then
			UseDispatchResult(NavigateWithLockFunction(UseResult2))
		end
		UseResult(IsAssetIdMatch, UseDispatchResult(ToggleEquipAssetModule(ConstantsModule.AssetTypeIdStrings.EmoteAnimation, p1.itemId, UseNavigationResult)) or false)
	end, {
		UseSelectorResult, p1.itemId, IsAssetIdMatch, UseRoactServiceModuleResult,
		UseNavigationResult, UseResult, UseResult2, UseDispatchResult
	})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseSelectorResult2 (copy), CryoModule (upval), p1 (copy), ImpressionEnums (upval), OrganicEventImpressionsSchema (upval), ImpressionsUtil (upval), AddUnifiedEventLoggingFunction (upval), IsAssetIdMatch (copy), UnifiedEventLogEnums (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogConstants (upval)
		if p2.current and UseSelectorResult2 and not CryoModule.isEmpty(UseSelectorResult2) then
			local config = {
				itemType = "Asset",
				itemId = p1.itemId,
				surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
			}
			
			if p1.impressionsTag then
				p2.current:SetAttribute(p1.impressionsTag, p1.itemId)
			end
			ImpressionsUtil.writeItemAttributes(OrganicEventImpressionsSchema[p1.impressionsSchema], p2.current, config)
			AddUnifiedEventLoggingFunction(p2, {
				action = if IsAssetIdMatch then UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED else UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET,
				itemId = p1.itemId,
				gridPositionRow = if p1.gridInformation then p1.gridInformation.row else nil,
				gridPositionColumn = if p1.gridInformation then p1.gridInformation.column else nil
			}, {
				hasDeferredActions = not FFlagAXMISEnableMultiShoppingUnifiedEvents or nil,
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
		end
	end, {
		p1.itemId,
		UseSelectorResult2,
		IsAssetIdMatch,
		p1.gridInformation
	})
	
	return {
		item = UseSelectorResult2,
		onActivated = UseResult3,
		isSelected = IsAssetIdMatch,
		itemId = p1.itemId,
		index = p1.index,
		itemWidth = p1.itemWidth,
		impressionsTag = p1.impressionsTag
	}
end