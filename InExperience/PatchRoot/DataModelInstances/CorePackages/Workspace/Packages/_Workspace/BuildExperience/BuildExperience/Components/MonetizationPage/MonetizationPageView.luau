local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local button = foundationModule.Button
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local image = foundationModule.Image
local text = foundationModule.Text
local toggle = foundationModule.Toggle
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens

local function ProductCard(p1)
	-- upvalues: reactModule (ref), view (ref), image (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local product = p1.product
	
	return reactModule.createElement(view, {
		tag = "col fill auto-y",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated,
		stateLayer = {},
		testId = `monetization-product-{product.id}`
	}, {
		Media = reactModule.createElement(view, {
			LayoutOrder = 1,
			aspectRatio = 1,
			tag = "radius-medium clip bg-surface-200",
			Size = UDim2.new(1, 0, 0, 109)
		}, {
			Image = if product.image ~= nil then nil else reactModule.createElement(image, {
				tag = "size-full",
				Image = product.image,
				ScaleType = Enum.ScaleType.Fit
			})
		}),
		Title = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y padding-top-small text-title-medium text-align-x-left text-truncate-end content-emphasis",
			Text = product.name
		}),
		Metadata = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y"
		}, {
			Kind = if product.kind ~= nil then nil else reactModule.createElement(text, {
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
				tag = "auto-xy text-body-medium content-default",
				Text = product.price
			}),
			Spacer = reactModule.createElement(view, { LayoutOrder = 4, tag = "fill" }),
			Age = if product.age ~= nil then nil else reactModule.createElement(text, {
				LayoutOrder = 5,
				tag = "auto-xy text-body-medium content-default",
				Text = product.age
			})
		})
	})
end

local function ProductRow(p1)
	-- upvalues: reactModule (ref), ProductCard (ref), view (ref)
	local t = {}
	
	for i = p1.startIndex, math.min(p1.startIndex + 2, #p1.products) do
		local var1 = p1.products[i]
		t[var1.id] = reactModule.createElement(ProductCard, {
			LayoutOrder = i - p1.startIndex + 1,
			product = var1,
			onActivated = function()
				-- upvalues: p1 (ref), var1 (ref)
				p1.onProductActivated(var1.id)
			end
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, t)
end

local function OptionRow(p2)
	-- upvalues: reactModule (ref), view (ref), text (ref), toggle (ref), inputSize (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y padding-x-large padding-y-medium",
		LayoutOrder = p2.LayoutOrder
	}, {
		Copy = reactModule.createElement(view, { LayoutOrder = 1, tag = "col fill gap-xxsmall auto-y" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
				Text = p2.title
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = p2.description
			})
		}),
		Toggle = reactModule.createElement(toggle, {
			LayoutOrder = 2,
			label = "",
			isChecked = p2.isChecked,
			onActivated = p2.onActivated,
			size = inputSize.Medium,
			testId = p2.testId
		})
	})
end

local function OptionsSection(p2)
	-- upvalues: reactModule (ref), view (ref), text (ref), OptionRow (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-medium",
		testId = "monetization-options"
	}, {
		Pricing = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-large text-align-x-left content-emphasis",
					Text = p2.labels.pricingOptions
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small text-align-x-left content-default",
					Text = p2.labels.pricingOptionsDescription
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
					isChecked = p2.managedPricing,
					onActivated = p2.onManagedPricingChanged,
					title = p2.labels.managedPricing
				}),
				AllowIndividual = reactModule.createElement(OptionRow, {
					LayoutOrder = 2,
					testId = "monetization-allow-individual-managed-pricing",
					description = p2.labels.allowIndividualManagedPricingDescription,
					isChecked = p2.allowIndividualManagedPricing,
					onActivated = p2.onAllowIndividualManagedPricingChanged,
					title = p2.labels.allowIndividualManagedPricing
				})
			})
		}),
		Shop = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			Header = reactModule.createElement(view, { LayoutOrder = 1, tag = "col size-full-0 auto-y" }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-large text-align-x-left content-emphasis",
					Text = p2.labels.shopUI
				})
			}),
			Rows = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
			}, {
				ShopButton = reactModule.createElement(OptionRow, {
					LayoutOrder = 1,
					testId = "monetization-shop-button",
					description = p2.labels.shopButtonDescription,
					isChecked = p2.shopButton,
					onActivated = p2.onShopButtonChanged,
					title = p2.labels.shopButton
				})
			})
		})
	})
end

local function CatalogContent(p2)
	-- upvalues: reactModule (ref), ProductRow (ref), view (ref)
	local t = {}
	local var2 = 0
	
	for i = 1, #p2.products, 3 do
		var2 += 1
		t[`row-{var2}`] = reactModule.createElement(ProductRow, {
			LayoutOrder = var2,
			onProductActivated = p2.onProductActivated,
			products = p2.products,
			startIndex = i
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-y-medium",
		testId = "MonetizationPageView"
	}, t)
end

local function EmptyContent(p3)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local var3 = useTokens()
	local emphasis = var3.Color.Content.Emphasis
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-y padding-y-medium",
		testId = "MonetizationPageView"
	}, {
		Illustration = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "monetization-empty-illustration",
			Size = UDim2.fromOffset(320, 180)
		}, {
			Outline = reactModule.createElement(view, {
				Rotation = -15,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(100, 100),
				cornerRadius = UDim.new(0, var3.Radius.Small),
				stroke = {
					Thickness = 1.5,
					Color = emphasis.Color3,
					Transparency = 1 - (1 - emphasis.Transparency) * 0.16
				}
			}),
			Robux = reactModule.createElement(icon, {
				size = 72,
				tag = "content-emphasis",
				testId = "monetization-empty-robux-icon",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				name = iconName.Robux
			})
		}),
		Copy = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
				Text = p3.emptyTitle
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = p3.emptyDescription
			})
		})
	})
