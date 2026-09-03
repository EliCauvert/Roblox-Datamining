local reactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)
local peoplePickerListViewModule = require(script.Parent.PeoplePickerListView)
local usePeoplePickerListItemViewModelModule = require(script.Parent.usePeoplePickerListItemViewModel)

return {
	Root = peoplePickerListViewModule.Root,
	Item = function(p1)
		-- upvalues: usePeoplePickerListItemViewModelModule (ref), reactModule (ref), peoplePickerListViewModule (ref)
		return reactModule.createElement(peoplePickerListViewModule.Item, usePeoplePickerListItemViewModelModule(p1))
	end
}