local GuiService = game:GetService("GuiService")
local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local WasLastInputGamepadFunction = require(Parent.RoactUtils).wasLastInputGamepad
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local InventoryRecentSearchTermsAppStorageModule = require(AvatarExperienceSearch.Utils.InventoryRecentSearchTermsAppStorage)
local _ = require(AvatarExperienceSearch.Components.SuggestedItemList)
local SuggestedItemTypeEnumModule = require(AvatarExperienceSearch.Enums.SuggestedItemTypeEnum)
local _ = require(script.Parent.InventorySearchLandingPageView)
local config = {
	placeholder = "Feature.Avatar.Placeholder.SearchInventory",
	recentSearchesTitle = "Feature.Avatar.Label.SearchLandingPage.Title.RecentSearches"
}

local function mapTokens(p1)
	return { horizontalPadding = p1.Size.Size_300 }
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseDesignTokensFunction (copy), mapTokens (copy), ReactModule (copy), InventoryRecentSearchTermsAppStorageModule (copy), DashModule (copy), SuggestedItemTypeEnumModule (copy), WasLastInputGamepadFunction (copy), GuiService (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local InitialQuery = p1.initialQuery or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(InitialQuery)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(InventoryRecentSearchTermsAppStorageModule.getTerms)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: DashModule (upval), UseStateResult2_1 (copy), InventoryRecentSearchTermsAppStorageModule (upval), p1 (copy)
		local TrimResult = DashModule.trim(p2)
		
		if TrimResult ~= "" then
			UseStateResult2_1(InventoryRecentSearchTermsAppStorageModule.addTerm(TrimResult))
			p1.onSubmitQuery(TrimResult)
			
			return
		end
	end, { p1.onSubmitQuery })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: InventoryRecentSearchTermsAppStorageModule (upval), UseStateResult (copy), SuggestedItemTypeEnumModule (upval), UseResult (copy), UseStateResult2_1 (copy), WasLastInputGamepadFunction (upval), UseRefResult (copy), GuiService (upval)
		local List = {}
		
		for _, Text in InventoryRecentSearchTermsAppStorageModule.findTermsForQuery(UseStateResult) do
			table.insert(List, {
				text = Text,
				type = SuggestedItemTypeEnumModule.Recent,
				onActivate = function()
					-- upvalues: UseResult (upval), Text (copy)
					UseResult(Text)
				end,
				onRemove = function()
					-- upvalues: UseStateResult2_1 (upval), InventoryRecentSearchTermsAppStorageModule (upval), Text (copy), WasLastInputGamepadFunction (upval), UseRefResult (upval), GuiService (upval)
					UseStateResult2_1(InventoryRecentSearchTermsAppStorageModule.removeTerm(Text))
					
					if WasLastInputGamepadFunction() and UseRefResult.current then
						GuiService.SelectedCoreObject = UseRefResult.current
					end
				end
			})
		end
		return List
	end, { UseStateResult, UseStateResult1, UseResult })
	
	return {
		initialQuery = InitialQuery,
		placeholder = UseLocalizationResult.placeholder,
		recentSearchesTitle = UseLocalizationResult.recentSearchesTitle,
		hasQuery = UseStateResult ~= "",
		recentTerms = UseMemoResult,
		shouldShowEmptyState = #UseMemoResult == 0 and UseStateResult == "",
		padding = {
			top = p1.statusBarHeight or 0,
			left = UseDesignTokensResult.horizontalPadding,
			right = UseDesignTokensResult.horizontalPadding
		},
		searchBarRef = UseRefResult,
		firstRecentTermRef = UseRefResult1,
		onChangeQuery = UseStateResult2,
		onSubmitQuery = UseResult,
		onClearQuery = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2("")
		end, {}),
		onCancel = p1.onCancel
	}
end