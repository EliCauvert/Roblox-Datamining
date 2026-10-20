local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local OverflowMenuPageShellModule = require(BuildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local ChatActionsModule = require(BuildExperience.Components.Chat.ChatActions)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceMonetizationMultiKindModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationMultiKind)
local FFlagBuildExperienceDeveloperProductContextModule = require(BuildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local Badge = FoundationModule.Badge
local Button = FoundationModule.Button
local Dialog = FoundationModule.Dialog
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Image = FoundationModule.Image
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local TextInput = FoundationModule.TextInput
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local Menu = FoundationModule.Menu
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeSize = FoundationModule.Enums.BadgeSize
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AssetId = if FFlagBuildExperienceMonetizationNativeUIModule then FoundationCloudAssetsModule.Assets["pictograms/robux"].assetId else nil
local _UDim2 = UDim2.new(0.3333333333333333, -8, 0, 0)

local function ProductActionsMenu(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), IconName (copy), Menu (copy), FoundationModule (copy), IconButton (copy), InputSize (copy), ButtonVariant (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({ archive = LocalizationStringsModule.ARCHIVE_GAME_ARCHIVE })
	
	return ReactModule.createElement(Menu, {
		testId = "monetization-product-actions-menu",
		align = FoundationModule.Enums.PopoverAlign.End,
		isOpen = UseStateResult,
		items = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), IconName (upval), UseLocalizationResult (copy)
			return {
				{
					id = "edit",
					text = p1.editLabel,
					icon = IconName.Pencil,
					isDisabled = p1.isDisabled
				},
				{
					id = "archive",
					isDisabled = true,
					text = UseLocalizationResult.archive,
					icon = IconName.TrashCan
				}
			}
		end, {
			UseLocalizationResult.archive,
			p1.editLabel,
			p1.isDisabled
		}),
		onActivated = function(p2)
			-- upvalues: UseResult (copy), p1 (copy)
			UseResult()
			
			if p2 == "edit" and not p1.isDisabled then
				p1.onEdit()
			end
		end,
		onPressedOutside = UseResult,
		side = FoundationModule.Enums.PopoverSide.Bottom
	}, {
		Trigger = ReactModule.createElement(IconButton, {
			isCircular = true,
			testId = "monetization-product-actions",
			icon = IconName.ThreeDotsHorizontal,
			isDisabled = p1.isDisabled,
			onActivated = function()
				-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
				UseStateResult2(not UseStateResult)
			end,
			size = InputSize.Medium,
			variant = ButtonVariant.Utility
		})
	})
end

