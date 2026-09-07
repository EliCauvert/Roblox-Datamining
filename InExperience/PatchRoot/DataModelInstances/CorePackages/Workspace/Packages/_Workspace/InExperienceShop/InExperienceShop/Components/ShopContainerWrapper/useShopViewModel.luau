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
local t = { homeLabel = "CommonUI.Features.Label.Home" }
local _ = require(script.Parent.ShopView)

local function _(p1)
	-- upvalues: constantsModule (ref)
	local _, replaced = string.gsub(p1, " ", "")
	
	return constantsModule.SEARCH_MIN_LENGTH <= #p1 - replaced
end

local var1 = nil

local function useShopViewModel(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), getFixRobuxTileClickInShopModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), var1 (write), resolveItemForSelection (ref), shopItemSelectionModule (ref), constantsModule (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref)
	local var2 = useTokens()
	local var3 = useLocalization(t)
	local var4 = getFixRobuxTileClickInShopModule()
	local var5 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var6 = signalsReactModule.useSignalState(var5.getCategories)
	local var7 = signalsReactModule.useSignalState(var5.getSections)
	local var8 = signalsReactModule.useSignalState(var5.getItemsPerRow)
	local var9 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), var6 (ref), var7 (ref)
		return var1(var6, var7)
	end, { var6, var7 })
	local homeLabel = var3.homeLabel
	local var10 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), homeLabel (ref)
		local list = table.create(#var9.categories)
		
		for i, v in var9.categories do
			list[i] = {
				id = v.id,
				text = if v.id == "home" then homeLabel else v.name
			}
		end
		return list
	end, { var9.categories, homeLabel })
	local var11, var12 = reactModule.useState(function()
		-- upvalues: var9 (ref)
		return if #var9.categories > 0 then var9.categories[1].id else ""
	end)
	local var13, var14 = reactModule.useState(function()
		return nil
	end)
	local var15, var16 = reactModule.useState(function()
		return nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var12 (ref)
		local categories = var9.categories
		
		if #categories == 0 then
			return
		end
		var12(function(p2)
			-- upvalues: categories (ref)
			for i, v in categories do
				if v.id == p2 then
					return p2
				end
			end
			return categories[1].id
		end)
	end, { var9.categories })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var15 (ref), resolveItemForSelection (copy), var9 (ref), var4 (ref), var14 (ref), var16 (ref)
		if var13 == nil or var15 == nil then return end
		if resolveItemForSelection(var9.sections, var13, var15, var4) == nil then
			var14(nil)
			var16(nil)
		end
	end, { var9.sections, var13, var15, var4 })
	local var17 = reactModule.useMemo(function()
		-- upvalues: resolveItemForSelection (copy), var9 (ref), var13 (ref), var15 (ref), var4 (ref)
		return resolveItemForSelection(var9.sections, var13, var15, var4)
	end, { var9.sections, var13, var15, var4 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: shopItemSelectionModule (copy), var9 (ref), var13 (ref), var15 (ref), var4 (ref)
		return shopItemSelectionModule.isRobuxBonusOnlySelection(var9.sections, var13, var15, var4)
	end, { var9.sections, var13, var15, var4 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref)
		var12(p2)
	end, {})
	local var20, var21 = reactModule.useState("")
	local var22, var23 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), constantsModule (copy), var23 (ref)
		local var24 = var20
		local _, replaced = string.gsub(var24, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #var24 - replaced then
			local var25 = false
			task.delay(constantsModule.SEARCH_DEBOUNCE_SECONDS, function()
				-- upvalues: var25 (write), var23 (copy), var20 (copy)
				if var25 then
					return
				end
				var23(var20)
			end)
			
			return function()
				-- upvalues: var25 (write)
				var25 = true
			end
		end
		var23("")
	end, { var20 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref)
		var21(p2)
	end, {})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref), constantsModule (copy), var23 (ref)
		var21(p2)
		local _, replaced = string.gsub(p2, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #p2 - replaced then
			var23(p2)
			
			return
		end
		var23("")
	end, {})
	local var26 = reactModule.useCallback(function(p2, p3)
		-- upvalues: resolveItemForSelection (copy), var9 (ref), var4 (ref), var14 (ref), var16 (ref)
		if p3 == nil then return end
		if resolveItemForSelection(var9.sections, p2, p3, var4) == nil then
			return
		end
		var14(p2)
		var16(p3)
	end, { var9.sections, var4 })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var16 (ref)
		var14(nil)
		var16(nil)
	end, {})
	local var28, var29 = reactModule.useState(false)
	local var30 = reactModule.useCallback(function()
		-- upvalues: var29 (ref)
		var29(true)
	end, {})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var29 (ref), var21 (ref), var23 (ref)
		var29(false)
		var21("")
		var23("")
	end, {})
	local setItemsPerRow = var5.setItemsPerRow
	local var32 = useShopReportOverflowModule.useShopReportOverflow({
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
		tabs = var10,
		selectedCategoryId = var11,
		onCategorySelected = var19,
		searchQuery = var20,
		committedQuery = var22,
		onSearchQueryChanged = var24,
		onSearchSubmit = var25,
		isSearchOpen = var28,
		onSearchOpen = var30,
		onSearchCancel = var31,
		sections = var9.sections,
		selectedItem = var17,
		selectedItemDisableBuy = var18,
		onItemActivated = var26,
		onDetailsClose = var27,
		itemsPerRow = var8,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: constantsModule (copy), setItemsPerRow (ref)
			local x = p2.AbsoluteSize.X
			
			if x == 0 then
				return
			end
			setItemsPerRow(math.max(constantsModule.MIN_COLUMNS, math.min(constantsModule.ITEMS_PER_SECTION, math.floor(x / constantsModule.MIN_TILE_WIDTH))))
		end, { setItemsPerRow }),
		isReportingEnabled = var32.isReportingEnabled,
		isOverflowMenuOpen = var32.isOverflowMenuOpen,
		topBarReportSession = var32.reportSession,
		onOverflowActivated = var32.onOverflowActivated,
		onOverflowMenuClosed = var32.onOverflowMenuClosed,
		onMenuItemActivated = var32.onMenuItemActivated,
		onTopBarReportClose = var32.onReportClose
	}
end

var1 = function(p2, p3)
	local t = {}
	
	for i, v in p3 do
		t[v.id] = true
	end
	local var17 = #p3 > 0
	local t_1 = {}
	
	for i_1, v_1 in p2 do
		if t[v_1.id] or var17 then
			table.insert(t_1, v_1)
		end
	end
	return { categories = t_1, sections = p3 }
end

return useShopViewModel