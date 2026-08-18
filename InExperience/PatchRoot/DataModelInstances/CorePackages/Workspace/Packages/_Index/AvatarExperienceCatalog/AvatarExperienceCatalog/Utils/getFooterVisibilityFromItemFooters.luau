local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Models.WidgetListInfo)

return function(p0) --[[ line: 11 | named "getFooterVisibilityFromItemFooters" ]]
	local t = {
		isCreatorNameVisible = false,
		isTitleVisible = false,
		isPriceVisible = false
	}
	
	if not p0 then
		return t
	end
	for i, v in p0 do
		if v.contentType == "AgentName" then
			t.isCreatorNameVisible = true
		elseif v.contentType == "Price" then
			t.isPriceVisible = true
		elseif v.contentType == "ItemName" then
			t.isTitleVisible = true
		end
	end
	return t
end