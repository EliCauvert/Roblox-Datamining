local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))
pcall(function() --[[ line: 12 ]]
	ChatLocalization = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function CreateWelcomeMessageLabel(p0, p1) --[[ line: 14 ]]
	-- upvalues: chatSettingsModule (ref), utilModule (ref)
	local message = p0.Message
	
	if ChatLocalization and ChatLocalization.LocalizeFormattedMessage then
		message = ChatLocalization:LocalizeFormattedMessage(message)
	end
	local extraData = p0.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local fontSize = extraData.FontSize or chatSettingsModule.ChatWindowTextSize
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local var8, var9 = utilModule:CreateBaseMessage(message, font, fontSize, chatColor)
	local var10 = nil
	
	if p1 ~= p0.OriginalChannel then
		local formattedText = string.format("{%s}", if ChatLocalization.tryLocalize then ChatLocalization:tryLocalize(p0.OriginalChannel) else p0.OriginalChannel)
		var10 = utilModule:AddChannelButtonToBaseMessage(var9, channelColor, formattedText, p0.OriginalChannel)
		var9.Text = utilModule:CreateLeadingSpaces(utilModule:GetNumberOfSpaces(formattedText, font, fontSize) + 1) .. utilModule:SanitizeForRichText(message)
	end
	local function GetHeightFunction(p2) --[[ line: 39 ]]
		-- upvalues: utilModule (copy), var9 (ref), var8 (ref)
		return utilModule:GetMessageHeight(var9, var8, p2)
	end
	
	local t = {
		[var9] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if var10 then
		t[var10] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var14, var15, var16 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var8,
		[utilModule.KEY_BASE_MESSAGE] = var9,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var14,
		[utilModule.KEY_FADE_OUT] = var15,
		[utilModule.KEY_UPDATE_ANIMATION] = var16
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeWelcome,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateWelcomeMessageLabel
}