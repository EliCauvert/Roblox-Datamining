local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local longPressListItemViewModule = require(script.Parent.LongPressListItemView)
local useLongPressListItemViewModelModule = require(script.Parent.useLongPressListItemViewModel)

return function(p1)
	-- upvalues: useLongPressListItemViewModelModule (ref), reactModule (ref), longPressListItemViewModule (ref)
	return reactModule.createElement(longPressListItemViewModule, useLongPressListItemViewModelModule(p1))
end