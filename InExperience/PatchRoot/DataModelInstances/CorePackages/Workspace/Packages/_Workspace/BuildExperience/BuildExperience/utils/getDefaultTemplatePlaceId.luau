local contentProviderService = game:GetService("ContentProvider")
local _ = {
	sitetest3 = 70389767,
	sitetest1 = 75308808508742,
	production = 95206881
}

return function() --[[ line: 15 | named "getDefaultTemplatePlaceId" ]]
	-- upvalues: contentProviderService (ref)
	local ok, status = pcall(function() --[[ line: 16 ]]
		-- upvalues: contentProviderService (copy)
		return contentProviderService.BaseUrl
	end)
	local var1 = if ok and typeof(status) == "string" then status else ""
	
	return if string.find(var1, "sitetest3", 1, true) then 70389767 elseif string.find(var1, "sitetest1", 1, true) then 75308808508742 else 95206881
end