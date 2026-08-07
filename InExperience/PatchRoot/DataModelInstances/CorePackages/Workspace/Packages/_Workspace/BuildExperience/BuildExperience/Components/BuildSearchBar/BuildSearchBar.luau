local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local getSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore)
local _ = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p0) --[[ line: 21 | named "BuildSearchBar" ]]
	-- upvalues: getSearchQueryStoreModule (ref), reactModule (ref), view (ref), searchInput (ref), localizationStringsModule (ref)
	local store = p0.store or getSearchQueryStoreModule()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "build-search-bar",
		LayoutOrder = p0.LayoutOrder
	}, {
		Input = reactModule.createElement(searchInput, {
			testId = "build-search-bar-input",
			text = store.useDraftQuery(),
			placeholder = localizationStringsModule.BUILD_SEARCH_PLACEHOLDER,
			onChanged = reactModule.useCallback(function(p1) --[[ line: 29 ]]
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