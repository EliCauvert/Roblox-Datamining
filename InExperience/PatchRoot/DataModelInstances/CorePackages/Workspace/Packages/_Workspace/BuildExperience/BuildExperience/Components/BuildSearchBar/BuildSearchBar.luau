local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local getSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore)
local _ = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), getSearchQueryStoreModule (ref), reactModule (ref), view (ref), searchInput (ref)
	local store = p1.store or getSearchQueryStoreModule()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "build-search-bar",
		LayoutOrder = p1.LayoutOrder
	}, {
		Input = reactModule.createElement(searchInput, {
			testId = "build-search-bar-input",
			text = store.useDraftQuery(),
			placeholder = useLocalization({
				placeholder = localizationStringsModule.BUILD_SEARCH_PLACEHOLDER
			}).placeholder,
			onChanged = reactModule.useCallback(function(p2)
				-- upvalues: store (ref)
				if p2 == "" then
					store.clear()
					
					return
				end
				store.setQuery(p2)
			end, { store }),
			width = UDim.new(1, 0)
		})
	})
end