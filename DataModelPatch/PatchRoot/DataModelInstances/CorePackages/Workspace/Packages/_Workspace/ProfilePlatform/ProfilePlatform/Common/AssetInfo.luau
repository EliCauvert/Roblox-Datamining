local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local FFlagProfilePlatformEnableBundlesInAssetsCarousel = require(Parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local Count = 0

local function _(): string
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end

return {
	mock = function(p1, p2)
		-- upvalues: Count (ref), EnumsModule (copy)
		local t = {}
		local Text = tostring(p1)
		
		if not Text then
			Count += 1
			Text = tostring(Count)
		end
		t.id = Text
		t.assetType = "0"
		t.itemType = p2 or EnumsModule.ItemTypes.Asset
		t.name = ""
		
		return t
	end,
	fromAsset = function(p1)
		-- upvalues: FFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), FFlagSocialEnableProfileInspectAndBuy (copy)
		local config = {
			id = tostring(p1.id),
			assetType = tostring(p1.assetType or (if FFlagProfilePlatformEnableBundlesInAssetsCarousel then p1.bundleType else nil)),
			itemType = p1.itemType,
			name = p1.name,
			price = p1.price,
			lowestResalePrice = p1.lowestResalePrice,
			isOffSale = p1.isOffSale,
			favoriteCount = p1.favoriteCount
		}
		
		if FFlagSocialEnableProfileInspectAndBuy then
			config.creatorName = p1.creatorName
			config.creatorHasVerifiedBadge = p1.creatorHasVerifiedBadge
			config.collectibleItemId = p1.collectibleItemId
			config.owned = p1.owned
			config.bundledItems = p1.bundledItems
			config.taxonomyName = if p1.taxonomy and #p1.taxonomy > 0 then p1.taxonomy[1].taxonomyName else nil
		end
		return config
	end
}