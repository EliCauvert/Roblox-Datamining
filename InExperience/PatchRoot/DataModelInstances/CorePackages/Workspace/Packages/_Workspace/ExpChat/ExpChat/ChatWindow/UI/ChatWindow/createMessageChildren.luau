local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary
local translatedTextMessageModule = require(script:FindFirstAncestor("UI").TranslatedTextMessage)
local var1 = require(parent.UserProfiles).Stores.VerifiedBadgeDisplayStore.get()
local fFlagEnableVerifiedBadgeStore = require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local enableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local fFlagExpChatRewriteInlineModule = require(expChat.Flags.FFlagExpChatRewriteInline)

return function(p1)
	-- upvalues: dictionary (ref), fFlagEnableVerifiedBadgeStore (ref), var1 (ref), reactModule (ref), translatedTextMessageModule (ref), enableInExpChatRewriteEngineFeature (ref), fFlagExpChatRewriteInlineModule (ref)
	local messages = p1.messages
	local verifiedUserIds = p1.verifiedUserIds
	local textTransparency = p1.textTransparency
	local transparencyValue = p1.transparencyValue
	local chatWindowSettings = p1.chatWindowSettings
	local showTranslationButton = p1.showTranslationButton
	local isSpatialUIEnabled = p1.isSpatialUIEnabled
	local onTextMessageLabelButtonActivated = p1.onTextMessageLabelButtonActivated
	local var2 = dictionary.map(messages, function(p2, p3)
		-- upvalues: fFlagEnableVerifiedBadgeStore (copy), var1 (copy), dictionary (copy), verifiedUserIds (ref), reactModule (copy), translatedTextMessageModule (copy), textTransparency (ref), enableInExpChatRewriteEngineFeature (copy), transparencyValue (ref), onTextMessageLabelButtonActivated (ref), chatWindowSettings (ref), showTranslationButton (ref), isSpatialUIEnabled (ref), fFlagExpChatRewriteInlineModule (copy)
		if p2.isVisibleInChatWindow then
			return reactModule.createElement(translatedTextMessageModule, {
				message = p2,
				LayoutOrder = p3,
				isUserVerified = if fFlagEnableVerifiedBadgeStore then if p2.userId then var1.isBadgeVisible(tonumber(p2.userId)) else false elseif p2.userId then dictionary.has(verifiedUserIds, p2.userId) else false,
				textTransparency = textTransparency,
				transparencyValue = if enableInExpChatRewriteEngineFeature then transparencyValue else nil,
				onTextMessageLabelButtonActivated = onTextMessageLabelButtonActivated,
				chatWindowSettings = chatWindowSettings,
				showTranslationButton = showTranslationButton,
				isSpatialUIEnabled = isSpatialUIEnabled,
				onToggle = function() end,
				chatWindowTransparencyBindable = if fFlagExpChatRewriteInlineModule then transparencyValue else nil
			}), p2.messageId
		end
		return nil, nil
	end)
	var2["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
	
	return var2
end