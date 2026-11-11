local ContentProvider = game:GetService("ContentProvider")

return function()
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	if BaseUrl:sub(#BaseUrl) == "/" then
		BaseUrl = BaseUrl:sub(1, #BaseUrl - 1)
	end
	local _, EndIndex = BaseUrl:find("://")
	local _, EndIndex1 = BaseUrl:find("%.", EndIndex + 1)
	
	return BaseUrl:sub(EndIndex1 + 1)
end