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
local var5 = nil
pcall(function() --[[ line: 22 ]]
	-- upvalues: var5 (write)
	var5 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function IsPlayerVerified(p0) --[[ line: 24 ]]
	-- upvalues: playersService (ref)
	local var6 = playersService:GetPlayerByUserId(p0)
	
	if not var6 then
		return false
	end
	local ok, status = pcall(function() --[[ line: 31 ]]
		-- upvalues: var6 (ref)
		return var6.HasVerifiedBadge
	end)
	
	return if ok then status else false
end

function AppendVerifiedBadge(p1) --[[ line: 38 ]]
	-- upvalues: char (ref)
	return p1 .. char
end

function CreateMessageLabel(p2, p3) --[[ line: 42 ]]
	-- upvalues: chatSettingsModule (ref), utilModule (ref), localPlayer (write), var5 (write)
	local fromSpeaker = p2.FromSpeaker
	local _ = nil
	local var7 = if chatSettingsModule.PlayerDisplayNamesEnabled and p2.SpeakerDisplayName then p2.SpeakerDisplayName else fromSpeaker
	
	if IsPlayerVerified(p2.SpeakerUserId) then
		var7 = AppendVerifiedBadge(var7)
	end
	local _ = p2.Message
	local extraData = p2.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local nameColor = extraData.NameColor or chatSettingsModule.DefaultNameColor
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local formattedText = string.format("[%s]:", var7)
	local _ = utilModule:GetStringTextBounds(formattedText, font, textSize)
	local var15 = utilModule:GetNumberOfSpaces(formattedText, font, textSize) + 1
	local var16, var17 = utilModule:CreateBaseMessage("", font, textSize, chatColor)
	local var18 = utilModule:AddNameButtonToBaseMessage(var17, nameColor, formattedText, fromSpeaker)
	local var19 = nil
	
	if p3 ~= p2.OriginalChannel then
		local var20 = if p2.FromSpeaker ~= localPlayer.Name then string.format("From %s", p2.FromSpeaker) else p2.OriginalChannel
		
		if var5.tryLocalize then
			var20 = var5:tryLocalize(var20)
		end
		local formattedText_1 = string.format("{%s}", var20)
		var19 = utilModule:AddChannelButtonToBaseMessage(var17, channelColor, formattedText_1, p2.OriginalChannel)
		var18.Position = UDim2.new(0, var19.Size.X.Offset + utilModule:GetStringTextBounds(" ", font, textSize).X, 0, 0)
		var15 = var15 + utilModule:GetNumberOfSpaces(formattedText_1, font, textSize) + 1
	end
	local function UpdateTextFunction(p4) --[[ line: 92 ]]
		-- upvalues: p2 (ref), var17 (ref), utilModule (copy), var15 (write)
		if p2.IsFiltered then
			var17.Text = utilModule:CreateLeadingSpaces(var15) .. utilModule:SanitizeForRichText(p4.Message)
			
			return
		end
		var17.Text = utilModule:CreateLeadingSpaces(var15) .. string.rep("_", p4.MessageLengthUtf8 or p4.MessageLength)
	end
	
	UpdateTextFunction(p2)
	
	local function GetHeightFunction(p5) --[[ line: 103 ]]
		-- upvalues: utilModule (copy), var17 (ref), var16 (ref)
		return utilModule:GetMessageHeight(var17, var16, p5)
	end
	
	local t = {
		[var18] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		},
		[var17] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if var19 then
		t[var19] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var25, var26, var27 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var16,
		[utilModule.KEY_BASE_MESSAGE] = var17,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var25,
		[utilModule.KEY_FADE_OUT] = var26,
		[utilModule.KEY_UPDATE_ANIMATION] = var27
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeWhisper,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}