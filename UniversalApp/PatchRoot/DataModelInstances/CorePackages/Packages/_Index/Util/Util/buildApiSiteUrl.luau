local contentProviderService = game:GetService("ContentProvider")
local _, _, var1 = (function() --[[ line: 4 | named "parseBaseUrlInformation" ]]
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	if baseUrl:sub(#baseUrl) == "/" then
		baseUrl = baseUrl:sub(1, #baseUrl - 1)
	end
	local _, var2 = baseUrl:find("://")
	assert(type(var2) == "number", "Expected schemeEnd to be a number")
	local var3, var4 = baseUrl:find("%.", var2 + 1)
	assert(type(var3) == "number", "Expected prefixIndex to be a number")
	assert(type(var4) == "number", "Expected prefixEnd to be a number")
	
	return baseUrl, baseUrl:sub(var2 + 1, var3 - 1), baseUrl:sub(var4 + 1)
end)()

return function(p0) --[[ line: 34 ]]
	-- upvalues: var1 (ref)
	assert(type(p0) == "string", "siteName must be a string")
	
	return string.format("https://%s.%s", p0, var1)
end