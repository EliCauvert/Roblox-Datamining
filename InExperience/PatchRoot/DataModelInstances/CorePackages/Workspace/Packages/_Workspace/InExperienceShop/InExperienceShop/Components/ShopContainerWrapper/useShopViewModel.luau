local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local signalsReactModule = require(parent.SignalsReact)
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
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
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), getFixRobuxTileClickInShopModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), var1 (write), isPioneerLaunch (ref), resolveItemForSelection (ref), shopItemSelectionModule (ref), constantsModule (ref), fFlagEnableUserOffers (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), useShopOfferChipModule (ref), inExperienceOffersModule (ref)
	local var2
	local var3 = useTokens()
	local var4 = useLocalization(t)
	local var5 = getFixRobuxTileClickInShopModule()
	local var6 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var7 = signalsReactModule.useSignalState(var6.getCategories)
	local var8 = signalsReactModule.useSignalState(var6.getSections)
	local var9 = signalsReactModule.useSignalState(var6.getItemsPerRow)
	local var10 = signalsReactModule.useSignalState(var6.getShouldOpenToRobuxTab)
	local var11 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), var7 (ref), var8 (ref)
		return var1(var7, var8)
	end, { var7, var8 })
	local homeLabel = var4.homeLabel
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), homeLabel (ref)
		local list = table.create(#var11.categories)
		
		for i, v in var11.categories do
			list[i] = {
				id = v.id,
				text = if v.id == "home" then homeLabel else v.name
			}
		end
		return list
	end, { var11.categories, homeLabel })
	local _ = nil
	local var13 = reactModule.useCallback(function()
		-- upvalues: isPioneerLaunch (copy), var11 (ref)
		if not isPioneerLaunch() then
			return nil
		end
		for i, v in var11.categories do
			if v.name == "Robux" then
				return v.id
			end
		end
		return nil
	end, { var11.categories })
	local var14, var15 = reactModule.useState(function()
		-- upvalues: isPioneerLaunch (copy), var10 (ref), var13 (write), var11 (ref)
		if isPioneerLaunch() and var10 then
			local var16 = var13()
			
			return if var16 == nil then if #var11.categories > 0 then var11.categories[1].id else "" else var16
		end
	end)
	local var16, var17 = reactModule.useState(function()
		return nil
	end)
	local var18, var19 = reactModule.useState(function()
		return nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var15 (ref)
		local categories = var11.categories
		
		if #categories == 0 then
			return
		end
		var15(function(p2)
			-- upvalues: categories (ref)
			for i, v in categories do
				if v.id == p2 then
					return p2
				end
			end
			return categories[1].id
		end)
	end, { var11.categories })
	reactModule.useEffect(function()
		-- upvalues: isPioneerLaunch (copy), var10 (ref), var11 (ref), var6 (ref), var13 (write), var15 (ref)
		if isPioneerLaunch() and var10 and #var11.categories > 0 then
			var6.setShouldOpenToRobuxTab(false)
			local var20 = var13()
			
			if var20 ~= nil then
				var15(var20)
			end
		end
	end, {
		var13,
		var11.categories,
		var10,
		var6.setShouldOpenToRobuxTab
	})
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var18 (ref), resolveItemForSelection (copy), var11 (ref), var5 (ref), var17 (ref), var19 (ref)
		if var16 == nil or var18 == nil then return end
		if resolveItemForSelection(var11.sections, var16, var18, var5) == nil then
			var17(nil)
			var19(nil)
		end
	end, { var11.sections, var16, var18, var5 })
	local var20 = reactModule.useMemo(function()
		-- upvalues: resolveItemForSelection (copy), var11 (ref), var16 (ref), var18 (ref), var5 (ref)
		return resolveItemForSelection(var11.sections, var16, var18, var5)
	end, { var11.sections, var16, var18, var5 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: shopItemSelectionModule (copy), var11 (ref), var16 (ref), var18 (ref), var5 (ref)
		return shopItemSelectionModule.isRobuxBonusOnlySelection(var11.sections, var16, var18, var5)
	end, { var11.sections, var16, var18, var5 })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref)
		var15(p2)
	end, {})
	local var23, var24 = reactModule.useState("")
	local var25, var26 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), constantsModule (copy), var26 (ref)
		local var27 = var23
		local _, replaced = string.gsub(var27, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #var27 - replaced then
			local var28 = false
			task.delay(constantsModule.SEARCH_DEBOUNCE_SECONDS, function()
				-- upvalues: var28 (write), var26 (copy), var23 (copy)
				if var28 then
					return
				end
				var26(var23)
			end)
			
			return function()
				-- upvalues: var28 (write)
				var28 = true
			end
		end
		var26("")
	end, { var23 })
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var24 (ref)
		var24(p2)
	end, {})
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var24 (ref), constantsModule (copy), var26 (ref)
		var24(p2)
		local _, replaced = string.gsub(p2, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #p2 - replaced then
			var26(p2)
			
			return
		end
		var26("")
	end, {})
	local var29 = reactModule.useCallback(function(p2, p3)
		-- upvalues: resolveItemForSelection (copy), var11 (ref), var5 (ref), var17 (ref), var19 (ref)
		if p3 == nil then return end
		if resolveItemForSelection(var11.sections, p2, p3, var5) == nil then
			return
		end
		var17(p2)
		var19(p3)
	end, { var11.sections, var5 })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var19 (ref)
		var17(nil)
		var19(nil)
	end, {})
	local var31, var32 = reactModule.useState(false)
	local var33 = reactModule.useCallback(function()
		-- upvalues: var32 (ref)
		var32(true)
	end, {})
	local var34 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var24 (ref), var26 (ref)
		var32(false)
		var24("")
		var26("")
	end, {})
	local setItemsPerRow = var6.setItemsPerRow
	local _ = nil
	local _ = nil
	
	if fFlagEnableUserOffers then
		local var35, var36 = reactModule.useState(false)
		var2 = var35
		local var37 = var36
	else
		var2 = false
		
		local var37 = function(_) end
	end
	local var38 = useShopReportOverflowModule.useShopReportOverflow({
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
		tabs = var12,
		selectedCategoryId = var14,
		onCategorySelected = var22,
		searchQuery = var23,
		committedQuery = var25,
		onSearchQueryChanged = var27,
		onSearchSubmit = var28,
		isSearchOpen = var31,
		onSearchOpen = var33,
		onSearchCancel = var34,
		sections = var11.sections,
		selectedItem = var20,
		selectedItemDisableBuy = var21,
		onItemActivated = var29,
		onDetailsClose = var30,
		itemsPerRow = var9,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: constantsModule (copy), setItemsPerRow (ref), fFlagEnableUserOffers (copy), var37 (write)
			local x = p2.AbsoluteSize.X
			
			if x == 0 then return end
			setItemsPerRow(math.max(constantsModule.MIN_COLUMNS, math.min(constantsModule.ITEMS_PER_SECTION, math.floor(x / constantsModule.MIN_TILE_WIDTH))))
			
			if fFlagEnableUserOffers then
				var37(x < constantsModule.COMPACT_BREAKPOINT_WIDTH)
			end
		end, {
			setItemsPerRow,
			if fFlagEnableUserOffers then var37 else nil
		}),
		isReportingEnabled = var38.isReportingEnabled,
		isOverflowMenuOpen = var38.isOverflowMenuOpen,
		topBarReportSession = var38.reportSession,
		onOverflowActivated = var38.onOverflowActivated,
		onOverflowMenuClosed = var38.onOverflowMenuClosed,
		onMenuItemActivated = var38.onMenuItemActivated,
		onTopBarReportClose = var38.onReportClose,
		offer = if fFlagEnableUserOffers then if fFlagEnableUserOffers then useShopOfferChipModule(inExperienceOffersModule.FeatureKeys.RobloxShop, var2) else nil else nil
	}
end

var1 = function(p2, p3)
	local t = {}
	
	for i, v in p3 do
		t[v.id] = true
	end
	local var20 = #p3 > 0
	local t_1 = {}
	
	for i_1, v_1 in p2 do
		if t[v_1.id] or var20 then
			table.insert(t_1, v_1)
		end
	end
	return { categories = t_1, sections = p3 }
end

return useShopViewModel