local function ProductCard(Frame)
	-- upvalues: UseTokensFunction (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), AssetId (copy), ReactModule (copy), View (copy), _UDim2 (copy), StateLayerAffordance (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), Badge (copy), BadgeShape (copy), BadgeSize (copy), BadgeVariant (copy), Image (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local Product = Frame.product
	local UseTokensResult = UseTokensFunction()
	local Image1 = Product.image or (if FFlagBuildExperienceMonetizationNativeUIModule then AssetId else nil)
	local Identity = Product.identity or Product.id
	
	return ReactModule.createElement(View, {
		tag = "col auto-y radius-medium",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		selection = { Selectable = true },
		Size = _UDim2,
		stateLayer = { affordance = StateLayerAffordance.None },
		testId = `monetization-product-{Identity}`
	}, {
		Media = ReactModule.createElement(View, {
			LayoutOrder = 1,
			aspectRatio = 1,
			tag = "radius-medium clip bg-surface-200",
			Size = if FFlagBuildExperienceMonetizationNativeUIModule and not FFlagBuildExperienceMonetizationMultiKindModule then UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_2800) elseif FFlagBuildExperienceMonetizationMultiKindModule then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, 109)
		}, {
			SaleStatus = if Product.saleStatus == nil or not FFlagBuildExperienceMonetizationMultiKindModule and FFlagBuildExperienceMonetizationNativeUIModule and Product.isForSale ~= true then nil else ReactModule.createElement(Badge, {
				ZIndex = 2,
				Position = UDim2.fromOffset(UseTokensResult.Gap.Small, UseTokensResult.Gap.Small),
				shape = BadgeShape.Pill,
				size = BadgeSize.Small,
				text = Product.saleStatus,
				testId = `monetization-product-sale-status-{Identity}`,
				variant = BadgeVariant.OverMedia
			}),
			Image = if Image1 == nil then nil else ReactModule.createElement(Image, {
				Image = Image1,
				imageStyle = if FFlagBuildExperienceMonetizationNativeUIModule and Product.image == nil then UseTokensResult.Color.Content.Emphasis else nil,
				ScaleType = Enum.ScaleType.Fit,
				tag = if FFlagBuildExperienceMonetizationNativeUIModule then "size-full radius-medium" else "size-full",
				testId = `monetization-product-image-{Identity}`
			})
		}),
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = Product.name,
			sizeConstraint = if FFlagBuildExperienceMonetizationNativeUIModule then {
				MaxSize = Vector2.new(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_1000 + UseTokensResult.Gap.Small)
			} else nil,
			tag = {
				["size-full-0 auto-y padding-top-small text-title-medium text-align-x-left text-truncate-end content-emphasis"] = true,
				["text-wrap"] = FFlagBuildExperienceMonetizationNativeUIModule
			},
			testId = if FFlagBuildExperienceMonetizationNativeUIModule then `monetization-product-title-{Identity}` else nil
		}),
		Kind = if FFlagBuildExperienceMonetizationMultiKindModule and Product.kind ~= nil then ReactModule.createElement(Text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y padding-top-xsmall text-body-small text-wrap text-align-x-left content-muted",
			Text = Product.kind,
			testId = `monetization-product-kind-{Identity}`
		}) else nil,
		Metadata = ReactModule.createElement(View, {
			LayoutOrder = 4,
			sizeConstraint = if FFlagBuildExperienceMonetizationNativeUIModule then {
				MaxSize = Vector2.new(UseTokensResult.Size.Size_2800, 1e999)
			} else nil,
			tag = {
				["row align-y-center gap-xsmall size-full-0 auto-y"] = true,
				["padding-top-xsmall"] = FFlagBuildExperienceMonetizationNativeUIModule
			}
		}, {
			Kind = if FFlagBuildExperienceMonetizationNativeUIModule or Product.kind == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-default",
				Text = Product.kind
			}),
			PriceIcon = if FFlagBuildExperienceMonetizationMultiKindModule and Product.showRobuxIcon == false then nil else ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.Robux,
				size = IconSize.Small
			}),
			Price = ReactModule.createElement(Text, {
				LayoutOrder = 3,
				Text = Product.price,
				tag = if FFlagBuildExperienceMonetizationNativeUIModule then "fill auto-y text-body-medium text-wrap text-align-x-left content-default" else "auto-xy text-body-medium content-default"
			}),
			Spacer = if FFlagBuildExperienceMonetizationNativeUIModule then nil else ReactModule.createElement(View, { LayoutOrder = 4, tag = "fill" }),
			Age = if FFlagBuildExperienceMonetizationNativeUIModule or Product.age == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 5,
				tag = "auto-xy text-body-medium content-default",
				Text = Product.age
			})
		})
	})
end

local function ProductRow(Frame)
	-- upvalues: ReactModule (copy), ProductCard (copy), View (copy)
	local Elements = {}
	
	for i = Frame.startIndex, math.min(Frame.startIndex + 2, #Frame.products) do
		local Product = Frame.products[i]
		local Identity = Product.identity or Product.id
		Elements[Identity] = ReactModule.createElement(ProductCard, {
			LayoutOrder = i - Frame.startIndex + 1,
			product = Product,
			onActivated = function()
				-- upvalues: Frame (copy), Identity (copy)
				Frame.onProductActivated(Identity)
			end
		})
	end
	return ReactModule.createElement(View, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end

local function OptionRow(Frame)
	-- upvalues: ReactModule (copy), View (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), Text (copy), Toggle (copy), InputSize (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-large size-full-0 auto-y padding-x-large padding-y-medium",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Copy = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = if FFlagBuildExperienceMonetizationNativeUIModule then "col fill gap-xsmall auto-y" else "col fill gap-xxsmall auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = Frame.title,
				tag = {
					["size-full-0 auto-y text-title-medium text-align-x-left content-emphasis"] = true,
					["text-wrap"] = FFlagBuildExperienceMonetizationNativeUIModule
				}
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = Frame.description
			}),
			Supporting = if Frame.supportingText == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted",
				Text = Frame.supportingText
			})
		}),
		Toggle = ReactModule.createElement(Toggle, {
			LayoutOrder = 2,
			label = "",
			isChecked = Frame.isChecked,
			isDisabled = Frame.isDisabled,
			onActivated = Frame.onActivated,
			size = InputSize.Medium,
			testId = Frame.testId
		})
	})
