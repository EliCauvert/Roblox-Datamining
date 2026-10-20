local ArgCheckModule = require(script:FindFirstAncestor("Localization").Parent.ArgCheck)

return function(p1, List)
	-- upvalues: ArgCheckModule (copy)
	local t = {}
	
	for i, value in pairs(List) do
		if typeof(value) == "table" then
			if typeof(value[1]) == "string" then
				local Success, Result = pcall(function()
					-- upvalues: p1 (copy), value (copy)
					return p1:Format(value[1], value)
				end)
				ArgCheckModule.isEqual(Success, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", i, value[1]))
				t[i] = Success and Result or ""
			else
				error(string.format("%s[1] in stringsToBeLocalized must be a string, got %s instead", i, (typeof(value[1]))))
			end
		elseif typeof(value) == "string" then
			local Success1, Result1 = pcall(function()
				-- upvalues: p1 (copy), value (copy)
				return p1:Format(value)
			end)
			ArgCheckModule.isEqual(Success1, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", i, value))
			t[i] = Success1 and Result1 or ""
		else
			error(string.format("%s in stringsToBeLocalized must be a string or table, got %s instead", i, (typeof(value))))
		end
	end
	return t
end