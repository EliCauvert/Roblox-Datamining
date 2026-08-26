local contentProviderService = game:GetService("ContentProvider")
local _, _, var1 = (function()
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	if baseUrl:sub(#baseUrl) ~= "/" then
		baseUrl ..= "/"
	end
	local _, var2 = baseUrl:find("://")
	local var3, var4 = baseUrl:find("%.", var2 + 1)
	
	return baseUrl, baseUrl:sub(var2 + 1, var3 - 1), baseUrl:sub(var4 + 1)
end)()

return function(p1)
	-- upvalues: var1 (ref)
	return string.format("https://%s.%s", p1, var1)
end