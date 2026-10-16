local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceDeveloperProductContextModule = require(buildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local badge = foundationModule.Badge
local button = foundationModule.Button
local dialog = foundationModule.Dialog
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local image = foundationModule.Image
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local toggle = foundationModule.Toggle
local view = foundationModule.View
local menu = foundationModule.Menu
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local var1 = if fFlagBuildExperienceMonetizationNativeUIModule then foundationCloudAssetsModule.Assets["pictograms/robux"].assetId else nil
local uDim2 = UDim2.new(0.333333333333, -8, 0, 0)

local function ProductActionsMenu(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), localizationStringsModule (ref), iconName (ref), menu (ref), foundationModule (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	local var5 = useLocalization({ archive = localizationStringsModule.ARCHIVE_GAME_ARCHIVE })
	
	return reactModule.createElement(menu, {
		testId = "monetization-product-actions-menu",
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var2,
		items = reactModule.useMemo(function()
			-- upvalues: p1 (ref), iconName (copy), var5 (ref)
			return {
				{
					id = "edit",
					text = p1.editLabel,
					icon = iconName.Pencil,
					isDisabled = p1.isDisabled
				},
				{
					id = "archive",
					isDisabled = true,
					text = var5.archive,
					icon = iconName.TrashCan
				}
			}
		end, { var5.archive, p1.editLabel, p1.isDisabled }),
		onActivated = function(p2)
			-- upvalues: var4 (ref), p1 (ref)
			var4()
			
			if p2 == "edit" and not p1.isDisabled then
				p1.onEdit()
			end
		end,
		onPressedOutside = var4,
		side = foundationModule.Enums.PopoverSide.Bottom
	}, {
		Trigger = reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "monetization-product-actions",
			icon = iconName.ThreeDotsHorizontal,
			isDisabled = p1.isDisabled,
			onActivated = function()
				-- upvalues: var3 (ref), var2 (ref)
				var3(not var2)
			end,
			size = inputSize.Medium,
			variant = buttonVariant.Utility
		})
	})
end

