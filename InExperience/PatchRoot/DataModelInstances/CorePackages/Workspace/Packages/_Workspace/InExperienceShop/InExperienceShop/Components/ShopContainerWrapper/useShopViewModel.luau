local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local signalsReactModule = require(parent.SignalsReact)
local constantsModule = require(inExperienceShop.Constants)
local sharedFlagsModule = require(parent.SharedFlags)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
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
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), getFixRobuxTileClickInShopModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), var1 (write), resolveItemForSelection (ref), shopItemSelectionModule (ref), constantsModule (ref), fFlagEnableUserOffers (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), useShopOfferChipModule (ref), inExperienceOffersModule (ref)
	local var2
	local var3 = useTokens()
	local var4 = useLocalization(t)
	local var5 = getFixRobuxTileClickInShopModule()
	local var6 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var7 = signalsReactModule.useSignalState(var6.getCategories)
	local var8 = signalsReactModule.useSignalState(var6.getSections)
	local var9 = signalsReactModule.useSignalState(var6.getItemsPerRow)
	local var10 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), var7 (ref), var8 (ref)
		return var1(var7, var8)
	end, { var7, var8 })
	local homeLabel = var4.homeLabel
	local var11 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), homeLabel (ref)
		local list = table.create(#var10.categories)
		
		for i, v in var10.categories do
			list[i] = {
				id = v.id,
				text = if v.id == "home" then homeLabel else v.name
			}
		end
		return list
	end, { var10.categories, homeLabel })
	local var12, var13 = reactModule.useState(function()
		-- upvalues: var10 (ref)
		return if #var10.categories > 0 then var10.categories[1].id else ""
	end)
	local var14, var15 = reactModule.useState(function()
		return nil
	end)
	local var16, var17 = reactModule.useState(function()
		return nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var13 (ref)
		local categories = var10.categories
		
		if #categories == 0 then
			return
		end
		var13(function(p2)
			-- upvalues: categories (ref)
			for i, v in categories do
				if v.id == p2 then
					return p2
				end
			end
			return categories[1].id
		end)
	end, { var10.categories })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var16 (ref), resolveItemForSelection (copy), var10 (ref), var5 (ref), var15 (ref), var17 (ref)
		if var14 == nil or var16 == nil then return end
		if resolveItemForSelection(var10.sections, var14, var16, var5) == nil then
			var15(nil)
			var17(nil)
		end
	end, { var10.sections, var14, var16, var5 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: resolveItemForSelection (copy), var10 (ref), var14 (ref), var16 (ref), var5 (ref)
		return resolveItemForSelection(var10.sections, var14, var16, var5)
	end, { var10.sections, var14, var16, var5 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: shopItemSelectionModule (copy), var10 (ref), var14 (ref), var16 (ref), var5 (ref)
		return shopItemSelectionModule.isRobuxBonusOnlySelection(var10.sections, var14, var16, var5)
	end, { var10.sections, var14, var16, var5 })
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref)
		var13(p2)
	end, {})
	local var21, var22 = reactModule.useState("")
	local var23, var24 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), constantsModule (copy), var24 (ref)
		local var25 = var21
		local _, replaced = string.gsub(var25, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #var25 - replaced then
			local var26 = false
			task.delay(constantsModule.SEARCH_DEBOUNCE_SECONDS, function()
				-- upvalues: var26 (write), var24 (copy), var21 (copy)
				if var26 then
					return
				end
				var24(var21)
			end)
			
			return function()
				-- upvalues: var26 (write)
				var26 = true
			end
		end
		var24("")
	end, { var21 })
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var22 (ref)
		var22(p2)
	end, {})
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: var22 (ref), constantsModule (copy), var24 (ref)
		var22(p2)
		local _, replaced = string.gsub(p2, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #p2 - replaced then
			var24(p2)
			
			return
		end
		var24("")
	end, {})
	local var27 = reactModule.useCallback(function(p2, p3)
		-- upvalues: resolveItemForSelection (copy), var10 (ref), var5 (ref), var15 (ref), var17 (ref)
		if p3 == nil then return end
		if resolveItemForSelection(var10.sections, p2, p3, var5) == nil then
			return
		end
		var15(p2)
		var17(p3)
	end, { var10.sections, var5 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var17 (ref)
		var15(nil)
		var17(nil)
	end, {})
	local var29, var30 = reactModule.useState(false)
	local var31 = reactModule.useCallback(function()
		-- upvalues: var30 (ref)
		var30(true)
	end, {})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), var22 (ref), var24 (ref)
		var30(false)
		var22("")
		var24("")
	end, {})
	local setItemsPerRow = var6.setItemsPerRow
	local _ = nil
	local _ = nil
	
	if fFlagEnableUserOffers then
		local var33, var34 = reactModule.useState(false)
		var2 = var33
		local var35 = var34
	else
		var2 = false
		
		local var35 = function(_) end
	end
	local var36 = useShopReportOverflowModule.useShopReportOverflow({
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
		overMediaColor = var3.Color.OverMedia.OverMedia_0.Color3,
		overMediaTransparency = var3.Color.OverMedia.OverMedia_0.Transparency,
		onClose = p1.toggleWindow,
		tabs = var11,
		selectedCategoryId = var12,
		onCategorySelected = var20,
		searchQuery = var21,
		committedQuery = var23,
		onSearchQueryChanged = var25,
		onSearchSubmit = var26,
		isSearchOpen = var29,
		onSearchOpen = var31,
		onSearchCancel = var32,
		sections = var10.sections,
		selectedItem = var18,
		selectedItemDisableBuy = var19,
		onItemActivated = var27,
		onDetailsClose = var28,
		itemsPerRow = var9,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: constantsModule (copy), setItemsPerRow (ref), fFlagEnableUserOffers (copy), var35 (write)
			local x = p2.AbsoluteSize.X
			
			if x == 0 then return end
			setItemsPerRow(math.max(constantsModule.MIN_COLUMNS, math.min(constantsModule.ITEMS_PER_SECTION, math.floor(x / constantsModule.MIN_TILE_WIDTH))))
			
			if fFlagEnableUserOffers then
				var35(x < constantsModule.COMPACT_BREAKPOINT_WIDTH)
			end
		end, {
			setItemsPerRow,
			if fFlagEnableUserOffers then var35 else nil
		}),
		isReportingEnabled = var36.isReportingEnabled,
		isOverflowMenuOpen = var36.isOverflowMenuOpen,
		topBarReportSession = var36.reportSession,
		onOverflowActivated = var36.onOverflowActivated,
		onOverflowMenuClosed = var36.onOverflowMenuClosed,
		onMenuItemActivated = var36.onMenuItemActivated,
		onTopBarReportClose = var36.onReportClose,
		offer = if fFlagEnableUserOffers then if fFlagEnableUserOffers then useShopOfferChipModule(inExperienceOffersModule.FeatureKeys.RobloxShop, var2) else nil else nil
	}
end

var1 = function(p2, p3)
	local t = {}
	
	for i, v in p3 do
		t[v.id] = true
	end
	local var18 = #p3 > 0
	local t_1 = {}
	
	for i_1, v_1 in p2 do
		if t[v_1.id] or var18 then
			table.insert(t_1, v_1)
		end
	end
	return { categories = t_1, sections = p3 }
end

return useShopViewModel