local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local MyCreationsFilterViewModule = require(script.Parent.MyCreationsFilterView)
local UseMyCreationsFilterViewModelModule = require(script.Parent.useMyCreationsFilterViewModel)

return function(p1)
	-- upvalues: UseMyCreationsFilterViewModelModule (copy), ReactModule (copy), MyCreationsFilterViewModule (copy)
	return ReactModule.createElement(MyCreationsFilterViewModule, (UseMyCreationsFilterViewModelModule(p1)))
end