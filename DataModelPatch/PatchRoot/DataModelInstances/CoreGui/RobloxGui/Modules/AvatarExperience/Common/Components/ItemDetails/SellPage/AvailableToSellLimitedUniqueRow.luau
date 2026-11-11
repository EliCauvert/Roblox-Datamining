local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AvailableToSellRowModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellRow)
local AvailableToSellLimitedUniqueRow = RoactModule.PureComponent:extend("AvailableToSellLimitedUniqueRow")

function AvailableToSellLimitedUniqueRow.render(p1)
	-- upvalues: RoactModule (copy), AvailableToSellRowModule (copy)
	local UserAssetInfo = p1.props.userAssetInfo
	
	if not UserAssetInfo or UserAssetInfo and not UserAssetInfo.serialNumber then return end
	return RoactModule.createElement(AvailableToSellRowModule, {
		LayoutOrder = p1.props.LayoutOrder,
		onActivated = p1.props.onActivated,
		horizontalPadding = p1.props.horizontalPadding,
		Position = p1.props.Position,
		Size = p1.props.Size,
		Text = "# " .. UserAssetInfo.serialNumber,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.forwardRef
	})
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	return {
		userAssetInfo = p1.AvatarExperience.Catalog.UserAssets[p2.userAssetId]
	}
end)(AvailableToSellLimitedUniqueRow)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)