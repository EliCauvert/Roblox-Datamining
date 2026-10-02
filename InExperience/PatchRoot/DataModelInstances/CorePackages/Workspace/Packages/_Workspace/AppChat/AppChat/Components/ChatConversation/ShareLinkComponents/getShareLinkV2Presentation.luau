local appChat = script:FindFirstAncestor("AppChat")
local dataHydrationModule = require(appChat.Parent.DataHydration)
local shareLinkClassificationModule = require(appChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local shareLinkV2PresentationModule = require(script.Parent.ShareLinkV2Presentation)
local fFlagAppChatMomentShareCardModule = require(appChat.Flags.FFlagAppChatMomentShareCard)
local dataStatus = dataHydrationModule.DataStatus

return function(p1, p2)
	-- upvalues: dataStatus (ref), shareLinkV2PresentationModule (ref), fFlagAppChatMomentShareCardModule (ref), shareLinkClassificationModule (ref)
	return if p1 == nil then if p2 == dataStatus.NotReady then shareLinkV2PresentationModule.Loading else shareLinkV2PresentationModule.Fallback elseif fFlagAppChatMomentShareCardModule and p1.type == shareLinkClassificationModule.Moment then shareLinkV2PresentationModule.Card else shareLinkV2PresentationModule.Fallback
end