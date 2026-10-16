local ReactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)
local PeoplePickerHeaderViewModule = require(script.Parent.PeoplePickerHeaderView)
local UsePeoplePickerHeaderViewModelModule = require(script.Parent.usePeoplePickerHeaderViewModel)

return function(p1) --[[ Line: 11 | Named "PeoplePickerHeaderContainer" ]]
	-- upvalues: UsePeoplePickerHeaderViewModelModule (copy), ReactModule (copy), PeoplePickerHeaderViewModule (copy)
	return ReactModule.createElement(PeoplePickerHeaderViewModule, (UsePeoplePickerHeaderViewModelModule(p1)))
end