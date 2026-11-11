local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)

local function v3(Users, p1: number)
	-- upvalues: DashModule (copy)
	return DashModule.slice(Users, p1 + 1)
end

return function(p1)
	-- upvalues: ReactModule (copy), v3 (copy)
	local Users = p1.users or {}
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Users)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), v3 (upval), Users (copy), UseStateResult (copy), UseStateResult2 (copy)
		UseStateResult2_1(v3(Users, UseStateResult))
		UseStateResult2(#Users)
	end, { #Users })
	
	return UseStateResult1
end