local function ProductCard(p1)
	-- upvalues: useTokens (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var1 (ref), reactModule (ref), view (ref), uDim2 (ref), stateLayerAffordance (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), image (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local createElement_2
	local product = p1.product
	local var2 = useTokens()
	local image_1 = product.image or (if fFlagBuildExperienceMonetizationNativeUIModule then var1 else nil)
	local createElement = reactModule.createElement
	local t = {
		tag = "col auto-y radius-medium",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated,
		selection = { Selectable = true },
		Size = uDim2,
		stateLayer = { affordance = stateLayerAffordance.None },
		testId = `monetization-product-{product.id}`
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 1,
		aspectRatio = 1,
		tag = "radius-medium clip bg-surface-200",
		Size = if fFlagBuildExperienceMonetizationNativeUIModule then UDim2.fromOffset(var2.Size.Size_2800, var2.Size.Size_2800) else UDim2.new(1, 0, 0, 109)
	}
	local t_3 = {
		SaleStatus = if product.saleStatus == nil or fFlagBuildExperienceMonetizationNativeUIModule and product.isForSale ~= true then nil else reactModule.createElement(badge, {
			ZIndex = 2,
			Position = UDim2.fromOffset(var2.Gap.Small, var2.Gap.Small),
			shape = badgeShape.Pill,
			size = badgeSize.Small,
			text = product.saleStatus,
			testId = `monetization-product-sale-status-{product.id}`,
			variant = badgeVariant.OverMedia
		})
	}
	
	if image_1 == nil then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(image, {
			Image = image_1,
			imageStyle = if fFlagBuildExperienceMonetizationNativeUIModule and product.image == nil then var2.Color.Content.Emphasis else nil,
			ScaleType = Enum.ScaleType.Fit,
			tag = if fFlagBuildExperienceMonetizationNativeUIModule then "size-full radius-medium" else "size-full",
			testId = `monetization-product-image-{product.id}`
		})
	end
	t_3.Image = createElement_2
	t_1.Media = createElement_1(view, t_2, t_3)
	t_1.Title = reactModule.createElement(text, {
		LayoutOrder = 2,
		Text = product.name,
		sizeConstraint = if fFlagBuildExperienceMonetizationNativeUIModule then {
			MaxSize = Vector2.new(var2.Size.Size_2800, var2.Size.Size_1000 + var2.Gap.Small)
		} else nil,
		tag = {
			["size-full-0 auto-y padding-top-small text-title-medium text-align-x-left text-truncate-end content-emphasis"] = true,
			["text-wrap"] = fFlagBuildExperienceMonetizationNativeUIModule
		},
		testId = if fFlagBuildExperienceMonetizationNativeUIModule then `monetization-product-title-{product.id}` else nil
	})
	t_1.Metadata = reactModule.createElement(view, {
		LayoutOrder = 3,
		sizeConstraint = if fFlagBuildExperienceMonetizationNativeUIModule then { MaxSize = Vector2.new(var2.Size.Size_2800, 1e999) } else nil,
		tag = {
			["row align-y-center gap-xsmall size-full-0 auto-y"] = true,
			["padding-top-xsmall"] = fFlagBuildExperienceMonetizationNativeUIModule
		}
	}, {
		Kind = if fFlagBuildExperienceMonetizationNativeUIModule or product.kind == nil then nil else reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium content-default",
			Text = product.kind
		}),
		PriceIcon = reactModule.createElement(icon, {
			LayoutOrder = 2,
			name = iconName.Robux,
			size = iconSize.Small
		}),
		Price = reactModule.createElement(text, {
			LayoutOrder = 3,
			Text = product.price,
			tag = if fFlagBuildExperienceMonetizationNativeUIModule then "fill auto-y text-body-medium text-wrap text-align-x-left content-default" else "auto-xy text-body-medium content-default"
		}),
		Spacer = if not fFlagBuildExperienceMonetizationNativeUIModule then reactModule.createElement(view, { LayoutOrder = 4, tag = "fill" }) else nil,
		Age = if fFlagBuildExperienceMonetizationNativeUIModule or product.age == nil then nil else reactModule.createElement(text, {
			LayoutOrder = 5,
			tag = "auto-xy text-body-medium content-default",
			Text = product.age
		})
	})
	
	return createElement(view, t, t_1)
end

local function ProductRow(p1)
	-- upvalues: reactModule (ref), ProductCard (ref), view (ref)
	local t = {}
	
	for i = p1.startIndex, math.min(p1.startIndex + 2, #p1.products) do
		local var2 = p1.products[i]
		t[var2.id] = reactModule.createElement(ProductCard, {
			LayoutOrder = i - p1.startIndex + 1,
			product = var2,
			onActivated = function()
				-- upvalues: p1 (ref), var2 (ref)
				p1.onProductActivated(var2.id)
			end
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, t)
end

local function OptionRow(p2)
	-- upvalues: reactModule (ref), view (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), text (ref), toggle (ref), inputSize (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y padding-x-large padding-y-medium",
		LayoutOrder = p2.LayoutOrder
	}, {
		Copy = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = if fFlagBuildExperienceMonetizationNativeUIModule then "col fill gap-xsmall auto-y" else "col fill gap-xxsmall auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p2.title,
				tag = {
					["size-full-0 auto-y text-title-medium text-align-x-left content-emphasis"] = true,
					["text-wrap"] = fFlagBuildExperienceMonetizationNativeUIModule
				}
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = p2.description
			}),
			Supporting = if p2.supportingText ~= nil then nil else reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted",
				Text = p2.supportingText
			})
		}),
		Toggle = reactModule.createElement(toggle, {
			LayoutOrder = 2,
			label = "",
			isChecked = p2.isChecked,
			isDisabled = p2.isDisabled,
			onActivated = p2.onActivated,
			size = inputSize.Medium,
			testId = p2.testId
		})
	})
end

