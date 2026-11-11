local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local SearchInputViewModule = require(script.Parent.SearchInputView)
local UseSearchInputViewModelModule = require(script.Parent.useSearchInputViewModel)

return function(p1)
	-- upvalues: UseSearchInputViewModelModule (copy), ReactModule (copy), SearchInputViewModule (copy)
	return ReactModule.createElement(SearchInputViewModule, (UseSearchInputViewModelModule(p1)))
end