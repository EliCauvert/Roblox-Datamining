local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local getSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore)
local _ = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p0) --[[ line: 25 | named "BuildSearchBar" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getSearchQueryStoreModule (ref), reactModule (ref), view (ref), searchInput (ref)
	local store = p0.store or getSearchQueryStoreModule()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "build-search-bar",
		LayoutOrder = p0.LayoutOrder
	}, {
		Input = reactModule.createElement(searchInput, {
			testId = "build-search-bar-input",
			text = store.useDraftQuery(),
			placeholder = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
				placeholder = localizationStringsModule.BUILD_SEARCH_PLACEHOLDER
			}) else nil).placeholder else localizationStringsModule.BUILD_SEARCH_PLACEHOLDER,
			onChanged = reactModule.useCallback(function(p1) --[[ line: 38 ]]
				-- upvalues: store (ref)
				if p1 == "" then
					store.clear()
					
					return
				end
				store.setQuery(p1)
			end, { store }),
			width = UDim.new(1, 0)
		})
	})
end