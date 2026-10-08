local appChat = script:FindFirstAncestor("AppChat")
local shareLinkClassificationModule = require(appChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local fFlagAppChatPlusReferralAssetCardModule = require(appChat.Flags.FFlagAppChatPlusReferralAssetCard)
local fFlagAppChatMomentAssetCardModule = require(appChat.Flags.FFlagAppChatMomentAssetCard)

return function(value)
	-- upvalues: fFlagAppChatPlusReferralAssetCardModule (ref), shareLinkClassificationModule (ref), fFlagAppChatMomentAssetCardModule (ref)
	return if value == nil then false elseif fFlagAppChatPlusReferralAssetCardModule and value.type == shareLinkClassificationModule.PlusReferral then true else fFlagAppChatMomentAssetCardModule and value.type == shareLinkClassificationModule.Moment
end