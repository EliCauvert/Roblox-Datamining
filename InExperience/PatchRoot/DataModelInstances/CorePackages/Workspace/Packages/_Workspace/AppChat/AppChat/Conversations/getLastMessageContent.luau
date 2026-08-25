local localizationService = game:GetService("LocalizationService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local sharedFlagsModule = require(parent.SharedFlags)
local url = require(parent.Http).Url
local localization = require(parent.RobloxAppLocales).Localization
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local messageModelModule = require(appChat.Models.MessageModel)
local getFFlagEnableSocialCards = sharedFlagsModule.GetFFlagEnableSocialCards

local function getMessageContent(p0)
	-- upvalues: messageModelModule (ref), localization (ref), localizationService (ref), enumMessageTypesModule (ref), url (ref), getFFlagEnableSocialCards (ref)
	return if p0.previewContent then p0.previewContent elseif p0.visibility == messageModelModule.VisibilityTypes.Hidden then localization.new(localizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable") elseif p0.messageType == enumMessageTypesModule.Link then url.WWW_URL .. "games/" .. p0.gameLink.universeId elseif getFFlagEnableSocialCards() and p0.messageType == enumMessageTypesModule.System and p0.cards then p0.cards[1] and p0.cards[1].alt_text else tostring(p0.content)
end

return function(p1)
	-- upvalues: getDeepValueModule (ref), getMessageContent (ref)
	local var7 = getDeepValueModule(p1, "messages.values")
	local previewMessageId = p1.previewMessageId
	
	return if previewMessageId and var7 and var7[previewMessageId] then getMessageContent(var7[previewMessageId]) elseif p1.previewContent then p1.previewContent else nil
end