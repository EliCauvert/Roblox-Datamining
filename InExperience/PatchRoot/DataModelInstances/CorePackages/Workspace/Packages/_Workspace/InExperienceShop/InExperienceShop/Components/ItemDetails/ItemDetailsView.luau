local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local verifiedBadgesModule = require(parent.VerifiedBadges)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(inExperienceShop.Types)
local formatPriceModule = require(inExperienceShop.Utils.formatPrice)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local icon = foundationModule.Icon
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local divider = foundationModule.Divider
local menu = foundationModule.Menu
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local iconSize = foundationModule.Enums.IconSize
local fillBehavior = foundationModule.Enums.FillBehavior
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local constantsModule = require(inExperienceShop.Constants)
local shopOverflowConstantsModule = require(inExperienceShop.Components.Shared.shopOverflowConstants)
local _ = require(inExperienceShop.Hooks.useShopReportOverflow)
local OVERFLOW_ICON = shopOverflowConstantsModule.OVERFLOW_ICON
local REPORT_ICON = shopOverflowConstantsModule.REPORT_ICON
local REPORT_MENU_ITEM_ID = shopOverflowConstantsModule.REPORT_MENU_ITEM_ID
local t = {
	owned = "Feature.Catalog.Label.Owned",
	buy = "Feature.Catalog.Action.Buy",
	total = "Feature.Catalog.Label.TotalUnformatted",
	category = "Feature.Catalog.Label.Category",
	updated = "Feature.GameDetails.Label.Updated",
	report = "Feature.Catalog.Action.Report",
	noDescription = "Feature.InExperienceShop.Label.NoDescription"
}

local function CreatorRow(p1)
	-- upvalues: verifiedBadgesModule (ref), reactModule (ref), text (ref)
	local creator = p1.creator
	
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-large text-align-x-left text-truncate-end content-muted",
		testId = "ItemDetailsView_CreatorRow",
		Text = if creator.hasVerifiedBadge then creator.name .. verifiedBadgesModule.emoji.verified else creator.name,
		LayoutOrder = p1.LayoutOrder
	})
end

