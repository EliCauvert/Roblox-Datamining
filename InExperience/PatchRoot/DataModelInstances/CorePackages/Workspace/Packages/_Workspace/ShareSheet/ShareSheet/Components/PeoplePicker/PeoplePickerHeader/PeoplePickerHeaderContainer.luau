local reactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)
local peoplePickerHeaderViewModule = require(script.Parent.PeoplePickerHeaderView)
local usePeoplePickerHeaderViewModelModule = require(script.Parent.usePeoplePickerHeaderViewModel)

return function(p1)
	-- upvalues: usePeoplePickerHeaderViewModelModule (ref), reactModule (ref), peoplePickerHeaderViewModule (ref)
	return reactModule.createElement(peoplePickerHeaderViewModule, usePeoplePickerHeaderViewModelModule(p1))
end