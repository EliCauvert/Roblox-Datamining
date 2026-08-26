local userList = script:FindFirstAncestor("UserList")
local useSelector = require(userList.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(userList.Common.Enums)

return function()
	-- upvalues: useSelector (ref)
	return {
		formFactor = useSelector(function(p1)
			return p1.FormFactor
		end)
	}
end