end

local function OptionsStatusContent(p1)
	-- upvalues: ReactModule (copy), Text (copy), View (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	return if p1.optionsLoadStatus == "NotReady" then ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
		testId = "monetization-options-loading",
		Text = p1.labels.loading
	}) elseif p1.optionsLoadStatus == "Failed" then ReactModule.createElement(View, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-large",
		testId = "monetization-options-error"
	}, {
		Message = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = p1.labels.optionsLoadError
		}),
		Retry = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			onActivated = p1.onRetryOptions,
			size = InputSize.Medium,
			text = p1.labels.retry,
			variant = ButtonVariant.Standard
		})
	}) else nil
end

local function OptionsContent(p1)
	-- upvalues: OptionsStatusContent (copy), ButtonVariant (copy), ReactModule (copy), View (copy), Text (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), OptionRow (copy), Dialog (copy), DialogSize (copy)
	local OptionsStatusContentResult = OptionsStatusContent(p1)
	
	if OptionsStatusContentResult == nil then
		local config = {
			actions = {
				{
					isDisabled = false,
					text = p1.labels.agree,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onConfirmManagedPricing,
					isLoading = p1.isOptionsManagedPricingPending
				},
				{
					isLoading = false,
					text = p1.labels.cancel,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancelManagedPricing,
					isDisabled = p1.isOptionsManagedPricingPending
				}
			}
		}
		
		return ReactModule.createElement(View, {
			tag = "col gap-xxlarge size-full-0 auto-y padding-y-medium",
			testId = "monetization-options"
		}, {
			Permission = if p1.canMonetize then nil else ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-medium text-body-medium text-wrap radius-medium bg-surface-100 content-default",
				Text = p1.labels.permissionDenied
			}),
			Pricing = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col gap-large size-full-0 auto-y"
			}, {
				Header = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-xsmall size-full-0 auto-y"
				}, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						Text = p1.labels.pricingOptions,
						tag = {
							["size-full-0 auto-y text-title-large text-align-x-left content-emphasis"] = true,
							["text-wrap"] = FFlagBuildExperienceMonetizationNativeUIModule
						}
					}),
					Description = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						Text = p1.labels.pricingOptionsDescription,
						tag = {
							["size-full-0 auto-y text-body-small text-align-x-left content-default"] = true,
							["text-wrap"] = FFlagBuildExperienceMonetizationNativeUIModule
						}
					})
				}),
				Rows = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
				}, {
					ManagedPricing = ReactModule.createElement(OptionRow, {
						LayoutOrder = 1,
						testId = "monetization-managed-pricing",
						description = p1.labels.managedPricingDescription,
						isChecked = p1.managedPricingState == "AllOn",
						isDisabled = not p1.canChangeManagedPricing or p1.isOptionsManagedPricingPending,
						onActivated = p1.onManagedPricingChanged,
						supportingText = p1.managedPricingSupportingText or (if p1.managedPricingState == "Mixed" then p1.labels.mixed elseif p1.managedPricingState == "Unavailable" then p1.labels.unavailable else nil),
						title = p1.labels.managedPricing
					}),
					Error = if p1.managedPricingError == nil then nil else ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y padding-x-large padding-bottom-medium text-body-small text-wrap content-alert",
						Text = p1.managedPricingError
					})
				})
			}),
			Shop = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "col gap-large size-full-0 auto-y"
			}, {
				Header = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = p1.labels.shopUI,
					tag = {
						["size-full-0 auto-y text-title-large text-align-x-left content-emphasis"] = true,
						["text-wrap"] = FFlagBuildExperienceMonetizationNativeUIModule
					}
				}),
				Rows = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
				}, {
					ShopButton = ReactModule.createElement(OptionRow, {
						LayoutOrder = 1,
						testId = "monetization-shop-button",
						description = p1.labels.shopButtonDescription,
						isChecked = p1.shopButtonEnabled,
						isDisabled = not p1.canMonetize or p1.isShopButtonPending,
						onActivated = p1.onShopButtonChanged,
						title = p1.labels.shopButton
					}),
					Error = if p1.shopButtonError == nil then nil else ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y padding-x-large padding-bottom-medium text-body-small text-wrap content-alert",
						Text = p1.shopButtonError
					})
				})
			}),
			Acknowledgement = if p1.showManagedPricingAcknowledgement then ReactModule.createElement(Dialog.Root, {
				disablePortal = p1.disableDialogPortal == true,
				hasBackdrop = p1.disableDialogPortal ~= true,
				size = DialogSize.Small
			}, {
				Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.labels.acknowledgementTitle }),
				Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
					Description = ReactModule.createElement(Dialog.Text, { Text = p1.labels.acknowledgementDescription })
				}),
				Actions = ReactModule.createElement(Dialog.Actions, config)
			}) else nil
		})
	else
		return OptionsStatusContentResult
	end
