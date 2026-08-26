local t = {
	["catalog/sponsored-items"] = "avatar_experience_sponsored_items",
	["marketplace-widgets/v1/widgets?requestId"] = "avatar_experience_marketplace_widgets",
	["v3/outfits"] = "avatar_experience_outfits",
	["catalog/items/details"] = "avatar_experience_item_details",
	["recommendations/user-inventory"] = "avatar_experience_recommended_user_inventory",
	["v1/purchases/products"] = "avatar_experience_purchase_product",
	["autocomplete-avatar/v2/suggest"] = "avatar_experience_auto_complete",
	["topic/get-topics"] = "avatar_experience_get_topics",
	["widgets/search"] = "avatar_experience_widget_search",
	["widgets/hydrate"] = "avatar_experience_widget_hydrate",
	["marketplace-widgets/v1/pills"] = "avatar_experience_catalog_categories"
}
local t_1 = {
	isSuccessStatusCode = function(_, p1)
		return p1 >= 200 and p1 < 300
	end
}

function t_1.getMatchingName(p1, p2)
	-- upvalues: t_1 (ref), t (ref)
	local text = nil
	local var1 = tostring(p2)
	local var2 = if t_1:isSuccessStatusCode(p2) then "api_success_" else "api_error_"
	
	for i, v in t do
		if string.find(p1, i, 1, true) then
			text = var2 .. v .. "_" .. var3
			
			return text
		end
	end
	return text
end

function t_1.sendStatusCodeCounter(p3, p4, p5)
	-- upvalues: t_1 (ref)
	if not p5 then
		p5 = game:GetService("RbxAnalyticsService")
	end
	local matchingName = t_1.getMatchingName(p3, p4)
	
	if matchingName and p5 then
		p5:ReportCounter(matchingName, 1)
	end
end

return t_1