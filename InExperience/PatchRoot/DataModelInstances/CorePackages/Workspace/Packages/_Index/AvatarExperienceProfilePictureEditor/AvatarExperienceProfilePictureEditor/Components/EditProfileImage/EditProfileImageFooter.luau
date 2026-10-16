local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local _ = require(AvatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)

return function(p1) --[[ Line: 29 | Named "EditProfileImageFooter" ]]
	-- upvalues: ReactModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-medium padding-top-medium",
		LayoutOrder = p1.layoutOrder
	}, if p1.footerCta == "purchaseEmote" then {
		Purchase = p1.renderRecommendedEmotePurchaseFooter(p1.selectedEmoteId)
	} elseif p1.footerCta == "subscribePlus" then {
		Subscribe = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = p1.localizedSubscribeLabel,
			variant = ButtonVariant.Emphasis,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			onActivated = function() --[[ Line: 44 ]]
				-- upvalues: p1 (copy)
				p1.onOpenProfileFramesSubscriptionUpsell("footer")
			end
		})
	} else {
		Save = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = p1.localizedSaveLabel,
			variant = ButtonVariant.Emphasis,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			isLoading = p1.isSaving,
			isDisabled = p1.isSaving,
			onActivated = p1.onSave
		})
	})
end