local function OptionsStatusContent(p2)
	-- upvalues: reactModule (ref), text (ref), view (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return if p2.optionsLoadStatus == "NotReady" then reactModule.createElement(text, {
		tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
		testId = "monetization-options-loading",
		Text = p2.labels.loading
	}) elseif p2.optionsLoadStatus == "Failed" then reactModule.createElement(view, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-large",
		testId = "monetization-options-error"
	}, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = p2.labels.optionsLoadError
		}),
		Retry = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = p2.onRetryOptions,
			size = inputSize.Medium,
			text = p2.labels.retry,
			variant = buttonVariant.Standard
		})
	}) else nil
end

local function OptionsContent(p2)
	-- upvalues: OptionsStatusContent (ref), buttonVariant (ref), reactModule (ref), view (ref), text (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), OptionRow (ref), dialog (ref), dialogSize (ref)
	local var3 = OptionsStatusContent(p2)
	
	return if var3 == nil then reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-medium",
		testId = "monetization-options"
	}, {
		Permission = if not p2.canMonetize then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y padding-medium text-body-medium text-wrap radius-medium bg-surface-100 content-default",
			Text = p2.labels.permissionDenied
		}) else nil,
		Pricing = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = p2.labels.pricingOptions,
					tag = {
						["size-full-0 auto-y text-title-large text-align-x-left content-emphasis"] = true,
						["text-wrap"] = fFlagBuildExperienceMonetizationNativeUIModule
					}
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = p2.labels.pricingOptionsDescription,
					tag = {
						["size-full-0 auto-y text-body-small text-align-x-left content-default"] = true,
						["text-wrap"] = fFlagBuildExperienceMonetizationNativeUIModule
					}
				})
			}),
			Rows = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
			}, {
				ManagedPricing = reactModule.createElement(OptionRow, {
					LayoutOrder = 1,
					testId = "monetization-managed-pricing",
					description = p2.labels.managedPricingDescription,
					isChecked = p2.managedPricingState == "AllOn",
					isDisabled = not p2.canChangeManagedPricing or p2.isOptionsManagedPricingPending,
					onActivated = p2.onManagedPricingChanged,
					supportingText = p2.managedPricingSupportingText or (if p2.managedPricingState == "Mixed" then p2.labels.mixed elseif p2.managedPricingState == "Unavailable" then p2.labels.unavailable else nil),
					title = p2.labels.managedPricing
				}),
				Error = if p2.managedPricingError ~= nil then nil else reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y padding-x-large padding-bottom-medium text-body-small text-wrap content-alert",
					Text = p2.managedPricingError
				})
			})
		}),
		Shop = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			Header = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p2.labels.shopUI,
				tag = {
					["size-full-0 auto-y text-title-large text-align-x-left content-emphasis"] = true,
					["text-wrap"] = fFlagBuildExperienceMonetizationNativeUIModule
				}
			}),
			Rows = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
			}, {
				ShopButton = reactModule.createElement(OptionRow, {
					LayoutOrder = 1,
					testId = "monetization-shop-button",
					description = p2.labels.shopButtonDescription,
					isChecked = p2.shopButtonEnabled,
					isDisabled = not p2.canMonetize or p2.isShopButtonPending,
					onActivated = p2.onShopButtonChanged,
					title = p2.labels.shopButton
				}),
				Error = if p2.shopButtonError ~= nil then nil else reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y padding-x-large padding-bottom-medium text-body-small text-wrap content-alert",
					Text = p2.shopButtonError
				})
			})
		}),
		Acknowledgement = if p2.showManagedPricingAcknowledgement then reactModule.createElement(dialog.Root, {
			disablePortal = p2.disableDialogPortal == true,
			hasBackdrop = p2.disableDialogPortal ~= true,
			size = dialogSize.Small
		}, {
			Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p2.labels.acknowledgementTitle }),
			Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
				Description = reactModule.createElement(dialog.Text, { Text = p2.labels.acknowledgementDescription })
			}),
			Actions = reactModule.createElement(dialog.Actions, {
				actions = {
					{
						isDisabled = false,
						text = p2.labels.agree,
						variant = buttonVariant.Emphasis,
						onActivated = p2.onConfirmManagedPricing,
						isLoading = p2.isOptionsManagedPricingPending
					},
					{
						isLoading = false,
						text = p2.labels.cancel,
						variant = buttonVariant.Standard,
						onActivated = p2.onCancelManagedPricing,
						isDisabled = p2.isOptionsManagedPricingPending
					}
				}
			})
		}) else nil
	}) else var3
