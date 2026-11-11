local LocalizationService = game:GetService("LocalizationService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local Url = require(Parent.Http).Url
local Localization = require(Parent.RobloxAppLocales).Localization
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageModelModule = require(AppChat.Models.MessageModel)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards

local function getMessageContent(p1)
	-- upvalues: MessageModelModule (copy), Localization (copy), LocalizationService (copy), EnumMessageTypesModule (copy), Url (copy), GetFFlagEnableSocialCardsFunction (copy)
	return if p1.previewContent then p1.previewContent elseif p1.visibility == MessageModelModule.VisibilityTypes.Hidden then Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable") elseif p1.messageType == EnumMessageTypesModule.Link then Url.WWW_URL .. "games/" .. p1.gameLink.universeId elseif GetFFlagEnableSocialCardsFunction() and p1.messageType == EnumMessageTypesModule.System and p1.cards then p1.cards[1] and p1.cards[1].alt_text else tostring(p1.content)
end

return function(p1)
	-- upvalues: GetDeepValueModule (copy), getMessageContent (copy)
	local MessagesValues = GetDeepValueModule(p1, "messages.values")
	local PreviewMessageId = p1.previewMessageId
	
	return if PreviewMessageId and MessagesValues and MessagesValues[PreviewMessageId] then getMessageContent(MessagesValues[PreviewMessageId]) elseif p1.previewContent then p1.previewContent else nil
end