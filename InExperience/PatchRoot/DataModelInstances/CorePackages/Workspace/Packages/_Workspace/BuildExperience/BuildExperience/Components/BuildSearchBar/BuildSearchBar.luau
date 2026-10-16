local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local SearchInput = FoundationModule.SearchInput
local View = FoundationModule.View
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(Frame) --[[ Line: 22 | Named "BuildSearchBar" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), GetSearchQueryStoreModule (copy), ReactModule (copy), View (copy), SearchInput (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		placeholder = LocalizationStringsModule.BUILD_SEARCH_PLACEHOLDER
	})
	local Store = Frame.store or GetSearchQueryStoreModule()
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		testId = "build-search-bar",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Input = ReactModule.createElement(SearchInput, {
			testId = "build-search-bar-input",
			text = Store.useDraftQuery(),
			placeholder = UseLocalizationResult.placeholder,
			onChanged = ReactModule.useCallback(function(p1) --[[ Line: 33 ]]
				-- upvalues: Store (copy)
				if p1 == "" then
					Store.clear()
					
					return
				else
					Store.setQuery(p1)
				end
			end, { Store }),
			width = UDim.new(1, 0)
		})
	})
end