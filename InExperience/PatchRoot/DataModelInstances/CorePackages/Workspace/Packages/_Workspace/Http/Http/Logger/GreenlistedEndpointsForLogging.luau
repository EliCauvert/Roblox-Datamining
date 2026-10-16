local config = {
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
local GreenlistedEndpointsForLoggingModule = {
	isSuccessStatusCode = function(_, p1: number): boolean --[[ Line: 25 ]]
		return p1 >= 200 and p1 < 300
	end
}

function GreenlistedEndpointsForLoggingModule.getMatchingName(Text: string, p1): string --[[ Line: 32 ]]
	-- upvalues: GreenlistedEndpointsForLoggingModule (copy), config (copy)
	local v1: string? = nil
	local Text1 = tostring(p1)
	local ApiSuccess: string = if GreenlistedEndpointsForLoggingModule:isSuccessStatusCode(p1) then "api_success_" else "api_error_"
	for i, value in config do
		if string.find(Text, i, 1, true) then
			v1 = ApiSuccess .. value .. "_" .. Text1
			
			return v1
		end
	end
	return v1
end

function GreenlistedEndpointsForLoggingModule.sendStatusCodeCounter(p2, p3, RbxAnalyticsService) --[[ Line: 49 ]]
	-- upvalues: GreenlistedEndpointsForLoggingModule (copy)
	if not RbxAnalyticsService then
		RbxAnalyticsService = game:GetService("RbxAnalyticsService")
	end
	local MatchingName = GreenlistedEndpointsForLoggingModule.getMatchingName(p2, p3)
	
	if MatchingName and RbxAnalyticsService then
		RbxAnalyticsService:ReportCounter(MatchingName, 1)
	end
end

return GreenlistedEndpointsForLoggingModule