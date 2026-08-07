local contentProviderService = game:GetService("ContentProvider")
local t = {
	sitetest3 = 70389767,
	sitetest1 = 75308808508742,
	production = if game:DefineFastFlag("BuildExperienceConfigurableProductionTemplatePlaceId", false) then tonumber(game:DefineFastString("BuildExperienceProductionTemplatePlaceId", "95206881")) or 95206881 else 95206881
}

return function() --[[ line: 21 | named "getDefaultTemplatePlaceId" ]]
	-- upvalues: contentProviderService (ref), t (ref)
	local ok, status = pcall(function() --[[ line: 22 ]]
		-- upvalues: contentProviderService (copy)
		return contentProviderService.BaseUrl
	end)
	local var2 = if ok and typeof(status) == "string" then status else ""
	
	return if string.find(var2, "sitetest3", 1, true) then t.sitetest3 elseif string.find(var2, "sitetest1", 1, true) then t.sitetest1 else t.production
end