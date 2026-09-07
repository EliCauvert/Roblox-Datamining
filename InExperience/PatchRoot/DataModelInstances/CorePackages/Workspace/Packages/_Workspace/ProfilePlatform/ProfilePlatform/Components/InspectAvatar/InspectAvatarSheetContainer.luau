local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local userLibModule = require(parent.UserLib)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useMarketplaceAnalyticsContextModule = require(profilePlatform.Hooks.useMarketplaceAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local useInspectAvatarDataModule = require(script.Parent.useInspectAvatarData)
local inspectAvatarUtilsModule = require(script.Parent.InspectAvatarUtils)
local inspectAvatarSheetModule = require(script.Parent.InspectAvatarSheet)
local _ = require(profilePlatform.Common.Types)
local isItemPurchasable = inspectAvatarUtilsModule.isItemPurchasable
local getPriceStatus = inspectAvatarUtilsModule.getPriceStatus
local priceStatusEnum = inspectAvatarUtilsModule.PriceStatusEnum

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useMarketplaceAnalyticsContextModule (ref), robloxAppHooksModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useSelector (ref), useProfileCardWidth (ref), useProfileJsonComponentModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), constantsModule (ref), useInspectAvatarDataModule (ref), reactModule (ref), isItemPurchasable (ref), dashModule (ref), inspectAvatarUtilsModule (ref), getPriceStatus (ref), priceStatusEnum (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), inspectAvatarSheetModule (ref)
	local var1 = useProfileWrapperContextModule()
	local var2 = useProfileAnalyticsContextModule()
	local var3 = useMarketplaceAnalyticsContextModule()
	local var4 = robloxAppHooksModule.useLocalRobuxBalance()
	local var5 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local profileId = var1.profileId
	local var6 = if var5 then 0 else useSelector(function(p2)
		return p2.TopBar.statusBarHeight
	end)
	local var7 = useProfileCardWidth()
	local var8 = if var5 then 400 else math.floor(var7 * 0.75)
	local var9 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var10 = if var9.names then var9.names.username else ""
	local var11 = getRbxthumbWithTypeSizeAndOptions(profileId, constants.RbxthumbTypes.Avatar, constantsModule.AVATAR_THUMBNAIL_SIZE)
	local var12 = useInspectAvatarDataModule(useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {})
	local displayItems = var12.displayItems
	local var13, var14 = reactModule.useState({})
	local var15 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: displayItems (ref), isItemPurchasable (copy), var15 (ref), var14 (ref), dashModule (copy)
		if #displayItems == 0 then return end
		local t = {}
		local var16 = false
		
		for i, v in displayItems do
			local id = v.id
			
			if isItemPurchasable(v) and not var15.current[id] then
				var15.current[id] = true
				t[id] = true
				var16 = true
			end
		end
		if var16 then
			var14(function(p2)
				-- upvalues: dashModule (copy), t (ref)
				return dashModule.join(p2, t)
			end)
			
			return
		end
	end, { displayItems })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var14 (ref), dashModule (copy)
		var14(function(p3)
			-- upvalues: dashModule (copy), p2 (ref)
			return dashModule.join(p3, { [p2] = not p3[p2] })
		end)
	end, {})
	local var18 = reactModule.useMemo(function()
		-- upvalues: displayItems (ref), var13 (ref), isItemPurchasable (copy), inspectAvatarUtilsModule (copy), getPriceStatus (copy), priceStatusEnum (copy), enumsModule (copy)
		local t = {}
		local var19 = 0
		local var20 = 0
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		
		for i, v in displayItems do
			if v.id then
				local id = v.id
				
				if var13[id] and isItemPurchasable(v) then
					local effectivePrice = inspectAvatarUtilsModule.getEffectivePrice(v)
					table.insert(t, {
						collectibleProductId = if getPriceStatus(v) == priceStatusEnum.PurchaseFromResale and v.collectibleItemDetails then v.collectibleItemDetails.collectibleLowestAvailableResaleProductId or v.collectibleProductId else v.collectibleProductId,
						agreedPriceRobux = effectivePrice
					})
					var19 += effectivePrice
					var20 += 1
					table.insert(t_2, id)
					
					if v.itemType == enumsModule.ItemTypes.Bundle then
						table.insert(t_3, id)
					end
					if #v.bundleAssetIds > 0 then
						for i_1, v_1 in v.bundleAssetIds do
							if not t_4[v_1] then
								t_4[v_1] = true
								table.insert(t_1, v_1)
							end
						end
					else
						local var21 = tonumber(v.id)
						
						if var21 and not t_4[var21] then
							t_4[var21] = true
							table.insert(t_1, var21)
						end
					end
				end
			end
		end
		return {
			lineItems = t,
			totalPrice = var19,
			count = var20,
			purchasedWearIds = t_1,
			purchasedItemIds = t_2,
			purchasedBundleIds = t_3
		}
	end, { displayItems, var13 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: displayItems (ref)
		local t = {}
		
		for i, v in displayItems do
			local var23 = tonumber(v.id)
			local var24 = tonumber(v.itemSubType)
			
			if var23 and var24 then
				t[var23] = var24
			end
			if v.assetsInBundle then
				for i_1, v_1 in v.assetsInBundle do
					local var25 = tonumber(v_1.id)
					local var26 = tonumber(v_1.assetType)
					
					if var25 and var26 then
						t[var25] = var26
					end
				end
			end
		end
		return t
	end, { displayItems })
	
	return reactModule.createElement(inspectAvatarSheetModule, {
		displayItems = displayItems,
		selectedItems = var13,
		isLoading = var12.isLoading,
		username = var10,
		profileId = profileId,
		avatarThumbnail = var11,
		avatarViewportHeight = var8,
		cardWidth = var7,
		topOffset = var6,
		purchaseSummary = { totalPrice = var18.totalPrice, count = var18.count },
		onToggleItem = var17,
		onBuyAll = reactModule.useCallback(function()
			-- upvalues: var18 (ref), var12 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var2 (ref), eventNamesModule (copy), var1 (ref), var4 (ref), p1 (ref), enumsModule (copy), var22 (ref)
			if #var18.lineItems == 0 or not var12.localUserId then return end
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then
				var2.fireAnalyticsEvent(eventNamesModule.InspectAvatarBuyClicked, {
					profileSessionId = var1.profileSessionId,
					itemIds = table.concat(var18.purchasedItemIds, ","),
					totalPrice = var18.totalPrice
				})
			end
			if var4 == nil or var4 >= var18.totalPrice then
				p1.navigation.navigate(enumsModule.Screens.PurchaseConfirmationModal, {
					totalPrice = var18.totalPrice,
					itemCount = var18.count,
					purchasableLineItems = var18.lineItems,
					userId = var12.localUserId,
					purchasedWearIds = var18.purchasedWearIds,
					ownedAssetIds = var12.ownedAssetIds,
					purchasedItemIds = var18.purchasedItemIds,
					purchasedBundleIds = var18.purchasedBundleIds,
					wearTypeMap = var22,
					robuxBalance = var4
				})
				
				return
			end
			p1.navigation.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = var18.totalPrice, robuxBalance = var4 })
		end, {
			var18, var12.localUserId, var12.ownedAssetIds, p1.navigation, var22, var4,
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then var2 else nil,
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then var1.profileSessionId else nil
		}),
		onClose = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.navigation.pop()
		end, { p1.navigation }),
		onDismiss = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var1 (ref)
			p1.navigation.pop()
			task.defer(function()
				-- upvalues: var1 (copy)
				var1.navigateTo.previousView(false)
			end)
		end, { p1.navigation, var1.navigateTo }),
		openItemDetails = reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: var1 (ref), var2 (ref), eventNamesModule (copy), var3 (ref)
			var1.navigateTo.itemOrBundleDetails(p2, p3)
			var2.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, {
				btnContext = "InspectAvatar",
				btnUnitId = tostring(p2),
				btnSortPosition = tostring(p4)
			})
			var1.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var3, p2, p3, "InspectAvatar", p4)
		end, {
			var1.navigateTo.itemOrBundleDetails,
			var1.externalAnalytics.catalogAnalytics,
			var2,
			var3
		})
	})
end