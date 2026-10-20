local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SignalsReactModule = require(Parent.SignalsReact)
local IsSideSheetEnabledModule = require(Parent.InExperienceSideSheetUtils.isSideSheetEnabled)
local ConstantsModule = require(InExperienceShop.Constants)
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local UseShopReportOverflowModule = require(InExperienceShop.Hooks.useShopReportOverflow)
local _ = require(InExperienceShop.Types)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local FFlagShopRobuxPurchaseCompletionModalModule = require(InExperienceShop.Flags.FFlagShopRobuxPurchaseCompletionModal)
local FormatPriceModule = require(InExperienceShop.Utils.formatPrice)
local GetFixRobuxTileClickInShopModule = require(InExperienceShop.Flags.GetFixRobuxTileClickInShop)
local ShopItemSelectionModule = require(InExperienceShop.Utils.shopItemSelection)
local ResolveItemForSelectionFunction = ShopItemSelectionModule.resolveItemForSelection
local UseShopOfferChipModule = require(InExperienceShop.Hooks.useShopOfferChip)
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local FFlagEnableUserOffers = SharedFlagsModule.FFlagEnableUserOffers
local FFlagHideHeaderForBuyRobuxInExperienceShop = SharedFlagsModule.FFlagHideHeaderForBuyRobuxInExperienceShop
local config = { homeLabel = "CommonUI.Features.Label.Home" }
local _ = require(script.Parent.ShopView)

local function _(Text: string): boolean
	-- upvalues: ConstantsModule (copy)
	local _, Replaced2 = string.gsub(Text, " ", "")
	
	return ConstantsModule.SEARCH_MIN_LENGTH <= #Text - Replaced2
end

local Callback = nil

