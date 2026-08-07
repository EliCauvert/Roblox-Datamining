local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local searchInputViewModule = require(script.Parent.SearchInputView)
local useSearchInputViewModelModule = require(script.Parent.useSearchInputViewModel)

return function(p0) --[[ line: 10 | named "SearchInputContainer" ]]
	-- upvalues: useSearchInputViewModelModule (ref), reactModule (ref), searchInputViewModule (ref)
	return reactModule.createElement(searchInputViewModule, useSearchInputViewModelModule(p0))
end