local AppChat = script:FindFirstAncestor("AppChat")
local ShareLinkClassificationModule = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local FFlagAppChatMomentAssetCardModule = require(AppChat.Flags.FFlagAppChatMomentAssetCard)
local FFlagAppChatGenericShareLinkCardModule = require(AppChat.Flags.FFlagAppChatGenericShareLinkCard)

return function(p1): boolean
	-- upvalues: FFlagAppChatPlusReferralAssetCardModule (copy), ShareLinkClassificationModule (copy), FFlagAppChatMomentAssetCardModule (copy), FFlagAppChatGenericShareLinkCardModule (copy)
	return p1 ~= nil and (FFlagAppChatPlusReferralAssetCardModule and p1.type == ShareLinkClassificationModule.PlusReferral or (FFlagAppChatMomentAssetCardModule and p1.type == ShareLinkClassificationModule.Moment or FFlagAppChatGenericShareLinkCardModule and (p1.type == ShareLinkClassificationModule.Unhandled or p1.type == ShareLinkClassificationModule.Invalid)))
end