end

local function CatalogContent(p2)
	-- upvalues: reactModule (ref), ProductRow (ref), view (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref)
	local t = {}
	local var3 = 0
	
	for i = 1, #p2.products, 3 do
		var3 += 1
		t[`row-{var3}`] = reactModule.createElement(ProductRow, {
			LayoutOrder = var3,
			onProductActivated = p2.onProductActivated,
			products = p2.products,
			startIndex = i
		})
	end
	return reactModule.createElement(view, {
		testId = "MonetizationPageView",
		tag = if fFlagBuildExperienceMonetizationNativeUIModule then "col gap-large size-full-0 auto-y padding-top-medium" else "col gap-large size-full-0 auto-y padding-y-medium"
	}, t)
end

local function EmptyContent(p3)
	-- upvalues: fFlagBuildExperienceMonetizationNativeUIModule (ref), useTokens (ref), reactModule (ref), view (ref), image (ref), var1 (ref), text (ref), scrollView (ref)
	local var4 = if fFlagBuildExperienceMonetizationNativeUIModule then useTokens() else nil
	local var5 = if fFlagBuildExperienceMonetizationNativeUIModule then var4.Config.UI.Scale else 1
	local var6 = reactModule.createElement(view, {
		testId = "MonetizationPageView",
		tag = if fFlagBuildExperienceMonetizationNativeUIModule then "col align-x-center align-y-center size-full auto-y" else "col align-x-center gap-xxlarge size-full-0 auto-y padding-y-medium"
	}, {
		Illustration = reactModule.createElement(image, {
			LayoutOrder = 1,
			testId = "monetization-empty-illustration",
			Image = if fFlagBuildExperienceMonetizationNativeUIModule then var1 else "rbxasset://textures/ui/LuaApp/graphic/BuildExperience/NativeMonetization/EmptyCatalog.png",
			imageStyle = if fFlagBuildExperienceMonetizationNativeUIModule then var4.Color.Content.Emphasis else nil,
			ScaleType = Enum.ScaleType.Fit,
			Size = if fFlagBuildExperienceMonetizationNativeUIModule then UDim2.fromOffset(320 * var5, 180 * var5) else UDim2.fromOffset(298, 168)
		}),
		Copy = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = if fFlagBuildExperienceMonetizationNativeUIModule then "col align-x-center size-full-0 auto-y padding-large" else "col align-x-center size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p3.emptyTitle,
				tag = if fFlagBuildExperienceMonetizationNativeUIModule then "size-full-0 auto-y text-heading-medium text-wrap text-align-x-center content-emphasis" else "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis"
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = p3.emptyDescription,
				tag = if fFlagBuildExperienceMonetizationNativeUIModule then "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default" else "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default"
			})
		})
	})
	
	return if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.createElement(scrollView, {
		tag = "size-full",
		testId = "monetization-empty-scroll",
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		}
	}, { Content = var6 }) else var6
end

local function CatalogStatusContent(p3)
	-- upvalues: reactModule (ref), text (ref), view (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return if p3.catalogStatus == "NotReady" then reactModule.createElement(text, {
		tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
		testId = "monetization-catalog-loading",
		Text = p3.labels.loading
	}) else reactModule.createElement(view, {
		tag = "col align-x-center gap-large size-full-0 auto-y padding-large",
		testId = "monetization-catalog-error"
	}, {
		Copy = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
				Text = p3.labels.loadErrorTitle
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = p3.labels.loadErrorDescription
			})
		}),
		Retry = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = p3.onRetryCatalog,
			size = inputSize.Medium,
			text = p3.labels.retry,
			variant = buttonVariant.Standard
		})
	})
end

local function CatalogRefreshWarning(p3)
	-- upvalues: reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-medium radius-medium bg-surface-100",
		testId = "monetization-catalog-refresh-error"
	}, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = p3.labels.loadErrorDescription
		}),
		Retry = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = p3.onRetryCatalog,
			size = inputSize.Medium,
			text = p3.labels.retry,
			variant = buttonVariant.Standard
		})
	})
