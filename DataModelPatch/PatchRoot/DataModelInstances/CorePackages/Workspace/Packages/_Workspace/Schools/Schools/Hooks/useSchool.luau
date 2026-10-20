local Schools = script:FindFirstAncestor("Schools")
local ReactModule = require(Schools.Parent.React)
local SchoolMockModule = require(Schools.Common.SchoolMock)

return function()
	-- upvalues: ReactModule (copy), SchoolMockModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: SchoolMockModule (upval)
		return SchoolMockModule.getSchool()
	end, {})
end