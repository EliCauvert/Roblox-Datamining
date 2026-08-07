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

local function _(p0) --[[ line: 43 | named "isQueryValid" ]]
	-- upvalues: constantsModule (ref)
	local _, replaced = string.gsub(p0, " ", "")
	
	return constantsModule.SEARCH_MIN_LENGTH <= #p0 - replaced
end

local var11 = nil

local function useShopViewModel(p1) --[[ line: 63 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), getFixRobuxTileClickInShopModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), var11 (write), resolveItemForSelection (ref), shopItemSelectionModule (ref), constantsModule (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref)
	local var14 = useTokens()
	local var15 = useLocalization(t)
	local var16 = getFixRobuxTileClickInShopModule()
	local var17 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var18 = signalsReactModule.useSignalState(var17.getCategories)
	local var19 = signalsReactModule.useSignalState(var17.getSections)
	local var20 = signalsReactModule.useSignalState(var17.getItemsPerRow)
	local var21 = reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: var11 (copy), var18 (ref), var19 (ref)
		return var11(var18, var19)
	end, { var18, var19 })
	local homeLabel = var15.homeLabel
	local var22 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: var21 (ref), homeLabel (ref)
		local list = table.create(#var21.categories)
		
		for i, v in var21.categories do
			list[i] = {
				id = v.id,
				text = if v.id == "home" then homeLabel else v.name
			}
		end
		return list
	end, { var21.categories, homeLabel })
	local var23, var24 = reactModule.useState(function() --[[ line: 90 ]]
		-- upvalues: var21 (ref)
		return if #var21.categories > 0 then var21.categories[1].id else ""
	end)
	local var25, var26 = reactModule.useState(function() --[[ line: 97 ]]
		return nil
	end)
	local var27, var28 = reactModule.useState(function() --[[ line: 100 ]]
		return nil
	end)
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: var21 (ref), var24 (ref)
		local categories = var21.categories
		
		if #categories == 0 then
			return
		end
		var24(function(p2) --[[ line: 108 ]]
			-- upvalues: categories (ref)
			for i, v in categories do
				if v.id == p2 then
					return p2
				end
			end
			return categories[1].id
		end)
	end, { var21.categories })
	reactModule.useEffect(function() --[[ line: 120 ]]
		-- upvalues: var25 (ref), var27 (ref), resolveItemForSelection (copy), var21 (ref), var16 (ref), var26 (ref), var28 (ref)
		if var25 == nil or var27 == nil then return end
		if resolveItemForSelection(var21.sections, var25, var27, var16) == nil then
			var26(nil)
			var28(nil)
		end
	end, { var21.sections, var25, var27, var16 })
	local var29 = reactModule.useMemo(function() --[[ line: 137 ]]
		-- upvalues: resolveItemForSelection (copy), var21 (ref), var25 (ref), var27 (ref), var16 (ref)
		return resolveItemForSelection(var21.sections, var25, var27, var16)
	end, { var21.sections, var25, var27, var16 })
	local var30 = reactModule.useMemo(function() --[[ line: 146 ]]
		-- upvalues: shopItemSelectionModule (copy), var21 (ref), var25 (ref), var27 (ref), var16 (ref)
		return shopItemSelectionModule.isRobuxBonusOnlySelection(var21.sections, var25, var27, var16)
	end, { var21.sections, var25, var27, var16 })
	local var31 = reactModule.useCallback(function(p3) --[[ line: 156 ]]
		-- upvalues: var24 (ref)
		var24(p3)
	end, {})
	local var32, var33 = reactModule.useState("")
	local var34, var35 = reactModule.useState("")
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: var32 (ref), constantsModule (copy), var35 (ref)
		local var46 = var32
		local _, replaced = string.gsub(var46, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #var46 - replaced then
			local var48 = false
			task.delay(constantsModule.SEARCH_DEBOUNCE_SECONDS, function() --[[ line: 179 ]]
				-- upvalues: var48 (write), var35 (copy), var32 (copy)
				if var48 then
					return
				end
				var35(var32)
			end)
			
			return function() --[[ line: 185 ]]
				-- upvalues: var48 (write)
				var48 = true
			end
		end
		var35("")
	end, { var32 })
	local var36 = reactModule.useCallback(function(p4) --[[ line: 190 ]]
		-- upvalues: var33 (ref)
		var33(p4)
	end, {})
	local var37 = reactModule.useCallback(function(p5) --[[ line: 196 ]]
		-- upvalues: var33 (ref), constantsModule (copy), var35 (ref)
		var33(p5)
		local _, replaced = string.gsub(p5, " ", "")
		
		if constantsModule.SEARCH_MIN_LENGTH <= #p5 - replaced then
			var35(p5)
			
			return
		end
		var35("")
	end, {})
	local var38 = reactModule.useCallback(function(p6, p7) --[[ line: 208 ]]
		-- upvalues: resolveItemForSelection (copy), var21 (ref), var16 (ref), var26 (ref), var28 (ref)
		if p7 == nil then return end
		if resolveItemForSelection(var21.sections, p6, p7, var16) == nil then
			return
		end
		var26(p6)
		var28(p7)
	end, { var21.sections, var16 })
	local var39 = reactModule.useCallback(function() --[[ line: 219 ]]
		-- upvalues: var26 (ref), var28 (ref)
		var26(nil)
		var28(nil)
	end, {})
	local var40, var41 = reactModule.useState(false)
	local var42 = reactModule.useCallback(function() --[[ line: 226 ]]
		-- upvalues: var41 (ref)
		var41(true)
	end, {})
	local var43 = reactModule.useCallback(function() --[[ line: 234 ]]
		-- upvalues: var41 (ref), var33 (ref), var35 (ref)
		var41(false)
		var33("")
		var35("")
	end, {})
	local setItemsPerRow = var17.setItemsPerRow
	local var44 = useShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = reactModule.useCallback(function() --[[ line: 260 ]]
			-- upvalues: abuseVectorModule (copy)
			return {
				abuseVector = abuseVectorModule.InExperienceShop,
				targetId = tostring(game.PlaceId)
			}
		end, {})
	})
	
	return {
		fullScreen = p1.fullScreen,
		overMediaColor = var14.Color.OverMedia.OverMedia_0.Color3,
		overMediaTransparency = var14.Color.OverMedia.OverMedia_0.Transparency,
		onClose = p1.toggleWindow,
		tabs = var22,
		selectedCategoryId = var23,
		onCategorySelected = var31,
		searchQuery = var32,
		committedQuery = var34,
		onSearchQueryChanged = var36,
		onSearchSubmit = var37,
		isSearchOpen = var40,
		onSearchOpen = var42,
		onSearchCancel = var43,
		sections = var21.sections,
		selectedItem = var29,
		selectedItemDisableBuy = var30,
		onItemActivated = var38,
		onDetailsClose = var39,
		itemsPerRow = var20,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p8) --[[ line: 245 ]]
			-- upvalues: constantsModule (copy), setItemsPerRow (ref)
			local x = p8.AbsoluteSize.X
			
			if x == 0 then
				return
			end
			setItemsPerRow(math.max(constantsModule.MIN_COLUMNS, math.min(constantsModule.ITEMS_PER_SECTION, math.floor(x / constantsModule.MIN_TILE_WIDTH))))
		end, { setItemsPerRow }),
		isReportingEnabled = var44.isReportingEnabled,
		isOverflowMenuOpen = var44.isOverflowMenuOpen,
		topBarReportSession = var44.reportSession,
		onOverflowActivated = var44.onOverflowActivated,
		onOverflowMenuClosed = var44.onOverflowMenuClosed,
		onMenuItemActivated = var44.onMenuItemActivated,
		onTopBarReportClose = var44.onReportClose
	}
end

var11 = function(p9, p10) --[[ line: 308 ]]
	local t = {}
	
	for i, v in p10 do
		t[v.id] = true
	end
	local var51 = #p10 > 0
	local t_1 = {}
	
	for i_1, v_1 in p9 do
		if t[v_1.id] or var51 then
			table.insert(t_1, v_1)
		end
	end
	return { categories = t_1, sections = p10 }
end

return useShopViewModel