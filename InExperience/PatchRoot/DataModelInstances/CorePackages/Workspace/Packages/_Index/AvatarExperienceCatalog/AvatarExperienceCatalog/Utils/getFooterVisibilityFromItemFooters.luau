local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Models.WidgetListInfo)

return function(p1)
	local t = {
		isCreatorNameVisible = false,
		isTitleVisible = false,
		isPriceVisible = false
	}
	
	if not p1 then
		return t
	end
	for i, v in p1 do
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