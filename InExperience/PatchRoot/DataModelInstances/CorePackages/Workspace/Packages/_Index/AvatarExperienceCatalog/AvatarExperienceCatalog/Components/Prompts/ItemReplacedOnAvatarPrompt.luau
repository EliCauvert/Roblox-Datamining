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

local _ = function(p0, p1) --[[ line: 34 ]]
	return `rbxthumb://type={p1}&id={p0}&w=150&h=150`
end

return withMappedNavigationParams(function(p2) --[[ line: 38 | named "ItemReplacedOnAvatarPrompt" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), roactNavigationModule (ref), view (ref), catalogItemCard (ref), itemCardThumbnail (ref), foundationModule (ref), builderIconsModule (ref), iconSize (ref), text (ref), AXPartialPageModal (ref), buttonVariant (ref), inputSize (ref)
	local var5 = useLocalization({
		confirmButtonText = "CommonUI.Controls.Action.OK",
		titleText = "Feature.Catalog.Title.Checkout.ItemReplacedOnAvatarTitle",
		bodyText = "Feature.Catalog.Label.Checkout.ItemReplacedOnAvatarBody"
	})
	local var6 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: p2 (ref), roactNavigationModule (copy)
		p2.navigation.dispatch(roactNavigationModule.Actions.back(nil))
	end, { p2.navigation })
	local var7 = reactModule.useCallback(function() --[[ line: 49 ]]
		-- upvalues: var6 (ref), p2 (ref)
		var6()
		p2.onConfirm()
	end, { p2.onConfirm, var6 })
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var7,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = var7,
						text = var5.confirmButtonText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, (function() --[[ line: 54 ]]
		-- upvalues: reactModule (copy), view (copy), catalogItemCard (copy), itemCardThumbnail (copy), p2 (ref), foundationModule (copy), builderIconsModule (copy), iconSize (copy), text (copy), var5 (ref)
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
							url = `rbxthumb://type={p2.beforeItem.thumbType}&id={p2.beforeItem.itemId}&w=150&h=150`
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
							url = `rbxthumb://type={p2.afterItem.thumbType}&id={p2.afterItem.itemId}&w=150&h=150`
						}))
					})
				}),
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small padding-top-large text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = var5.titleText
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = var5.bodyText
				})
			})
		}
	end)())
end)