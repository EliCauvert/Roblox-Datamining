local reactModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.React)
local selectableItemCardRowViewModule = require(script.Parent.SelectableItemCardRowView)
local useSelectableRowViewModelModule = require(script.Parent.useSelectableRowViewModel)

return function(p1)
	-- upvalues: useSelectableRowViewModelModule (ref), reactModule (ref), selectableItemCardRowViewModule (ref)
	return reactModule.createElement(selectableItemCardRowViewModule, useSelectableRowViewModelModule(p1))
end