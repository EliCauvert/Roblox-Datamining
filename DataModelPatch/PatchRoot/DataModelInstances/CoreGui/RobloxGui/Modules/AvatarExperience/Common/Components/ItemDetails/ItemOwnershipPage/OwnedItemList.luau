local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OwnedItemRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.OwnedItemRow)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)

return (ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseStyleFunction (copy), UseLocalizationModule (copy), RoactGamepadModule (copy), ReactModule (copy), OwnedItemRowModule (copy), GetFFlagL2ControllerSupportModule (copy), Focusable (copy), CatalogConstantsModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationModuleResult = UseLocalizationModule({
		itemsOnSaleHeading = "Feature.Catalog.Heading.ItemsOnSale",
		availableItemsHeading = "Feature.Catalog.Heading.AvailableItems",
		cannotBeResold = "Feature.Catalog.Message.CannotBeResold"
	})
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local Elements = {}
	
	for LayoutOrder, item in p1.items do
		Elements[item.id] = ReactModule.createElement(OwnedItemRowModule, {
			itemId = p1.itemId,
			itemType = p1.itemType,
			title = item.title,
			buyPrice = item.buyPrice,
			salePrice = item.salePrice,
			isOnHold = item.isOnHold,
			resaleRestriction = p1.resaleRestriction,
			isOnSale = item.isOnSale,
			restrictionTypes = p1.restrictionTypes,
			layoutOrder = LayoutOrder,
			onActivated = function()
				-- upvalues: p1 (copy), item (copy)
				p1.onItemActivated(item.id, item.isOnSale)
			end,
			ref = if GetFFlagL2ControllerSupportModule() then UseRefCacheResult[LayoutOrder] else nil,
			NextSelectionUp = if GetFFlagL2ControllerSupportModule() and LayoutOrder > 1 then UseRefCacheResult[LayoutOrder - 1] else nil,
			NextSelectionDown = if GetFFlagL2ControllerSupportModule() and LayoutOrder < #p1.items then UseRefCacheResult[LayoutOrder + 1] else nil
		})
	end
	return ReactModule.createElement(if GetFFlagL2ControllerSupportModule() then Focusable.Frame else "Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = p1.layoutOrder,
		ref = if GetFFlagL2ControllerSupportModule() then p2 else nil,
		defaultChild = if GetFFlagL2ControllerSupportModule() then UseRefCacheResult[1] else nil,
		restorePreviousChildFocus = if GetFFlagL2ControllerSupportModule() then true else nil
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 24),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		ResaleRestrictionLabel = p1.resaleRestriction == CatalogConstantsModule.ResaleRestriction.Disabled and ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = UseLocalizationModuleResult.cannotBeResold,
			Font = UseStyleResult.Font.Header2.Font,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
		}),
		Rows = ReactModule.createElement(ReactModule.Fragment, nil, Elements)
	})
end))