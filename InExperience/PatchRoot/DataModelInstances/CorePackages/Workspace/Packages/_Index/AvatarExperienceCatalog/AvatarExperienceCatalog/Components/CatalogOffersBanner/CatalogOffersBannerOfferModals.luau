local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local GetFoundationIconNameModule = require(script.Parent.getFoundationIconName)
local AXPartialPageModal = require(Parent.AvatarExperienceCommon).Components.AXPartialPageModal
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FFlagAXPartialPageModalBackgroundShim = require(Parent.AvatarExperienceFlags).FFlagAXPartialPageModalBackgroundShim
local AXUpdateOffersModalHero = game:DefineFastFlag("AXUpdateOffersModalHero", false)
local _UDim2 = UDim2.new(0.5, -82, 0.5, 12)
local _UDim2_1 = UDim2.new(0.5, 92, 0.5, -19)
local v1: number = if AXUpdateOffersModalHero then 230 else 540

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function _(Vector): number
	-- upvalues: v1 (copy)
	local IsXBelow = Vector.X < 540
	
	return (math.clamp(math.floor(Vector.Y * (if IsXBelow then 0.35 else 0.5)), 180, if IsXBelow then 280 else v1))
end

local function RichTextBlock(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		RichText = true,
		tag = p1.tag,
		Text = p1.segment,
		LayoutOrder = p1.layoutOrder
	})
end