end

local function CatalogContent(p1)
	-- upvalues: ReactModule (copy), ProductRow (copy), View (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy)
	local Elements = {}
	local LayoutOrder = 0
	
	for i = 1, #p1.products, 3 do
		LayoutOrder += 1
		Elements[`row-{LayoutOrder}`] = ReactModule.createElement(ProductRow, {
			LayoutOrder = LayoutOrder,
			onProductActivated = p1.onProductActivated,
			products = p1.products,
			startIndex = i
		})
	end
	return ReactModule.createElement(View, {
		testId = "MonetizationPageView",
		tag = if FFlagBuildExperienceMonetizationNativeUIModule then "col gap-large size-full-0 auto-y padding-top-medium" else "col gap-large size-full-0 auto-y padding-y-medium"
	}, Elements)
end

local function EmptyContent(p2)
	-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), AssetId (copy), Text (copy), ScrollView (copy)
	local UseTokensResult = if FFlagBuildExperienceMonetizationNativeUIModule then UseTokensFunction() else nil
	local Scale = if FFlagBuildExperienceMonetizationNativeUIModule then UseTokensResult.Config.UI.Scale else 1
	local Element = ReactModule.createElement(View, {
		testId = "MonetizationPageView",
		tag = if FFlagBuildExperienceMonetizationNativeUIModule then "col align-x-center align-y-center size-full auto-y" else "col align-x-center gap-xxlarge size-full-0 auto-y padding-y-medium"
	}, {
		Illustration = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			testId = "monetization-empty-illustration",
			Image = if FFlagBuildExperienceMonetizationNativeUIModule then AssetId else "rbxasset://textures/ui/LuaApp/graphic/BuildExperience/NativeMonetization/EmptyCatalog.png",
			imageStyle = if FFlagBuildExperienceMonetizationNativeUIModule then UseTokensResult.Color.Content.Emphasis else nil,
			ScaleType = Enum.ScaleType.Fit,
			Size = if FFlagBuildExperienceMonetizationNativeUIModule then UDim2.fromOffset(320 * Scale, 180 * Scale) else UDim2.fromOffset(298, 168)
		}),
		Copy = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = if FFlagBuildExperienceMonetizationNativeUIModule then "col align-x-center size-full-0 auto-y padding-large" else "col align-x-center size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = p2.emptyTitle,
				tag = if FFlagBuildExperienceMonetizationNativeUIModule then "size-full-0 auto-y text-heading-medium text-wrap text-align-x-center content-emphasis" else "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis"
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = p2.emptyDescription,
				tag = if FFlagBuildExperienceMonetizationNativeUIModule then "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default" else "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default"
			})
		})
	})
	
	return if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.createElement(ScrollView, {
		tag = "size-full",
		testId = "monetization-empty-scroll",
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		}
	}, { Content = Element }) else Element
end

