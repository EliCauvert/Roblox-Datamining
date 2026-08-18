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

return function(p0) --[[ line: 29 | named "EditProfileImageFooter" ]]
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-medium padding-top-medium",
		LayoutOrder = p0.layoutOrder
	}, if p0.footerCta == "purchaseEmote" then {
		Purchase = p0.renderRecommendedEmotePurchaseFooter(p0.selectedEmoteId)
	} elseif p0.footerCta == "subscribePlus" then {
		Subscribe = reactModule.createElement(button, {
			LayoutOrder = 1,
			text = p0.localizedSubscribeLabel,
			variant = buttonVariant.Emphasis,
			size = inputSize.Medium,
			fillBehavior = fillBehavior.Fill,
			onActivated = function() --[[ line: 44 ]]
				-- upvalues: p0 (ref)
				p0.onOpenProfileFramesSubscriptionUpsell("footer")
			end
		})
	} else {
		Save = reactModule.createElement(button, {
			LayoutOrder = 1,
			text = p0.localizedSaveLabel,
			variant = buttonVariant.Emphasis,
			size = inputSize.Medium,
			fillBehavior = fillBehavior.Fill,
			isLoading = p0.isSaving,
			isDisabled = p0.isSaving,
			onActivated = p0.onSave
		})
	})
end