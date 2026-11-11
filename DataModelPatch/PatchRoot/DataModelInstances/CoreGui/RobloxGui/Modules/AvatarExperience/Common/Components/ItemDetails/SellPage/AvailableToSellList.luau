local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvailableToSellRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellRow)
local AvailableToSellLimitedUniqueRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellLimitedUniqueRow)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AvailableToSellList = RoactModule.PureComponent:extend("AvailableToSellList")

function AvailableToSellList.init(p1)
	-- upvalues: AvatarScreen (copy), RoactGamepadModule (copy)
	function p1.sellLimitedUniqueItem(UserAssetId)
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.SellItemPrompt, {
			itemId = p1.props.itemId,
			itemType = p1.props.itemType,
			userAssetId = UserAssetId,
			onOverlayClosed = p1.props.onOverlayClosed
		})
	end
	
	function p1.sellLimitedItem()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.SellItemPrompt, {
			itemId = p1.props.itemId,
			itemType = p1.props.itemType,
			userAssetId = p1.props.availableItemsToSell[1],
			onOverlayClosed = p1.props.onOverlayClosed
		})
	end
	
	p1.focusableRefs = RoactGamepadModule.createRefCache()
end

function AvailableToSellList.createAvailableToSellLimitedUniqueList(p1, Theme)
	-- upvalues: RoactModule (copy), FitFrameVertical (copy), AvailableToSellLimitedUniqueRowModule (copy)
	local AvailableItemsToSell = p1.props.availableItemsToSell
	
	local function _(p2: number)
		-- upvalues: AvailableItemsToSell (copy), p1 (copy)
		return p2 >= 1 and p2 <= #AvailableItemsToSell and p1.focusableRefs[p2] or nil
	end
	
	local config = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local Count = 0
	
	if AvailableItemsToSell then
		for LayoutOrder, UserAssetId in AvailableItemsToSell do
			Count += 1
			local v1 = LayoutOrder - 1
			local FocusableRef = v1 >= 1 and v1 <= #AvailableItemsToSell and p1.focusableRefs[v1] or nil
			local v2 = LayoutOrder + 1
			config["AvailableToSellLimitedUniqueRow" .. LayoutOrder] = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				LayoutOrder = LayoutOrder
			}, {
				AvailableToSellLimitedUniqueRow = RoactModule.createElement(AvailableToSellLimitedUniqueRowModule, {
					horizontalPadding = 24,
					LayoutOrder = 1,
					onActivated = function()
						-- upvalues: p1 (copy), UserAssetId (copy)
						p1.sellLimitedUniqueItem(UserAssetId)
					end,
					userAssetId = UserAssetId,
					NextSelectionUp = FocusableRef,
					NextSelectionDown = v2 >= 1 and v2 <= #AvailableItemsToSell and p1.focusableRefs[v2] or nil,
					[RoactModule.Ref] = LayoutOrder >= 1 and LayoutOrder <= #AvailableItemsToSell and p1.focusableRefs[LayoutOrder] or nil
				}),
				Divider = LayoutOrder < #AvailableItemsToSell and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.new(1, -24, 0, 1)
				})
			})
		end
	end
	return config
end

function AvailableToSellList.renderLocalized(p2, p3)
	-- upvalues: CatalogConstantsModule (copy), WithStyleFunction (copy), RoactModule (copy), Focusable (copy), FitFrameVertical (copy), RoactFitComponents (copy), FitTextLabel (copy), AvailableToSellRowModule (copy)
	local AvailableItemsToSell = p2.props.availableItemsToSell
	local LayoutOrder = p2.props.LayoutOrder
	local ItemRestrictions = p2.props.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited]
	local CountAvailableItemsToSell: number = AvailableItemsToSell and #AvailableItemsToSell or 0
	local ItemCount = (if CountAvailableItemsToSell == 1 then p3.itemCountSingularLabel else p3.itemCountPluralLabel):gsub("({itemCount})", CountAvailableItemsToSell)
	
	return WithStyleFunction(function(p4)
		-- upvalues: ItemRestriction (copy), p2 (copy), RoactModule (upval), Focusable (upval), FitFrameVertical (upval), LayoutOrder (copy), AvailableItemsToSell (copy), RoactFitComponents (upval), FitTextLabel (upval), p3 (copy), ItemRestriction1 (copy), AvailableToSellRowModule (upval), ItemCount (copy)
		local _Font = p4.Font
		local Theme = p4.Theme
		local AvailableToSellLimitedUniqueList = ItemRestriction and p2:createAvailableToSellLimitedUniqueList(Theme)
		
		return RoactModule.createElement(Focusable[FitFrameVertical], {
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, 6),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			NextSelectionLeft = p2.props.NextSelectionLeft,
			NextSelectionRight = p2.props.NextSelectionRight,
			NextSelectionUp = p2.props.NextSelectionUp,
			NextSelectionDown = p2.props.NextSelectionDown,
			[RoactModule.Ref] = p2.props.forwardRef,
			defaultChild = AvailableItemsToSell and #AvailableItemsToSell > 0 and p2.focusableRefs[1] or nil
		}, {
			AvailableForSaleLabelContainer = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				margin = RoactFitComponents.Rect.quad(0, 0, 0, 24)
			}, {
				AvailableForSaleLabel = RoactModule.createElement(FitTextLabel, {
					BackgroundTransparency = 1,
					width = FitTextLabel.Width.FitToText,
					Font = _Font.CaptionSubHeader.Font,
					Text = p3.headerText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextSize = _Font.BaseSize * _Font.CaptionSubHeader.RelativeSize,
					TextColor3 = Theme.TextEmphasis.Color
				})
			}),
			LimitedCountRow = ItemRestriction1 and RoactModule.createElement(AvailableToSellRowModule, {
				horizontalPadding = 24,
				LayoutOrder = 2,
				onActivated = p2.sellLimitedItem,
				Text = ItemCount,
				[RoactModule.Ref] = p2.focusableRefs[1]
			}),
			LimitedUniqueRowConatiner = ItemRestriction and RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				width = UDim.new(1, 0)
			}, AvailableToSellLimitedUniqueList)
		})
	end)
end

function AvailableToSellList.render(p2)
	-- upvalues: WithLocalizationFunction (copy)
	local AvailableItemsToSell = p2.props.availableItemsToSell
	
	if not AvailableItemsToSell or #AvailableItemsToSell == 0 then return end
	return WithLocalizationFunction({
		headerText = "Feature.Catalog.Label.AvailableForSale",
		itemCountPluralLabel = "Feature.Catalog.Label.ItemsCount",
		itemCountSingularLabel = "Feature.Catalog.Label.ItemCount"
	})(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderLocalized(p3)
	end)
end

local WithNavigationResult = WithNavigationFunction((RoactRoduxModule.connect(function(p2, p3)
	local AssetInfo = p2.AvatarExperience.Common.AssetInfos[p3.itemId]
	
	return {
		itemRestrictions = AssetInfo and AssetInfo.itemRestrictions,
		availableItemsToSell = p2.AvatarExperience.Catalog.Sell.AvailableToSellAssets[p3.itemId]
	}
end, nil)(AvailableToSellList)))

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), WithNavigationResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithNavigationResult, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)