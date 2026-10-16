local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))
pcall(function() --[[ Line: 12 ]]
	ChatLocalization = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function CreateWelcomeMessageLabel(p1, OriginalChannel) --[[ Line: 14 ]]
	-- upvalues: ChatSettingsModule (copy), UtilModule (copy)
	local Message = p1.Message
	
	if ChatLocalization and ChatLocalization.LocalizeFormattedMessage then
		Message = ChatLocalization:LocalizeFormattedMessage(Message)
	end
	local ExtraData = p1.ExtraData or {}
	local _Font = ExtraData.Font or ChatSettingsModule.DefaultFont
	local FontSize = ExtraData.FontSize or ChatSettingsModule.ChatWindowTextSize
	local ChatColor = ExtraData.ChatColor or ChatSettingsModule.DefaultMessageColor
	local ChannelColor = ExtraData.ChannelColor or ChatColor
	local BaseMessage, BaseMessage2 = UtilModule:CreateBaseMessage(Message, _Font, FontSize, ChatColor)
	local AddChannelButtonToBaseMessageResult = nil
	
	if OriginalChannel ~= p1.OriginalChannel then
		local Formatted = string.format("{%s}", if ChatLocalization.tryLocalize then ChatLocalization:tryLocalize(p1.OriginalChannel) else p1.OriginalChannel)
		AddChannelButtonToBaseMessageResult = UtilModule:AddChannelButtonToBaseMessage(BaseMessage2, ChannelColor, Formatted, p1.OriginalChannel)
		BaseMessage2.Text = UtilModule:CreateLeadingSpaces(UtilModule:GetNumberOfSpaces(Formatted, _Font, FontSize) + 1) .. UtilModule:SanitizeForRichText(Message)
	end
	local function GetHeightFunction(p2) --[[ Line: 39 ]]
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
	[UtilModule.KEY_MESSAGE_TYPE] = ChatConstantsModule.MessageTypeWelcome,
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateWelcomeMessageLabel
}