local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local roactNavigationModule = require(parent.RoactNavigation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local withMappedNavigationParams = require(parent.AvatarExperienceNavigation).withMappedNavigationParams
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local AXPartialPageModal = avatarExperienceCommonModule.Components.AXPartialPageModal
local catalogItemCard = avatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local iconSize = foundationModule.Enums.IconSize

local _ = function(p1, p2)
	return `rbxthumb://type={p2}&id={p1}&w=150&h=150`
end

return withMappedNavigationParams(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), roactNavigationModule (ref), view (ref), catalogItemCard (ref), itemCardThumbnail (ref), foundationModule (ref), builderIconsModule (ref), iconSize (ref), text (ref), AXPartialPageModal (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useLocalization({
		confirmButtonText = "CommonUI.Controls.Action.OK",
		titleText = "Feature.Catalog.Title.Checkout.ItemReplacedOnAvatarTitle",
		bodyText = "Feature.Catalog.Label.Checkout.ItemReplacedOnAvatarBody"
	})
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), roactNavigationModule (copy)
		p1.navigation.dispatch(roactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2()
		p1.onConfirm()
	end, { p1.onConfirm, var2 })
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var3,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = var3,
						text = var1.confirmButtonText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, (function()
		-- upvalues: reactModule (copy), view (copy), catalogItemCard (copy), itemCardThumbnail (copy), p1 (ref), foundationModule (copy), builderIconsModule (copy), iconSize (copy), text (copy), var1 (ref)
		return {
			ViewFrame = reactModule.createElement(view, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				GraphicContainer = reactModule.createElement(view, {
					tag = "row size-full-0 auto-y align-x-center padding-bottom-xxlarge",
					LayoutOrder = 1
				}, {
					BeforeItem = reactModule.createElement(catalogItemCard, {
						LayoutOrder = 1,
						Selectable = false,
						AutomaticSize = Enum.AutomaticSize.XY,
						presentationSlot = reactModule.createElement(view, { Size = UDim2.fromOffset(80, 80) }, reactModule.createElement(itemCardThumbnail, {
							url = `rbxthumb://type={p1.beforeItem.thumbType}&id={p1.beforeItem.itemId}&w=150&h=150`
						}))
					}),
					ReplaceIcon = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row auto-x auto-y align-x-center align-y-center",
						Size = UDim2.fromOffset(60, 80)
					}, reactModule.createElement(foundationModule.Icon, {
						name = builderIconsModule.Icon.TwoArrowsSpinClockwise,
						size = iconSize.Large,
						variant = builderIconsModule.IconVariant.Regular
					})),
					AfterItem = reactModule.createElement(catalogItemCard, {
						LayoutOrder = 3,
						Selectable = false,
						AutomaticSize = Enum.AutomaticSize.XY,
						presentationSlot = reactModule.createElement(view, { Size = UDim2.fromOffset(80, 80) }, reactModule.createElement(itemCardThumbnail, {
							url = `rbxthumb://type={p1.afterItem.thumbType}&id={p1.afterItem.itemId}&w=150&h=150`
						}))
					})
				}),
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small padding-top-large text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = var1.titleText
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = var1.bodyText
				})
			})
		}
	end)())
end)