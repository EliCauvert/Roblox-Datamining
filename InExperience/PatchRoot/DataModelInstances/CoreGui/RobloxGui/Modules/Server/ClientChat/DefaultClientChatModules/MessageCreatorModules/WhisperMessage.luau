local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))
local Character = utf8.char(57344)
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 22 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function IsPlayerVerified(UserId) --[[ Line: 24 ]]
	-- upvalues: Players (copy)
	local Player = Players:GetPlayerByUserId(UserId)
	
	if Player then
		local Success, Result = pcall(function() --[[ Line: 31 ]]
			-- upvalues: Player (copy)
			return Player.HasVerifiedBadge
		end)
		
		return if Success then Result else false
	else
		return false
	end
end

function AppendVerifiedBadge(Text): string --[[ Line: 38 ]]
	-- upvalues: Character (copy)
	return Text .. Character
end

function CreateMessageLabel(p1, OriginalChannel) --[[ Line: 42 ]]
	-- upvalues: ChatSettingsModule (copy), UtilModule (copy), LocalPlayer (ref), ChatLocalizationModule (ref)
	local FromSpeaker = p1.FromSpeaker
	local SpeakerDisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled and p1.SpeakerDisplayName then p1.SpeakerDisplayName else FromSpeaker
	
	if IsPlayerVerified(p1.SpeakerUserId) then
		SpeakerDisplayName = AppendVerifiedBadge(SpeakerDisplayName)
	end
	local _ = p1.Message
	local ExtraData = p1.ExtraData or {}
	local _Font = ExtraData.Font or ChatSettingsModule.DefaultFont
	local TextSize = ExtraData.TextSize or ChatSettingsModule.ChatWindowTextSize
	local NameColor = ExtraData.NameColor or ChatSettingsModule.DefaultNameColor
	local ChatColor = ExtraData.ChatColor or ChatSettingsModule.DefaultMessageColor
	local ChannelColor = ExtraData.ChannelColor or ChatColor
	local Formatted = string.format("[%s]:", SpeakerDisplayName)
	local _ = UtilModule:GetStringTextBounds(Formatted, _Font, TextSize)
	local NewNumberOfSpaces = UtilModule:GetNumberOfSpaces(Formatted, _Font, TextSize) + 1
	local BaseMessage, BaseMessage2 = UtilModule:CreateBaseMessage("", _Font, TextSize, ChatColor)
	local AddNameButtonToBaseMessageResult = UtilModule:AddNameButtonToBaseMessage(BaseMessage2, NameColor, Formatted, FromSpeaker)
	local AddChannelButtonToBaseMessageResult = nil
	
	if OriginalChannel ~= p1.OriginalChannel then
		local Formatted1 = if p1.FromSpeaker ~= LocalPlayer.Name then string.format("From %s", p1.FromSpeaker) else p1.OriginalChannel
		
		if ChatLocalizationModule.tryLocalize then
			Formatted1 = ChatLocalizationModule:tryLocalize(Formatted1)
		end
		local Formatted11 = string.format("{%s}", Formatted1)
		AddChannelButtonToBaseMessageResult = UtilModule:AddChannelButtonToBaseMessage(BaseMessage2, ChannelColor, Formatted11, p1.OriginalChannel)
		AddNameButtonToBaseMessageResult.Position = UDim2.new(0, AddChannelButtonToBaseMessageResult.Size.X.Offset + UtilModule:GetStringTextBounds(" ", _Font, TextSize).X, 0, 0)
		NewNumberOfSpaces = NewNumberOfSpaces + UtilModule:GetNumberOfSpaces(Formatted11, _Font, TextSize) + 1
	end
	local function UpdateTextFunction(p2) --[[ Line: 92 ]]
		-- upvalues: p1 (copy), BaseMessage2 (copy), UtilModule (upval), NewNumberOfSpaces (ref)
		if p1.IsFiltered then
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.Message)
			
			return
		else
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. string.rep("_", p2.MessageLengthUtf8 or p2.MessageLength)
		end
	end
	
	UpdateTextFunction(p1)
	
	local function GetHeightFunction(p2) --[[ Line: 103 ]]
		-- upvalues: UtilModule (upval), BaseMessage2 (copy), BaseMessage (copy)
		return UtilModule:GetMessageHeight(BaseMessage2, BaseMessage, p2)
	end
	
	local config = {
		[AddNameButtonToBaseMessageResult] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		},
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
	[UtilModule.KEY_MESSAGE_TYPE] = ChatConstantsModule.MessageTypeWhisper,
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}