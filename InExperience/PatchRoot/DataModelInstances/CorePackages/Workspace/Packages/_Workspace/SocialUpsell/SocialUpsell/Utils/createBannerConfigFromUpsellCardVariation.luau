local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local getDeepValue = require(parent.SocialCommon).Utils.getDeepValue
local createCommonSocialUpsellBannerConfigModule = require(script.Parent.createCommonSocialUpsellBannerConfig)
local _ = require(socialUpsell.Types)
local constantsModule = require(socialUpsell.Constants)
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAgeBasedUXHomepageVerificationBannerLockIcon = sharedFlagsModule.FFlagAgeBasedUXHomepageVerificationBannerLockIcon
local fFlagAgeBasedUXHomepageVerificationBannerGreyButton = sharedFlagsModule.FFlagAgeBasedUXHomepageVerificationBannerGreyButton
local t = {
	OpenFaeUpsell = constantsModule.UPSELL_BUTTON_ACTION.Primary,
	OpenFaeViewDetails = constantsModule.UPSELL_BUTTON_ACTION.Secondary,
	Dismiss = constantsModule.UPSELL_BUTTON_ACTION.Dismiss
}
local t_1 = { Fae = socialUpsellTypeModule.FacialAgeEstimation }

local function _(p0)
	-- upvalues: t (ref)
	return if p0.action and p0.action.type then t[p0.action.type] else nil
end

return function(p1, p2)
	-- upvalues: t_1 (ref), socialUpsellTypeModule (ref), constantsModule (ref), t (ref), fFlagAgeBasedUXHomepageVerificationBannerGreyButton (ref), createCommonSocialUpsellBannerConfigModule (ref), getDeepValue (ref), fFlagAgeBasedUXHomepageVerificationBannerLockIcon (ref)
	local upsellCardType = t_1[p1.upsellCardType] or socialUpsellTypeModule.Unknown
	local upsellCardV2Config = p1.upsellCardV2Config
	local t_2 = {}
	local t_3 = {}
	
	if upsellCardV2Config.label_items then
		for i, v in upsellCardV2Config.label_items do
			if v.type == "Countdown" and v.metadata and v.metadata.countdown_text then
				table.insert(t_2, {
					type = constantsModule.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN,
					text = v.metadata.countdown_text
				})
			end
		end
	end
	if upsellCardV2Config.buttons then
		for i, v in upsellCardV2Config.buttons do
			local var10 = if v.action and v.action.type then t[v.action.type] else nil
			
			if var10 then
				table.insert(t_3, {
					text = v.text,
					action = var10,
					variantOverride = if fFlagAgeBasedUXHomepageVerificationBannerGreyButton and p2 and var10 == constantsModule.UPSELL_BUTTON_ACTION.Primary then p2.primaryButtonVariantOverride else nil
				})
			end
		end
	end
	return createCommonSocialUpsellBannerConfigModule({
		type = upsellCardType,
		title = getDeepValue(upsellCardV2Config, "header.text"),
		body = getDeepValue(upsellCardV2Config, "body.text"),
		image = getDeepValue(upsellCardV2Config, "image"),
		isDismissable = getDeepValue(upsellCardV2Config, "dismissable"),
		labelItems = t_2,
		buttons = t_3,
		icon = if fFlagAgeBasedUXHomepageVerificationBannerLockIcon and p2 then p2.iconOverride else nil
	})
end