local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local searchInputViewModule = require(script.Parent.SearchInputView)
local useSearchInputViewModelModule = require(script.Parent.useSearchInputViewModel)

return function(p1)
	-- upvalues: useSearchInputViewModelModule (ref), reactModule (ref), searchInputViewModule (ref)
	return reactModule.createElement(searchInputViewModule, useSearchInputViewModelModule(p1))
end