local function CatalogStatusContent(p2)
	-- upvalues: ReactModule (copy), Text (copy), View (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	return if p2.catalogStatus == "NotReady" then ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
		testId = "monetization-catalog-loading",
		Text = p2.labels.loading
	}) else ReactModule.createElement(View, {
		tag = "col align-x-center gap-large size-full-0 auto-y padding-large",
		testId = "monetization-catalog-error"
	}, {
		Copy = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-small size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-emphasis",
				Text = p2.labels.loadErrorTitle
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = p2.labels.loadErrorDescription
			})
		}),
		Retry = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			onActivated = p2.onRetryCatalog,
			size = InputSize.Medium,
			text = p2.labels.retry,
			variant = ButtonVariant.Standard
		})
	})
end

local function CatalogRefreshWarning(p2)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-medium radius-medium bg-surface-100",
		testId = "monetization-catalog-refresh-error"
	}, {
		Message = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = p2.labels.loadErrorDescription
		}),
		Retry = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			onActivated = p2.onRetryCatalog,
			size = InputSize.Medium,
			text = p2.labels.retry,
			variant = ButtonVariant.Standard
		})
	})
end

local function CatalogSourcesStatus(p2)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local Elements = {}
	local CatalogSources = p2.catalogSources
	
	if CatalogSources == nil then
		return nil
	end
	for LayoutOrder, catalogSource in CatalogSources do
		if catalogSource.status ~= "Ready" then
			Elements[catalogSource.kind] = ReactModule.createElement(View, {
				tag = "col gap-small size-full-0 auto-y padding-medium radius-medium bg-surface-100",
				LayoutOrder = LayoutOrder,
				testId = `monetization-catalog-source-{catalogSource.kind}`
			}, {
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = catalogSource.label
				}),
				Message = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = if catalogSource.status == "Failed" then p2.labels.loadErrorDescription else p2.labels.loading
				}),
				Retry = if catalogSource.status == "Failed" and p2.onRetryCatalogSource ~= nil then ReactModule.createElement(Button, {
					LayoutOrder = 3,
					onActivated = function()
						-- upvalues: p2 (copy), catalogSource (copy)
						p2.onRetryCatalogSource(catalogSource.kind)
					end,
					size = InputSize.Medium,
					text = p2.labels.retry,
					variant = ButtonVariant.Standard
				}) else nil
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "monetization-catalog-sources-status"
	}, Elements)
end