end

local function CatalogStatusContent(p3)
	-- upvalues: reactModule (ref), text (ref), view (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return if p3.catalogStatus == "NotReady" then reactModule.createElement(text, {
		tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
		testId = "monetization-catalog-loading",
		Text = p3.labels.loading
	}) else reactModule.createElement(view, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-large",
		testId = "monetization-catalog-error"
	}, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium content-default",
			Text = p3.labels.loadError
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

local function PriceRow(p3)
	-- upvalues: reactModule (ref), view (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-large",
		LayoutOrder = p3.LayoutOrder,
		onActivated = p3.onActivated,
		stateLayer = if p3.onActivated ~= nil then nil else {}
	}, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "fill auto-y text-body-medium text-align-x-left content-default",
			Text = p3.label
		}),
		Value = if p3.value ~= nil then if p3.onActivated ~= nil then nil else reactModule.createElement(icon, {
			LayoutOrder = 2,
			name = iconName.ChevronSmallRight,
			size = iconSize.Large
		}) else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = iconName.Robux,
				size = iconSize.Small
			}),
			Text = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-emphasis",
				Text = p3.value
			})
		})
	})
end

local function DetailContent(p3)
	-- upvalues: reactModule (ref), view (ref), divider (ref), PriceRow (ref), image (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), toggle (ref), inputSize (ref)
	local selectedProduct = p3.selectedProduct
	
	if selectedProduct == nil then
		return reactModule.createElement(view, { tag = "size-full", testId = "MonetizationPageView" })
	end
	local t = {}
	
	for i, v in selectedProduct.regionalPrices do
		t[v.country] = reactModule.createElement(reactModule.Fragment, nil, {
			Divider = reactModule.createElement(divider, { LayoutOrder = i * 2 - 1 }),
			Row = reactModule.createElement(PriceRow, { LayoutOrder = i * 2, label = v.country, value = v.price })
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large",
		testId = "MonetizationPageView"
	}, {
		Media = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-y-medium"
		}, {
			Image = if selectedProduct.image ~= nil then nil else reactModule.createElement(image, {
				Image = selectedProduct.image,
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
					tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
					Text = selectedProduct.name
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
			Pricing = reactModule.createElement(view, { LayoutOrder = 3, tag = "col size-full-0 auto-y" }, {
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
						isDisabled = p3.isProductDisabled or (p3.isProductManagedPricingPending or not p3.canUpdateProductManagedPricing),
						onActivated = p3.onProductManagedPricingChanged,
						size = inputSize.Medium
					})
				}),
				UpdateError = if p3.productManagedPricingError then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-small content-alert",
					testId = "monetization-managed-pricing-error",
					Text = p3.labels.updateError
				}) else nil,
				Prices = reactModule.createElement(view, { LayoutOrder = 4, tag = "col size-full-0 auto-y" }, t),
				ViewAllDivider = if p3.onViewAllPrices ~= nil then nil else reactModule.createElement(divider, { LayoutOrder = 5 }),
				ViewAll = if p3.onViewAllPrices ~= nil then nil else reactModule.createElement(PriceRow, {
					LayoutOrder = 6,
					label = p3.labels.viewAll,
					onActivated = p3.onViewAllPrices
				})
			})
		})
	})
end

return function(p4)
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), DetailContent (ref), CatalogStatusContent (ref), OptionsSection (ref), EmptyContent (ref), CatalogContent (ref), button (ref), fillBehavior (ref), overflowMenuPageShellModule (ref)
	local isDetail = p4.mode == "detail"
	local isOptions = p4.mode == "options"
	local var3 = not isDetail and (not isOptions and p4.catalogStatus ~= "Ready")
	
	return reactModule.createElement(overflowMenuPageShellModule, {
		testId = "MonetizationPage",
		closeIcon = if isDetail then iconName.X else iconName.ChevronLargeLeft,
		content = if var3 then reactModule.createElement(CatalogStatusContent, p4) elseif isDetail then if p4.isProductDisabled then reactModule.createElement("CanvasGroup", {
			[reactModule.Tag] = "data-testid=monetization-disabled-detail",
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			GroupTransparency = 0.55,
			Size = UDim2.new(1, 0, 0, 0)
		}, { Content = reactModule.createElement(DetailContent, p4) }) else reactModule.createElement(DetailContent, p4) elseif isOptions then reactModule.createElement(OptionsSection, p4) elseif p4.mode == "empty" then reactModule.createElement(EmptyContent, p4) else reactModule.createElement(CatalogContent, p4),
		footer = if var3 or p4.mode ~= "empty" and p4.mode ~= "catalog" then nil else reactModule.createElement(button, {
			testId = "monetization-create",
			fillBehavior = fillBehavior.Fill,
			onActivated = p4.onOpenCreate,
			size = inputSize.Large,
			text = p4.labels.emptyCreateProduct,
			variant = buttonVariant.Emphasis,
			width = UDim.new(1, 0)
		}),
		headerTrailing = if isDetail or isOptions or var3 then nil else reactModule.createElement(view, { tag = "row gap-medium auto-xy" }, {
			Options = if p4.showOptions then reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "monetization-open-options",
				icon = iconName.ThreeSlidersHorizontal,
				onActivated = p4.onOpenOptions,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}) else nil
		}),
		onClose = p4.onClose,
		title = if isDetail then "" elseif isOptions then p4.labels.options else p4.labels.title
	})
end