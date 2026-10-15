local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local getFoundationIconNameModule = require(script.Parent.getFoundationIconName)
local AXPartialPageModal = avatarExperienceCommonModule.Components.AXPartialPageModal
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local fFlagAXPartialPageModalBackgroundShim = require(parent.AvatarExperienceFlags).FFlagAXPartialPageModalBackgroundShim
local AXUpdateOffersModalHero = game:DefineFastFlag("AXUpdateOffersModalHero", false)
local uDim2 = UDim2.new(0.5, -82, 0.5, 12)
local uDim2_1 = UDim2.new(0.5, 92, 0.5, -19)
local var1 = if AXUpdateOffersModalHero then 230 else 540

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function _(p1)
	-- upvalues: var1 (ref)
	local var2 = p1.X < 540
	
	return math.clamp(math.floor(p1.Y * (if var2 then 0.35 else 0.5)), 180, if var2 then 280 else var1)
end

local function RichTextBlock(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		RichText = true,
		tag = p1.tag,
		Text = p1.segment,
		LayoutOrder = p1.layoutOrder
	})
end

local function HeroFrame(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), iconVariant (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "bg-surface-100 stroke-standard stroke-emphasis",
		testId = p1.testId,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = UDim2.fromOffset(p1.framePx, p1.framePx),
		Rotation = p1.rotation,
		ZIndex = p1.zIndex,
		cornerRadius = UDim.new(0, var2.Radius.Small)
	}, {
		IconCenter = reactModule.createElement(foundationModule.View, { tag = "size-full col align-x-center align-y-center" }, {
			Glyph = reactModule.createElement(foundationModule.Icon, {
				testId = `{p1.testId}Icon`,
				name = p1.iconName,
				variant = iconVariant.Regular,
				size = p1.iconSize,
				style = var2.Color.Content.Emphasis
			})
		})
	})
