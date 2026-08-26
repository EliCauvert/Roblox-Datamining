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
local useAvatarBackgroundFromWrapperModule = require(profilePlatform.Hooks.useAvatarBackgroundFromWrapper)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useMarketplaceAnalyticsContextModule = require(profilePlatform.Hooks.useMarketplaceAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local fFlagProfileInspectAvatarBackgroundModule = require(profilePlatform.Flags.FFlagProfileInspectAvatarBackground)
local useInspectAvatarDataModule = require(script.Parent.useInspectAvatarData)
local inspectAvatarUtilsModule = require(script.Parent.InspectAvatarUtils)
local inspectAvatarSheetModule = require(script.Parent.InspectAvatarSheet)
local _ = require(profilePlatform.Common.Types)
local isItemPurchasable = inspectAvatarUtilsModule.isItemPurchasable
local getPriceStatus = inspectAvatarUtilsModule.getPriceStatus
local priceStatusEnum = inspectAvatarUtilsModule.PriceStatusEnum

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useMarketplaceAnalyticsContextModule (ref), robloxAppHooksModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useSelector (ref), useProfileCardWidth (ref), useProfileJsonComponentModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), constantsModule (ref), fFlagProfileInspectAvatarBackgroundModule (ref), useAvatarBackgroundFromWrapperModule (ref), useInspectAvatarDataModule (ref), reactModule (ref), isItemPurchasable (ref), dashModule (ref), inspectAvatarUtilsModule (ref), getPriceStatus (ref), priceStatusEnum (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), inspectAvatarSheetModule (ref)
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
	local var12 = if fFlagProfileInspectAvatarBackgroundModule then useAvatarBackgroundFromWrapperModule() else nil
	local var13 = useInspectAvatarDataModule(useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {})
	local displayItems = var13.displayItems
	local var14, var15 = reactModule.useState({})
	local var16 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: displayItems (ref), isItemPurchasable (copy), var16 (ref), var15 (ref), dashModule (copy)
		if #displayItems == 0 then return end
		local t = {}
		local var17 = false
		
		for i, v in displayItems do
			local id = v.id
			
			if isItemPurchasable(v) and not var16.current[id] then
				var16.current[id] = true
				t[id] = true
				var17 = true
			end
		end
		if var17 then
			var15(function(p2)
				-- upvalues: dashModule (copy), t (ref)
				return dashModule.join(p2, t)
			end)
			
			return
		end
	end, { displayItems })
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), dashModule (copy)
		var15(function(p3)
			-- upvalues: dashModule (copy), p2 (ref)
			return dashModule.join(p3, { [p2] = not p3[p2] })
		end)
	end, {})
	local var19 = reactModule.useMemo(function()
		-- upvalues: displayItems (ref), var14 (ref), isItemPurchasable (copy), inspectAvatarUtilsModule (copy), getPriceStatus (copy), priceStatusEnum (copy), enumsModule (copy)
		local t = {}
		local var20 = 0
		local var21 = 0
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		
		for i, v in displayItems do
			if v.id then
				local id = v.id
				
				if var14[id] and isItemPurchasable(v) then
					local effectivePrice = inspectAvatarUtilsModule.getEffectivePrice(v)
					table.insert(t, {
						collectibleProductId = if getPriceStatus(v) == priceStatusEnum.PurchaseFromResale and v.collectibleItemDetails then v.collectibleItemDetails.collectibleLowestAvailableResaleProductId or v.collectibleProductId else v.collectibleProductId,
						agreedPriceRobux = effectivePrice
					})
					var20 += effectivePrice
					var21 += 1
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
						local var22 = tonumber(v.id)
						
						if var22 and not t_4[var22] then
							t_4[var22] = true
							table.insert(t_1, var22)
						end
					end
				end
			end
		end
		return {
			lineItems = t,
			totalPrice = var20,
			count = var21,
			purchasedWearIds = t_1,
			purchasedItemIds = t_2,
			purchasedBundleIds = t_3
		}
	end, { displayItems, var14 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: displayItems (ref)
		local t = {}
		
		for i, v in displayItems do
			local var24 = tonumber(v.id)
			local var25 = tonumber(v.itemSubType)
			
			if var24 and var25 then
				t[var24] = var25
			end
			if v.assetsInBundle then
				for i_1, v_1 in v.assetsInBundle do
					local var26 = tonumber(v_1.id)
					local var27 = tonumber(v_1.assetType)
					
					if var26 and var27 then
						t[var26] = var27
					end
				end
			end
		end
		return t
	end, { displayItems })
	
	return reactModule.createElement(inspectAvatarSheetModule, {
		displayItems = displayItems,
		selectedItems = var14,
		isLoading = var13.isLoading,
		username = var10,
		profileId = profileId,
		avatarThumbnail = var11,
		avatarBackgroundImage = if fFlagProfileInspectAvatarBackgroundModule then var12 else nil,
		avatarViewportHeight = var8,
		cardWidth = var7,
		topOffset = var6,
		purchaseSummary = { totalPrice = var19.totalPrice, count = var19.count },
		onToggleItem = var18,
		onBuyAll = reactModule.useCallback(function()
			-- upvalues: var19 (ref), var13 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var2 (ref), eventNamesModule (copy), var1 (ref), var4 (ref), p1 (ref), enumsModule (copy), var23 (ref)
			if #var19.lineItems == 0 or not var13.localUserId then return end
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then
				var2.fireAnalyticsEvent(eventNamesModule.InspectAvatarBuyClicked, {
					profileSessionId = var1.profileSessionId,
					itemIds = table.concat(var19.purchasedItemIds, ","),
					totalPrice = var19.totalPrice
				})
			end
			if var4 == nil or var4 >= var19.totalPrice then
				p1.navigation.navigate(enumsModule.Screens.PurchaseConfirmationModal, {
					totalPrice = var19.totalPrice,
					itemCount = var19.count,
					purchasableLineItems = var19.lineItems,
					userId = var13.localUserId,
					purchasedWearIds = var19.purchasedWearIds,
					ownedAssetIds = var13.ownedAssetIds,
					purchasedItemIds = var19.purchasedItemIds,
					purchasedBundleIds = var19.purchasedBundleIds,
					wearTypeMap = var23,
					robuxBalance = var4
				})
				
				return
			end
			p1.navigation.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = var19.totalPrice, robuxBalance = var4 })
		end, {
			var19, var13.localUserId, var13.ownedAssetIds, p1.navigation, var23, var4,
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