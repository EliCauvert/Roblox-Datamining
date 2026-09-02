local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local badge = foundationModule.Badge
local button = foundationModule.Button
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local textInput = foundationModule.TextInput
local toggle = foundationModule.Toggle
local view = foundationModule.View
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local uDim2 = UDim2.new(0.333333333333, -8, 0, 0)

local function ProductCard(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), uDim2 (ref), stateLayerAffordance (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), image (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local product = p1.product
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "col auto-y radius-medium",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated,
		selection = { Selectable = true },
		Size = uDim2,
		stateLayer = { affordance = stateLayerAffordance.None },
		testId = `monetization-product-{product.id}`
	}, {
		Media = reactModule.createElement(view, {
			LayoutOrder = 1,
			aspectRatio = 1,
			tag = "radius-medium clip bg-surface-200",
			Size = UDim2.new(1, 0, 0, 109)
		}, {
			SaleStatus = if product.saleStatus ~= nil then nil else reactModule.createElement(badge, {
				ZIndex = 2,
				Position = UDim2.fromOffset(var1.Gap.Small, var1.Gap.Small),
				shape = badgeShape.Pill,
				size = badgeSize.Small,
				text = product.saleStatus,
				testId = `monetization-product-sale-status-{product.id}`,
				variant = badgeVariant.OverMedia
			}),
			Image = if product.image ~= nil then nil else reactModule.createElement(image, {
				tag = "size-full",
				Image = product.image,
				ScaleType = Enum.ScaleType.Fit,
				testId = `monetization-product-image-{product.id}`
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
	-- upvalues: reactModule (ref), view (ref), image (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-y padding-y-medium",
		testId = "MonetizationPageView"
	}, {
		Illustration = reactModule.createElement(image, {
			Image = "rbxasset://textures/ui/LuaApp/graphic/BuildExperience/NativeMonetization/EmptyCatalog.png",
			LayoutOrder = 1,
			testId = "monetization-empty-illustration",
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(298, 168)
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
	-- upvalues: reactModule (ref), view (ref), image (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), toggle (ref), inputSize (ref)
	local selectedProduct = p3.selectedProduct
	
	return if selectedProduct == nil then reactModule.createElement(view, { tag = "size-full", testId = "MonetizationPageView" }) else reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large",
		testId = "MonetizationPageView"
	}, {
		Media = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-y-medium"
		}, {
			Image = if selectedProduct.image ~= nil then nil else reactModule.createElement(image, {
				testId = "monetization-detail-image",
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
					Text = p3.labels.updateError
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
					Text = p3.labels.updateError
				}) else nil
			})
		})
	})
end

local function EditContent(p3)
	-- upvalues: reactModule (ref), view (ref), textInput (ref), textArea (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		testId = "monetization-product-edit"
	}, {
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
	-- upvalues: reactModule (ref), button (ref), inputSize (ref), buttonVariant (ref), DetailContent (ref), CatalogStatusContent (ref), EditContent (ref), EmptyContent (ref), CatalogContent (ref), view (ref), CatalogRefreshWarning (ref), fillBehavior (ref), overflowMenuPageShellModule (ref), iconName (ref)
	local isDetail = p3.mode == "detail"
	local isEdit = p3.mode == "edit"
	local var3 = #p3.products > 0
	local var4 = not isDetail and (not isEdit and (p3.catalogStatus ~= "Ready" and not (p3.catalogStatus == "Failed" and var3)))
	local var5 = not isDetail and (not isEdit and (p3.catalogStatus == "Failed" and var3))
	local var6 = if isDetail and p3.canManageProduct then reactModule.createElement(button, {
		testId = "monetization-edit-product",
		isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or p3.isProductManagedPricingPending),
		onActivated = p3.onOpenProductEdit,
		size = inputSize.Medium,
		text = p3.labels.edit,
		variant = buttonVariant.Standard
	}) elseif isDetail or isEdit or var4 then nil else nil
	local var7 = if var4 then reactModule.createElement(CatalogStatusContent, p3) elseif isDetail then if p3.isProductDisabled then reactModule.createElement("CanvasGroup", {
		[reactModule.Tag] = "data-testid=monetization-disabled-detail",
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		GroupTransparency = 0.55,
		Size = UDim2.new(1, 0, 0, 0)
	}, { Content = reactModule.createElement(DetailContent, p3) }) else reactModule.createElement(DetailContent, p3) elseif isEdit then reactModule.createElement(EditContent, p3) elseif p3.mode == "empty" then reactModule.createElement(EmptyContent, p3) else reactModule.createElement(CatalogContent, p3)
	
	if var5 then
		var7 = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
			Warning = reactModule.createElement(CatalogRefreshWarning, p3),
			Content = var7
		})
	end
	return reactModule.createElement(overflowMenuPageShellModule, {
		footerDivider = false,
		testId = "MonetizationPage",
		closeIcon = iconName.ChevronLargeLeft,
		content = var7,
		footer = if isEdit then reactModule.createElement(view, { tag = "row gap-medium size-full-0 auto-y" }, {
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
		}) elseif var4 or p3.mode ~= "empty" and p3.mode ~= "catalog" then nil else reactModule.createElement(view, { tag = "row align-x-center size-full-0 auto-y" }, {
			Create = reactModule.createElement(button, {
				testId = "monetization-create",
				onActivated = p3.onOpenCreate,
				size = inputSize.Medium,
				text = p3.labels.emptyCreateProduct,
				variant = buttonVariant.Emphasis,
				width = UDim.new(0, 240)
			})
		}),
		headerTrailing = var6,
		onClose = p3.onClose,
		title = if isDetail then if p3.selectedProduct ~= nil then p3.labels.title else p3.selectedProduct.name elseif isEdit then p3.labels.editProduct else p3.labels.title
	})
end