local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local httpModule = require(avatarExperienceCommon.Parent.Http)
local constantsModule = require(script.Parent.Constants)
local normalizeModule = require(avatarExperienceCommon.Utils.normalize)
local url = httpModule.Url
local normalizeNumber = normalizeModule.normalizeNumber
local normalizeString = normalizeModule.normalizeString
local var4 = tostring(Enum.AvatarAssetType.EmoteAnimation.Value)

return {
	EMOTE_ASSET_TYPE_ID = var4,
	buildEmoteRecommendationsUrl = function(p0) --[[ line: 33 ]]
		-- upvalues: url (ref), var4 (ref)
		return `{url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={var4}&{url:makeQueryString({ details = true, numItems = p0 })}`
	end,
	parseEmoteRecommendationsResponse = function(p1) --[[ line: 41 ]]
		-- upvalues: normalizeString (ref), normalizeNumber (ref)
		local var5 = if p1 then p1.data else nil
		
		if typeof(var5) ~= "table" then
			return {}
		end
		local t = {}
		
		for i, v in var5 do
			if typeof(v) == "table" and v.id ~= nil then
				local name = v.name
				local var7 = normalizeString(v.priceStatus)
				table.insert(t, {
					id = tostring(v.id),
					label = if typeof(name) == "string" then name else "",
					priceInRobux = normalizeNumber(v.price),
					lowestPrice = normalizeNumber(v.lowestPrice),
					priceStatus = if var7 == nil or var7 == "" then nil else var7
				})
			end
		end
		return t
	end,
	getEmoteRecommendationsUrl = function(p2) --[[ line: 64 ]]
		-- upvalues: constantsModule (ref), url (ref), var4 (ref)
		return `{url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={var4}&{url:makeQueryString({
			details = true,
			numItems = (p2 or {}).numItems or constantsModule.RecommendedEmoteCount
		})}`
	end
}