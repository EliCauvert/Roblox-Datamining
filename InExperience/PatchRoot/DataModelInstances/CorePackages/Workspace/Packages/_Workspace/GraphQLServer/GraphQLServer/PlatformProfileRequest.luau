return {
	hasPlatformFields = function(List): boolean --[[ Line: 2 ]]
		return table.find(List, "names.platformName") ~= nil or table.find(List, "platformProfileId") ~= nil
	end,
	normalizeProfiles = function(List1, List) --[[ Line: 6 ]]
		local HasFoundIndex = table.find(List, "names.platformName") ~= nil
		local HasFoundIndex1 = table.find(List, "platformProfileId") ~= nil
		
		if not HasFoundIndex and not HasFoundIndex1 then
			return List1
		end
		local List2 = {}
		
		for _, value in List1 do
			local Copy = table.clone(value)
			
			if HasFoundIndex then
				local Copy1 = if type(value.names) == "table" then table.clone(value.names) else {}
				
				if type(Copy1.platformName) ~= "string" then
					Copy1.platformName = ""
				end
				Copy.names = Copy1
			end
			if HasFoundIndex1 and type(Copy.platformProfileId) ~= "string" then
				Copy.platformProfileId = ""
			end
			table.insert(List2, Copy)
		end
		return List2
	end
}