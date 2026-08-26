local parent = script.Parent.Parent
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local pagesModule = require(parent.Components.Pages)

return function(p1)
	-- upvalues: setCurrentPageModule (ref), pagesModule (ref)
	p1:dispatch(setCurrentPageModule(pagesModule.pagesByKey[p1:getState().menuPage].parentPage))
end