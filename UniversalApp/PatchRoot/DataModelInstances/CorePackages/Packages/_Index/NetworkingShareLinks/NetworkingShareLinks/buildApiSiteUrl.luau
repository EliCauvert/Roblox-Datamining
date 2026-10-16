local ContentProvider = game:GetService("ContentProvider")
local _, _, v1 = (function() --[[ Line: 7 | Named "parseBaseUrlInformation" ]]
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	if BaseUrl:sub(#BaseUrl) ~= "/" then
		BaseUrl ..= "/"
	end
	local _, EndIndex = BaseUrl:find("://")
	assert(type(EndIndex) == "number", "Expected schemeEnd to be a number")
	local StartIndex, EndIndex1 = BaseUrl:find("%.", EndIndex + 1)
	assert(type(StartIndex) == "number", "Expected prefixIndex to be a number")
	assert(type(EndIndex1) == "number", "Expected prefixEnd to be a number")
	
	return BaseUrl, BaseUrl:sub(EndIndex + 1, StartIndex - 1), (BaseUrl:sub(EndIndex1 + 1))
end)()

return function(p1): string --[[ Line: 37 ]]
	-- upvalues: v1 (copy)
	return string.format("https://%s.%s", p1, v1)
end