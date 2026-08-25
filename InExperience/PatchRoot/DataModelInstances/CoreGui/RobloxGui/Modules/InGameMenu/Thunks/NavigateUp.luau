local parent = script.Parent.Parent
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local pagesModule = require(parent.Components.Pages)

return function(p0)
	-- upvalues: setCurrentPageModule (ref), pagesModule (ref)
	p0:dispatch(setCurrentPageModule(pagesModule.pagesByKey[p0:getState().menuPage].parentPage))
end