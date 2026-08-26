local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local _ = require(avatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)

return function(p1)
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-medium padding-top-medium",
		LayoutOrder = p1.layoutOrder
	}, if p1.footerCta == "purchaseEmote" then {
		Purchase = p1.renderRecommendedEmotePurchaseFooter(p1.selectedEmoteId)
	} elseif p1.footerCta == "subscribePlus" then {
		Subscribe = reactModule.createElement(button, {
			LayoutOrder = 1,
			text = p1.localizedSubscribeLabel,
			variant = buttonVariant.Emphasis,
			size = inputSize.Medium,
			fillBehavior = fillBehavior.Fill,
			onActivated = function()
				-- upvalues: p1 (ref)
				p1.onOpenProfileFramesSubscriptionUpsell("footer")
			end
		})
	} else {
		Save = reactModule.createElement(button, {
			LayoutOrder = 1,
			text = p1.localizedSaveLabel,
			variant = buttonVariant.Emphasis,
			size = inputSize.Medium,
			fillBehavior = fillBehavior.Fill,
			isLoading = p1.isSaving,
			isDisabled = p1.isSaving,
			onActivated = p1.onSave
		})
	})
end