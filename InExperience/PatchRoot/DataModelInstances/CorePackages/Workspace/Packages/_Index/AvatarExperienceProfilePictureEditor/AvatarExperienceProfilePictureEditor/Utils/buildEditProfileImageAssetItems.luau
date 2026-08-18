local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local _ = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerTile)
local userLibModule = require(avatarExperienceProfilePictureEditor.Parent.UserLib)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants
local _ = require(avatarExperienceProfilePictureEditor.Hooks.useOwnedEmotes)
local _ = require(avatarExperienceProfilePictureEditor.Hooks.useRecommendedEmotes)
local _ = require(avatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)
local getRecommendationPriceLineContentModule = require(avatarExperienceProfilePictureEditor.Utils.getRecommendationPriceLineContent)

local function buildOwnedEmoteItems(p0) --[[ line: 35 ]]
	-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	local t = {}
	
	for i, v in p0 do
		table.insert(t, {
			id = v.id,
			label = v.label,
			image = getRbxthumbWithTypeSizeAndOptions(v.id, constants.RbxthumbTypes.Asset, 150)
		})
	end
	return t
end

local function buildRecommendedEmoteItems(p1, p2, p3) --[[ line: 50 ]]
	-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), getRecommendationPriceLineContentModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		t_1[v.id] = true
	end
	for i, v_1 in p2 do
		if not t_1[v_1.id] then
			table.insert(t, {
				id = v_1.id,
				label = v_1.label,
				image = getRbxthumbWithTypeSizeAndOptions(v_1.id, constants.RbxthumbTypes.Asset, 150),
				priceLineContent = getRecommendationPriceLineContentModule({
					priceInRobux = v_1.priceInRobux,
					lowestPrice = v_1.lowestPrice,
					priceStatus = v_1.priceStatus,
					freeLabel = p3
				})
			})
		end
	end
	return t
end

local function _(p4, p5) --[[ line: 81 | named "buildCombinedEmoteItems" ]]
	local cloned = table.clone(p4)
	
	for i, v in p5 do
		table.insert(cloned, v)
	end
	return cloned
end

local function buildFrameAssetItems(value) --[[ line: 92 ]]
	local t = {}
	
	for i, v in value do
		table.insert(t, { id = v.id, label = v.label, image = v.image })
	end
	return t
end

return function(value) --[[ line: 107 | named "buildEditProfileImageAssetItems" ]]
	-- upvalues: buildOwnedEmoteItems (ref), buildRecommendedEmoteItems (ref), buildFrameAssetItems (ref)
	local var11 = buildOwnedEmoteItems(value.ownedEmotes)
	local var12 = buildRecommendedEmoteItems(value.ownedEmotes, value.recommendedEmotes, value.freeLabel)
	local t = { ownedEmoteItems = var11, recommendedEmoteItems = var12 }
	local cloned = table.clone(var11)
	
	for i, v in var12 do
		table.insert(cloned, v)
	end
	t.combinedEmoteItems = cloned
	t.frameAssetItems = buildFrameAssetItems(value.frameItems)
	
	return t
end