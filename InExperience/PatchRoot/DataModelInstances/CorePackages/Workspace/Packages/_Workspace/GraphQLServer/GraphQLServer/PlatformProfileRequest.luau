return {
	hasPlatformFields = function(p1)
		return if table.find(p1, "names.platformName") == nil then table.find(p1, "platformProfileId") ~= nil else true
	end,
	normalizeProfiles = function(p1, p2)
		local var1 = table.find(p2, "names.platformName") ~= nil
		local var2 = table.find(p2, "platformProfileId") ~= nil
		
		if not var1 and not var2 then
			return p1
		end
		local t = {}
		
		for i, v in p1 do
			local cloned = table.clone(v)
			
			if var1 then
				local var3 = if type(v.names) == "table" then table.clone(v.names) else {}
				
				if type(var3.platformName) ~= "string" then
					var3.platformName = ""
				end
				cloned.names = var3
			end
			if var2 and type(cloned.platformProfileId) ~= "string" then
				cloned.platformProfileId = ""
			end
			table.insert(t, cloned)
		end
		return t
	end
}