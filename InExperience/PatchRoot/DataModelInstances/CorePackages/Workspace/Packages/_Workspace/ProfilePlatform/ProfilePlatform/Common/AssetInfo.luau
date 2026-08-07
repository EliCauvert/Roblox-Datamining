local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local var2 = 0

local _ = function() --[[ line: 14 ]]
	-- upvalues: var2 (write)
	var2 += 1
	
	return tostring(var2)
end

return {
	mock = function(p0, p1) --[[ line: 50 ]]
		-- upvalues: var2 (write), enumsModule (ref)
		local t = {}
		local var4 = tostring(p0)
		
		if not var4 then
			var2 += 1
			var4 = tostring(var2)
		end
		t.id = var4
		t.assetType = "0"
		t.itemType = p1 or enumsModule.ItemTypes.Asset
		t.name = ""
		
		return t
	end,
	fromAsset = function(value) --[[ line: 65 ]]
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