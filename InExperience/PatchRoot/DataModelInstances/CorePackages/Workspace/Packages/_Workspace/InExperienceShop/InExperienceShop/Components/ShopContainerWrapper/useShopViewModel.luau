local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local signalsReactModule = require(parent.SignalsReact)
local isSideSheetEnabledModule = require(parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local constantsModule = require(inExperienceShop.Constants)
local sharedFlagsModule = require(parent.SharedFlags)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local fFlagShopRobuxPurchaseCompletionModalModule = require(inExperienceShop.Flags.FFlagShopRobuxPurchaseCompletionModal)
local formatPriceModule = require(inExperienceShop.Utils.formatPrice)
local getFixRobuxTileClickInShopModule = require(inExperienceShop.Flags.GetFixRobuxTileClickInShop)
local shopItemSelectionModule = require(inExperienceShop.Utils.shopItemSelection)
local resolveItemForSelection = shopItemSelectionModule.resolveItemForSelection
local useShopOfferChipModule = require(inExperienceShop.Hooks.useShopOfferChip)
local inExperienceOffersModule = require(parent.InExperienceOffers)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local t = { homeLabel = "CommonUI.Features.Label.Home" }
local _ = require(script.Parent.ShopView)

local function _(p1)
	-- upvalues: constantsModule (ref)
	local _, replaced = string.gsub(p1, " ", "")
	
	return constantsModule.SEARCH_MIN_LENGTH <= #p1 - replaced
end

local var1 = nil

local function useShopViewModel(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), getFixRobuxTileClickInShopModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), fFlagShopRobuxPurchaseCompletionModalModule (ref), reactModule (ref), formatPriceModule (ref), var1 (write), isSideSheetEnabledModule (ref), resolveItemForSelection (ref), shopItemSelectionModule (ref), constantsModule (ref), fFlagEnableUserOffers (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), useShopOfferChipModule (ref), inExperienceOffersModule (ref)
	local var2 = useTokens()
	local var3 = useLocalization(t)
	local var4 = getFixRobuxTileClickInShopModule()
	local var5 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var6 = signalsReactModule.useSignalState(var5.getCategories)
	local var7 = signalsReactModule.useSignalState(var5.getSections)
	local var8 = signalsReactModule.useSignalState(var5.getItemsPerRow)
	local var9 = signalsReactModule.useSignalState(var5.getShouldOpenToRobuxTab)
	local t_1 = nil
	
	if fFlagShopRobuxPurchaseCompletionModalModule then
		local var10 = signalsReactModule.useSignalState(var5.getPurchasedRobuxAmount)
		reactModule.useEffect(function()
			-- upvalues: var10 (ref), var5 (ref)
			return if var10 == nil then nil else function()
				-- upvalues: var5 (copy), var10 (copy)
				if var5.getPurchasedRobuxAmount(false) == var10 then
					var5.dismissRobuxPurchaseSuccess()
				end
			end
		end, { var10, var5 })
		local var11 = useLocalization({
			bodyText = if var10 ~= nil then nil else {
				"Feature.InExperienceShop.Message.RobuxPurchaseSuccess",
				ROBUX_AMOUNT = formatPriceModule(var10)
			}
		})
		
		if var10 ~= nil then
			t_1 = {
				bodyText = var11.bodyText,
				onClose = var5.dismissRobuxPurchaseSuccess
			}
		end
	end
	local var12
	local var13 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), var6 (ref), var7 (ref)
		return var1(var6, var7)
	end, { var6, var7 })
	local homeLabel = var3.homeLabel
	local var14 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), homeLabel (ref)
		local list = table.create(#var13.categories)
		
		for i, v in var13.categories do
			list[i] = {
				id = v.id,
				text = if v.id == "home" then homeLabel else v.name
			}
		end
		return list
	end, { var13.categories, homeLabel })
	local _ = nil
	local var15 = reactModule.useCallback(function()
		-- upvalues: isSideSheetEnabledModule (copy), var13 (ref)
		if not isSideSheetEnabledModule then
			return nil
		end
		for i, v in var13.categories do
			if v.name == "Robux" then
				return v.id
			end
		end
		return nil
	end, { var13.categories })
	local var16, var17 = reactModule.useState(function()
		-- upvalues: isSideSheetEnabledModule (copy), var9 (ref), var15 (write), var13 (ref)
		if isSideSheetEnabledModule and var9 then
			local var18 = var15()
			
			return if var18 == nil then if #var13.categories > 0 then var13.categories[1].id else "" else var18
		end
	end)
	local var18, var19 = reactModule.useState(function()
		return nil
	end)
	local var20, var21 = reactModule.useState(function()
		return nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var17 (ref)
		local categories = var13.categories
		
		if #categories == 0 then
			return
		end
		var17(function(p2)
			-- upvalues: categories (ref)
			for i, v in categories do
				if v.id == p2 then
					return p2
				end
			end
			return categories[1].id
		end)
	end, { var13.categories })
	reactModule.useEffect(function()
		-- upvalues: isSideSheetEnabledModule (copy), var9 (ref), var13 (ref), var5 (ref), var15 (write), var17 (ref)
		if isSideSheetEnabledModule and var9 and #var13.categories > 0 then
			var5.setShouldOpenToRobuxTab(false)
			local var22 = var15()
			
			if var22 ~= nil then
				var17(var22)
			end
		end
	end, {
		var15,
		var13.categories,
		var9,
		var5.setShouldOpenToRobuxTab
	})
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var20 (ref), resolveItemForSelection (copy), var13 (ref), var4 (ref), var19 (ref), var21 (ref)
		if var18 == nil or var20 == nil then return end
		if resolveItemForSelection(var13.sections, var18, var20, var4) == nil then
			var19(nil)
			var21(nil)
		end
	end, { var13.sections, var18, var20, var4 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: resolveItemForSelection (copy), var13 (ref), var18 (ref), var20 (ref), var4 (ref)
		return resolveItemForSelection(var13.sections, var18, var20, var4)
	end, { var13.sections, var18, var20, var4 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: shopItemSelectionModule (copy), var13 (ref), var18 (ref), var20 (ref), var4 (ref)
		return shopItemSelectionModule.isRobuxBonusOnlySelection(var13.sections, var18, var20, var4)
	end, { var13.sections, var18, var20, var4 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref)
		var17(p2)
	end, {})
	local var25, var26 = reactModule.useState("")
	local var27, var28 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), constantsModule (copy), var28 (ref)
		local var29 = var25
		local _, replaced = string.gsub(var29, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #var29 - replaced then
			local var30 = false
			task.delay(constantsModule.SEARCH_DEBOUNCE_SECONDS, function()
				-- upvalues: var30 (write), var28 (copy), var25 (copy)
				if var30 then
					return
				end
				var28(var25)
			end)
			
			return function()
				-- upvalues: var30 (write)
				var30 = true
			end
		end
		var28("")
	end, { var25 })
	local var29 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref)
		var26(p2)
	end, {})
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref), constantsModule (copy), var28 (ref)
		var26(p2)
		local _, replaced = string.gsub(p2, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #p2 - replaced then
			var28(p2)
			
			return
		end
		var28("")
	end, {})
	local var31 = reactModule.useCallback(function(p2, p3)
		-- upvalues: resolveItemForSelection (copy), var13 (ref), var4 (ref), var19 (ref), var21 (ref)
		if p3 == nil then return end
		if resolveItemForSelection(var13.sections, p2, p3, var4) == nil then
			return
		end
		var19(p2)
		var21(p3)
	end, { var13.sections, var4 })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var21 (ref)
		var19(nil)
		var21(nil)
	end, {})
	local var33, var34 = reactModule.useState(false)
	local var35 = reactModule.useCallback(function()
		-- upvalues: var34 (ref)
		var34(true)
	end, {})
	local var36 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), var26 (ref), var28 (ref)
		var34(false)
		var26("")
		var28("")
	end, {})
	local setItemsPerRow = var5.setItemsPerRow
	local _ = nil
	local _ = nil
	
	if fFlagEnableUserOffers then
		local var37, var38 = reactModule.useState(false)
		var12 = var37
		local var39 = var38
	else
		var12 = false
		
		local var39 = function(_) end
	end
	local var40 = useShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = reactModule.useCallback(function()
			-- upvalues: abuseVectorModule (copy)
			return {
				abuseVector = abuseVectorModule.InExperienceShop,
				targetId = tostring(game.PlaceId)
			}
		end, {})
	})
	
	return {
		fullScreen = p1.fullScreen,
		overMediaColor = var2.Color.OverMedia.OverMedia_0.Color3,
		overMediaTransparency = var2.Color.OverMedia.OverMedia_0.Transparency,
		onClose = p1.toggleWindow,
		robuxPurchaseSuccess = t_1,
		tabs = var14,
		selectedCategoryId = var16,
		onCategorySelected = var24,
		searchQuery = var25,
		committedQuery = var27,
		onSearchQueryChanged = var29,
		onSearchSubmit = var30,
		isSearchOpen = var33,
		onSearchOpen = var35,
		onSearchCancel = var36,
		sections = var13.sections,
		selectedItem = var22,
		selectedItemDisableBuy = var23,
		onItemActivated = var31,
		onDetailsClose = var32,
		itemsPerRow = var8,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: constantsModule (copy), setItemsPerRow (ref), fFlagEnableUserOffers (copy), var39 (write)
			local x = p2.AbsoluteSize.X
			
			if x == 0 then return end
			setItemsPerRow(math.max(constantsModule.MIN_COLUMNS, math.min(constantsModule.ITEMS_PER_SECTION, math.floor(x / constantsModule.MIN_TILE_WIDTH))))
			
			if fFlagEnableUserOffers then
				var39(x < constantsModule.COMPACT_BREAKPOINT_WIDTH)
			end
		end, {
			setItemsPerRow,
			if fFlagEnableUserOffers then var39 else nil
		}),
		isReportingEnabled = var40.isReportingEnabled,
		isOverflowMenuOpen = var40.isOverflowMenuOpen,
		topBarReportSession = var40.reportSession,
		onOverflowActivated = var40.onOverflowActivated,
		onOverflowMenuClosed = var40.onOverflowMenuClosed,
		onMenuItemActivated = var40.onMenuItemActivated,
		onTopBarReportClose = var40.onReportClose,
		offer = if fFlagEnableUserOffers then if fFlagEnableUserOffers then useShopOfferChipModule(inExperienceOffersModule.FeatureKeys.RobloxShop, var12) else nil else nil
	}
end

var1 = function(p2, p3)
	local t = {}
	
	for i, v in p3 do
		t[v.id] = true
	end
	local var22 = #p3 > 0
	local t_1 = {}
	
	for i_1, v_1 in p2 do
		if t[v_1.id] or var22 then
			table.insert(t_1, v_1)
		end
	end
	return { categories = t_1, sections = p3 }
end

return useShopViewModel