local ContentProvider = game:GetService("ContentProvider")
local _, _, v1 = (function()
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	if BaseUrl:sub(#BaseUrl) ~= "/" then
		BaseUrl ..= "/"
	end
	local _, EndIndex = BaseUrl:find("://")
	local StartIndex, EndIndex1 = BaseUrl:find("%.", EndIndex + 1)
	
	return BaseUrl, BaseUrl:sub(EndIndex + 1, StartIndex - 1), (BaseUrl:sub(EndIndex1 + 1))
end)()

return function(p1): string
	-- upvalues: v1 (copy)
	return string.format("https://%s.%s", p1, v1)
end