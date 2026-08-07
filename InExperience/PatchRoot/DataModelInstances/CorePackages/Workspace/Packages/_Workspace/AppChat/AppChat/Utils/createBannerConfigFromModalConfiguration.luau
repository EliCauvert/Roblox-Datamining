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

local function getCountdownLabelItem(p0) --[[ line: 44 ]]
	-- upvalues: getDeepValue (ref), cryoModule (ref), appChatNetworkingModule (ref), constants (ref)
	local t = nil
	local var8 = getDeepValue(p0, "modal_layout.header.additional_content")
	
	if var8 then
		local var9 = cryoModule.List.findWhere(var8, function(p1) --[[ line: 48 ]]
			-- upvalues: appChatNetworkingModule (copy)
			return p1.type == appChatNetworkingModule.Constants.ModalContentType.Countdown
		end)
		
		if var9 and var8[var9].text then
			t = {
				type = constants.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN,
				text = var8[var9].text
			}
		end
	end
	return t
end

local function _(p2) --[[ line: 62 | named "getButtonAction" ]]
	-- upvalues: t_1 (ref)
	return if p2.action and p2.action.type then t_1[p2.action.type] else nil
end

return function(p3) --[[ line: 69 ]]
	-- upvalues: t (ref), socialUpsellType (ref), getDeepValue (ref), getCountdownLabelItem (ref), cryoModule (ref), t_1 (ref), createCommonSocialUpsellBannerConfig (ref)
	local modalVariant = t[p3.modal_variant] or socialUpsellType.Unknown
	local t_2 = {}
	local var12 = getDeepValue(p3, "modal_layout.buttons")
	local var13 = getCountdownLabelItem(p3)
	
	if var13 then
		table.insert(t_2, var13)
	end
	return createCommonSocialUpsellBannerConfig({
		type = modalVariant,
		title = getDeepValue(p3, "modal_layout.header.text"),
		body = getDeepValue(p3, "modal_layout.body.text"),
		isDismissable = getDeepValue(p3, "modal_layout.dismissible"),
		labelItems = t_2,
		buttons = cryoModule.List.filterMap(var12, function(p4) --[[ line: 79 ]]
			-- upvalues: t_1 (copy)
			local var14 = if p4.action and p4.action.type then t_1[p4.action.type] else nil
			
			return if var14 and p4.text then { text = p4.text, action = var14 } else nil
		end)
	})
end