end

local function DetailContent(p3)
	-- upvalues: fFlagBuildExperienceMonetizationNativeUIModule (ref), useTokens (ref), reactModule (ref), view (ref), image (ref), var1 (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), toggle (ref), inputSize (ref)
	local selectedProduct = p3.selectedProduct
	
	return if selectedProduct == nil then reactModule.createElement(view, { tag = "size-full", testId = "MonetizationPageView" }) else reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large",
		testId = "MonetizationPageView"
	}, {
		Media = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = if fFlagBuildExperienceMonetizationNativeUIModule then "row align-x-center size-full-0 auto-y padding-y-xlarge radius-medium bg-surface-200" else "row align-x-center size-full-0 auto-y padding-y-medium"
		}, {
			Image = if selectedProduct.image == nil and not fFlagBuildExperienceMonetizationNativeUIModule then nil else reactModule.createElement(image, {
				testId = "monetization-detail-image",
				Image = selectedProduct.image or var1,
				imageStyle = if selectedProduct.image == nil then if fFlagBuildExperienceMonetizationNativeUIModule then useTokens().Color.Content.Emphasis else nil else nil,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(195, 196)
			})
		}),
		Summary = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-xxlarge size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(view, { LayoutOrder = 1, tag = "col size-full-0 auto-y" }, {
				Name = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = selectedProduct.name,
					tag = {
						["size-full-0 auto-y text-heading-small text-align-x-left content-emphasis"] = true,
						["text-wrap"] = fFlagBuildExperienceMonetizationNativeUIModule
					}
				}),
				Price = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-xsmall size-full-0 auto-y"
				}, {
					Icon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.Robux,
						size = iconSize.Small
					}),
					Value = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy text-body-medium content-default",
						Text = selectedProduct.price
					})
				})
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = selectedProduct.description
			}),
			SaleStatus = if p3.canManageProduct then reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "col gap-small size-full-0 auto-y"
			}, {
				Row = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-large size-full-0 auto-y padding-y-large"
				}, {
					Label = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-body-medium text-align-x-left content-default",
						Text = p3.labels.availableForPurchase
					}),
					Toggle = reactModule.createElement(toggle, {
						LayoutOrder = 2,
						label = "",
						testId = "monetization-detail-sale-status",
						isChecked = selectedProduct.isForSale == true,
						isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or (p3.isProductManagedPricingPending or not p3.canManageProduct)),
						onActivated = p3.onProductSaleStatusChanged,
						size = inputSize.Medium
					})
				}),
				Error = if p3.productSaleStatusError then reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small content-alert",
					testId = "monetization-sale-status-error",
					Text = if selectedProduct.priceInRobux == nil then p3.labels.priceRequiredForSale else p3.labels.updateError
				}) else nil
			}) else nil,
			Pricing = reactModule.createElement(view, { LayoutOrder = 4, tag = "col size-full-0 auto-y" }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-small text-heading-small text-align-x-left content-emphasis",
					Text = p3.labels.pricing
				}),
				Regional = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-large size-full-0 auto-y padding-y-large"
				}, {
					Label = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-body-medium text-align-x-left content-default",
						Text = p3.labels.regionalPricing
					}),
					Toggle = reactModule.createElement(toggle, {
						LayoutOrder = 2,
						label = "",
						testId = "monetization-detail-managed-pricing",
						isChecked = selectedProduct.isManagedPricingEnabled == true,
						isDisabled = p3.isProductDisabled or (p3.isProductManagedPricingPending or (p3.isProductSaleStatusPending or not p3.canUpdateProductManagedPricing)),
						onActivated = p3.onProductManagedPricingChanged,
						size = inputSize.Medium
					})
				}),
				UpdateError = if p3.productManagedPricingError then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-small content-alert",
					testId = "monetization-managed-pricing-error",
					Text = if selectedProduct.priceInRobux == nil then p3.labels.priceRequiredForSale else p3.labels.updateError
				}) else nil
			})
		})
	})
end

