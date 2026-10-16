local UserList = script:FindFirstAncestor("UserList")
local UseSelectorFunction = require(UserList.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(UserList.Common.Enums)

return function() --[[ Line: 11 ]]
	-- upvalues: UseSelectorFunction (copy)
	return {
		formFactor = UseSelectorFunction(function(p1) --[[ Line: 12 ]]
			return p1.FormFactor
		end)
	}
end