local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UserLibModule = require(Parent.UserLib)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseAvatarBackgroundFromWrapperModule = require(ProfilePlatform.Hooks.useAvatarBackgroundFromWrapper)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseMarketplaceAnalyticsContextModule = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local FFlagSocialEnableProfileInspectAndBuyAnalytics = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local FFlagProfileInspectAvatarBackgroundModule = require(ProfilePlatform.Flags.FFlagProfileInspectAvatarBackground)
local FFlagProfileUnifiedPurchaseLoggingModule = require(ProfilePlatform.Flags.FFlagProfileUnifiedPurchaseLogging)
local UseInspectAvatarDataModule = require(script.Parent.useInspectAvatarData)
local InspectAvatarUtilsModule = require(script.Parent.InspectAvatarUtils)
local InspectAvatarSheetModule = require(script.Parent.InspectAvatarSheet)
local _ = require(ProfilePlatform.Common.Types)
local _ = require(ProfilePlatform.Analytics.sendProfilePurchaseEvents)
local IsItemPurchasableFunction = InspectAvatarUtilsModule.isItemPurchasable
local GetPriceStatusFunction = InspectAvatarUtilsModule.getPriceStatus
local PriceStatusEnum = InspectAvatarUtilsModule.PriceStatusEnum

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseMarketplaceAnalyticsContextModule (copy), RobloxAppHooksModule (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), UseSelectorFunction (copy), UseProfileCardWidthFunction (copy), UseProfileJsonComponentModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), ConstantsModule (copy), FFlagProfileInspectAvatarBackgroundModule (copy), UseAvatarBackgroundFromWrapperModule (copy), UseInspectAvatarDataModule (copy), ReactModule (copy), IsItemPurchasableFunction (copy), DashModule (copy), FFlagProfileUnifiedPurchaseLoggingModule (copy), InspectAvatarUtilsModule (copy), GetPriceStatusFunction (copy), PriceStatusEnum (copy), FFlagSocialEnableProfileInspectAndBuyAnalytics (copy), EventNamesModule (copy), InspectAvatarSheetModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseMarketplaceAnalyticsContextModuleResult = UseMarketplaceAnalyticsContextModule()
	local UseLocalRobuxBalanceResult = RobloxAppHooksModule.useLocalRobuxBalance()
	local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end)
	local UseSelectorResult1 = if IsFormFactorMatch then 0 else UseSelectorResult
	local UseProfileCardWidthResult: number = UseProfileCardWidthFunction()
	local Floored: number = if IsFormFactorMatch then 400 else math.floor(UseProfileCardWidthResult * 0.75)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader)
	local Username = UseProfileJsonComponentModuleResult.names and UseProfileJsonComponentModuleResult.names.username or ""
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(ProfileId, Constants.RbxthumbTypes.Avatar, ConstantsModule.AVATAR_THUMBNAIL_SIZE)
	local UseAvatarBackgroundFromWrapperModuleResult = if FFlagProfileInspectAvatarBackgroundModule then UseAvatarBackgroundFromWrapperModule() else nil
	local UseInspectAvatarDataModuleResult = UseInspectAvatarDataModule(UseProfileJsonComponentModule(EnumsModule.Components.CurrentlyWearing).assets or {})
	local DisplayItems = UseInspectAvatarDataModuleResult.displayItems
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: DisplayItems (copy), IsItemPurchasableFunction (upval), UseRefResult (copy), UseStateResult2 (copy), DashModule (upval)
		if #DisplayItems == 0 then return end
		local t = {}
		local Flag = false
		
		for _, displayItem in DisplayItems do
			local Id = displayItem.id
			
			if IsItemPurchasableFunction(displayItem) and not UseRefResult.current[Id] then
				UseRefResult.current[Id] = true
				t[Id] = true
				Flag = true
			end
		end
		if Flag then
			UseStateResult2(function(p2)
				-- upvalues: DashModule (upval), t (copy)
				return DashModule.join(p2, t)
			end)
			
			return
		end
	end, { DisplayItems })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagProfileUnifiedPurchaseLoggingModule (upval), DisplayItems (copy), UseStateResult (copy), IsItemPurchasableFunction (upval), InspectAvatarUtilsModule (upval), GetPriceStatusFunction (upval), PriceStatusEnum (upval), EnumsModule (upval)
		local LineItems = {}
		local TotalPrice = 0
		local Count = 0
		local List = {}
		local PurchasedItemIds = {}
		local PurchasedBundleIds = {}
		local T = if FFlagProfileUnifiedPurchaseLoggingModule then {} else nil
		local t = {}
		
		for _, displayItem in DisplayItems do
			if displayItem.id then
				local Id = displayItem.id
				
				if UseStateResult[Id] and IsItemPurchasableFunction(displayItem) then
					local EffectivePrice: number = InspectAvatarUtilsModule.getEffectivePrice(displayItem)
					table.insert(LineItems, {
						collectibleProductId = GetPriceStatusFunction(displayItem) == PriceStatusEnum.PurchaseFromResale and displayItem.collectibleItemDetails and displayItem.collectibleItemDetails.collectibleLowestAvailableResaleProductId or displayItem.collectibleProductId,
						agreedPriceRobux = EffectivePrice
					})
					TotalPrice += EffectivePrice
					Count += 1
					table.insert(PurchasedItemIds, Id)
					
					if FFlagProfileUnifiedPurchaseLoggingModule and T then
						table.insert(T, {
							itemId = Id,
							itemType = displayItem.itemType,
							itemSubType = tonumber(displayItem.itemSubType),
							priceInRobux = EffectivePrice
						})
					end
					if displayItem.itemType == EnumsModule.ItemTypes.Bundle then
						table.insert(PurchasedBundleIds, Id)
					end
					if #displayItem.bundleAssetIds > 0 then
						for _, bundleAssetId in displayItem.bundleAssetIds do
							if not t[bundleAssetId] then
								t[bundleAssetId] = true
								table.insert(List, bundleAssetId)
							end
						end
					else
						local Number: number? = tonumber(displayItem.id)
						
						if Number and not t[Number] then
							t[Number] = true
							table.insert(List, Number)
						end
					end
				end
			end
		end
		return {
			lineItems = LineItems,
			totalPrice = TotalPrice,
			count = Count,
			purchasedWearIds = List,
			purchasedItemIds = PurchasedItemIds,
			purchasedBundleIds = PurchasedBundleIds,
			purchasedItems = T
		}
	end, { DisplayItems, UseStateResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: DisplayItems (copy)
		local Numbers = {}
		
		for _, displayItem in DisplayItems do
			local Number: number? = tonumber(displayItem.id)
			local Number1: number? = tonumber(displayItem.itemSubType)
			
			if Number and Number1 then
				Numbers[Number] = Number1
			end
			if displayItem.assetsInBundle then
				for _, value in displayItem.assetsInBundle do
					local Number2: number? = tonumber(value.id)
					local Number21: number? = tonumber(value.assetType)
					
					if Number2 and Number21 then
						Numbers[Number2] = Number21
					end
				end
			end
		end
		return Numbers
	end, { DisplayItems })
	
	return ReactModule.createElement(InspectAvatarSheetModule, {
		displayItems = DisplayItems,
		selectedItems = UseStateResult,
		isLoading = UseInspectAvatarDataModuleResult.isLoading,
		username = Username,
		profileId = ProfileId,
		avatarThumbnail = RbxthumbWithTypeSizeAndOptions,
		avatarBackgroundImage = if FFlagProfileInspectAvatarBackgroundModule then UseAvatarBackgroundFromWrapperModuleResult else nil,
		avatarViewportHeight = Floored,
		cardWidth = UseProfileCardWidthResult,
		topOffset = UseSelectorResult1,
		purchaseSummary = {
			totalPrice = UseMemoResult.totalPrice,
			count = UseMemoResult.count
		},
		onToggleItem = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy), DashModule (upval)
			UseStateResult2(function(p3)
				-- upvalues: DashModule (upval), p2 (copy)
				return DashModule.join(p3, { [p2] = not p3[p2] })
			end)
		end, {}),
		onBuyAll = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (copy), UseInspectAvatarDataModuleResult (copy), FFlagSocialEnableProfileInspectAndBuyAnalytics (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseProfileWrapperContextModuleResult (copy), UseLocalRobuxBalanceResult (copy), p1 (copy), EnumsModule (upval), FFlagProfileUnifiedPurchaseLoggingModule (upval), UseMemoResult1 (copy)
			if #UseMemoResult.lineItems == 0 or not UseInspectAvatarDataModuleResult.localUserId then return end
			if FFlagSocialEnableProfileInspectAndBuyAnalytics then
				UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.InspectAvatarBuyClicked, {
					profileSessionId = UseProfileWrapperContextModuleResult.profileSessionId,
					itemIds = table.concat(UseMemoResult.purchasedItemIds, ","),
					totalPrice = UseMemoResult.totalPrice
				})
			end
			if UseLocalRobuxBalanceResult == nil or UseLocalRobuxBalanceResult >= UseMemoResult.totalPrice then
				p1.navigation.navigate(EnumsModule.Screens.PurchaseConfirmationModal, {
					totalPrice = UseMemoResult.totalPrice,
					itemCount = UseMemoResult.count,
					purchasableLineItems = UseMemoResult.lineItems,
					userId = UseInspectAvatarDataModuleResult.localUserId,
					purchasedWearIds = UseMemoResult.purchasedWearIds,
					ownedAssetIds = UseInspectAvatarDataModuleResult.ownedAssetIds,
					purchasedItemIds = UseMemoResult.purchasedItemIds,
					purchasedBundleIds = UseMemoResult.purchasedBundleIds,
					purchasedItems = if FFlagProfileUnifiedPurchaseLoggingModule then UseMemoResult.purchasedItems else nil,
					wearTypeMap = UseMemoResult1,
					robuxBalance = UseLocalRobuxBalanceResult
				})
				
				return
			else
				p1.navigation.navigate(EnumsModule.Screens.InsufficientRobuxDialog, {
					totalPrice = UseMemoResult.totalPrice,
					robuxBalance = UseLocalRobuxBalanceResult
				})
			end
		end, {
			UseMemoResult, UseInspectAvatarDataModuleResult.localUserId,
			UseInspectAvatarDataModuleResult.ownedAssetIds, p1.navigation, UseMemoResult1,
			UseLocalRobuxBalanceResult,
			if FFlagSocialEnableProfileInspectAndBuyAnalytics then UseProfileAnalyticsContextModuleResult else nil,
			if FFlagSocialEnableProfileInspectAndBuyAnalytics then UseProfileWrapperContextModuleResult.profileSessionId else nil
		}),
		onClose = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.navigation.pop()
		end, { p1.navigation }),
		onDismiss = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseProfileWrapperContextModuleResult (copy)
			p1.navigation.pop()
			task.defer(function()
				-- upvalues: UseProfileWrapperContextModuleResult (upval)
				UseProfileWrapperContextModuleResult.navigateTo.previousView(false)
			end)
		end, {
			p1.navigation,
			UseProfileWrapperContextModuleResult.navigateTo
		}),
		openItemDetails = ReactModule.useCallback(function(p2, p3, p4)
			-- upvalues: UseProfileWrapperContextModuleResult (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseMarketplaceAnalyticsContextModuleResult (copy)
			UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails(p2, p3)
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened, {
				btnContext = "InspectAvatar",
				btnUnitId = tostring(p2),
				btnSortPosition = tostring(p4)
			})
			UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p2, p3, "InspectAvatar", p4)
		end, {
			UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails,
			UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics,
			UseProfileAnalyticsContextModuleResult,
			UseMarketplaceAnalyticsContextModuleResult
		})
	})
end