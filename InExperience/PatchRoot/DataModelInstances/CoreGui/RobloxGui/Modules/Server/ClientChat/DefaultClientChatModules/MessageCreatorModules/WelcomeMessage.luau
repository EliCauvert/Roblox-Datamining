local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))
pcall(function()
	ChatLocalization = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function CreateWelcomeMessageLabel(p1, p2)
	-- upvalues: chatSettingsModule (ref), utilModule (ref)
	local message = p1.Message
	
	if ChatLocalization and ChatLocalization.LocalizeFormattedMessage then
		message = ChatLocalization:LocalizeFormattedMessage(message)
	end
	local extraData = p1.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local fontSize = extraData.FontSize or chatSettingsModule.ChatWindowTextSize
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local var1, var2 = utilModule:CreateBaseMessage(message, font, fontSize, chatColor)
	local var3 = nil
	
	if p2 ~= p1.OriginalChannel then
		local formattedText = string.format("{%s}", if ChatLocalization.tryLocalize then ChatLocalization:tryLocalize(p1.OriginalChannel) else p1.OriginalChannel)
		var3 = utilModule:AddChannelButtonToBaseMessage(var2, channelColor, formattedText, p1.OriginalChannel)
		var2.Text = utilModule:CreateLeadingSpaces(utilModule:GetNumberOfSpaces(formattedText, font, fontSize) + 1) .. utilModule:SanitizeForRichText(message)
	end
	local function GetHeightFunction(p3)
		-- upvalues: utilModule (copy), var2 (ref), var1 (ref)
		return utilModule:GetMessageHeight(var2, var1, p3)
	end
	
	local t = {
		[var2] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if var3 then
		t[var3] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var4, var5, var6 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var1,
		[utilModule.KEY_BASE_MESSAGE] = var2,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var4,
		[utilModule.KEY_FADE_OUT] = var5,
		[utilModule.KEY_UPDATE_ANIMATION] = var6
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeWelcome,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateWelcomeMessageLabel
}