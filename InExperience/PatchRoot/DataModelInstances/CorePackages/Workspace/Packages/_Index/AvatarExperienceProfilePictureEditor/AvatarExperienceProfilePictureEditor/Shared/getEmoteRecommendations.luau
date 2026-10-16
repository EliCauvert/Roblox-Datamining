local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ConstantsModule = require(script.Parent.Parent.Constants)
local Normalize = require(Parent.AvatarExperienceCommon).Utils.normalize
local Url = require(Parent.Http).Url
local NormalizeNumberFunction = Normalize.normalizeNumber
local NormalizeStringFunction = Normalize.normalizeString
local Text = tostring(Enum.AvatarAssetType.EmoteAnimation.Value)

return {
	EMOTE_ASSET_TYPE_ID = Text,
	buildEmoteRecommendationsUrl = function(NumItems): string --[[ Line: 34 ]]
		-- upvalues: Url (copy), Text (copy)
		return `{Url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={Text}&{Url:makeQueryString({ details = true, numItems = NumItems })}`
	end,
	parseEmoteRecommendationsResponse = function(p1) --[[ Line: 42 ]]
		-- upvalues: NormalizeStringFunction (copy), NormalizeNumberFunction (copy)
		local Data = if p1 then p1.data else nil
		
		if typeof(Data) ~= "table" then
			return {}
		end
		local List = {}
		
		for _, entry in Data do
			if typeof(entry) == "table" and entry.id ~= nil then
				local Name = entry.name
				local NormalizeStringResult = NormalizeStringFunction(entry.priceStatus)
				table.insert(List, {
					id = tostring(entry.id),
					label = if typeof(Name) == "string" then Name else "",
					priceInRobux = NormalizeNumberFunction(entry.price),
					lowestPrice = NormalizeNumberFunction(entry.lowestPrice),
					priceStatus = if NormalizeStringResult == nil or NormalizeStringResult == "" then nil else NormalizeStringResult
				})
			end
		end
		return List
	end,
	getEmoteRecommendationsUrl = function(p2): string --[[ Line: 65 ]]
		-- upvalues: ConstantsModule (copy), Url (copy), Text (copy)
		return `{Url.CATALOG_URL}v2/recommendations/user-inventory?assetTypeId={Text}&{Url:makeQueryString({
			details = true,
			numItems = (p2 or {}).numItems or ConstantsModule.RecommendedEmoteCount
		})}`
	end
}