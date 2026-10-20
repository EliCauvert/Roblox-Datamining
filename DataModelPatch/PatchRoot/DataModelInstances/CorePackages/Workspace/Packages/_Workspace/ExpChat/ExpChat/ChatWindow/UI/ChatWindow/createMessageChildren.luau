local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary
local TranslatedTextMessageModule = require(script:FindFirstAncestor("UI").TranslatedTextMessage)
local GetResult = require(Parent.UserProfiles).Stores.VerifiedBadgeDisplayStore.get()
local FFlagEnableVerifiedBadgeStore = require(Parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local EnableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local FFlagExpChatRewriteInlineModule = require(ExpChat.Flags.FFlagExpChatRewriteInline)

return function(p1)
	-- upvalues: Dictionary (copy), FFlagEnableVerifiedBadgeStore (copy), GetResult (copy), ReactModule (copy), TranslatedTextMessageModule (copy), EnableInExpChatRewriteEngineFeature (copy), FFlagExpChatRewriteInlineModule (copy)
	local VerifiedUserIds = p1.verifiedUserIds
	local TextTransparency = p1.textTransparency
	local TransparencyValue = p1.transparencyValue
	local ChatWindowSettings = p1.chatWindowSettings
	local ShowTranslationButton = p1.showTranslationButton
	local IsSpatialUIEnabled = p1.isSpatialUIEnabled
	local OnTextMessageLabelButtonActivated = p1.onTextMessageLabelButtonActivated
	local MapResult = Dictionary.map(p1.messages, function(Message, LayoutOrder)
		-- upvalues: FFlagEnableVerifiedBadgeStore (upval), GetResult (upval), Dictionary (upval), VerifiedUserIds (copy), ReactModule (upval), TranslatedTextMessageModule (upval), TextTransparency (copy), EnableInExpChatRewriteEngineFeature (upval), TransparencyValue (copy), OnTextMessageLabelButtonActivated (copy), ChatWindowSettings (copy), ShowTranslationButton (copy), IsSpatialUIEnabled (copy), FFlagExpChatRewriteInlineModule (upval)
		if Message.isVisibleInChatWindow then
			return ReactModule.createElement(TranslatedTextMessageModule, {
				message = Message,
				LayoutOrder = LayoutOrder,
				isUserVerified = if FFlagEnableVerifiedBadgeStore then if Message.userId then GetResult.isBadgeVisible((tonumber(Message.userId))) else false elseif Message.userId then Dictionary.has(VerifiedUserIds, Message.userId) else false,
				textTransparency = TextTransparency,
				transparencyValue = if EnableInExpChatRewriteEngineFeature then TransparencyValue else nil,
				onTextMessageLabelButtonActivated = OnTextMessageLabelButtonActivated,
				chatWindowSettings = ChatWindowSettings,
				showTranslationButton = ShowTranslationButton,
				isSpatialUIEnabled = IsSpatialUIEnabled,
				onToggle = function() end,
				chatWindowTransparencyBindable = if FFlagExpChatRewriteInlineModule then TransparencyValue else nil
			}), Message.messageId
		else
			return nil, nil
		end
	end)
	MapResult["$layout"] = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
	
	return MapResult
end