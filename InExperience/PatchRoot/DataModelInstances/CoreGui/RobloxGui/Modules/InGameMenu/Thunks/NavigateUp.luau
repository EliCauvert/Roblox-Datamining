local Parent = script.Parent.Parent
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local PagesModule = require(Parent.Components.Pages)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: SetCurrentPageModule (copy), PagesModule (copy)
	p1:dispatch(SetCurrentPageModule(PagesModule.pagesByKey[p1:getState().menuPage].parentPage))
end