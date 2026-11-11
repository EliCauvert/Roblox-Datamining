local list = {
	{ userId = "8315650029", graduationYear = 2025 },
	{ userId = "8040950308", graduationYear = 2026 },
	{ userId = "1", graduationYear = 2024 },
	{ userId = "156", graduationYear = 2025 },
	{ userId = "261", graduationYear = 2024 },
	{ userId = "24813339", graduationYear = 2026 },
	{ userId = "13268404", graduationYear = 2025 },
	{ userId = "2470023", graduationYear = 2026 },
	{ userId = "21441956", graduationYear = 2024 },
	{ userId = "1995870730", graduationYear = 2027 }
}

return {
	ALL_YEARS = "allYears",
	listGroupMemberships = function()
		-- upvalues: list (copy)
		return list
	end,
	listMembershipsByClassYear = function(GraduationYear)
		-- upvalues: list (copy)
		local List = {}
		
		for _, value in list do
			if value.graduationYear == GraduationYear then
				table.insert(List, value)
			end
		end
		return List
	end,
	getClassYears = function()
		-- upvalues: list (copy)
		local t = {}
		local List = {}
		
		for _, value in list do
			if not t[value.graduationYear] then
				t[value.graduationYear] = true
				table.insert(List, value.graduationYear)
			end
		end
		table.sort(List)
		
		return List
	end
}