local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 12 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function CreateSystemMessageLabel(p1, OriginalChannel) --[[ Line: 14 ]]
	-- upvalues: ChatLocalizationModule (ref), ChatSettingsModule (copy), UtilModule (copy)
	local Message = p1.Message
	
	if ChatLocalizationModule and ChatLocalizationModule.LocalizeFormattedMessage then
		Message = ChatLocalizationModule:LocalizeFormattedMessage(Message)
	end
	local ExtraData = p1.ExtraData or {}
	local _Font = ExtraData.Font or ChatSettingsModule.DefaultFont
	local TextSize = ExtraData.TextSize or ChatSettingsModule.ChatWindowTextSize
	local ChatColor = ExtraData.ChatColor or ChatSettingsModule.DefaultMessageColor
	local ChannelColor = ExtraData.ChannelColor or ChatColor
	local BaseMessage, BaseMessage2 = UtilModule:CreateBaseMessage(Message, _Font, TextSize, ChatColor)
	BaseMessage2.AutoLocalize = true
	local AddChannelButtonToBaseMessageResult = nil
	
	if OriginalChannel ~= p1.OriginalChannel then
		local Formatted: string = if ChatLocalizationModule and p1.OriginalChannel == "System" then string.format("{%s}", (ChatLocalizationModule:Get("InGame.Chat.Label.SystemMessagePrefix", "System"))) elseif ChatLocalizationModule and p1.OriginalChannel == "Team" then string.format("{%s}", (ChatLocalizationModule:Get("InGame.Chat.Label.TeamMessagePrefix", "System"))) else string.format("{%s}", p1.OriginalChannel)
		AddChannelButtonToBaseMessageResult = UtilModule:AddChannelButtonToBaseMessage(BaseMessage2, ChannelColor, Formatted, p1.OriginalChannel)
		BaseMessage2.Text = UtilModule:CreateLeadingSpaces(UtilModule:GetNumberOfSpaces(Formatted, _Font, TextSize) + 1) .. UtilModule:SanitizeForRichText(Message)
	end
	local function GetHeightFunction(p2) --[[ Line: 45 ]]
		-- upvalues: UtilModule (upval), BaseMessage2 (copy), BaseMessage (copy)
		return UtilModule:GetMessageHeight(BaseMessage2, BaseMessage, p2)
	end
	
	local config = {
		[BaseMessage2] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if AddChannelButtonToBaseMessageResult then
		config[AddChannelButtonToBaseMessageResult] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local FadeFunctions, FadeFunctions2, FadeFunctions3 = UtilModule:CreateFadeFunctions(config)
	
	return {
		[UtilModule.KEY_BASE_FRAME] = BaseMessage,
		[UtilModule.KEY_BASE_MESSAGE] = BaseMessage2,
		[UtilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[UtilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[UtilModule.KEY_FADE_IN] = FadeFunctions,
		[UtilModule.KEY_FADE_OUT] = FadeFunctions2,
		[UtilModule.KEY_UPDATE_ANIMATION] = FadeFunctions3
	}
end

return {
	[UtilModule.KEY_MESSAGE_TYPE] = ChatConstantsModule.MessageTypeSystem,
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
}