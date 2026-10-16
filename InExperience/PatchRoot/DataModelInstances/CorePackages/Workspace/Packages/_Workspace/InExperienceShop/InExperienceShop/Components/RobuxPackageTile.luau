local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local IconSize = FoundationModule.Enums.IconSize
local FormatPriceModule = require(InExperienceShop.Utils.formatPrice)
local MEDIAHEIGHTSCALEFALLBACK = require(InExperienceShop.Components.computeShopRowTileWidths).MEDIA_HEIGHT_SCALE_FALLBACK
local _UDim2 = UDim2.fromOffset(50, 50)
local config = {
	buy = "Feature.Catalog.Action.Buy",
	bonusItem = "Feature.InExperienceShop.Label.BonusItem",
	robux = "Feature.Home.Robux"
}

local function _(p1, p2, p3) --[[ Line: 46 | Named "getTitleText" ]]
	return if p1 then `{p2} + {p3}` else p2
end

local function renderMediaContent(Frame) --[[ Line: 54 ]]
	-- upvalues: FormatPriceModule (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy), Image (copy), _UDim2 (copy)
	local IsHasBonusItem = Frame.hasBonusItem == true
	
	return {
		RobuxGroup = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			testId = "RobuxPackageTile-RobuxGroup",
			LayoutOrder = 1
		}, {
			RobuxIcon = ReactModule.createElement(Icon, {
				testId = "RobuxPackageTile-RobuxIcon",
				LayoutOrder = 1,
				name = Frame.robuxImage,
				size = IconSize.Medium
			}),
			RobuxAmount = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-medium content-emphasis",
				testId = "RobuxPackageTile-MediaRobuxAmount",
				LayoutOrder = 2,
				Text = FormatPriceModule(Frame.robuxAmount)
			})
		}),
		PlusSign = if IsHasBonusItem and Frame.bonusItemThumbnail then ReactModule.createElement(Text, {
			tag = "auto-xy text-heading-medium content-emphasis",
			Text = "+",
			testId = "RobuxPackageTile-PlusSign",
			LayoutOrder = 2
		}) else nil,
		BonusItemImage = if IsHasBonusItem and Frame.bonusItemThumbnail then ReactModule.createElement(Image, {
			tag = "radius-medium bg-shift-200",
			testId = "RobuxPackageTile-BonusItemImage",
			LayoutOrder = 3,
			Size = _UDim2,
			Image = Frame.bonusItemThumbnail,
			ScaleType = Enum.ScaleType.Fit
		}) else nil
	}
end

return ReactModule.memo(function(Frame) --[[ Line: 99 | Named "RobuxPackageTile" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), MEDIAHEIGHTSCALEFALLBACK (copy), ReactModule (copy), View (copy), renderMediaContent (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Robux = UseLocalizationResult.robux
	local BonusItem = UseLocalizationResult.bonusItem
	
	return ReactModule.createElement(View, {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		testId = "RobuxPackageTile",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onTileActivated
	}, {
		MediaWrapper = ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center gap-small size-full-0 bg-shift-200",
			testId = "RobuxPackageTile-MediaWrapper",
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, Frame.mediaHeightScale or MEDIAHEIGHTSCALEFALLBACK),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, (renderMediaContent(Frame))),
		TileContent = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			ContentHeader = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					testId = "RobuxPackageTile-Title",
					LayoutOrder = 1,
					Text = if Frame.hasBonusItem then `{Robux} + {BonusItem}` else Robux
				}),
				RobuxAmount = ReactModule.createElement(View, {
					tag = "row align-y-center auto-xy",
					testId = "RobuxPackageTile-RobuxAmount",
					LayoutOrder = 2
				}, {
					PriceLabel = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-truncate-end content-default",
						testId = "RobuxPackageTile-PriceLabel",
						LayoutOrder = 1,
						Text = Frame.currencyAmountStr
					})
				})
			}),
			Footer = ReactModule.createElement(Button, {
				testId = "RobuxPackageTile-BuyButton",
				LayoutOrder = 2,
				text = UseLocalizationResult.buy,
				variant = if Frame.isPrimaryRobuxPackage == true then ButtonVariant.SoftEmphasis else ButtonVariant.Standard,
				size = InputSize.Small,
				width = UDim.new(1, 0),
				onActivated = Frame.onBuyActivated or function() --[[ Line: 152 ]] end,
				isLoading = Frame.isBuyLoading
			})
		})
	})
end)