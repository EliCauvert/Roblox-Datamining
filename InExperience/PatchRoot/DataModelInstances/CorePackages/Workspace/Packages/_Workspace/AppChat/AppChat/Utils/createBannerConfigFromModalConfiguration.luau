local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local socialCommonModule = require(parent.SocialCommon)
local socialUpsellModule = require(parent.SocialUpsell)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local socialUpsellType = require(parent.SocialUpsell).Enums.SocialUpsellType
local getDeepValue = socialCommonModule.Utils.getDeepValue
local createCommonSocialUpsellBannerConfig = socialUpsellModule.Utils.createCommonSocialUpsellBannerConfig
local constants = socialUpsellModule.Constants
local chatLandingModalVariant = appChatNetworkingModule.Constants.ChatLandingModalVariant
local conversationBottomModal = appChatNetworkingModule.Constants.ConversationBottomModal
local t = {
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = socialUpsellType.FacialAgeEstimation,
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = socialUpsellType.FacialAgeEstimation,
	[conversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = socialUpsellType.ConversationFacialAgeEstimation,
	[conversationBottomModal.NudgeToBottomChatUpsell] = socialUpsellType.ConversationFacialAgeEstimation
}
local t_1 = {
	open_fae_upsell = constants.UPSELL_BUTTON_ACTION.Primary,
	open_fae_view_details = constants.UPSELL_BUTTON_ACTION.Secondary,
	dismiss = constants.UPSELL_BUTTON_ACTION.Dismiss
}

local function getCountdownLabelItem(p1)
	-- upvalues: getDeepValue (ref), cryoModule (ref), appChatNetworkingModule (ref), constants (ref)
	local t = nil
	local var1 = getDeepValue(p1, "modal_layout.header.additional_content")
	
	if var1 then
		local var2 = cryoModule.List.findWhere(var1, function(p2)
			-- upvalues: appChatNetworkingModule (copy)
			return p2.type == appChatNetworkingModule.Constants.ModalContentType.Countdown
		end)
		
		if var2 and var1[var2].text then
			t = {
				type = constants.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN,
				text = var1[var2].text
			}
		end
	end
	return t
end

local function _(p1)
	-- upvalues: t_1 (ref)
	return if p1.action and p1.action.type then t_1[p1.action.type] else nil
end

return function(p1)
	-- upvalues: t (ref), socialUpsellType (ref), getDeepValue (ref), getCountdownLabelItem (ref), cryoModule (ref), t_1 (ref), createCommonSocialUpsellBannerConfig (ref)
	local modalVariant = t[p1.modal_variant] or socialUpsellType.Unknown
	local t_2 = {}
	local var1 = getDeepValue(p1, "modal_layout.buttons")
	local var2 = getCountdownLabelItem(p1)
	
	if var2 then
		table.insert(t_2, var2)
	end
	return createCommonSocialUpsellBannerConfig({
		type = modalVariant,
		title = getDeepValue(p1, "modal_layout.header.text"),
		body = getDeepValue(p1, "modal_layout.body.text"),
		isDismissable = getDeepValue(p1, "modal_layout.dismissible"),
		labelItems = t_2,
		buttons = cryoModule.List.filterMap(var1, function(p2)
			-- upvalues: t_1 (copy)
			local var3 = if p2.action and p2.action.type then t_1[p2.action.type] else nil
			
			return if var3 and p2.text then { text = p2.text, action = var3 } else nil
		end)
	})
end