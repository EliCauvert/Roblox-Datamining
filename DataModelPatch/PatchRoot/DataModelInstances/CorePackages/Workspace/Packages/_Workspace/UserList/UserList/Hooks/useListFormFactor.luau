local UserList = script:FindFirstAncestor("UserList")
local UseSelectorFunction = require(UserList.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(UserList.Common.Enums)

return function()
	-- upvalues: UseSelectorFunction (copy)
	return {
		formFactor = UseSelectorFunction(function(p1)
			return p1.FormFactor
		end)
	}
end