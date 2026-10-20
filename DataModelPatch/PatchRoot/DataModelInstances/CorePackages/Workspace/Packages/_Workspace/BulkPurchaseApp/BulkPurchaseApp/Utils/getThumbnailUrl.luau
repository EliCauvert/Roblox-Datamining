local UserLibModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants

local function _(p1)
	-- upvalues: Constants (copy)
	return if p1 == "AvatarBundle" then Constants.RbxthumbTypes.BundleThumbnail else Constants.RbxthumbTypes.Asset
end

return function(p1, p2)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	return GetRbxthumbWithTypeSizeAndOptionsFunction(p1, if p2 == "AvatarBundle" then Constants.RbxthumbTypes.BundleThumbnail else Constants.RbxthumbTypes.Asset, 150)
end