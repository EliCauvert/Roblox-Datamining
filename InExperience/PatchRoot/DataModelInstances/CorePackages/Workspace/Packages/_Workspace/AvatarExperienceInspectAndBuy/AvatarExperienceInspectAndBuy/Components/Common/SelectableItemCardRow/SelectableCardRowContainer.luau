local ReactModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.React)
local SelectableItemCardRowViewModule = require(script.Parent.SelectableItemCardRowView)
local UseSelectableRowViewModelModule = require(script.Parent.useSelectableRowViewModel)

return function(p1)
	-- upvalues: UseSelectableRowViewModelModule (copy), ReactModule (copy), SelectableItemCardRowViewModule (copy)
	return ReactModule.createElement(SelectableItemCardRowViewModule, (UseSelectableRowViewModelModule(p1)))
end