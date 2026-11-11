local Schools = script:FindFirstAncestor("Schools")
local ReactModule = require(Schools.Parent.React)
local SchoolMembersMockModule = require(Schools.Common.SchoolMembersMock)

return function()
	-- upvalues: ReactModule (copy), SchoolMembersMockModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: SchoolMembersMockModule (upval)
		return SchoolMembersMockModule.getClassYears()
	end, {})
end