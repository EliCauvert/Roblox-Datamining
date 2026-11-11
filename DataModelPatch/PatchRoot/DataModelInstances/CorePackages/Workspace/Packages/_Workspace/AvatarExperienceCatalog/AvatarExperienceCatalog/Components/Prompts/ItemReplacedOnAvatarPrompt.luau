local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AXPartialPageModal = AvatarExperienceCommonModule.Components.AXPartialPageModal
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local IconSize = FoundationModule.Enums.IconSize

local function _(p1, p2): string
	return `rbxthumb://type={p2}&id={p1}&w=150&h=150`
end

return (require(Parent.AvatarExperienceNavigation).withMappedNavigationParams(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), RoactNavigationModule (copy), View (copy), CatalogItemCard (copy), ItemCardThumbnail (copy), FoundationModule (copy), BuilderIconsModule (copy), IconSize (copy), Text (copy), AXPartialPageModal (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "CommonUI.Controls.Action.OK",
		titleText = "Feature.Catalog.Title.Checkout.ItemReplacedOnAvatarTitle",
		bodyText = "Feature.Catalog.Label.Checkout.ItemReplacedOnAvatarBody"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		p1.onConfirm()
	end, { p1.onConfirm, UseResult })
	
	return ReactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = UseResult1,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = UseResult1,
						text = UseLocalizationResult.confirmButtonText,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium
					}
				}
			}
		}
	}, ((function()
		-- upvalues: ReactModule (upval), View (upval), CatalogItemCard (upval), ItemCardThumbnail (upval), p1 (copy), FoundationModule (upval), BuilderIconsModule (upval), IconSize (upval), Text (upval), UseLocalizationResult (copy)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				GraphicContainer = ReactModule.createElement(View, {
					tag = "row size-full-0 auto-y align-x-center padding-bottom-xxlarge",
					LayoutOrder = 1
				}, {
					BeforeItem = ReactModule.createElement(CatalogItemCard, {
						LayoutOrder = 1,
						Selectable = false,
						AutomaticSize = Enum.AutomaticSize.XY,
						presentationSlot = ReactModule.createElement(View, { Size = UDim2.fromOffset(80, 80) }, ReactModule.createElement(ItemCardThumbnail, {
							url = `rbxthumb://type={p1.beforeItem.thumbType}&id={p1.beforeItem.itemId}&w=150&h=150`
						}))
					}),
					ReplaceIcon = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row auto-x auto-y align-x-center align-y-center",
						Size = UDim2.fromOffset(60, 80)
					}, ReactModule.createElement(FoundationModule.Icon, {
						name = BuilderIconsModule.Icon.TwoArrowsSpinClockwise,
						size = IconSize.Large,
						variant = BuilderIconsModule.IconVariant.Regular
					})),
					AfterItem = ReactModule.createElement(CatalogItemCard, {
						LayoutOrder = 3,
						Selectable = false,
						AutomaticSize = Enum.AutomaticSize.XY,
						presentationSlot = ReactModule.createElement(View, { Size = UDim2.fromOffset(80, 80) }, ReactModule.createElement(ItemCardThumbnail, {
							url = `rbxthumb://type={p1.afterItem.thumbType}&id={p1.afterItem.itemId}&w=150&h=150`
						}))
					})
				}),
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small padding-top-large text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.titleText
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = UseLocalizationResult.bodyText
				})
			})
		}
	end)()))
end))