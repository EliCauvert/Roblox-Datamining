local ReactModule = require(script:FindFirstAncestor("SocialCommon").Parent.React)
local SearchFieldViewModule = require(script.Parent.SearchFieldView)
local UseSearchFieldViewModelModule = require(script.Parent.useSearchFieldViewModel)

return function(p1) --[[ Line: 10 | Named "SearchField" ]]
	-- upvalues: UseSearchFieldViewModelModule (copy), ReactModule (copy), SearchFieldViewModule (copy)
	return ReactModule.createElement(SearchFieldViewModule, (UseSearchFieldViewModelModule(p1)))
end