local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local _ = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerTile)
local UserLibModule = require(AvatarExperienceProfilePictureEditor.Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local _ = require(AvatarExperienceProfilePictureEditor.Hooks.useOwnedEmotes)
local _ = require(AvatarExperienceProfilePictureEditor.Hooks.useRecommendedEmotes)
local _ = require(AvatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)
local GetRecommendationPriceLineContentModule = require(AvatarExperienceProfilePictureEditor.Utils.getRecommendationPriceLineContent)

local function buildOwnedEmoteItems(OwnedEmotes)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	local List = {}
	
	for _, ownedEmote in OwnedEmotes do
		table.insert(List, {
			id = ownedEmote.id,
			label = ownedEmote.label,
			image = GetRbxthumbWithTypeSizeAndOptionsFunction(ownedEmote.id, Constants.RbxthumbTypes.Asset, 150)
		})
	end
	return List
end

local function buildRecommendedEmoteItems(OwnedEmotes, RecommendedEmotes, FreeLabel)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), GetRecommendationPriceLineContentModule (copy)
	local List = {}
	local t = {}
	
	for _, ownedEmote in OwnedEmotes do
		t[ownedEmote.id] = true
	end
	for _, recommendedEmote in RecommendedEmotes do
		if not t[recommendedEmote.id] then
			table.insert(List, {
				id = recommendedEmote.id,
				label = recommendedEmote.label,
				image = GetRbxthumbWithTypeSizeAndOptionsFunction(recommendedEmote.id, Constants.RbxthumbTypes.Asset, 150),
				priceLineContent = GetRecommendationPriceLineContentModule({
					priceInRobux = recommendedEmote.priceInRobux,
					lowestPrice = recommendedEmote.lowestPrice,
					priceStatus = recommendedEmote.priceStatus,
					freeLabel = FreeLabel
				})
			})
		end
	end
	return List
end

local function _(Tbl, List)
	local Copy = table.clone(Tbl)
	
	for _, value in List do
		table.insert(Copy, value)
	end
	return Copy
end

local function buildFrameAssetItems(FrameItems)
	local List = {}
	
	for _, frameItem in FrameItems do
		table.insert(List, {
			id = frameItem.id,
			label = frameItem.label,
			image = frameItem.image
		})
	end
	return List
end

return function(p1)
	-- upvalues: buildOwnedEmoteItems (copy), buildRecommendedEmoteItems (copy), buildFrameAssetItems (copy)
	local OwnedEmoteItems = buildOwnedEmoteItems(p1.ownedEmotes)
	local RecommendedEmoteItems = buildRecommendedEmoteItems(p1.ownedEmotes, p1.recommendedEmotes, p1.freeLabel)
	local config = {
		ownedEmoteItems = OwnedEmoteItems,
		recommendedEmoteItems = RecommendedEmoteItems
	}
	local Copy = table.clone(OwnedEmoteItems)
	
	for _, recommendedEmoteItem in RecommendedEmoteItems do
		table.insert(Copy, recommendedEmoteItem)
	end
	config.combinedEmoteItems = Copy
	config.frameAssetItems = buildFrameAssetItems(p1.frameItems)
	
	return config
end