local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local myCreationsFilterViewModule = require(script.Parent.MyCreationsFilterView)
local useMyCreationsFilterViewModelModule = require(script.Parent.useMyCreationsFilterViewModel)

return function(p1)
	-- upvalues: useMyCreationsFilterViewModelModule (ref), reactModule (ref), myCreationsFilterViewModule (ref)
	return reactModule.createElement(myCreationsFilterViewModule, useMyCreationsFilterViewModelModule(p1))
end