local function useShopViewModel(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), GetFixRobuxTileClickInShopModule (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), FFlagShopRobuxPurchaseCompletionModalModule (copy), ReactModule (copy), FormatPriceModule (copy), Callback (ref), IsSideSheetEnabledModule (copy), FFlagHideHeaderForBuyRobuxInExperienceShop (copy), ResolveItemForSelectionFunction (copy), ShopItemSelectionModule (copy), ConstantsModule (copy), FFlagEnableUserOffers (copy), SharedFlagsModule (copy), AbuseVectorModule (copy), UseShopReportOverflowModule (copy), UseShopOfferChipModule (copy), InExperienceOffersModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local FixRobuxTileClickInShopModule = GetFixRobuxTileClickInShopModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getCategories)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseSignalStateResult.getSections)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseSignalStateResult.getItemsPerRow)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(UseSignalStateResult.getShouldOpenToRobuxTab)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(UseSignalStateResult.getOpenedFromBuyRobux)
	local RobuxPurchaseSuccess = nil
	
	if FFlagShopRobuxPurchaseCompletionModalModule then
		local UseSignalStateResult6 = SignalsReactModule.useSignalState(UseSignalStateResult.getPurchasedRobuxAmount)
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult6 (copy), UseSignalStateResult (copy)
			return if UseSignalStateResult6 == nil then nil else function()
				-- upvalues: UseSignalStateResult (upval), UseSignalStateResult6 (upval)
				if UseSignalStateResult.getPurchasedRobuxAmount(false) == UseSignalStateResult6 then
					UseSignalStateResult.dismissRobuxPurchaseSuccess()
				end
			end
		end, { UseSignalStateResult6, UseSignalStateResult })
		local UseLocalizationResult1 = UseLocalizationFunction({
			bodyText = if UseSignalStateResult6 == nil then nil else {
				"Feature.InExperienceShop.Message.RobuxPurchaseSuccess",
				ROBUX_AMOUNT = FormatPriceModule(UseSignalStateResult6)
			}
		})
		
		if UseSignalStateResult6 ~= nil then
			RobuxPurchaseSuccess = {
				bodyText = UseLocalizationResult1.bodyText,
				onClose = UseSignalStateResult.dismissRobuxPurchaseSuccess
			}
		end
	end
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
	local UseResult = nil
	UseResult = ReactModule.useCallback(function()
		-- upvalues: IsSideSheetEnabledModule (upval), UseMemoResult (copy)
		if not IsSideSheetEnabledModule then
			return nil
		end
		for _, category in UseMemoResult.categories do
			if category.name == "Robux" then
				return category.id
			end
		end
		return nil
	end, { UseMemoResult.categories })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: IsSideSheetEnabledModule (upval), UseSignalStateResult4 (copy), UseResult (ref), UseMemoResult (copy)
		if IsSideSheetEnabledModule and UseSignalStateResult4 then
			local UseResultResult = UseResult()
			
			if UseResultResult ~= nil then
				return UseResultResult
			end
		end
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
		-- upvalues: IsSideSheetEnabledModule (upval), UseSignalStateResult4 (copy), UseMemoResult (copy), UseSignalStateResult (copy), UseResult (ref), UseStateResult2 (copy)
		if IsSideSheetEnabledModule and UseSignalStateResult4 and #UseMemoResult.categories > 0 then
			UseSignalStateResult.setShouldOpenToRobuxTab(false)
			local UseResultResult = UseResult()
			
			if UseResultResult ~= nil then
				UseStateResult2(UseResultResult)
			end
		end
	end, {
		UseResult,
		UseMemoResult.categories,
		UseSignalStateResult4,
		UseSignalStateResult.setShouldOpenToRobuxTab
	})
	local UseMemoResult2 = false
	
	if FFlagHideHeaderForBuyRobuxInExperienceShop then
		UseMemoResult2 = ReactModule.useMemo(function(): boolean
			-- upvalues: UseMemoResult (copy)
			if #UseMemoResult.categories ~= 2 then
				return false
			end
			local Flag = false
			local Flag1 = false
			
			for _, category in UseMemoResult.categories do
				if category.name == "CommonUI.Features.Label.Home" then
					Flag = true
				elseif category.name == "Robux" then
					Flag1 = true
				end
			end
			return Flag and Flag1
		end, { UseMemoResult.categories })
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult (copy)
			return function()
				-- upvalues: UseSignalStateResult (upval)
				UseSignalStateResult.setOpenedFromBuyRobux(false)
			end
		end, { UseSignalStateResult.setOpenedFromBuyRobux })
	end
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
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: ResolveItemForSelectionFunction (upval), UseMemoResult (copy), UseStateResult1 (copy), UseStateResult3 (copy), FixRobuxTileClickInShopModule (copy)
		return ResolveItemForSelectionFunction(UseMemoResult.sections, UseStateResult1, UseStateResult3, FixRobuxTileClickInShopModule)
	end, {
		UseMemoResult.sections,
		UseStateResult1,
		UseStateResult3,
		FixRobuxTileClickInShopModule
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: ShopItemSelectionModule (upval), UseMemoResult (copy), UseStateResult1 (copy), UseStateResult3 (copy), FixRobuxTileClickInShopModule (copy)
		return ShopItemSelectionModule.isRobuxBonusOnlySelection(UseMemoResult.sections, UseStateResult1, UseStateResult3, FixRobuxTileClickInShopModule)
	end, {
		UseMemoResult.sections,
		UseStateResult1,
		UseStateResult3,
		FixRobuxTileClickInShopModule
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
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
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Text: string)
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
	local UseResult4 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: ResolveItemForSelectionFunction (upval), UseMemoResult (copy), FixRobuxTileClickInShopModule (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if p3 == nil then return end
		if ResolveItemForSelectionFunction(UseMemoResult.sections, p2, p3, FixRobuxTileClickInShopModule) ~= nil then
			UseStateResult2_1(p2)
			UseStateResult2_2(p3)
			
			return
		end
	end, { UseMemoResult.sections, FixRobuxTileClickInShopModule })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1(nil)
		UseStateResult2_2(nil)
	end, {})
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_5 (copy)
		UseStateResult2_5(true)
	end, {})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_5 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy)
		UseStateResult2_5(false)
		UseStateResult2_3("")
		UseStateResult2_4("")
	end, {})
	local SetItemsPerRowFunction = UseSignalStateResult.setItemsPerRow
	local UseStateResult2_6 = nil
	local UseStateResult7 = nil
	
	if FFlagEnableUserOffers then
		UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	else
		UseStateResult7 = false
		
		UseStateResult2_6 = function(_) end
	end
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
	local UseShopOfferChipModuleResult = if FFlagEnableUserOffers then UseShopOfferChipModule(InExperienceOffersModule.FeatureKeys.RobloxShop, UseStateResult7) else nil
	
	return {
		fullScreen = p1.fullScreen,
		overMediaColor = UseTokensResult.Color.OverMedia.OverMedia_0.Color3,
		overMediaTransparency = UseTokensResult.Color.OverMedia.OverMedia_0.Transparency,
		onClose = p1.toggleWindow,
		robuxPurchaseSuccess = RobuxPurchaseSuccess,
		tabs = UseMemoResult1,
		hideTabs = FFlagHideHeaderForBuyRobuxInExperienceShop and (UseSignalStateResult5 and UseMemoResult2),
		selectedCategoryId = UseStateResult,
		onCategorySelected = UseResult1,
		searchQuery = UseStateResult4,
		committedQuery = UseStateResult5,
		onSearchQueryChanged = UseResult2,
		onSearchSubmit = UseResult3,
		isSearchOpen = UseStateResult6,
		onSearchOpen = UseResult6,
		onSearchCancel = UseResult7,
		sections = UseMemoResult.sections,
		selectedItem = UseMemoResult3,
		selectedItemDisableBuy = UseMemoResult4,
		onItemActivated = UseResult4,
		onDetailsClose = UseResult5,
		itemsPerRow = UseSignalStateResult3,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: ConstantsModule (upval), SetItemsPerRowFunction (copy), FFlagEnableUserOffers (upval), UseStateResult2_6 (ref)
			local X = Frame.AbsoluteSize.X
			
			if X == 0 then return end
			SetItemsPerRowFunction((math.max(ConstantsModule.MIN_COLUMNS, (math.min(ConstantsModule.ITEMS_PER_SECTION, (math.floor(X / ConstantsModule.MIN_TILE_WIDTH)))))))
			
			if FFlagEnableUserOffers then
				UseStateResult2_6(X < ConstantsModule.COMPACT_BREAKPOINT_WIDTH)
			end
		end, {
			SetItemsPerRowFunction,
			if FFlagEnableUserOffers then UseStateResult2_6 else nil
		}),
		isReportingEnabled = UseShopReportOverflowResult.isReportingEnabled,
		isOverflowMenuOpen = UseShopReportOverflowResult.isOverflowMenuOpen,
		topBarReportSession = UseShopReportOverflowResult.reportSession,
		onOverflowActivated = UseShopReportOverflowResult.onOverflowActivated,
		onOverflowMenuClosed = UseShopReportOverflowResult.onOverflowMenuClosed,
		onMenuItemActivated = UseShopReportOverflowResult.onMenuItemActivated,
		onTopBarReportClose = UseShopReportOverflowResult.onReportClose,
		offer = if FFlagEnableUserOffers then UseShopOfferChipModuleResult else nil
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