local function EditContent(p3)
	-- upvalues: fFlagBuildExperienceMonetizationNativeUIModule (ref), useTokens (ref), reactModule (ref), view (ref), image (ref), var1 (ref), textInput (ref), textArea (ref), text (ref)
	local var4 = if fFlagBuildExperienceMonetizationNativeUIModule then useTokens() else nil
	local selectedProduct = p3.selectedProduct
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		testId = "monetization-product-edit"
	}, {
		Media = if fFlagBuildExperienceMonetizationNativeUIModule and selectedProduct ~= nil then reactModule.createElement(view, {
			LayoutOrder = 0,
			tag = "row align-x-center size-full-0 auto-y padding-y-xlarge radius-medium bg-surface-200"
		}, {
			Image = reactModule.createElement(image, {
				testId = "monetization-edit-image",
				Image = selectedProduct.image or var1,
				imageStyle = if selectedProduct.image == nil then var4.Color.Content.Emphasis else nil,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(var4.Size.Size_3000, var4.Size.Size_3000)
			})
		}) else nil,
		Name = reactModule.createElement(textInput, {
			LayoutOrder = 1,
			testId = "monetization-edit-name",
			isDisabled = p3.isProductEditPending,
			label = p3.labels.name,
			onChanged = p3.onEditNameChanged,
			text = p3.editName,
			width = UDim.new(1, 0)
		}),
		Description = reactModule.createElement(textArea, {
			LayoutOrder = 2,
			numLines = 4,
			testId = "monetization-edit-description",
			isDisabled = p3.isProductEditPending,
			label = p3.labels.description,
			onChanged = p3.onEditDescriptionChanged,
			text = p3.editDescription,
			width = UDim.new(1, 0)
		}),
		Price = reactModule.createElement(textInput, {
			LayoutOrder = 3,
			testId = "monetization-edit-price",
			isDisabled = p3.isProductEditPending,
			label = p3.labels.price,
			onChanged = p3.onEditPriceChanged,
			text = p3.editPrice,
			textInputType = Enum.TextInputType.Number,
			width = UDim.new(1, 0)
		}),
		Error = if p3.productEditError ~= nil then nil else reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-body-small text-wrap content-alert",
			testId = "monetization-product-edit-error",
			Text = p3.productEditError
		})
	})
end

