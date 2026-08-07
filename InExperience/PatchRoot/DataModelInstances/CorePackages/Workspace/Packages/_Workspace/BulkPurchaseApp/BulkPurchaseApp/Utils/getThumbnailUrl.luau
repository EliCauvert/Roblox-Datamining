local userLibModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.UserLib)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants

local function _(p0) --[[ line: 9 | named "getRbxThumbType" ]]
	-- upvalues: constants (ref)
	return if p0 == "AvatarBundle" then constants.RbxthumbTypes.BundleThumbnail else constants.RbxthumbTypes.Asset
end

return function(p1, p2) --[[ line: 16 | named "getThumbnailUrl" ]]
	-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	return getRbxthumbWithTypeSizeAndOptions(p1, if p2 == "AvatarBundle" then constants.RbxthumbTypes.BundleThumbnail else constants.RbxthumbTypes.Asset, 150)
end