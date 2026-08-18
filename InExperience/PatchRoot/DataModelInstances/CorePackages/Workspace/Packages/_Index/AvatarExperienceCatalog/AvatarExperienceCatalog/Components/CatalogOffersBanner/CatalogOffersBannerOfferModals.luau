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
local iconVariant = foundationModule.Enums.IconVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local fFlagAXPartialPageModalBackgroundShim = require(parent.AvatarExperienceFlags).FFlagAXPartialPageModalBackgroundShim

local function selectScreenSize(p0) --[[ line: 46 ]]
	return p0.ScreenSize
end

local function _(p1) --[[ line: 50 | named "getTermsScrollHeight" ]]
	local var7 = p1.X < 540
	
	return math.clamp(math.floor(p1.Y * (if var7 then 0.35 else 0.5)), 180, if var7 then 280 else 540)
end

local function RichTextBlock(p2) --[[ line: 64 ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		RichText = true,
		tag = p2.tag,
		Text = p2.segment,
		LayoutOrder = p2.layoutOrder
	})
end

return function(p3) --[[ line: 83 | named "CatalogOffersBannerOfferModals" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), useSelector (ref), selectScreenSize (ref), reactModule (ref), foundationModule (ref), RichTextBlock (ref), AXPartialPageModal (ref), fFlagAXPartialPageModalBackgroundShim (ref), buttonVariant (ref), inputSize (ref), getFoundationIconNameModule (ref), iconVariant (ref)
	local var8 = useTokens()
	local var9 = useLocalization({ viewTermsButtonText = "Feature.Catalog.Action.ViewTerms" })
	local modal = p3.modal
	local onOpenTermsModal = p3.onOpenTermsModal
	local termsBody = modal.termsBody
	local var10 = termsBody ~= nil and termsBody ~= ""
	local var11 = if var10 then modal.offerBodyLinkText .. " " else modal.offerBodyLinkText
	local var12 = useSelector(selectScreenSize)
	local var13 = var12.X < 540
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		OffersModal = if p3.offersModalOpen then reactModule.createElement(AXPartialPageModal, {
			visible = true,
			onBackgroundPress = p3.onCloseOffersModal,
			hasBackgroundShim = if fFlagAXPartialPageModalBackgroundShim then true else nil,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							text = p3.okButtonText,
							variant = buttonVariant.Emphasis,
							size = inputSize.Medium,
							onActivated = p3.onCloseOffersModal
						}
					}
				}
			}
		}, {
			ViewFrame = reactModule.createElement(foundationModule.View, {
				tag = "col align-x-left align-y-top size-full-0 auto-y padding-y-xxlarge"
			}, {
				Contents = reactModule.createElement(foundationModule.View, {
					tag = "col align-x-left gap-medium size-full-0 auto-y padding-y-xlarge"
				}, {
					HeroIcon = reactModule.createElement(foundationModule.View, {
						tag = "row align-x-center align-y-center auto-y",
						LayoutOrder = 0,
						Size = UDim2.new(1, 0, 0, 136)
					}, {
						HeroIconSlot = reactModule.createElement(foundationModule.View, {
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(136, 136)
						}, {
							TiltedSquare = reactModule.createElement(foundationModule.View, {
								BackgroundTransparency = 1,
								Rotation = -15,
								Size = UDim2.fromOffset(108, 108),
								AnchorPoint = Vector2.new(0.5, 0.5),
								Position = UDim2.fromScale(0.5, 0.5),
								cornerRadius = UDim.new(0, var8.Radius.Small),
								stroke = {
									Transparency = 0.84,
									Color = var8.Color.Content.Emphasis.Color3,
									Thickness = var8.Stroke.Standard
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
										style = var8.Color.Content.Emphasis,
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.fromScale(0.5, 0.5)
									})
								})
							})
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
							Body = if var11 ~= "" then nil else reactModule.createElement(RichTextBlock, {
								tag = "auto-xy text-body-medium text-wrap text-align-x-left",
								layoutOrder = 1,
								segment = var11
							}),
							TermsLink = if var10 then reactModule.createElement(foundationModule.Text, {
								tag = "auto-xy text-body-medium text-wrap text-align-x-left content-muted",
								RichText = true,
								LayoutOrder = 2,
								Text = `<u>{var9.viewTermsButtonText}</u>`,
								onActivated = onOpenTermsModal
							}) else nil
						})
					})
				})
			})
		}) else nil,
		TermsModal = if p3.termsModalOpen and var10 then reactModule.createElement(AXPartialPageModal, {
			visible = true,
			onBackgroundPress = p3.onCloseTermsModal,
			hasBackgroundShim = if fFlagAXPartialPageModalBackgroundShim then true else nil,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							text = p3.okButtonText,
							variant = buttonVariant.Standard,
							size = inputSize.Medium,
							onActivated = p3.onCloseTermsModal
						}
					}
				}
			}
		}, {
			ViewFrame = reactModule.createElement(foundationModule.View, {
				tag = "col align-x-left gap-medium size-full-0 auto-y padding-y-large"
			}, {
				TermsTitle = if modal.termsModalTitle then reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-xy text-heading-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = modal.termsModalTitle
				}) else nil,
				TermsScroll = reactModule.createElement(foundationModule.ScrollView, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, math.clamp(math.floor(var12.Y * (if var13 then 0.35 else 0.5)), 180, if var13 then 280 else 540)),
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