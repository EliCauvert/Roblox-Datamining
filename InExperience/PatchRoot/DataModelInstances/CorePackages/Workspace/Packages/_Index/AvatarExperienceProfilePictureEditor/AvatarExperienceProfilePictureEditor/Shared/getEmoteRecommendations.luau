local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local httpModule = require(parent.Http)
local constantsModule = require(script.Parent.Parent.Constants)
local normalize = require(parent.AvatarExperienceCommon).Utils.normalize
local url = httpModule.Url
local normalizeNumber = normalize.normalizeNumber
local normalizeString = normalize.normalizeString
local var2 = tostring(Enum.AvatarAssetType.EmoteAnimation.Value)

return {
	EMOTE_ASSET_TYPE_ID = var2,
	buildEmoteRecommendationsUrl = function(p0) --[[ line: 34 ]]
		-- upvalues: url (ref), var2 (ref)
		return `{url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={var2}&{url:makeQueryString({ details = true, numItems = p0 })}`
	end,
	parseEmoteRecommendationsResponse = function(p1) --[[ line: 42 ]]
		-- upvalues: normalizeString (ref), normalizeNumber (ref)
		local var3 = if p1 then p1.data else nil
		
		if typeof(var3) ~= "table" then
			return {}
		end
		local t = {}
		
		for i, v in var3 do
			if typeof(v) == "table" and v.id ~= nil then
				local name = v.name
				local var5 = normalizeString(v.priceStatus)
				table.insert(t, {
					id = tostring(v.id),
					label = if typeof(name) == "string" then name else "",
					priceInRobux = normalizeNumber(v.price),
					lowestPrice = normalizeNumber(v.lowestPrice),
					priceStatus = if var5 == nil or var5 == "" then nil else var5
				})
			end
		end
		return t
	end,
	getEmoteRecommendationsUrl = function(p2) --[[ line: 65 ]]
		-- upvalues: constantsModule (ref), url (ref), var2 (ref)
		return `{url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={var2}&{url:makeQueryString({
			details = true,
			numItems = (p2 or {}).numItems or constantsModule.RecommendedEmoteCount
		})}`
	end
}