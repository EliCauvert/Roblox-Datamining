local ContentProvider = game:GetService("ContentProvider")
local BuildExperienceProductionTemplatePlaceId = game:DefineFastString("BuildExperienceProductionTemplatePlaceId", "95206881")
local config = {
	sitetest3 = 70389767,
	sitetest1 = 75308808508742,
	production = game:DefineFastFlag("BuildExperienceConfigurableProductionTemplatePlaceId", false) and tonumber(BuildExperienceProductionTemplatePlaceId) or 95206881
}

return function() --[[ Line: 21 | Named "getDefaultTemplatePlaceId" ]]
	-- upvalues: ContentProvider (copy), config (copy)
	local Success, Result = pcall(function() --[[ Line: 22 ]]
		-- upvalues: ContentProvider (upval)
		return ContentProvider.BaseUrl
	end)
	local Text = if Success and typeof(Result) == "string" then Result else ""
	
	return if string.find(Text, "sitetest3", 1, true) then config.sitetest3 elseif string.find(Text, "sitetest1", 1, true) then config.sitetest1 else config.production
end