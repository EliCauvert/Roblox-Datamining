local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))
local char = utf8.char(57344)
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function IsPlayerVerified(p1)
	-- upvalues: playersService (ref)
	local var2 = playersService:GetPlayerByUserId(p1)
	
	if not var2 then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: var2 (ref)
		return var2.HasVerifiedBadge
	end)
	
	return if ok then status else false
end

function AppendVerifiedBadge(p1)
	-- upvalues: char (ref)
	return p1 .. char
end

function CreateMessageLabel(p1, p2)
	-- upvalues: chatSettingsModule (ref), utilModule (ref), localPlayer (write), var1 (write)
	local fromSpeaker = p1.FromSpeaker
	local _ = nil
	local var2 = if chatSettingsModule.PlayerDisplayNamesEnabled and p1.SpeakerDisplayName then p1.SpeakerDisplayName else fromSpeaker
	
	if IsPlayerVerified(p1.SpeakerUserId) then
		var2 = AppendVerifiedBadge(var2)
	end
	local _ = p1.Message
	local extraData = p1.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local nameColor = extraData.NameColor or chatSettingsModule.DefaultNameColor
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local formattedText = string.format("[%s]:", var2)
	local _ = utilModule:GetStringTextBounds(formattedText, font, textSize)
	local var3 = utilModule:GetNumberOfSpaces(formattedText, font, textSize) + 1
	local var4, var5 = utilModule:CreateBaseMessage("", font, textSize, chatColor)
	local var6 = utilModule:AddNameButtonToBaseMessage(var5, nameColor, formattedText, fromSpeaker)
	local var7 = nil
	
	if p2 ~= p1.OriginalChannel then
		local var8 = if p1.FromSpeaker ~= localPlayer.Name then string.format("From %s", p1.FromSpeaker) else p1.OriginalChannel
		
		if var1.tryLocalize then
			var8 = var1:tryLocalize(var8)
		end
		local formattedText_1 = string.format("{%s}", var8)
		var7 = utilModule:AddChannelButtonToBaseMessage(var5, channelColor, formattedText_1, p1.OriginalChannel)
		var6.Position = UDim2.new(0, var7.Size.X.Offset + utilModule:GetStringTextBounds(" ", font, textSize).X, 0, 0)
		var3 = var3 + utilModule:GetNumberOfSpaces(formattedText_1, font, textSize) + 1
	end
	local function UpdateTextFunction(p3)
		-- upvalues: p1 (ref), var5 (ref), utilModule (copy), var3 (write)
		if p1.IsFiltered then
			var5.Text = utilModule:CreateLeadingSpaces(var3) .. utilModule:SanitizeForRichText(p3.Message)
			
			return
		end
		var5.Text = utilModule:CreateLeadingSpaces(var3) .. string.rep("_", p3.MessageLengthUtf8 or p3.MessageLength)
	end
	
	UpdateTextFunction(p1)
	
	local function GetHeightFunction(p3)
		-- upvalues: utilModule (copy), var5 (ref), var4 (ref)
		return utilModule:GetMessageHeight(var5, var4, p3)
	end
	
	local t = {
		[var6] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		},
		[var5] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if var7 then
		t[var7] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var9, var10, var11 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var4,
		[utilModule.KEY_BASE_MESSAGE] = var5,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var9,
		[utilModule.KEY_FADE_OUT] = var10,
		[utilModule.KEY_UPDATE_ANIMATION] = var11
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeWhisper,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}