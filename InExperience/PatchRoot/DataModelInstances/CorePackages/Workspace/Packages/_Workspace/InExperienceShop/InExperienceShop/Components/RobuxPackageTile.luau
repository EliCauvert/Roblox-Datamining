local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local icon = foundationModule.Icon
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local iconSize = foundationModule.Enums.IconSize
local formatPriceModule = require(inExperienceShop.Utils.formatPrice)
local MEDIA_HEIGHT_SCALE_FALLBACK = require(inExperienceShop.Components.computeShopRowTileWidths).MEDIA_HEIGHT_SCALE_FALLBACK
local uDim2 = UDim2.fromOffset(50, 50)
local t = {
	buy = "Feature.Catalog.Action.Buy",
	bonusItem = "Feature.InExperienceShop.Label.BonusItem",
	robux = "Feature.Home.Robux"
}

local function _(p0, p1, p2)
	return if p0 then `{p1} + {p2}` else p1
end

local function renderMediaContent(p3)
	-- upvalues: formatPriceModule (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref), image (ref), uDim2 (ref)
	local var7 = p3.hasBonusItem == true
	
	return {
		RobuxGroup = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			testId = "RobuxPackageTile-RobuxGroup",
			LayoutOrder = 1
		}, {
			RobuxIcon = reactModule.createElement(icon, {
				testId = "RobuxPackageTile-RobuxIcon",
				LayoutOrder = 1,
				name = p3.robuxImage,
				size = iconSize.Medium
			}),
			RobuxAmount = reactModule.createElement(text, {
				tag = "auto-xy text-heading-medium content-emphasis",
				testId = "RobuxPackageTile-MediaRobuxAmount",
				LayoutOrder = 2,
				Text = formatPriceModule(p3.robuxAmount)
			})
		}),
		PlusSign = if var7 and p3.bonusItemThumbnail then reactModule.createElement(text, {
			tag = "auto-xy text-heading-medium content-emphasis",
			Text = "+",
			testId = "RobuxPackageTile-PlusSign",
			LayoutOrder = 2
		}) else nil,
		BonusItemImage = if var7 and p3.bonusItemThumbnail then reactModule.createElement(image, {
			tag = "radius-medium bg-shift-200",
			testId = "RobuxPackageTile-BonusItemImage",
			LayoutOrder = 3,
			Size = uDim2,
			Image = p3.bonusItemThumbnail,
			ScaleType = Enum.ScaleType.Fit
		}) else nil
	}
end

return reactModule.memo(function(p4)
	-- upvalues: useLocalization (ref), t (ref), MEDIA_HEIGHT_SCALE_FALLBACK (ref), reactModule (ref), view (ref), renderMediaContent (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var8 = useLocalization(t)
	local robux = var8.robux
	
	return reactModule.createElement(view, {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		testId = "RobuxPackageTile",
		LayoutOrder = p4.LayoutOrder,
		onActivated = p4.onTileActivated
	}, {
		MediaWrapper = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center gap-small size-full-0 bg-shift-200",
			testId = "RobuxPackageTile-MediaWrapper",
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, p4.mediaHeightScale or MEDIA_HEIGHT_SCALE_FALLBACK),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, renderMediaContent(p4)),
		TileContent = reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			ContentHeader = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					testId = "RobuxPackageTile-Title",
					LayoutOrder = 1,
					Text = if p4.hasBonusItem then `{robux} + {var8.bonusItem}` else robux
				}),
				RobuxAmount = reactModule.createElement(view, {
					tag = "row align-y-center auto-xy",
					testId = "RobuxPackageTile-RobuxAmount",
					LayoutOrder = 2
				}, {
					PriceLabel = reactModule.createElement(text, {
						tag = "auto-xy text-body-medium text-truncate-end content-default",
						testId = "RobuxPackageTile-PriceLabel",
						LayoutOrder = 1,
						Text = p4.currencyAmountStr
					})
				})
			}),
			Footer = reactModule.createElement(button, {
				testId = "RobuxPackageTile-BuyButton",
				LayoutOrder = 2,
				text = var8.buy,
				variant = if p4.isPrimaryRobuxPackage == true then buttonVariant.SoftEmphasis else buttonVariant.Standard,
				size = inputSize.Small,
				width = UDim.new(1, 0),
				onActivated = p4.onBuyActivated or function() end
			})
		})
	})
end)