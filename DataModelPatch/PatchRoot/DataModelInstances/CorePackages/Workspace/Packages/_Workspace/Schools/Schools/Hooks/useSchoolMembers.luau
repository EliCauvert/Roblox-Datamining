local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.UserList)
local SchoolMembersMockModule = require(Schools.Common.SchoolMembersMock)

return function(ALLYEARS)
	-- upvalues: ReactModule (copy), SchoolMembersMockModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: ALLYEARS (copy), SchoolMembersMockModule (upval)
		local Number = if ALLYEARS == SchoolMembersMockModule.ALL_YEARS then nil else tonumber(ALLYEARS)
		local List = {}
		
		for _, value in if Number == nil then SchoolMembersMockModule.listGroupMemberships() else SchoolMembersMockModule.listMembershipsByClassYear(Number) do
			table.insert(List, { type = "User", id = value.userId })
		end
		return List
	end, { ALLYEARS })
end