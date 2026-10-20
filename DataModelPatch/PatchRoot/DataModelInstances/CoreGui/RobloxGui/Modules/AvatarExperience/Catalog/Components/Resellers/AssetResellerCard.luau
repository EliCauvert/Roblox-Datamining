local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ResellerCardModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.ResellerCard)
local AssetResellerCard = RoactModule.PureComponent:extend("AssetResellerCard")

function AssetResellerCard.render(p1)
	-- upvalues: RoactModule (copy), ResellerCardModule (copy)
	local UserAssetInfo = p1.props.userAssetInfo
	
	if not UserAssetInfo then return end
	return RoactModule.createElement(ResellerCardModule, {
		LayoutOrder = p1.props.LayoutOrder,
		itemId = p1.props.itemId,
		itemType = p1.props.itemType,
		itemPrice = UserAssetInfo.priceInRobux,
		productId = p1.props.productId,
		sellerId = UserAssetInfo.userId,
		sellerName = UserAssetInfo.userName,
		sellerHasVerifiedBadge = UserAssetInfo.sellerHasVerifiedBadge,
		serialNumber = UserAssetInfo.serialNumber,
		userAssetId = p1.props.userAssetId,
		hasDivider = p1.props.hasDivider,
		horizontalPadding = p1.props.horizontalPadding,
		focusController = p1.props.focusController
	})
end

return RoactRoduxModule.connect(function(p1, p2)
	return {
		userAssetInfo = p1.AvatarExperience.Catalog.UserAssets[p2.userAssetId]
	}
end)(AssetResellerCard)