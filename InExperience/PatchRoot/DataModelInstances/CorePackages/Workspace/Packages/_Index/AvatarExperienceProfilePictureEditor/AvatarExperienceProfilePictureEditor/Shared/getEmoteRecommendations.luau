local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local httpModule = require(parent.Http)
local constantsModule = require(script.Parent.Parent.Constants)
local normalize = require(parent.AvatarExperienceCommon).Utils.normalize
local url = httpModule.Url
local normalizeNumber = normalize.normalizeNumber
local normalizeString = normalize.normalizeString
local var1 = tostring(Enum.AvatarAssetType.EmoteAnimation.Value)

return {
	EMOTE_ASSET_TYPE_ID = var1,
	buildEmoteRecommendationsUrl = function(p1)
		-- upvalues: url (ref), var1 (ref)
		return `{url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={var1}&{url:makeQueryString({ details = true, numItems = p1 })}`
	end,
	parseEmoteRecommendationsResponse = function(p1)
		-- upvalues: normalizeString (ref), normalizeNumber (ref)
		local var2 = if p1 then p1.data else nil
		
		if typeof(var2) ~= "table" then
			return {}
		end
		local t = {}
		
		for i, v in var2 do
			if typeof(v) == "table" and v.id ~= nil then
				local name = v.name
				local var3 = normalizeString(v.priceStatus)
				table.insert(t, {
					id = tostring(v.id),
					label = if typeof(name) == "string" then name else "",
					priceInRobux = normalizeNumber(v.price),
					lowestPrice = normalizeNumber(v.lowestPrice),
					priceStatus = if var3 == nil or var3 == "" then nil else var3
				})
			end
		end
		return t
	end,
	getEmoteRecommendationsUrl = function(p2)
		-- upvalues: constantsModule (ref), url (ref), var1 (ref)
		return `{url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={var1}&{url:makeQueryString({
			details = true,
			numItems = (p2 or {}).numItems or constantsModule.RecommendedEmoteCount
		})}`
	end
}