local AppChat = script:FindFirstAncestor("AppChat")
local ShareLinkClassificationModule = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local FFlagAppChatMomentAssetCardModule = require(AppChat.Flags.FFlagAppChatMomentAssetCard)

return function(p1): boolean --[[ Line: 12 | Named "isAssetCardClassification" ]]
	-- upvalues: FFlagAppChatPlusReferralAssetCardModule (copy), ShareLinkClassificationModule (copy), FFlagAppChatMomentAssetCardModule (copy)
	return p1 ~= nil and (FFlagAppChatPlusReferralAssetCardModule and p1.type == ShareLinkClassificationModule.PlusReferral or (FFlagAppChatMomentAssetCardModule and p1.type == ShareLinkClassificationModule.Moment or false))
end