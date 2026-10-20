local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SignalsReactModule = require(Parent.SignalsReact)
local ConstantsModule = require(InExperienceShop.Constants)
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local UseShopReportOverflowModule = require(InExperienceShop.Hooks.useShopReportOverflow)
local _ = require(InExperienceShop.Types)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetFixRobuxTileClickInShopModule = require(InExperienceShop.Flags.GetFixRobuxTileClickInShop)
local ShopItemSelectionModule = require(InExperienceShop.Utils.shopItemSelection)
local ResolveItemForSelectionFunction = ShopItemSelectionModule.resolveItemForSelection
local config = { homeLabel = "CommonUI.Features.Label.Home" }
local _ = require(script.Parent.ShopView)

local function _(Text: string): boolean
	-- upvalues: ConstantsModule (copy)
	local _, Replaced2 = string.gsub(Text, " ", "")
	
	return ConstantsModule.SEARCH_MIN_LENGTH <= #Text - Replaced2
end

local Callback = nil

local function useShopViewModel(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), GetFixRobuxTileClickInShopModule (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), ReactModule (copy), Callback (ref), ResolveItemForSelectionFunction (copy), ShopItemSelectionModule (copy), ConstantsModule (copy), SharedFlagsModule (copy), AbuseVectorModule (copy), UseShopReportOverflowModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local FixRobuxTileClickInShopModule = GetFixRobuxTileClickInShopModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getCategories)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseSignalStateResult.getSections)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseSignalStateResult.getItemsPerRow)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Callback (upval), UseSignalStateResult1 (copy), UseSignalStateResult2 (copy)
		return Callback(UseSignalStateResult1, UseSignalStateResult2)
	end, { UseSignalStateResult1, UseSignalStateResult2 })
	local HomeLabel = UseLocalizationResult.homeLabel
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), HomeLabel (copy)
		local Buffer = table.create(#UseMemoResult.categories)
		
		for i, category in UseMemoResult.categories do
			Buffer[i] = {
				id = category.id,
				text = if category.id == "home" then HomeLabel else category.name
			}
		end
		return Buffer
	end, { UseMemoResult.categories, HomeLabel })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy)
		return if #UseMemoResult.categories > 0 then UseMemoResult.categories[1].id else ""
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		return nil
	end)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(function()
		return nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseStateResult2 (copy)
		local Categories = UseMemoResult.categories
		
		if #Categories ~= 0 then
			UseStateResult2(function(Id)
				-- upvalues: Categories (copy)
				for _, category in Categories do
					if category.id == Id then
						return Id
					end
				end
				return Categories[1].id
			end)
			
			return
		end
	end, { UseMemoResult.categories })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult3 (copy), ResolveItemForSelectionFunction (upval), UseMemoResult (copy), FixRobuxTileClickInShopModule (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if UseStateResult1 == nil or UseStateResult3 == nil then return end
		if ResolveItemForSelectionFunction(UseMemoResult.sections, UseStateResult1, UseStateResult3, FixRobuxTileClickInShopModule) == nil then
			UseStateResult2_1(nil)
			UseStateResult2_2(nil)
		end
	end, {
		UseMemoResult.sections,
		UseStateResult1,
		UseStateResult3,
		FixRobuxTileClickInShopModule
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ResolveItemForSelectionFunction (upval), UseMemoResult (copy), UseStateResult1 (copy), UseStateResult3 (copy), FixRobuxTileClickInShopModule (copy)
		return ResolveItemForSelectionFunction(UseMemoResult.sections, UseStateResult1, UseStateResult3, FixRobuxTileClickInShopModule)
	end, {
		UseMemoResult.sections,
		UseStateResult1,
		UseStateResult3,
		FixRobuxTileClickInShopModule
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: ShopItemSelectionModule (upval), UseMemoResult (copy), UseStateResult1 (copy), UseStateResult3 (copy), FixRobuxTileClickInShopModule (copy)
		return ShopItemSelectionModule.isRobuxBonusOnlySelection(UseMemoResult.sections, UseStateResult1, UseStateResult3, FixRobuxTileClickInShopModule)
	end, {
		UseMemoResult.sections,
		UseStateResult1,
		UseStateResult3,
		FixRobuxTileClickInShopModule
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), ConstantsModule (upval), UseStateResult2_4 (copy)
		local _, Replaced2 = string.gsub(UseStateResult4, " ", "")
		
		if #UseStateResult4 - Replaced2 < ConstantsModule.SEARCH_MIN_LENGTH then
			UseStateResult2_4("")
			
			return
		end
		local Flag = false
		task.delay(ConstantsModule.SEARCH_DEBOUNCE_SECONDS, function()
			-- upvalues: Flag (ref), UseStateResult2_4 (upval), UseStateResult4 (upval)
			if not Flag then
				UseStateResult2_4(UseStateResult4)
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseStateResult4 })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Text: string)
		-- upvalues: UseStateResult2_3 (copy), ConstantsModule (upval), UseStateResult2_4 (copy)
		UseStateResult2_3(Text)
		local _, Replaced2 = string.gsub(Text, " ", "")
		
		if #Text - Replaced2 >= ConstantsModule.SEARCH_MIN_LENGTH then
			UseStateResult2_4(Text)
			
			return
		else
			UseStateResult2_4("")
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: ResolveItemForSelectionFunction (upval), UseMemoResult (copy), FixRobuxTileClickInShopModule (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if p3 == nil then return end
		if ResolveItemForSelectionFunction(UseMemoResult.sections, p2, p3, FixRobuxTileClickInShopModule) ~= nil then
			UseStateResult2_1(p2)
			UseStateResult2_2(p3)
			
			return
		end
	end, { UseMemoResult.sections, FixRobuxTileClickInShopModule })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1(nil)
		UseStateResult2_2(nil)
	end, {})
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local SetItemsPerRowFunction = UseSignalStateResult.setItemsPerRow
	local UseShopReportOverflowResult = UseShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = SharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = ReactModule.useCallback(function()
			-- upvalues: AbuseVectorModule (upval)
			return {
				abuseVector = AbuseVectorModule.InExperienceShop,
				targetId = tostring(game.PlaceId)
			}
		end, {})
	})
	
	return {
		fullScreen = p1.fullScreen,
		overMediaColor = UseTokensResult.Color.OverMedia.OverMedia_0.Color3,
		overMediaTransparency = UseTokensResult.Color.OverMedia.OverMedia_0.Transparency,
		onClose = p1.toggleWindow,
		tabs = UseMemoResult1,
		selectedCategoryId = UseStateResult,
		onCategorySelected = UseResult,
		searchQuery = UseStateResult4,
		committedQuery = UseStateResult5,
		onSearchQueryChanged = UseResult1,
		onSearchSubmit = UseResult2,
		isSearchOpen = UseStateResult6,
		onSearchOpen = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_5 (copy)
			UseStateResult2_5(true)
		end, {}),
		onSearchCancel = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_5 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy)
			UseStateResult2_5(false)
			UseStateResult2_3("")
			UseStateResult2_4("")
		end, {}),
		sections = UseMemoResult.sections,
		selectedItem = UseMemoResult2,
		selectedItemDisableBuy = UseMemoResult3,
		onItemActivated = UseResult3,
		onDetailsClose = UseResult4,
		itemsPerRow = UseSignalStateResult3,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: ConstantsModule (upval), SetItemsPerRowFunction (copy)
			local X = Frame.AbsoluteSize.X
			
			if X ~= 0 then
				SetItemsPerRowFunction((math.max(ConstantsModule.MIN_COLUMNS, (math.min(ConstantsModule.ITEMS_PER_SECTION, (math.floor(X / ConstantsModule.MIN_TILE_WIDTH)))))))
				
				return
			end
		end, { SetItemsPerRowFunction }),
		isReportingEnabled = UseShopReportOverflowResult.isReportingEnabled,
		isOverflowMenuOpen = UseShopReportOverflowResult.isOverflowMenuOpen,
		topBarReportSession = UseShopReportOverflowResult.reportSession,
		onOverflowActivated = UseShopReportOverflowResult.onOverflowActivated,
		onOverflowMenuClosed = UseShopReportOverflowResult.onOverflowMenuClosed,
		onMenuItemActivated = UseShopReportOverflowResult.onMenuItemActivated,
		onTopBarReportClose = UseShopReportOverflowResult.onReportClose
	}
end

Callback = function(UseSignalStateResult, Sections)
	local t = {}
	
	for _, section in Sections do
		t[section.id] = true
	end
	local v1 = #Sections > 0
	local Categories = {}
	
	for _, value in UseSignalStateResult do
		if t[value.id] or v1 then
			table.insert(Categories, value)
		end
	end
	return { categories = Categories, sections = Sections }
end

return useShopViewModel