local function DetailRow(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row flex-x-between align-y-center size-full-0 auto-y padding-y-medium",
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-muted",
			LayoutOrder = 1,
			Text = p1.label
		}),
		Value = reactModule.createElement(text, {
			tag = "auto-xy text-caption-large content-emphasis",
			LayoutOrder = 2,
			Text = p1.value
		})
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), DetailRow (ref), divider (ref), view (ref), text (ref), CreatorRow (ref), icon (ref), constantsModule (ref), iconSize (ref), formatPriceModule (ref), REPORT_MENU_ITEM_ID (ref), REPORT_ICON (ref), menu (ref), inputSize (ref), popoverSide (ref), popoverAlign (ref), iconButton (ref), OVERFLOW_ICON (ref), buttonVariant (ref), button (ref), fillBehavior (ref), image (ref), iconName (ref)
	local var1 = useLocalization(t)
	local var2 = if p1.description == nil or p1.description == "" then var1.noDescription else p1.description
	local var3 = p1.isOwned == true
	local var4 = p1.isBuyDisabled == true
	local var5 = p1.price ~= nil
	local isCompact = p1.isCompact
	local t_1 = {
		Category = reactModule.createElement(DetailRow, {
			LayoutOrder = 1,
			label = var1.category,
			value = p1.categoryLabel
		}),
		CategoryDivider = reactModule.createElement(divider, { LayoutOrder = 2 })
	}
	
	if p1.updated ~= nil and p1.updated ~= "" then
		t_1.Updated = reactModule.createElement(DetailRow, {
			LayoutOrder = 3,
			label = var1.updated,
			value = p1.updated
		})
		t_1.UpdatedDivider = reactModule.createElement(divider, { LayoutOrder = 4 })
	end
	local var6 = reactModule.createElement(view, {
		tag = "col gap-xxsmall size-full-0 auto-y",
		LayoutOrder = 1
	}, {
		Name = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-heading-small text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 1,
			Text = p1.name
		}),
		Creator = if p1.creator ~= nil and (p1.creator.name ~= nil and p1.creator.name ~= "") then reactModule.createElement(CreatorRow, { LayoutOrder = 2, creator = p1.creator }) else nil
	})
	local var7 = reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
		LayoutOrder = 2,
		Text = var2
	})
	local var8 = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 3 }, t_1)
	local var9 = reactModule.createElement(view, {
		tag = "row flex-x-between align-y-center size-full-0 auto-y",
		LayoutOrder = 2
	}, {
		TotalLabel = reactModule.createElement(text, {
			tag = "auto-xy text-title-medium content-emphasis",
			LayoutOrder = 1,
			Text = var1.total
		}),
		Price = if var5 then reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			RobuxIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = constantsModule.ROBUX_ICON,
				size = iconSize.Small
			}),
			PriceLabel = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium content-default",
				LayoutOrder = 2,
				Text = formatPriceModule(p1.price)
			})
		}) else nil
	})
	local t_2 = {}
	
	if p1.isReportingEnabled then
		table.insert(t_2, {
			id = REPORT_MENU_ITEM_ID,
			icon = REPORT_ICON,
			text = var1.report
		})
	end
	local var10 = reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-x-large padding-y-medium",
		LayoutOrder = if isCompact then 3 else 2
	}, {
		TopDivider = reactModule.createElement(divider, { LayoutOrder = 1 }),
		TotalRow = var9,
		ActionRow = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			Buy = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var3 then var1.owned else var1.buy,
				variant = if var3 then buttonVariant.Standard else buttonVariant.Emphasis,
				size = inputSize.Medium,
				fillBehavior = fillBehavior.Fill,
				isDisabled = var3 or var4,
				onActivated = p1.onBuyActivated
			}),
			Overflow = if p1.isReportingEnabled then reactModule.createElement(menu, {
				LayoutOrder = 2,
				testId = "ItemDetailsView_OverflowMenu",
				isOpen = p1.isOverflowMenuOpen,
				items = t_2,
				size = inputSize.Medium,
				side = popoverSide.Top,
				align = popoverAlign.End,
				onPressedOutside = p1.onOverflowMenuClosed,
				onActivated = p1.onMenuItemActivated
			}, {
				Trigger = reactModule.createElement(iconButton, {
					testId = "ItemDetailsView_OverflowButton",
					icon = OVERFLOW_ICON,
					size = inputSize.Medium,
					variant = buttonVariant.Standard,
					onActivated = p1.onOverflowActivated
				})
			}) else reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				testId = "ItemDetailsView_OverflowButton",
				icon = OVERFLOW_ICON,
				size = inputSize.Medium,
				variant = buttonVariant.Standard,
				onActivated = p1.onOverflowActivated
			})
		})
	})
	
	return reactModule.createElement(view, {
		tag = "col size-full",
		testId = "ItemDetailsView",
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, {
		TopBarRow = reactModule.createElement(view, {
			tag = "row align-y-center size-full-0 auto-y padding-x-medium padding-top-medium",
			LayoutOrder = 1
		}, {
			BackButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 1,
				testId = "ItemDetailsView_BackButton",
				icon = iconName.ChevronLargeLeft,
				size = inputSize.Medium,
				variant = buttonVariant.Utility,
				onActivated = p1.onClose
			})
		}),
		Body = if isCompact then reactModule.createElement(view, { tag = "col fill size-full-0", LayoutOrder = 2 }, {
			Preview = reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y padding-x-xlarge padding-bottom-medium padding-top-large",
				LayoutOrder = 1
			}, {
				Thumbnail = reactModule.createElement(image, {
					tag = "radius-medium",
					Size = UDim2.fromOffset(180, 180),
					Image = p1.thumbnail,
					ScaleType = Enum.ScaleType.Fit
				})
			}),
			Info = reactModule.createElement(view, {
				tag = "col fill gap-large size-full-0 padding-x-xlarge padding-bottom-large",
				LayoutOrder = 2
			}, {
				TitleBlock = var6,
				Description = var7,
				DetailsList = var8
			}),
			BuyBar = var10
		}) else reactModule.createElement(view, {
			tag = "row align-y-top fill size-full-0",
			LayoutOrder = 2
		}, {
			LeftPane = reactModule.createElement(view, {
				tag = "col fill gap-large size-full padding-x-xlarge padding-y-large",
				LayoutOrder = 1
			}, {
				TitleBlock = var6,
				Description = var7,
				DetailsList = var8
			}),
			RightPane = reactModule.createElement(view, {
				tag = "col",
				LayoutOrder = 2,
				Size = UDim2.new(0, 236, 1, 0)
			}, {
				Preview = reactModule.createElement(view, { tag = "fill size-full-0 padding-large", LayoutOrder = 1 }, {
					Thumbnail = reactModule.createElement(image, {
						tag = "size-full radius-medium",
						Image = p1.thumbnail,
						ScaleType = Enum.ScaleType.Fit
					})
				}),
				BuyBar = var10
			})
		})
	})
end