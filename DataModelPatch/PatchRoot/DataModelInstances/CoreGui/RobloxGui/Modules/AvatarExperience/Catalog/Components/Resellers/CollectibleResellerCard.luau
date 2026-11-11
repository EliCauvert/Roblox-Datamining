local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ResellerCardModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.ResellerCard)
local CollectibleResellerCard = RoactModule.PureComponent:extend("CollectibleResellerCard")

function CollectibleResellerCard.render(p1)
	-- upvalues: RoactModule (copy), ResellerCardModule (copy)
	local CollectibleInstance = p1.props.collectibleInstance
	
	if not CollectibleInstance then return end
	return RoactModule.createElement(ResellerCardModule, {
		LayoutOrder = p1.props.LayoutOrder,
		itemId = p1.props.itemId,
		itemType = p1.props.itemType,
		itemPrice = CollectibleInstance.price,
		productId = CollectibleInstance.collectibleProductId,
		sellerId = tostring(CollectibleInstance.seller.sellerId),
		sellerName = CollectibleInstance.seller.name,
		sellerHasVerifiedBadge = CollectibleInstance.seller.hasVerifiedBadge,
		serialNumber = CollectibleInstance.serialNumber,
		hasDivider = p1.props.hasDivider,
		horizontalPadding = p1.props.horizontalPadding,
		focusController = p1.props.focusController,
		collectibleInstanceId = CollectibleInstance.collectibleInstanceId
	})
end

return RoactRoduxModule.connect(function(p1, p2)
	local CollectiblesResellersInstances = p1.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances
	local CollectiblesResellersInstance = if p2.collectibleItemId then CollectiblesResellersInstances[p2.collectibleItemId] else nil
	
	return {
		collectibleInstance = if CollectiblesResellersInstance and p2.collectibleInstanceId then CollectiblesResellersInstance.Instances[p2.collectibleInstanceId] else nil
	}
end)(CollectibleResellerCard)