local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local SocialUpsellModule = require(Parent.SocialUpsell)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local SocialUpsellType = require(Parent.SocialUpsell).Enums.SocialUpsellType
local GetDeepValueFunction = require(Parent.SocialCommon).Utils.getDeepValue
local CreateCommonSocialUpsellBannerConfigFunction = SocialUpsellModule.Utils.createCommonSocialUpsellBannerConfig
local Constants = SocialUpsellModule.Constants
local ChatLandingModalVariant = AppChatNetworkingModule.Constants.ChatLandingModalVariant
local ConversationBottomModal = AppChatNetworkingModule.Constants.ConversationBottomModal
local config = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = SocialUpsellType.FacialAgeEstimation,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = SocialUpsellType.FacialAgeEstimation,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = SocialUpsellType.ConversationFacialAgeEstimation,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = SocialUpsellType.ConversationFacialAgeEstimation
}
local config1 = {
	open_fae_upsell = Constants.UPSELL_BUTTON_ACTION.Primary,
	open_fae_view_details = Constants.UPSELL_BUTTON_ACTION.Secondary,
	dismiss = Constants.UPSELL_BUTTON_ACTION.Dismiss
}

local function getCountdownLabelItem(p1)
	-- upvalues: GetDeepValueFunction (copy), CryoModule (copy), AppChatNetworkingModule (copy), Constants (copy)
	local v1 = nil
	local ModalLayoutHeaderAdditionalContent = GetDeepValueFunction(p1, "modal_layout.header.additional_content")
	
	if ModalLayoutHeaderAdditionalContent then
		local Where = CryoModule.List.findWhere(ModalLayoutHeaderAdditionalContent, function(p2): boolean
			-- upvalues: AppChatNetworkingModule (upval)
			return p2.type == AppChatNetworkingModule.Constants.ModalContentType.Countdown
		end)
		
		if Where and ModalLayoutHeaderAdditionalContent[Where].text then
			v1 = {
				type = Constants.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN,
				text = ModalLayoutHeaderAdditionalContent[Where].text
			}
		end
	end
	return v1
end

local function _(p1)
	-- upvalues: config1 (copy)
	return if p1.action and p1.action.type then config1[p1.action.type] else nil
end

return function(p1)
	-- upvalues: config (copy), SocialUpsellType (copy), GetDeepValueFunction (copy), getCountdownLabelItem (copy), CryoModule (copy), config1 (copy), CreateCommonSocialUpsellBannerConfigFunction (copy)
	local Entry = config[p1.modal_variant] or SocialUpsellType.Unknown
	local LabelItems = {}
	local ModalLayoutButtons = GetDeepValueFunction(p1, "modal_layout.buttons")
	local CountdownLabelItem = getCountdownLabelItem(p1)
	
	if CountdownLabelItem then
		table.insert(LabelItems, CountdownLabelItem)
	end
	return CreateCommonSocialUpsellBannerConfigFunction({
		type = Entry,
		title = GetDeepValueFunction(p1, "modal_layout.header.text"),
		body = GetDeepValueFunction(p1, "modal_layout.body.text"),
		isDismissable = GetDeepValueFunction(p1, "modal_layout.dismissible"),
		labelItems = LabelItems,
		buttons = CryoModule.List.filterMap(ModalLayoutButtons, function(p2)
			-- upvalues: config1 (upval)
			local Entry = if p2.action and p2.action.type then config1[p2.action.type] else nil
			
			return if Entry and p2.text then { text = p2.text, action = Entry } else nil
		end)
	})
end