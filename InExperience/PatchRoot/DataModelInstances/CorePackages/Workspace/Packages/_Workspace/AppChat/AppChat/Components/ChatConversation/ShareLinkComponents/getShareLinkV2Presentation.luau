local AppChat = script:FindFirstAncestor("AppChat")
local ShareLinkClassificationModule = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local ShareLinkV2PresentationModule = require(script.Parent.ShareLinkV2Presentation)
local IsAssetCardClassificationModule = require(script.Parent.isAssetCardClassification)
local FFlagAppChatMomentShareCardModule = require(AppChat.Flags.FFlagAppChatMomentShareCard)
local DataStatus = require(AppChat.Parent.DataHydration).DataStatus

return function(p1, NotReady)
	-- upvalues: DataStatus (copy), ShareLinkV2PresentationModule (copy), FFlagAppChatMomentShareCardModule (copy), ShareLinkClassificationModule (copy), IsAssetCardClassificationModule (copy)
	return if p1 == nil then if NotReady == DataStatus.NotReady then ShareLinkV2PresentationModule.Loading else ShareLinkV2PresentationModule.Fallback elseif FFlagAppChatMomentShareCardModule and p1.type == ShareLinkClassificationModule.Moment then ShareLinkV2PresentationModule.Card elseif IsAssetCardClassificationModule(p1) then ShareLinkV2PresentationModule.Card else ShareLinkV2PresentationModule.Fallback
end