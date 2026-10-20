local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Models.WidgetListInfo)

return function(List)
	local config = {
		isCreatorNameVisible = false,
		isTitleVisible = false,
		isPriceVisible = false
	}
	
	if not List then
		return config
	end
	for _, value in List do
		if value.contentType == "AgentName" then
			config.isCreatorNameVisible = true
		elseif value.contentType == "Price" then
			config.isPriceVisible = true
		elseif value.contentType == "ItemName" then
			config.isTitleVisible = true
		end
	end
	return config
end