return function(p3)
	-- upvalues: fFlagBuildExperienceMonetizationNativeUIModule (ref), reactModule (ref), ProductActionsMenu (ref), button (ref), inputSize (ref), buttonVariant (ref), iconButton (ref), iconName (ref), DetailContent (ref), CatalogStatusContent (ref), EditContent (ref), OptionsContent (ref), EmptyContent (ref), CatalogContent (ref), view (ref), CatalogRefreshWarning (ref), fillBehavior (ref), fFlagBuildExperienceDeveloperProductContextModule (ref), chatActionsModule (ref), overflowMenuPageShellModule (ref)
	local isDetail = p3.mode == "detail"
	local isEdit = p3.mode == "edit"
	local isOptions = p3.mode == "options"
	local var4 = #p3.products > 0
	local var5 = not isDetail and (not isEdit and (not isOptions and (p3.catalogStatus ~= "Ready" and not (p3.catalogStatus == "Failed" and var4))))
	local var6 = p3.mode == "empty" and not var5
	local var7 = not isDetail and (not isEdit and (not isOptions and (p3.catalogStatus == "Failed" and var4)))
	local var8 = if isDetail and p3.canManageProduct then if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.createElement(ProductActionsMenu, {
		isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or p3.isProductManagedPricingPending),
		editLabel = p3.labels.edit,
		onEdit = p3.onOpenProductEdit
	}) else reactModule.createElement(button, {
		testId = "monetization-edit-product",
		isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or p3.isProductManagedPricingPending),
		onActivated = p3.onOpenProductEdit,
		size = inputSize.Medium,
		text = p3.labels.edit,
		variant = buttonVariant.Standard
	}) elseif isDetail or isEdit or (isOptions or var5) or not p3.showOptions then nil else reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "monetization-open-options",
		icon = if fFlagBuildExperienceMonetizationNativeUIModule then iconName.TwoSwitchesHorizontal else iconName.ThreeSlidersHorizontal,
		onActivated = p3.onOpenOptions,
		size = inputSize.Medium,
		variant = buttonVariant.Utility
	})
	local var9 = if var5 then reactModule.createElement(CatalogStatusContent, p3) elseif isDetail then if p3.isProductDisabled then reactModule.createElement("CanvasGroup", {
		[reactModule.Tag] = "data-testid=monetization-disabled-detail",
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		GroupTransparency = 0.55,
		Size = UDim2.new(1, 0, 0, 0)
	}, { Content = reactModule.createElement(DetailContent, p3) }) else reactModule.createElement(DetailContent, p3) elseif isEdit then reactModule.createElement(EditContent, p3) elseif isOptions then reactModule.createElement(OptionsContent, p3) elseif p3.mode == "empty" then reactModule.createElement(EmptyContent, p3) else reactModule.createElement(CatalogContent, p3)
	
	if var7 then
		var9 = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
			Warning = reactModule.createElement(CatalogRefreshWarning, p3),
			Content = var9
		})
	end
	local var10 = if isEdit then reactModule.createElement(view, {
		tag = {
			["row gap-medium size-full-0 auto-y"] = true,
			["padding-y-medium"] = fFlagBuildExperienceMonetizationNativeUIModule
		}
	}, {
		Cancel = reactModule.createElement(button, {
			LayoutOrder = 1,
			testId = "monetization-cancel-product-edit",
			fillBehavior = fillBehavior.Fill,
			isDisabled = p3.isProductEditPending,
			onActivated = p3.onCancelProductEdit,
			size = inputSize.Large,
			text = p3.labels.cancel,
			variant = buttonVariant.Standard,
			width = UDim.new(0.5, -6)
		}),
		Save = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "monetization-save-product-edit",
			fillBehavior = fillBehavior.Fill,
			isLoading = p3.isProductEditPending,
			onActivated = p3.onSaveProductEdit,
			size = inputSize.Large,
			text = p3.labels.save,
			variant = buttonVariant.Emphasis,
			width = UDim.new(0.5, -6)
		})
	}) elseif var5 or p3.mode ~= "empty" and p3.mode ~= "catalog" then nil else reactModule.createElement(view, {
		tag = {
			["row align-x-center size-full-0 auto-y"] = true,
			["padding-y-medium"] = fFlagBuildExperienceMonetizationNativeUIModule
		}
	}, {
		Create = reactModule.createElement(button, {
			testId = "monetization-create",
			onActivated = p3.onOpenCreate,
			size = if fFlagBuildExperienceMonetizationNativeUIModule then inputSize.Large else inputSize.Medium,
			text = p3.labels.emptyCreateProduct,
			variant = buttonVariant.Emphasis,
			width = if fFlagBuildExperienceMonetizationNativeUIModule then UDim.new(1, 0) else UDim.new(0, 240)
		})
	})
	
	if fFlagBuildExperienceDeveloperProductContextModule and isDetail and p3.chatActions ~= nil then
		var10 = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-y-medium",
			testId = "monetization-detail-composer"
		}, {
			Composer = reactModule.createElement(chatActionsModule, p3.chatActions)
		})
	end
	local var11 = reactModule.createElement(overflowMenuPageShellModule, {
		footerDivider = false,
		testId = "MonetizationPage",
		closeIcon = iconName.ChevronLargeLeft,
		content = var9,
		footer = var10,
		disableScrolling = fFlagBuildExperienceMonetizationNativeUIModule and var6,
		headerTrailing = var8,
		onClose = p3.onClose,
		title = if isDetail then if p3.selectedProduct ~= nil then p3.labels.title else p3.selectedProduct.name elseif isEdit then p3.labels.editProduct elseif isOptions then p3.labels.options else p3.labels.title
	})
	
	return if fFlagBuildExperienceDeveloperProductContextModule then reactModule.createElement(view, {
		tag = "size-full",
		padding = { bottom = UDim.new(0, p3.keyboardHeight or 0) }
	}, { Page = var11 }) else var11
end