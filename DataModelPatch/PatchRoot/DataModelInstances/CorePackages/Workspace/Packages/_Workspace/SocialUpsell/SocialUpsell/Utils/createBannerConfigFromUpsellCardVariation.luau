local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local GetDeepValueFunction = require(Parent.SocialCommon).Utils.getDeepValue
local CreateCommonSocialUpsellBannerConfigModule = require(script.Parent.createCommonSocialUpsellBannerConfig)
local _ = require(SocialUpsell.Types)
local ConstantsModule = require(SocialUpsell.Constants)
local SocialUpsellTypeModule = require(SocialUpsell.Enum.SocialUpsellType)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAgeBasedUXHomepageVerificationBannerLockIcon = SharedFlagsModule.FFlagAgeBasedUXHomepageVerificationBannerLockIcon
local FFlagAgeBasedUXHomepageVerificationBannerGreyButton = SharedFlagsModule.FFlagAgeBasedUXHomepageVerificationBannerGreyButton
local config = {
	OpenFaeUpsell = ConstantsModule.UPSELL_BUTTON_ACTION.Primary,
	OpenFaeViewDetails = ConstantsModule.UPSELL_BUTTON_ACTION.Secondary,
	Dismiss = ConstantsModule.UPSELL_BUTTON_ACTION.Dismiss
}
local config1 = { Fae = SocialUpsellTypeModule.FacialAgeEstimation }

local function _(p1)
	-- upvalues: config (copy)
	return if p1.action and p1.action.type then config[p1.action.type] else nil
end

return function(p1, p2)
	-- upvalues: config1 (copy), SocialUpsellTypeModule (copy), ConstantsModule (copy), config (copy), FFlagAgeBasedUXHomepageVerificationBannerGreyButton (copy), CreateCommonSocialUpsellBannerConfigModule (copy), GetDeepValueFunction (copy), FFlagAgeBasedUXHomepageVerificationBannerLockIcon (copy)
	local Entry = config1[p1.upsellCardType] or SocialUpsellTypeModule.Unknown
	local UpsellCardV2Config = p1.upsellCardV2Config
	local LabelItems = {}
	local Buttons = {}
	
	if UpsellCardV2Config.label_items then
		for _, labelItem in UpsellCardV2Config.label_items do
			if labelItem.type == "Countdown" and labelItem.metadata and labelItem.metadata.countdown_text then
				table.insert(LabelItems, {
					type = ConstantsModule.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN,
					text = labelItem.metadata.countdown_text
				})
			end
		end
	end
	if UpsellCardV2Config.buttons then
		for _, button in UpsellCardV2Config.buttons do
			local Entry1 = if button.action and button.action.type then config[button.action.type] else nil
			
			if Entry1 then
				table.insert(Buttons, {
					text = button.text,
					action = Entry1,
					variantOverride = if FFlagAgeBasedUXHomepageVerificationBannerGreyButton and p2 and Entry1 == ConstantsModule.UPSELL_BUTTON_ACTION.Primary then p2.primaryButtonVariantOverride else nil
				})
			end
		end
	end
	return CreateCommonSocialUpsellBannerConfigModule({
		type = Entry,
		title = GetDeepValueFunction(UpsellCardV2Config, "header.text"),
		body = GetDeepValueFunction(UpsellCardV2Config, "body.text"),
		image = GetDeepValueFunction(UpsellCardV2Config, "image"),
		isDismissable = GetDeepValueFunction(UpsellCardV2Config, "dismissable"),
		labelItems = LabelItems,
		buttons = Buttons,
		icon = if FFlagAgeBasedUXHomepageVerificationBannerLockIcon and p2 then p2.iconOverride else nil
	})
end