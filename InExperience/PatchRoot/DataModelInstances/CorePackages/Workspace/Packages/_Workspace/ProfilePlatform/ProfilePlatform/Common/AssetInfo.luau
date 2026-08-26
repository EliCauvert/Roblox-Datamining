local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local var1 = 0

local _ = function()
	-- upvalues: var1 (write)
	var1 += 1
	
	return tostring(var1)
end

return {
	mock = function(p1, p2)
		-- upvalues: var1 (write), enumsModule (ref)
		local t = {}
		local var2 = tostring(p1)
		
		if not var2 then
			var1 += 1
			var2 = tostring(var1)
		end
		t.id = var2
		t.assetType = "0"
		t.itemType = p2 or enumsModule.ItemTypes.Asset
		t.name = ""
		
		return t
	end,
	fromAsset = function(value)
		-- upvalues: fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), fFlagSocialEnableProfileInspectAndBuy (ref)
		local t = {
			id = tostring(value.id),
			assetType = tostring(value.assetType or (if fFlagProfilePlatformEnableBundlesInAssetsCarousel then value.bundleType else nil)),
			itemType = value.itemType,
			name = value.name,
			price = value.price,
			lowestResalePrice = value.lowestResalePrice,
			isOffSale = value.isOffSale,
			favoriteCount = value.favoriteCount
		}
		
		if fFlagSocialEnableProfileInspectAndBuy then
			t.creatorName = value.creatorName
			t.creatorHasVerifiedBadge = value.creatorHasVerifiedBadge
			t.collectibleItemId = value.collectibleItemId
			t.owned = value.owned
			t.bundledItems = value.bundledItems
			t.taxonomyName = if value.taxonomy and #value.taxonomy > 0 then value.taxonomy[1].taxonomyName else nil
		end
		return t
	end
}