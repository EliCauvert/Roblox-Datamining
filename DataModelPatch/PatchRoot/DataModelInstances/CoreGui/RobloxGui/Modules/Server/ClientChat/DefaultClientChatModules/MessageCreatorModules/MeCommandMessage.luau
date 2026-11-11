local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))

function CreateMeCommandMessageLabel(p1, OriginalChannel)
	-- upvalues: ChatSettingsModule (copy), UtilModule (copy)
	local _ = p1.Message
	local ExtraData = p1.ExtraData or {}
	local _Font = ExtraData.Font or Enum.Font.SourceSansItalic
	local TextSize = ExtraData.TextSize or ChatSettingsModule.ChatWindowTextSize
	local _Color3 = Color3.new(1, 1, 1)
	local ChannelColor = ExtraData.ChannelColor or _Color3
	local NewNumberOfSpaces = 0
	local BaseMessage, BaseMessage2 = UtilModule:CreateBaseMessage("", _Font, TextSize, _Color3)
	local AddChannelButtonToBaseMessageResult = nil
	
	if OriginalChannel ~= p1.OriginalChannel then
		local Formatted = string.format("{%s}", p1.OriginalChannel)
		AddChannelButtonToBaseMessageResult = UtilModule:AddChannelButtonToBaseMessage(BaseMessage2, ChannelColor, Formatted, p1.OriginalChannel)
		NewNumberOfSpaces = UtilModule:GetNumberOfSpaces(Formatted, _Font, TextSize) + 1
	end
	local function UpdateTextFunction(p2)
		-- upvalues: p1 (copy), BaseMessage2 (copy), UtilModule (upval), NewNumberOfSpaces (ref)
		if p1.IsFiltered then
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.FromSpeaker .. " " .. string.sub(p2.Message, 5))
			
			return
		else
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. string.rep("_", utf8.len(utf8.nfcnormalize(p2.FromSpeaker)) + (p2.MessageLengthUtf8 or p2.MessageLength) - 4)
		end
	end
	
	UpdateTextFunction(p1)
	
	local function GetHeightFunction(p2)
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
		[UtilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[UtilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[UtilModule.KEY_FADE_IN] = FadeFunctions,
		[UtilModule.KEY_FADE_OUT] = FadeFunctions2,
		[UtilModule.KEY_UPDATE_ANIMATION] = FadeFunctions3
	}
end

return {
	[UtilModule.KEY_MESSAGE_TYPE] = ChatConstantsModule.MessageTypeMeCommand,
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateMeCommandMessageLabel
}