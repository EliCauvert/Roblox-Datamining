local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(InExperienceShop.Types)
local FormatPriceModule = require(InExperienceShop.Utils.formatPrice)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Divider = FoundationModule.Divider
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local IconSize = FoundationModule.Enums.IconSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local ConstantsModule = require(InExperienceShop.Constants)
local ShopOverflowConstantsModule = require(InExperienceShop.Components.Shared.shopOverflowConstants)
local _ = require(InExperienceShop.Hooks.useShopReportOverflow)
local OVERFLOWICON = ShopOverflowConstantsModule.OVERFLOW_ICON
local REPORTICON = ShopOverflowConstantsModule.REPORT_ICON
local REPORTMENUITEMID = ShopOverflowConstantsModule.REPORT_MENU_ITEM_ID
local config = {
	owned = "Feature.Catalog.Label.Owned",
	buy = "Feature.Catalog.Action.Buy",
	try = "Feature.Catalog.Action.Try",
	total = "Feature.Catalog.Label.TotalUnformatted",
	category = "Feature.Catalog.Label.Category",
	updated = "Feature.GameDetails.Label.Updated",
	report = "Feature.Catalog.Action.Report",
	noDescription = "Feature.InExperienceShop.Label.NoDescription"
}

local function CreatorRow(Frame) --[[ Line: 86 ]]
	-- upvalues: VerifiedBadgesModule (copy), ReactModule (copy), Text (copy)
	local Creator = Frame.creator
	
	return ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-large text-align-x-left text-truncate-end content-muted",
		testId = "ItemDetailsView_CreatorRow",
		Text = if Creator.hasVerifiedBadge then Creator.name .. VerifiedBadgesModule.emoji.verified else Creator.name,
		LayoutOrder = Frame.LayoutOrder
	})
end

local function DetailRow(Frame) --[[ Line: 98 ]]
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row flex-x-between align-y-center size-full-0 auto-y padding-y-medium",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-muted",
			LayoutOrder = 1,
			Text = Frame.label
		}),
		Value = ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-large content-emphasis",
			LayoutOrder = 2,
			Text = Frame.value
		})
	})
end

