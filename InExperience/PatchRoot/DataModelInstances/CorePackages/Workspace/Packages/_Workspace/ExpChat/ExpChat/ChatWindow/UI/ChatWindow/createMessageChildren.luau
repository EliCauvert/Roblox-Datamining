local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary
local translatedTextMessageModule = require(script:FindFirstAncestor("UI").TranslatedTextMessage)
local var3 = require(parent.UserProfiles).Stores.VerifiedBadgeDisplayStore.get()
local fFlagEnableVerifiedBadgeStore = require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local enableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local fFlagExpChatRewriteInlineModule = require(expChat.Flags.FFlagExpChatRewriteInline)

return function(p0) --[[ line: 34 | named "createMessageChildren" ]]
	-- upvalues: dictionary (ref), fFlagEnableVerifiedBadgeStore (ref), var3 (ref), reactModule (ref), translatedTextMessageModule (ref), enableInExpChatRewriteEngineFeature (ref), fFlagExpChatRewriteInlineModule (ref)
	local messages = p0.messages
	local verifiedUserIds = p0.verifiedUserIds
	local textTransparency = p0.textTransparency
	local transparencyValue = p0.transparencyValue
	local chatWindowSettings = p0.chatWindowSettings
	local showTranslationButton = p0.showTranslationButton
	local isSpatialUIEnabled = p0.isSpatialUIEnabled
	local onTextMessageLabelButtonActivated = p0.onTextMessageLabelButtonActivated
	local var6 = dictionary.map(messages, function(p1, p2) --[[ line: 44 ]]
		-- upvalues: fFlagEnableVerifiedBadgeStore (copy), var3 (copy), dictionary (copy), verifiedUserIds (ref), reactModule (copy), translatedTextMessageModule (copy), textTransparency (ref), enableInExpChatRewriteEngineFeature (copy), transparencyValue (ref), onTextMessageLabelButtonActivated (ref), chatWindowSettings (ref), showTranslationButton (ref), isSpatialUIEnabled (ref), fFlagExpChatRewriteInlineModule (copy)
		if p1.isVisibleInChatWindow then
			return reactModule.createElement(translatedTextMessageModule, {
				message = p1,
				LayoutOrder = p2,
				isUserVerified = if fFlagEnableVerifiedBadgeStore then if p1.userId then var3.isBadgeVisible(tonumber(p1.userId)) else false elseif p1.userId then dictionary.has(verifiedUserIds, p1.userId) else false,
				textTransparency = textTransparency,
				transparencyValue = if enableInExpChatRewriteEngineFeature then transparencyValue else nil,
				onTextMessageLabelButtonActivated = onTextMessageLabelButtonActivated,
				chatWindowSettings = chatWindowSettings,
				showTranslationButton = showTranslationButton,
				isSpatialUIEnabled = isSpatialUIEnabled,
				onToggle = function() --[[ line: 64 ]] end,
				chatWindowTransparencyBindable = if fFlagExpChatRewriteInlineModule then transparencyValue else nil
			}), p1.messageId
		end
		return nil, nil
	end)
	var6["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
	
	return var6
end