local function DetailContent(p3)
	-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), AssetId (copy), Text (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), Icon (copy), IconName (copy), IconSize (copy), Toggle (copy), InputSize (copy)
	local Emphasis = if FFlagBuildExperienceMonetizationNativeUIModule then UseTokensFunction().Color.Content.Emphasis else nil
	local SelectedProduct = p3.selectedProduct
	
	return if SelectedProduct == nil then ReactModule.createElement(View, { tag = "size-full", testId = "MonetizationPageView" }) else ReactModule.createElement(View, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large",
		testId = "MonetizationPageView"
	}, {
		Media = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = if FFlagBuildExperienceMonetizationNativeUIModule then "row align-x-center size-full-0 auto-y padding-y-xlarge radius-medium bg-surface-200" else "row align-x-center size-full-0 auto-y padding-y-medium"
		}, {
			Image = if SelectedProduct.image == nil and not FFlagBuildExperienceMonetizationNativeUIModule then nil else ReactModule.createElement(Image, {
				testId = "monetization-detail-image",
				Image = SelectedProduct.image or AssetId,
				imageStyle = if SelectedProduct.image == nil then Emphasis else nil,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(195, 196)
			})
		}),
		Summary = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-xxlarge size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(View, { LayoutOrder = 1, tag = "col size-full-0 auto-y" }, {
				Name = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = SelectedProduct.name,
					tag = {
						["size-full-0 auto-y text-heading-small text-align-x-left content-emphasis"] = true,
						["text-wrap"] = FFlagBuildExperienceMonetizationNativeUIModule
					}
				}),
				Kind = if FFlagBuildExperienceMonetizationMultiKindModule and SelectedProduct.kind ~= nil then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y padding-top-xsmall text-body-medium text-wrap text-align-x-left content-muted",
					testId = "monetization-detail-kind",
					Text = SelectedProduct.kind
				}) else nil,
				Price = ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "row align-y-center gap-xsmall size-full-0 auto-y"
				}, {
					Icon = if FFlagBuildExperienceMonetizationMultiKindModule and SelectedProduct.showRobuxIcon == false then nil else ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = IconName.Robux,
						size = IconSize.Small
					}),
					Value = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy text-body-medium content-default",
						Text = SelectedProduct.price
					})
				}),
				Status = if SelectedProduct.canManage == false and SelectedProduct.saleStatus ~= nil then ReactModule.createElement(Text, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y padding-top-xsmall text-body-medium text-wrap text-align-x-left content-muted",
					testId = "monetization-detail-sale-status",
					Text = SelectedProduct.saleStatus
				}) else nil
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = SelectedProduct.description
			}),
			SaleStatus = if p3.canManageProduct then ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "col gap-small size-full-0 auto-y"
			}, {
				Row = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-large size-full-0 auto-y padding-y-large"
				}, {
					Label = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-body-medium text-align-x-left content-default",
						Text = p3.labels.availableForPurchase
					}),
					Toggle = ReactModule.createElement(Toggle, {
						LayoutOrder = 2,
						label = "",
						testId = "monetization-detail-sale-status",
						isChecked = SelectedProduct.isForSale == true,
						isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or (p3.isProductManagedPricingPending or not p3.canManageProduct)),
						onActivated = p3.onProductSaleStatusChanged,
						size = InputSize.Medium
					})
				}),
				Error = if p3.productSaleStatusError then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small content-alert",
					testId = "monetization-sale-status-error",
					Text = if SelectedProduct.priceInRobux == nil then p3.labels.priceRequiredForSale else p3.labels.updateError
				}) else nil
			}) else nil,
			Pricing = if SelectedProduct.productKind == nil or SelectedProduct.productKind == "DeveloperProduct" then ReactModule.createElement(View, { LayoutOrder = 4, tag = "col size-full-0 auto-y" }, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-small text-heading-small text-align-x-left content-emphasis",
					Text = p3.labels.pricing
				}),
				Regional = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-large size-full-0 auto-y padding-y-large"
				}, {
					Label = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-body-medium text-align-x-left content-default",
						Text = p3.labels.regionalPricing
					}),
					Toggle = ReactModule.createElement(Toggle, {
						LayoutOrder = 2,
						label = "",
						testId = "monetization-detail-managed-pricing",
						isChecked = SelectedProduct.isManagedPricingEnabled == true,
						isDisabled = p3.isProductDisabled or (p3.isProductManagedPricingPending or (p3.isProductSaleStatusPending or not p3.canUpdateProductManagedPricing)),
						onActivated = p3.onProductManagedPricingChanged,
						size = InputSize.Medium
					})
				}),
				UpdateError = if p3.productManagedPricingError then ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-small content-alert",
					testId = "monetization-managed-pricing-error",
					Text = if SelectedProduct.priceInRobux == nil then p3.labels.priceRequiredForSale else p3.labels.updateError
				}) else nil
			}) else nil
		})
	})
end

local function EditContent(p3)
	-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), AssetId (copy), TextInput (copy), TextArea (copy), Text (copy)
	local UseTokensResult = if FFlagBuildExperienceMonetizationNativeUIModule then UseTokensFunction() else nil
	local SelectedProduct = p3.selectedProduct
	
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		testId = "monetization-product-edit"
	}, {
		Media = if FFlagBuildExperienceMonetizationNativeUIModule and SelectedProduct ~= nil then ReactModule.createElement(View, {
			LayoutOrder = 0,
			tag = "row align-x-center size-full-0 auto-y padding-y-xlarge radius-medium bg-surface-200"
		}, {
			Image = ReactModule.createElement(Image, {
				testId = "monetization-edit-image",
				Image = SelectedProduct.image or AssetId,
				imageStyle = if SelectedProduct.image == nil then UseTokensResult.Color.Content.Emphasis else nil,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_3000, UseTokensResult.Size.Size_3000)
			})
		}) else nil,
		Name = ReactModule.createElement(TextInput, {
			LayoutOrder = 1,
			testId = "monetization-edit-name",
			isDisabled = p3.isProductEditPending,
			label = p3.labels.name,
			onChanged = p3.onEditNameChanged,
			text = p3.editName,
			width = UDim.new(1, 0)
		}),
		Description = ReactModule.createElement(TextArea, {
			LayoutOrder = 2,
			numLines = 4,
			testId = "monetization-edit-description",
			isDisabled = p3.isProductEditPending,
			label = p3.labels.description,
			onChanged = p3.onEditDescriptionChanged,
			text = p3.editDescription,
			width = UDim.new(1, 0)
		}),
		Price = ReactModule.createElement(TextInput, {
			LayoutOrder = 3,
			testId = "monetization-edit-price",
			isDisabled = p3.isProductEditPending,
			label = p3.labels.price,
			onChanged = p3.onEditPriceChanged,
			text = p3.editPrice,
			textInputType = Enum.TextInputType.Number,
			width = UDim.new(1, 0)
		}),
		Error = if p3.productEditError == nil then nil else ReactModule.createElement(Text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-body-small text-wrap content-alert",
			testId = "monetization-product-edit-error",
			Text = p3.productEditError
		})
	})