end

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), useSelector (ref), selectScreenSize (ref), var1 (ref), reactModule (ref), foundationModule (ref), RichTextBlock (ref), AXPartialPageModal (ref), fFlagAXPartialPageModalBackgroundShim (ref), buttonVariant (ref), inputSize (ref), AXUpdateOffersModalHero (ref), getFoundationIconNameModule (ref), iconVariant (ref), HeroFrame (ref), uDim2 (ref), iconName (ref), uDim2_1 (ref)
	local var2 = useTokens()
	local var3 = useLocalization({ viewTermsButtonText = "Feature.Catalog.Action.ViewTerms" })
	local modal = p1.modal
	local onOpenTermsModal = p1.onOpenTermsModal
	local termsBody = modal.termsBody
	local var4 = termsBody ~= nil and termsBody ~= ""
	local var5 = if var4 then modal.offerBodyLinkText .. " " else modal.offerBodyLinkText
	local var6 = useSelector(selectScreenSize)
	local var7 = var6.X < 540
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		OffersModal = if p1.offersModalOpen then reactModule.createElement(AXPartialPageModal, {
			visible = true,
			onBackgroundPress = p1.onCloseOffersModal,
			hasBackgroundShim = if fFlagAXPartialPageModalBackgroundShim then true else nil,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							text = p1.okButtonText,
							variant = buttonVariant.Emphasis,
							size = inputSize.Medium,
							onActivated = p1.onCloseOffersModal
						}
					}
				}
			}
		}, {
			ViewFrame = reactModule.createElement(foundationModule.View, {
				tag = {
					["col align-x-left align-y-top size-full-0 auto-y"] = true,
					["padding-bottom-xxlarge"] = AXUpdateOffersModalHero,
					["padding-y-xxlarge"] = not AXUpdateOffersModalHero
				}
			}, {
				Contents = reactModule.createElement(foundationModule.View, {
					tag = {
						["col align-x-left gap-medium size-full-0 auto-y"] = true,
						["padding-y-xlarge"] = not AXUpdateOffersModalHero
					}
				}, {
					HeroIcon = reactModule.createElement(foundationModule.View, {
						LayoutOrder = 0,
						tag = {
							["row align-x-center align-y-center auto-y"] = true,
							["padding-bottom-xxlarge"] = AXUpdateOffersModalHero
						},
						Size = UDim2.new(1, 0, 0, 136)
					}, {
						HeroIconSlot = reactModule.createElement(foundationModule.View, {
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(136, 136)
						}, {
							TiltedSquare = if AXUpdateOffersModalHero then nil else reactModule.createElement(foundationModule.View, {
								BackgroundTransparency = 1,
								Rotation = -15,
								Size = UDim2.fromOffset(108, 108),
								AnchorPoint = Vector2.new(0.5, 0.5),
								Position = UDim2.fromScale(0.5, 0.5),
								cornerRadius = UDim.new(0, var2.Radius.Small),
								stroke = {
									Transparency = 0.84,
									Color = var2.Color.Content.Emphasis.Color3,
									Thickness = var2.Stroke.Standard
								}
							}, {
								IconCounterRotate = reactModule.createElement(foundationModule.View, {
									tag = "size-full",
									BackgroundTransparency = 1,
									Rotation = 15
								}, {
									Icon = reactModule.createElement(foundationModule.Icon, {
										size = 64,
										name = getFoundationIconNameModule(modal.modalHeroIcon),
										variant = iconVariant.Regular,
										style = var2.Color.Content.Emphasis,
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5)
									})
								})
							}),
							HeroFrameLeft = if AXUpdateOffersModalHero then reactModule.createElement(HeroFrame, {
								framePx = 74,
								rotation = 15,
								zIndex = 1,
								testId = "CatalogOffersModalHeroFrameLeft",
								position = uDim2,
								iconName = iconName.Shirt,
								iconSize = var2.Size.Size_1200
							}) else nil,
							HeroFrameRight = if AXUpdateOffersModalHero then reactModule.createElement(HeroFrame, {
								framePx = 84,
								rotation = 15,
								zIndex = 1,
								testId = "CatalogOffersModalHeroFrameRight",
								position = uDim2_1,
								iconName = iconName.Shoe,
								iconSize = var2.Size.Size_1200
							}) else nil,
							HeroFrame = if AXUpdateOffersModalHero then reactModule.createElement(HeroFrame, {
								rotation = -15,
								zIndex = 2,
								testId = "CatalogOffersModalHeroFrame",
								framePx = var2.Size.Size_2600,
								position = UDim2.fromScale(0.5, 0.5),
								iconName = getFoundationIconNameModule(modal.modalHeroIcon),
								iconSize = var2.Size.Size_1600
							}) else nil
						})
					}),
					ModalTitle = reactModule.createElement(foundationModule.Text, {
						tag = "size-full-0 auto-xy padding-bottom-small text-heading-small text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = modal.modalTitle
					}),
					ModalBody = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						Body = reactModule.createElement(foundationModule.View, {
							tag = "row wrap align-x-left align-y-top gap-xsmall size-full-0 auto-y"
						}, {
							Body = if var5 ~= "" then nil else reactModule.createElement(RichTextBlock, {
								tag = "auto-xy text-body-medium text-wrap text-align-x-left",
								layoutOrder = 1,
								segment = var5
							}),
							TermsLink = if var4 then reactModule.createElement(foundationModule.Text, {
								tag = "auto-xy text-body-medium text-wrap text-align-x-left content-muted",
								RichText = true,
								LayoutOrder = 2,
								Text = `<u>{var3.viewTermsButtonText}</u>`,
								onActivated = onOpenTermsModal
							}) else nil
						})
					})
				})
			})
		}) else nil,
		TermsModal = if p1.termsModalOpen and var4 then reactModule.createElement(AXPartialPageModal, {
			visible = true,
			onBackgroundPress = p1.onCloseTermsModal,
			hasBackgroundShim = if fFlagAXPartialPageModalBackgroundShim then true else nil,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							text = p1.okButtonText,
							variant = buttonVariant.Standard,
							size = inputSize.Medium,
							onActivated = p1.onCloseTermsModal
						}
					}
				}
			}
		}, {
			ViewFrame = reactModule.createElement(foundationModule.View, {
				tag = {
					["col align-x-left gap-medium size-full-0 auto-y"] = true,
					["padding-bottom-large"] = AXUpdateOffersModalHero,
					["padding-y-large"] = not AXUpdateOffersModalHero
				}
			}, {
				TermsTitle = if modal.termsModalTitle then reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-xy text-heading-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = modal.termsModalTitle
				}) else nil,
				TermsScroll = reactModule.createElement(foundationModule.ScrollView, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, math.clamp(math.floor(var6.Y * (if var7 then 0.35 else 0.5)), 180, if var7 then 280 else var1)),
					scroll = {
						scrollBarVisibility = foundationModule.Enums.Visibility.None,
						ScrollingDirection = Enum.ScrollingDirection.Y,
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(0, 1)
					},
					selection = { Selectable = false }
				}, {
					TermsBody = reactModule.createElement(foundationModule.Text, {
						tag = "size-full-0 auto-xy padding-bottom-large text-body-medium text-wrap text-align-x-left",
						RichText = true,
						Text = termsBody or "",
						selection = { Selectable = false }
					})
				})
			})
		}) else nil
	})
end