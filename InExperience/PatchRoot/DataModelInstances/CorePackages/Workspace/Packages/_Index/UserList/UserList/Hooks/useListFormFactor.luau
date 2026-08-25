local userList = script:FindFirstAncestor("UserList")
local useSelector = require(userList.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(userList.Common.Enums)

return function()
	-- upvalues: useSelector (ref)
	return {
		formFactor = useSelector(function(p0)
			return p0.FormFactor
		end)
	}
end