end

return function(p3)
	-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (copy), ReactModule (copy), ProductActionsMenu (copy), Button (copy), InputSize (copy), ButtonVariant (copy), IconButton (copy), IconName (copy), DetailContent (copy), CatalogSourcesStatus (copy), CatalogStatusContent (copy), EditContent (copy), OptionsContent (copy), EmptyContent (copy), CatalogContent (copy), View (copy), CatalogRefreshWarning (copy), FillBehavior (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), FFlagBuildExperienceDeveloperProductContextModule (copy), ChatActionsModule (copy), OverflowMenuPageShellModule (copy)
	local IsDetail = p3.mode == "detail"
	local IsEdit = p3.mode == "edit"
	local IsOptions = p3.mode == "options"
	local v1 = #p3.products > 0
	local HasCatalogSources = p3.catalogSources ~= nil
	local Flag = true
	
	if HasCatalogSources then
		for _, catalogSource in p3.catalogSources do
			if catalogSource.status ~= "Ready" then
				Flag = false
				break
			end
		end
	end
	local NoV76: boolean = not IsDetail and (not IsEdit and (not IsOptions and (if HasCatalogSources then not Flag and not v1 else p3.catalogStatus ~= "Ready" and not (p3.catalogStatus == "Failed" and v1))))
	local NoNoV76: boolean = p3.mode == "empty" and not NoV76
	local V76: boolean = not HasCatalogSources and (not IsDetail and (not IsEdit and (not IsOptions and (p3.catalogStatus == "Failed" and v1))))
	local Element = if IsDetail and p3.canManageProduct then if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.createElement(ProductActionsMenu, {
		isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or p3.isProductManagedPricingPending),
		editLabel = p3.labels.edit,
		onEdit = p3.onOpenProductEdit
	}) else ReactModule.createElement(Button, {
		testId = "monetization-edit-product",
		isDisabled = p3.isProductDisabled or (p3.isProductSaleStatusPending or p3.isProductManagedPricingPending),
		onActivated = p3.onOpenProductEdit,
		size = InputSize.Medium,
		text = p3.labels.edit,
		variant = ButtonVariant.Standard
	}) elseif IsDetail or IsEdit or IsOptions or NoV76 or not p3.showOptions then nil else ReactModule.createElement(IconButton, {
		isCircular = true,
		testId = "monetization-open-options",
		icon = if FFlagBuildExperienceMonetizationNativeUIModule then IconName.TwoSwitchesHorizontal else IconName.ThreeSlidersHorizontal,
		onActivated = p3.onOpenOptions,
		size = InputSize.Medium,
		variant = ButtonVariant.Utility
	})
	local CanvasGroup = if p3.isProductDisabled then ReactModule.createElement("CanvasGroup", {
		[ReactModule.Tag] = "data-testid=monetization-disabled-detail",
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		GroupTransparency = 0.55,
		Size = UDim2.new(1, 0, 0, 0)
	}, { Content = ReactModule.createElement(DetailContent, p3) }) else ReactModule.createElement(DetailContent, p3)
	local Element1 = if NoV76 then if HasCatalogSources then ReactModule.createElement(CatalogSourcesStatus, p3) else ReactModule.createElement(CatalogStatusContent, p3) elseif IsDetail then CanvasGroup elseif IsEdit then ReactModule.createElement(EditContent, p3) elseif IsOptions then ReactModule.createElement(OptionsContent, p3) elseif p3.mode == "empty" then ReactModule.createElement(EmptyContent, p3) else ReactModule.createElement(CatalogContent, p3)
	
	if HasCatalogSources and not Flag and v1 and not IsDetail and not IsEdit and not IsOptions then
		Element1 = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
			Status = ReactModule.createElement(CatalogSourcesStatus, p3),
			Content = Element1
		})
	end
	if V76 then
		Element1 = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
			Warning = ReactModule.createElement(CatalogRefreshWarning, p3),
			Content = Element1
		})
	end
	local Element2 = ReactModule.createElement(OverflowMenuPageShellModule, {
		footerDivider = false,
		testId = "MonetizationPage",
		closeIcon = IconName.ChevronLargeLeft,
		content = Element1,
		footer = if IsEdit then if FFlagBuildExperienceDeveloperProductContextModule and IsDetail and p3.chatActions ~= nil then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-y-medium",
			testId = "monetization-detail-composer"
		}, {
			Composer = ReactModule.createElement(ChatActionsModule, p3.chatActions)
		}) else ReactModule.createElement(View, {
			tag = {
				["row gap-medium size-full-0 auto-y"] = true,
				["padding-y-medium"] = FFlagBuildExperienceMonetizationNativeUIModule
			}
		}, {
			Cancel = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				testId = "monetization-cancel-product-edit",
				fillBehavior = FillBehavior.Fill,
				isDisabled = p3.isProductEditPending,
				onActivated = p3.onCancelProductEdit,
				size = InputSize.Large,
				text = p3.labels.cancel,
				variant = ButtonVariant.Standard,
				width = UDim.new(0.5, -6)
			}),
			Save = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "monetization-save-product-edit",
				fillBehavior = FillBehavior.Fill,
				isLoading = p3.isProductEditPending,
				onActivated = p3.onSaveProductEdit,
				size = InputSize.Large,
				text = p3.labels.save,
				variant = ButtonVariant.Emphasis,
				width = UDim.new(0.5, -6)
			})
		}) elseif FFlagBuildExperienceDeveloperProductContextModule and IsDetail and p3.chatActions ~= nil then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-y-medium",
			testId = "monetization-detail-composer"
		}, {
			Composer = ReactModule.createElement(ChatActionsModule, p3.chatActions)
		}) elseif NoV76 or p3.mode ~= "empty" and p3.mode ~= "catalog" then nil else ReactModule.createElement(View, {
			tag = {
				["row align-x-center size-full-0 auto-y"] = true,
				["padding-y-medium"] = FFlagBuildExperienceMonetizationNativeUIModule
			}
		}, {
			Create = ReactModule.createElement(Button, {
				testId = "monetization-create",
				isDisabled = if FFlagBuildExperienceMonetizationMultiKindModule then not p3.canCreateProduct else nil,
				onActivated = p3.onOpenCreate,
				size = if FFlagBuildExperienceMonetizationNativeUIModule then InputSize.Large else InputSize.Medium,
				text = p3.labels.emptyCreateProduct,
				variant = ButtonVariant.Emphasis,
				width = if FFlagBuildExperienceMonetizationNativeUIModule then UDim.new(1, 0) else UDim.new(0, 240)
			})
		}),
		disableScrolling = FFlagBuildExperienceMonetizationNativeUIModule and NoNoV76,
		headerTrailing = Element,
		onClose = p3.onClose,
		title = if IsDetail then if p3.selectedProduct == nil then p3.labels.title else p3.selectedProduct.name elseif IsEdit then p3.labels.editProduct elseif IsOptions then p3.labels.options else p3.labels.title
	})
	
	return if FFlagBuildExperienceDeveloperProductContextModule then ReactModule.createElement(View, {
		tag = "size-full",
		padding = { bottom = UDim.new(0, p3.keyboardHeight or 0) }
	}, { Page = Element2 }) else Element2
end