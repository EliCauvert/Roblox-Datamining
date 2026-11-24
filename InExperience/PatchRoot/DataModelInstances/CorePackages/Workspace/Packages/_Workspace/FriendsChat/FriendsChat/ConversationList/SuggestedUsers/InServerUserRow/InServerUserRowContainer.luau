local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local UserListModule = require(Parent.UserList)
local UseInServerUserRowViewModelModule = require(script.Parent.useInServerUserRowViewModel)

return function(p1)
	-- upvalues: UseInServerUserRowViewModelModule (copy), ReactModule (copy), UserListModule (copy)
	local UseInServerUserRowViewModelModuleResult = UseInServerUserRowViewModelModule(p1)
	
	return if UseInServerUserRowViewModelModuleResult == nil then nil else ReactModule.createElement(UserListModule.UserRow, UseInServerUserRowViewModelModuleResult)
end