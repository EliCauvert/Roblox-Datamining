local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function CreateSystemMessageLabel(p1, p2)
	-- upvalues: var1 (write), chatSettingsModule (ref), utilModule (ref)
	local message = p1.Message
	
	if var1 and var1.LocalizeFormattedMessage then
		message = var1:LocalizeFormattedMessage(message)
	end
	local extraData = p1.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local var2, var3 = utilModule:CreateBaseMessage(message, font, textSize, chatColor)
	var3.AutoLocalize = true
	local var4 = nil
	
	if p2 ~= p1.OriginalChannel then
		local _ = nil
		local var5 = if var1 and p1.OriginalChannel == "System" then string.format("{%s}", var1:Get("InGame.Chat.Label.SystemMessagePrefix", "System")) elseif var1 and p1.OriginalChannel == "Team" then string.format("{%s}", var1:Get("InGame.Chat.Label.TeamMessagePrefix", "System")) else string.format("{%s}", p1.OriginalChannel)
		var4 = utilModule:AddChannelButtonToBaseMessage(var3, channelColor, var5, p1.OriginalChannel)
		var3.Text = utilModule:CreateLeadingSpaces(utilModule:GetNumberOfSpaces(var5, font, textSize) + 1) .. utilModule:SanitizeForRichText(message)
	end
	local function GetHeightFunction(p3)
		-- upvalues: utilModule (copy), var3 (ref), var2 (ref)
		return utilModule:GetMessageHeight(var3, var2, p3)
	end
	
	local t = {
		[var3] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if var4 then
		t[var4] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var6, var7, var8 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var2,
		[utilModule.KEY_BASE_MESSAGE] = var3,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var6,
		[utilModule.KEY_FADE_OUT] = var7,
		[utilModule.KEY_UPDATE_ANIMATION] = var8
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeSystem,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
}