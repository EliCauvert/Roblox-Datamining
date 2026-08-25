local argCheckModule = require(script:FindFirstAncestor("Localization").Parent.ArgCheck)

return function(p0, p1)
	-- upvalues: argCheckModule (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if typeof(v) == "table" then
			if typeof(v[1]) == "string" then
				local ok, status = pcall(function()
					-- upvalues: p0 (ref), v (ref)
					return p0:Format(v[1], v)
				end)
				argCheckModule.isEqual(ok, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", i, v[1]))
				t[i] = if ok then status else ""
			else
				error(string.format("%s[1] in stringsToBeLocalized must be a string, got %s instead", i, typeof(v[1])))
			end
		elseif typeof(v) == "string" then
			local ok, status = pcall(function()
				-- upvalues: p0 (ref), v (ref)
				return p0:Format(v)
			end)
			argCheckModule.isEqual(ok, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", i, v))
			t[i] = if ok then status else ""
		else
			error(string.format("%s in stringsToBeLocalized must be a string or table, got %s instead", i, typeof(v)))
		end
	end
	return t
end