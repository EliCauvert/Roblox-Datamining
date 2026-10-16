local Result1 = false
local Success, Result = pcall(function() --[[ Line: 8 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
Result1 = Success and Result
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))
local Character = utf8.char(57344)

function IsPlayerVerified(UserId) --[[ Line: 23 ]]
	-- upvalues: Players (copy)
	local Player = Players:GetPlayerByUserId(UserId)
	
	if Player then
		local Success, Result = pcall(function() --[[ Line: 30 ]]
			-- upvalues: Player (copy)
			return Player.HasVerifiedBadge
		end)
		
		return if Success then Result else false
	else
		return false
	end
end

function AppendVerifiedBadge(Text): string --[[ Line: 37 ]]
	-- upvalues: Character (copy)
	return Text .. Character
end

function CreateMessageLabel(p1, OriginalChannel, Callback) --[[ Line: 41 ]]
	-- upvalues: ChatSettingsModule (copy), UtilModule (copy), Result1 (ref)
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
	local Tags = ExtraData.Tags or {}
	local Formatted = string.format("[%s]:", SpeakerDisplayName)
	local _ = UtilModule:GetStringTextBounds(Formatted, _Font, TextSize)
	local NewNumberOfSpaces = UtilModule:GetNumberOfSpaces(Formatted, _Font, TextSize) + 1
	local BaseMessage, BaseMessage2 = UtilModule:CreateBaseMessage("", _Font, TextSize, ChatColor)
	local AddNameButtonToBaseMessageResult = UtilModule:AddNameButtonToBaseMessage(BaseMessage2, NameColor, Formatted, FromSpeaker)
	local AddChannelButtonToBaseMessageResult = nil
	local _UDim2 = UDim2.new(0, 0, 0, 0)
	
	if OriginalChannel ~= p1.OriginalChannel then
		local Formatted1 = string.format("{%s}", p1.OriginalChannel)
		AddChannelButtonToBaseMessageResult = UtilModule:AddChannelButtonToBaseMessage(BaseMessage2, ChannelColor, Formatted1, p1.OriginalChannel)
		_UDim2 = UDim2.new(0, AddChannelButtonToBaseMessageResult.Size.X.Offset + UtilModule:GetStringTextBounds(" ", _Font, TextSize).X, 0, 0)
		NewNumberOfSpaces = NewNumberOfSpaces + UtilModule:GetNumberOfSpaces(Formatted1, _Font, TextSize) + 1
	end
	local AddTagLabelToBaseMessageResults = {}
	
	for _, tag in pairs(Tags) do
		local Formatted2 = string.format("[%s] ", tag.TagText or "???")
		local AddTagLabelToBaseMessageResult = UtilModule:AddTagLabelToBaseMessage(BaseMessage2, tag.TagColor or Color3.fromRGB(255, 0, 255), Formatted2)
		AddTagLabelToBaseMessageResult.Position = _UDim2
		NewNumberOfSpaces += UtilModule:GetNumberOfSpaces(Formatted2, _Font, TextSize)
		_UDim2 += UDim2.new(0, AddTagLabelToBaseMessageResult.Size.X.Offset, 0, 0)
		table.insert(AddTagLabelToBaseMessageResults, AddTagLabelToBaseMessageResult)
	end
	AddNameButtonToBaseMessageResult.Position = _UDim2
	local Flag = false
	local AddTranslationButtonToBaseMessageResult = nil
	
	if Result1 then
		pcall(function() --[[ Line: 105 ]]
			-- upvalues: AddTranslationButtonToBaseMessageResult (ref), UtilModule (upval), BaseMessage2 (copy), _UDim2 (ref), AddNameButtonToBaseMessageResult (copy)
			AddTranslationButtonToBaseMessageResult = UtilModule:AddTranslationButtonToBaseMessage(BaseMessage2)
			_UDim2 += UDim2.new(0, AddNameButtonToBaseMessageResult.Size.X.Offset + 2, 0, 0)
			AddTranslationButtonToBaseMessageResult.Position = _UDim2
		end)
	end
	local function useOriginalText(p2) --[[ Line: 112 ]]
		-- upvalues: Flag (ref), p1 (copy), BaseMessage2 (copy), UtilModule (upval), NewNumberOfSpaces (ref)
		Flag = false
		
		if p1.IsFiltered then
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.Message)
			
			return
		else
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. string.rep("_", p2.MessageLengthUtf8 or p2.MessageLength)
		end
	end
	
	local function _(p2) --[[ Line: 122 | Named "useTranslatedText" ]]
		-- upvalues: AddTranslationButtonToBaseMessageResult (ref), NewNumberOfSpaces (ref), Flag (ref), useOriginalText (copy), BaseMessage2 (copy), UtilModule (upval)
		if AddTranslationButtonToBaseMessageResult == nil then return end
		if AddTranslationButtonToBaseMessageResult.Visible == false then
			NewNumberOfSpaces += 6
		end
		AddTranslationButtonToBaseMessageResult.Visible = true
		Flag = true
		
		if p2.TranslatedMessage == "" then
			useOriginalText(p2)
			
			return
		else
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.TranslatedMessage)
		end
	end
	
	local _ = function(p2) --[[ Line: 142 | Named "UpdateTextFunction_Chat" ]]
		-- upvalues: p1 (copy), AddTranslationButtonToBaseMessageResult (ref), NewNumberOfSpaces (ref), Flag (ref), useOriginalText (copy), BaseMessage2 (copy), UtilModule (upval)
		p1.TranslatedMessage = p2.TranslatedMessage
		
		if not p2.TranslatedMessage then
			useOriginalText(p2)
			
			return
		end
		if AddTranslationButtonToBaseMessageResult == nil then return end
		if AddTranslationButtonToBaseMessageResult.Visible == false then
			NewNumberOfSpaces += 6
		end
		AddTranslationButtonToBaseMessageResult.Visible = true
		Flag = true
		
		if p2.TranslatedMessage == "" then
			useOriginalText(p2)
			
			return
		else
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.TranslatedMessage)
		end
	end
	
	local function UpdateTextFunction(p2) --[[ Line: 151 ]]
		-- upvalues: Result1 (upval), p1 (copy), AddTranslationButtonToBaseMessageResult (ref), NewNumberOfSpaces (ref), Flag (ref), useOriginalText (copy), BaseMessage2 (copy), UtilModule (upval)
		if Result1 then
			p1.TranslatedMessage = p2.TranslatedMessage
			
			if not p2.TranslatedMessage then
				useOriginalText(p2)
				
				return
			end
			if AddTranslationButtonToBaseMessageResult == nil then return end
			if AddTranslationButtonToBaseMessageResult.Visible == false then
				NewNumberOfSpaces += 6
			end
			AddTranslationButtonToBaseMessageResult.Visible = true
			Flag = true
			
			if p2.TranslatedMessage == "" then
				useOriginalText(p2)
				
				return
			else
				BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.TranslatedMessage)
				
				return
			end
		elseif p1.IsFiltered then
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p2.Message)
			
			return
		else
			BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. string.rep("_", p2.MessageLengthUtf8 or p2.MessageLength)
		end
	end
	
	local _ = function() --[[ Line: 164 | Named "toggleTranslation" ]]
		-- upvalues: Flag (ref), p1 (copy), AddTranslationButtonToBaseMessageResult (ref), NewNumberOfSpaces (ref), useOriginalText (copy), BaseMessage2 (copy), UtilModule (upval), Callback (copy)
		if Flag or not p1.TranslatedMessage then
			useOriginalText(p1)
		elseif AddTranslationButtonToBaseMessageResult ~= nil then
			if AddTranslationButtonToBaseMessageResult.Visible == false then
				NewNumberOfSpaces += 6
			end
			AddTranslationButtonToBaseMessageResult.Visible = true
			Flag = true
			
			if p1.TranslatedMessage == "" then
				useOriginalText(p1)
			else
				BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p1.TranslatedMessage)
			end
		end
		if Callback then
			Callback()
		end
	end
	
	if Result1 and AddTranslationButtonToBaseMessageResult ~= nil then
		local MouseButton1ClickConnection = AddTranslationButtonToBaseMessageResult.MouseButton1Click:connect(function() --[[ Line: 176 ]]
			-- upvalues: Flag (ref), p1 (copy), AddTranslationButtonToBaseMessageResult (ref), NewNumberOfSpaces (ref), useOriginalText (copy), BaseMessage2 (copy), UtilModule (upval), Callback (copy)
			if Flag or not p1.TranslatedMessage then
				useOriginalText(p1)
			elseif AddTranslationButtonToBaseMessageResult ~= nil then
				if AddTranslationButtonToBaseMessageResult.Visible == false then
					NewNumberOfSpaces += 6
				end
				AddTranslationButtonToBaseMessageResult.Visible = true
				Flag = true
				
				if p1.TranslatedMessage == "" then
					useOriginalText(p1)
				else
					BaseMessage2.Text = UtilModule:CreateLeadingSpaces(NewNumberOfSpaces) .. UtilModule:SanitizeForRichText(p1.TranslatedMessage)
				end
			end
			if Callback then
				Callback()
			end
		end)
		local Connection = nil
		Connection = AddTranslationButtonToBaseMessageResult.Changed:connect(function(p2) --[[ Line: 181 ]]
			-- upvalues: MouseButton1ClickConnection (copy), Connection (ref)
			if p2 == "Parent" then
				MouseButton1ClickConnection:Disconnect()
				Connection:Disconnect()
			end
		end)
	end
	UpdateTextFunction(p1)
	
	local function GetHeightFunction(p2) --[[ Line: 191 ]]
		-- upvalues: UtilModule (upval), BaseMessage2 (copy), BaseMessage (copy)
		return UtilModule:GetMessageHeight(BaseMessage2, BaseMessage, p2)
	end
	
	local config = {
		[AddNameButtonToBaseMessageResult] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if Result1 and AddTranslationButtonToBaseMessageResult ~= nil then
		config[AddTranslationButtonToBaseMessageResult] = { ImageTransparency = { FadedIn = 0, FadedOut = 1 } }
	end
	config[BaseMessage2] = {
		TextTransparency = { FadedIn = 0, FadedOut = 1 },
		TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
	}
	
	for i, addTagLabelToBaseMessageResult in pairs(AddTagLabelToBaseMessageResults) do
		local _ = string.format("Tag%d", i)
		config[addTagLabelToBaseMessageResult] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
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
	[UtilModule.KEY_MESSAGE_TYPE] = ChatConstantsModule.MessageTypeDefault,
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}