local function HeroFrame(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), IconVariant (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "bg-surface-100 stroke-standard stroke-emphasis",
		testId = p1.testId,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = UDim2.fromOffset(p1.framePx, p1.framePx),
		Rotation = p1.rotation,
		ZIndex = p1.zIndex,
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Small)
	}, {
		IconCenter = ReactModule.createElement(FoundationModule.View, { tag = "size-full col align-x-center align-y-center" }, {
			Glyph = ReactModule.createElement(FoundationModule.Icon, {
				testId = `{p1.testId}Icon`,
				name = p1.iconName,
				variant = IconVariant.Regular,
				size = p1.iconSize,
				style = UseTokensResult.Color.Content.Emphasis
			})
		})
	})
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), v1 (copy), ReactModule (copy), FoundationModule (copy), RichTextBlock (copy), AXPartialPageModal (copy), FFlagAXPartialPageModalBackgroundShim (copy), ButtonVariant (copy), InputSize (copy), AXUpdateOffersModalHero (copy), GetFoundationIconNameModule (copy), IconVariant (copy), HeroFrame (copy), _UDim2 (copy), IconName (copy), _UDim2_1 (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ viewTermsButtonText = "Feature.Catalog.Action.ViewTerms" })
	local Modal = p1.modal
	local OnOpenTermsModal = p1.onOpenTermsModal
	local TermsBody = Modal.termsBody
	local IsNotTermsBodyMatch: boolean = TermsBody ~= nil and TermsBody ~= ""
	local Text = if IsNotTermsBodyMatch then Modal.offerBodyLinkText .. " " else Modal.offerBodyLinkText
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local IsXBelow = UseSelectorResult.X < 540
	local ClampedValue = math.clamp(math.floor(UseSelectorResult.Y * (if IsXBelow then 0.35 else 0.5)), 180, if IsXBelow then 280 else v1)
	local Element = ReactModule.createElement(FoundationModule.View, {
		tag = "row wrap align-x-left align-y-top gap-xsmall size-full-0 auto-y"
	}, {
		Body = if Text == "" then nil else ReactModule.createElement(RichTextBlock, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			layoutOrder = 1,
			segment = Text
		}),
		TermsLink = if IsNotTermsBodyMatch then ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-muted",
			RichText = true,
			LayoutOrder = 2,
			Text = `<u>{UseLocalizationResult.viewTermsButtonText}</u>`,
			onActivated = OnOpenTermsModal
		}) else nil
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		OffersModal = if p1.offersModalOpen then ReactModule.createElement(AXPartialPageModal, {
			visible = true,
			onBackgroundPress = p1.onCloseOffersModal,
			hasBackgroundShim = if FFlagAXPartialPageModalBackgroundShim then true else nil,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							text = p1.okButtonText,
							variant = ButtonVariant.Emphasis,
							size = InputSize.Medium,
							onActivated = p1.onCloseOffersModal
						}
					}
				}
			}
		}, {
			ViewFrame = ReactModule.createElement(FoundationModule.View, {
				tag = {
					["col align-x-left align-y-top size-full-0 auto-y"] = true,
					["padding-bottom-xxlarge"] = AXUpdateOffersModalHero,
					["padding-y-xxlarge"] = not AXUpdateOffersModalHero
				}
			}, {
				Contents = ReactModule.createElement(FoundationModule.View, {
					tag = {
						["col align-x-left gap-medium size-full-0 auto-y"] = true,
						["padding-y-xlarge"] = not AXUpdateOffersModalHero
					}
				}, {
					HeroIcon = ReactModule.createElement(FoundationModule.View, {
						LayoutOrder = 0,
						tag = {
							["row align-x-center align-y-center auto-y"] = true,
							["padding-bottom-xxlarge"] = AXUpdateOffersModalHero
						},
						Size = UDim2.new(1, 0, 0, 136)
					}, {
						HeroIconSlot = ReactModule.createElement(FoundationModule.View, {
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(136, 136)
						}, {
							TiltedSquare = if AXUpdateOffersModalHero then nil else ReactModule.createElement(FoundationModule.View, {
								BackgroundTransparency = 1,
								Rotation = -15,
								Size = UDim2.fromOffset(108, 108),
								AnchorPoint = Vector2.new(0.5, 0.5),
								Position = UDim2.fromScale(0.5, 0.5),
								cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
								stroke = {
									Transparency = 0.84,
									Color = UseTokensResult.Color.Content.Emphasis.Color3,
									Thickness = UseTokensResult.Stroke.Standard
								}
							}, {
								IconCounterRotate = ReactModule.createElement(FoundationModule.View, {
									tag = "size-full",
									BackgroundTransparency = 1,
									Rotation = 15
								}, {
									Icon = ReactModule.createElement(FoundationModule.Icon, {
										size = 64,
										name = GetFoundationIconNameModule(Modal.modalHeroIcon),
										variant = IconVariant.Regular,
										style = UseTokensResult.Color.Content.Emphasis,
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5)
									})
								})
							}),
							HeroFrameLeft = if AXUpdateOffersModalHero then ReactModule.createElement(HeroFrame, {
								framePx = 74,
								rotation = 15,
								zIndex = 1,
								testId = "CatalogOffersModalHeroFrameLeft",
								position = _UDim2,
								iconName = IconName.Shirt,
								iconSize = UseTokensResult.Size.Size_1200
							}) else nil,
							HeroFrameRight = if AXUpdateOffersModalHero then ReactModule.createElement(HeroFrame, {
								framePx = 84,
								rotation = 15,
								zIndex = 1,
								testId = "CatalogOffersModalHeroFrameRight",
								position = _UDim2_1,
								iconName = IconName.Shoe,
								iconSize = UseTokensResult.Size.Size_1200
							}) else nil,
							HeroFrame = if AXUpdateOffersModalHero then ReactModule.createElement(HeroFrame, {
								rotation = -15,
								zIndex = 2,
								testId = "CatalogOffersModalHeroFrame",
								framePx = UseTokensResult.Size.Size_2600,
								position = UDim2.fromScale(0.5, 0.5),
								iconName = GetFoundationIconNameModule(Modal.modalHeroIcon),
								iconSize = UseTokensResult.Size.Size_1600
							}) else nil
						})
					}),
					ModalTitle = ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-xy padding-bottom-small text-heading-small text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = Modal.modalTitle
					}),
					ModalBody = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, { Body = Element })
				})
			})
		}) else nil,
		TermsModal = if p1.termsModalOpen and IsNotTermsBodyMatch then ReactModule.createElement(AXPartialPageModal, {
			visible = true,
			onBackgroundPress = p1.onCloseTermsModal,
			hasBackgroundShim = if FFlagAXPartialPageModalBackgroundShim then true else nil,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							text = p1.okButtonText,
							variant = ButtonVariant.Standard,
							size = InputSize.Medium,
							onActivated = p1.onCloseTermsModal
						}
					}
				}
			}
		}, {
			ViewFrame = ReactModule.createElement(FoundationModule.View, {
				tag = {
					["col align-x-left gap-medium size-full-0 auto-y"] = true,
					["padding-bottom-large"] = AXUpdateOffersModalHero,
					["padding-y-large"] = not AXUpdateOffersModalHero
				}
			}, {
				TermsTitle = if Modal.termsModalTitle then ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-xy text-heading-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = Modal.termsModalTitle
				}) else nil,
				TermsScroll = ReactModule.createElement(FoundationModule.ScrollView, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, ClampedValue),
					scroll = {
						scrollBarVisibility = FoundationModule.Enums.Visibility.None,
						ScrollingDirection = Enum.ScrollingDirection.Y,
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(0, 1)
					},
					selection = { Selectable = false }
				}, {
					TermsBody = ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-xy padding-bottom-large text-body-medium text-wrap text-align-x-left",
						RichText = true,
						Text = TermsBody or "",
						selection = { Selectable = false }
					})
				})
			})
		}) else nil
	})
end