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

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useMarketplaceAnalyticsContextModule (ref), robloxAppHooksModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useSelector (ref), useProfileCardWidth (ref), useProfileJsonComponentModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), constantsModule (ref), useInspectAvatarDataModule (ref), reactModule (ref), isItemPurchasable (ref), dashModule (ref), inspectAvatarUtilsModule (ref), getPriceStatus (ref), priceStatusEnum (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), inspectAvatarSheetModule (ref)
	local var17 = useProfileWrapperContextModule()
	local var18 = useProfileAnalyticsContextModule()
	local var19 = useMarketplaceAnalyticsContextModule()
	local var20 = robloxAppHooksModule.useLocalRobuxBalance()
	local var21 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local profileId = var17.profileId
	local var22 = if var21 then 0 else useSelector(function(p1)
		return p1.TopBar.statusBarHeight
	end)
	local var23 = useProfileCardWidth()
	local var24 = if var21 then 400 else math.floor(var23 * 0.75)
	local var25 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var26 = if var25.names then var25.names.username else ""
	local var27 = getRbxthumbWithTypeSizeAndOptions(profileId, constants.RbxthumbTypes.Avatar, constantsModule.AVATAR_THUMBNAIL_SIZE)
	local var28 = useInspectAvatarDataModule(useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {})
	local displayItems = var28.displayItems
	local var29, var30 = reactModule.useState({})
	local var31 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: displayItems (ref), isItemPurchasable (copy), var31 (ref), var30 (ref), dashModule (copy)
		if #displayItems == 0 then return end
		local t = {}
		local var36 = false
		
		for i, v in displayItems do
			local id = v.id
			
			if isItemPurchasable(v) and not var31.current[id] then
				var31.current[id] = true
				t[id] = true
				var36 = true
			end
		end
		if var36 then
			var30(function(p2)
				-- upvalues: dashModule (copy), t (ref)
				return dashModule.join(p2, t)
			end)
			
			return
		end
	end, { displayItems })
	local var32 = reactModule.useCallback(function(p3)
		-- upvalues: var30 (ref), dashModule (copy)
		var30(function(p4)
			-- upvalues: dashModule (copy), p3 (ref)
			return dashModule.join(p4, { [p3] = not p4[p3] })
		end)
	end, {})
	local var33 = reactModule.useMemo(function()
		-- upvalues: displayItems (ref), var29 (ref), isItemPurchasable (copy), inspectAvatarUtilsModule (copy), getPriceStatus (copy), priceStatusEnum (copy), enumsModule (copy)
		local t = {}
		local var38 = 0
		local var39 = 0
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		
		for i, v in displayItems do
			if v.id then
				local id = v.id
				
				if var29[id] and isItemPurchasable(v) then
					local effectivePrice = inspectAvatarUtilsModule.getEffectivePrice(v)
					table.insert(t, {
						collectibleProductId = if getPriceStatus(v) == priceStatusEnum.PurchaseFromResale and v.collectibleItemDetails then v.collectibleItemDetails.collectibleLowestAvailableResaleProductId or v.collectibleProductId else v.collectibleProductId,
						agreedPriceRobux = effectivePrice
					})
					var38 += effectivePrice
					var39 += 1
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
						local var45 = tonumber(v.id)
						
						if var45 and not t_4[var45] then
							t_4[var45] = true
							table.insert(t_1, var45)
						end
					end
				end
			end
		end
		return {
			lineItems = t,
			totalPrice = var38,
			count = var39,
			purchasedWearIds = t_1,
			purchasedItemIds = t_2,
			purchasedBundleIds = t_3
		}
	end, { displayItems, var29 })
	local var34 = reactModule.useMemo(function()
		-- upvalues: displayItems (ref)
		local t = {}
		
		for i, v in displayItems do
			local var47 = tonumber(v.id)
			local var48 = tonumber(v.itemSubType)
			
			if var47 and var48 then
				t[var47] = var48
			end
			if v.assetsInBundle then
				for i_1, v_1 in v.assetsInBundle do
					local var49 = tonumber(v_1.id)
					local var50 = tonumber(v_1.assetType)
					
					if var49 and var50 then
						t[var49] = var50
					end
				end
			end
		end
		return t
	end, { displayItems })
	
	return reactModule.createElement(inspectAvatarSheetModule, {
		displayItems = displayItems,
		selectedItems = var29,
		isLoading = var28.isLoading,
		username = var26,
		profileId = profileId,
		avatarThumbnail = var27,
		avatarViewportHeight = var24,
		cardWidth = var23,
		topOffset = var22,
		purchaseSummary = { totalPrice = var33.totalPrice, count = var33.count },
		onToggleItem = var32,
		onBuyAll = reactModule.useCallback(function()
			-- upvalues: var33 (ref), var28 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var18 (ref), eventNamesModule (copy), var17 (ref), var20 (ref), p0 (ref), enumsModule (copy), var34 (ref)
			if #var33.lineItems == 0 or not var28.localUserId then return end
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then
				var18.fireAnalyticsEvent(eventNamesModule.InspectAvatarBuyClicked, {
					profileSessionId = var17.profileSessionId,
					itemIds = table.concat(var33.purchasedItemIds, ","),
					totalPrice = var33.totalPrice
				})
			end
			if var20 == nil or var20 >= var33.totalPrice then
				p0.navigation.navigate(enumsModule.Screens.PurchaseConfirmationModal, {
					totalPrice = var33.totalPrice,
					itemCount = var33.count,
					purchasableLineItems = var33.lineItems,
					userId = var28.localUserId,
					purchasedWearIds = var33.purchasedWearIds,
					ownedAssetIds = var28.ownedAssetIds,
					purchasedItemIds = var33.purchasedItemIds,
					purchasedBundleIds = var33.purchasedBundleIds,
					wearTypeMap = var34,
					robuxBalance = var20
				})
				
				return
			end
			p0.navigation.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = var33.totalPrice, robuxBalance = var20 })
		end, {
			var33, var28.localUserId, var28.ownedAssetIds, p0.navigation, var34, var20,
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then var18 else nil,
			if fFlagSocialEnableProfileInspectAndBuyAnalytics then var17.profileSessionId else nil
		}),
		onClose = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			p0.navigation.pop()
		end, { p0.navigation }),
		onDismiss = reactModule.useCallback(function()
			-- upvalues: p0 (ref), var17 (ref)
			p0.navigation.pop()
			task.defer(function()
				-- upvalues: var17 (copy)
				var17.navigateTo.previousView(false)
			end)
		end, { p0.navigation, var17.navigateTo }),
		openItemDetails = reactModule.useCallback(function(p5, p6, p7)
			-- upvalues: var17 (ref), var18 (ref), eventNamesModule (copy), var19 (ref)
			var17.navigateTo.itemOrBundleDetails(p5, p6)
			var18.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, {
				btnContext = "InspectAvatar",
				btnUnitId = tostring(p5),
				btnSortPosition = tostring(p7)
			})
			var17.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var19, p5, p6, "InspectAvatar", p7)
		end, {
			var17.navigateTo.itemOrBundleDetails,
			var17.externalAnalytics.catalogAnalytics,
			var18,
			var19
		})
	})
end