return function(p1) --[[ Line: 120 | Named "ItemDetailsView" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), DetailRow (copy), Divider (copy), View (copy), Text (copy), CreatorRow (copy), Icon (copy), ConstantsModule (copy), IconSize (copy), FormatPriceModule (copy), REPORTMENUITEMID (copy), REPORTICON (copy), Menu (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy), IconButton (copy), OVERFLOWICON (copy), ButtonVariant (copy), Button (copy), FillBehavior (copy), Image (copy), IconName (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local NoDescription = if p1.description == nil or p1.description == "" then UseLocalizationResult.noDescription else p1.description
	local IsIsOwned = p1.isOwned == true
	local IsIsBuyDisabled = p1.isBuyDisabled == true
	local HasPrice = p1.price ~= nil
	local IsCompact = p1.isCompact
	local config1 = {
		Category = ReactModule.createElement(DetailRow, {
			LayoutOrder = 1,
			label = UseLocalizationResult.category,
			value = p1.categoryLabel
		}),
		CategoryDivider = ReactModule.createElement(Divider, { LayoutOrder = 2 })
	}
	
	if p1.updated ~= nil and p1.updated ~= "" then
		config1.Updated = ReactModule.createElement(DetailRow, {
			LayoutOrder = 3,
			label = UseLocalizationResult.updated,
			value = p1.updated
		})
		config1.UpdatedDivider = ReactModule.createElement(Divider, { LayoutOrder = 4 })
	end
	local IsNotNameMatch: boolean = p1.creator ~= nil and (p1.creator.name ~= nil and p1.creator.name ~= "")
	local Element = ReactModule.createElement(View, {
		tag = "col gap-xxsmall size-full-0 auto-y",
		LayoutOrder = 1
	}, {
		Name = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-heading-small text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 1,
			Text = p1.name
		}),
		Creator = if IsNotNameMatch then ReactModule.createElement(CreatorRow, { LayoutOrder = 2, creator = p1.creator }) else nil
	})
	local Element1 = ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
		LayoutOrder = 2,
		Text = NoDescription
	})
	local Element2 = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 3 }, config1)
	local Element3 = ReactModule.createElement(View, {
		tag = "row flex-x-between align-y-center size-full-0 auto-y",
		LayoutOrder = 2
	}, {
		TotalLabel = ReactModule.createElement(Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			LayoutOrder = 1,
			Text = UseLocalizationResult.total
		}),
		Price = if HasPrice then ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			RobuxIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = ConstantsModule.ROBUX_ICON,
				size = IconSize.Small
			}),
			PriceLabel = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium content-default",
				LayoutOrder = 2,
				Text = FormatPriceModule(p1.price)
			})
		}) else nil
	})
	local Items = {}
	
	if p1.isReportingEnabled then
		table.insert(Items, {
			id = REPORTMENUITEMID,
			icon = REPORTICON,
			text = UseLocalizationResult.report
		})
	end
	local Element4 = ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-x-large padding-y-medium",
		LayoutOrder = if IsCompact then 3 else 2
	}, {
		TopDivider = ReactModule.createElement(Divider, { LayoutOrder = 1 }),
		TotalRow = Element3,
		ActionRow = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			Buy = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = if IsIsOwned then UseLocalizationResult.owned else UseLocalizationResult.buy,
				variant = if IsIsOwned then ButtonVariant.Standard else ButtonVariant.Emphasis,
				size = InputSize.Medium,
				fillBehavior = FillBehavior.Fill,
				isDisabled = IsIsOwned or (IsIsBuyDisabled or p1.isActionDisabled == true),
				onActivated = p1.onBuyActivated
			}),
			Try = if p1.showTry and not IsIsOwned then ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.try,
				variant = ButtonVariant.Standard,
				size = InputSize.Medium,
				fillBehavior = FillBehavior.Fill,
				onActivated = p1.onTryActivated or function() --[[ Line: 276 ]] end,
				isLoading = p1.isActionLoading,
				isDisabled = p1.isActionDisabled == true and p1.isActionLoading ~= true
			}) else nil,
			Overflow = if p1.isReportingEnabled then ReactModule.createElement(Menu, {
				LayoutOrder = 3,
				testId = "ItemDetailsView_OverflowMenu",
				isOpen = p1.isOverflowMenuOpen,
				items = Items,
				size = InputSize.Medium,
				side = PopoverSide.Top,
				align = PopoverAlign.End,
				onPressedOutside = p1.onOverflowMenuClosed,
				onActivated = p1.onMenuItemActivated
			}, {
				Trigger = ReactModule.createElement(IconButton, {
					testId = "ItemDetailsView_OverflowButton",
					icon = OVERFLOWICON,
					size = InputSize.Medium,
					variant = ButtonVariant.Standard,
					onActivated = p1.onOverflowActivated
				})
			}) else ReactModule.createElement(IconButton, {
				LayoutOrder = 3,
				testId = "ItemDetailsView_OverflowButton",
				icon = OVERFLOWICON,
				size = InputSize.Medium,
				variant = ButtonVariant.Standard,
				onActivated = p1.onOverflowActivated
			})
		})
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full",
		testId = "ItemDetailsView",
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, {
		TopBarRow = ReactModule.createElement(View, {
			tag = "row align-y-center size-full-0 auto-y padding-x-medium padding-top-medium",
			LayoutOrder = 1
		}, {
			BackButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 1,
				testId = "ItemDetailsView_BackButton",
				icon = IconName.ChevronLargeLeft,
				size = InputSize.Medium,
				variant = ButtonVariant.Utility,
				onActivated = p1.onClose
			})
		}),
		Body = if IsCompact then ReactModule.createElement(View, { tag = "col fill size-full-0", LayoutOrder = 2 }, {
			Preview = ReactModule.createElement(View, {
				tag = "col align-x-center size-full-0 auto-y padding-x-xlarge padding-bottom-medium padding-top-large",
				LayoutOrder = 1
			}, {
				Thumbnail = ReactModule.createElement(Image, {
					tag = "radius-medium",
					Size = UDim2.fromOffset(180, 180),
					Image = p1.thumbnail,
					ScaleType = Enum.ScaleType.Fit
				})
			}),
			Info = ReactModule.createElement(View, {
				tag = "col fill gap-large size-full-0 padding-x-xlarge padding-bottom-large",
				LayoutOrder = 2
			}, {
				TitleBlock = Element,
				Description = Element1,
				DetailsList = Element2
			}),
			BuyBar = Element4
		}) else ReactModule.createElement(View, {
			tag = "row align-y-top fill size-full-0",
			LayoutOrder = 2
		}, {
			LeftPane = ReactModule.createElement(View, {
				tag = "col fill gap-large size-full padding-x-xlarge padding-y-large",
				LayoutOrder = 1
			}, {
				TitleBlock = Element,
				Description = Element1,
				DetailsList = Element2
			}),
			RightPane = ReactModule.createElement(View, {
				tag = "col",
				LayoutOrder = 2,
				Size = UDim2.new(0, 236, 1, 0)
			}, {
				Preview = ReactModule.createElement(View, { tag = "fill size-full-0 padding-large", LayoutOrder = 1 }, {
					Thumbnail = ReactModule.createElement(Image, {
						tag = "size-full radius-medium",
						Image = p1.thumbnail,
						ScaleType = Enum.ScaleType.Fit
					})
				}),
				BuyBar = Element4
			})
		})
	})
end