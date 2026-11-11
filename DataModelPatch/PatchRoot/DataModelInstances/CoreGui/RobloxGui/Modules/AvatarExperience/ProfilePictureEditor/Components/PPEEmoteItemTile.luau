local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(CorePackages.Packages.Foundation)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local SetEmoteAssetIdModule = require(Modules.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UsePPEEmoteItemTileBindingsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Components.usePPEEmoteItemTileBindings)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.useAdaptiveScrolling
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService

function shouldProvideControlsToViewItemDetails(p1): boolean
	return if p1.itemId and p1.isSelected then true else false
end

return (RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	local EmoteAssetId = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId
	local AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	local ItemId = p2.itemId
	local ItemData = nil
	local Name = nil
	local Thumbnail = nil
	
	if ItemId then
		ItemData = ItemDataModule(p1.AvatarExperience.Common, ItemId, ConstantsModule.ItemType.Asset)
		Name = ItemData and ItemData.name or nil
		Thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Asset, 150)
	end
	return {
		itemData = ItemData,
		emoteAssetId = EmoteAssetId,
		name = Name,
		thumbnail = Thumbnail,
		avatarType = AvatarType
	}
end, function(Callback)
	-- upvalues: SetEmoteAssetIdModule (copy), NavigateWithLockFunction (copy)
	return {
		setEmoteAssetId = function(ItemId, Navigation)
			-- upvalues: Callback (copy), SetEmoteAssetIdModule (upval)
			return Callback(SetEmoteAssetIdModule(ItemId, Navigation))
		end,
		navigateWithLock = function(p1)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p1))
		end
	}
end)(function(p1)
	-- upvalues: UseAdaptiveScrollingFunction (copy), RoactModule (copy), UseDispatchFunction (copy), UseFocusGuiObjectFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceFunction (copy), AnalyticsModule (copy), WasLastInputGamepadFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), CatalogUtilsModule (copy), ConstantsModule (copy), OpenItemDetailsModule (copy), AvatarScreen (copy), LogOnOverlayClosedFunction (copy), UsePPEEmoteItemTileBindingsModule (copy), UseTableWrappedCallbackRefFunction (copy), CatalogItemCard (copy), ItemCardThumbnail (copy)
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local Ref = RoactModule.createRef()
	local UseDispatchResult = UseDispatchFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local WasLastInputGamepadResult = WasLastInputGamepadFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CatalogUtilsModule (upval), p1 (copy), ConstantsModule (upval), UseRoactServiceResult (copy), UseAvatarRouteResult (copy), UseNavigationResult (copy), UseDispatchResult (copy), OpenItemDetailsModule (upval)
		UseDispatchResult(OpenItemDetailsModule({
			mountAsFullView = true,
			closePreviousItemDetails = true,
			itemId = if p1.itemId then p1.itemId else "",
			itemType = ConstantsModule.ItemType.Asset,
			itemSubType = CatalogUtilsModule.GetItemSubType(p1.itemType, p1.itemData),
			priceInRobux = if p1.itemData then p1.itemData.priceInRobux else nil,
			catalogAnalytics = UseRoactServiceResult,
			avatarRoute = UseAvatarRouteResult,
			navigation = UseNavigationResult,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			resultsListRef = p1.resultsListRef
		}))
	end, {
		p1.itemType, p1.itemData, p1.itemId, p1.itemDetailsPeekViewRefs,
		p1.resultsListRef, UseNavigationResult, UseAvatarRouteResult,
		UseRoactServiceResult, UseDispatchResult
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseAdaptiveScrollingResult (copy), Ref (copy)
		if not UseAdaptiveScrollingResult then return end
		if p2 then
			UseAdaptiveScrollingResult.setSelectedItemInstance(nil)
			
			return
		end
		if Ref.current then
			UseAdaptiveScrollingResult.setSelectedItemInstance(Ref.current)
		end
	end, { Ref.current })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseNavigationResult (copy), UseResult1 (copy), ConstantsModule (upval), AvatarScreen (upval), LogOnOverlayClosedFunction (upval), WasLastInputGamepadResult (copy), UseFocusGuiObjectResult (copy), Ref (copy)
		if p1.itemId == p1.emoteAssetId then
			p1.setEmoteAssetId(nil, UseNavigationResult)
			UseResult1(true)
			
			return
		end
		if p1.avatarType == ConstantsModule.AvatarType.R6 then
			UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Label.PPEEmoteR15Warning",
				onSwitchSelected = function()
					-- upvalues: p1 (upval), UseNavigationResult (upval), UseResult1 (upval)
					p1.setEmoteAssetId(p1.itemId, UseNavigationResult)
					UseResult1(false)
				end,
				onOverlayClosed = function()
					-- upvalues: LogOnOverlayClosedFunction (upval), WasLastInputGamepadResult (upval), UseFocusGuiObjectResult (upval), Ref (upval)
					LogOnOverlayClosedFunction("EmotesScrollView", WasLastInputGamepadResult)
					
					if WasLastInputGamepadResult then
						UseFocusGuiObjectResult(Ref.current)
					end
				end
			})
			
			return
		else
			p1.setEmoteAssetId(p1.itemId, UseNavigationResult)
			UseResult1(false)
		end
	end, {
		p1.itemId, p1.emoteAssetId, p1.setEmoteAssetId, p1.avatarType,
		UseNavigationResult, UseResult1, WasLastInputGamepadResult,
		UseFocusGuiObjectResult
	})
	
	return ReactModule.createElement(CatalogItemCard, {
		ref = UseTableWrappedCallbackRefFunction((UsePPEEmoteItemTileBindingsModule({
			onSelectItem = UseResult2,
			onOpenItemDetailsPage = if shouldProvideControlsToViewItemDetails(p1) then UseResult else nil
		}))),
		onActivated = UseResult2,
		isSelected = p1.isSelected,
		onOverlayButtonActivated = UseResult,
		overlayButtonText = UseLocalizationFunction({ details = "Feature.Avatar.Label.DetailsButton" }).details,
		presentationSlot = if p1.thumbnail then ReactModule.createElement(ItemCardThumbnail, { url = p1.thumbnail }) else nil,
		title = p1.name,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
end))