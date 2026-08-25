local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))
local var3 = nil
pcall(function()
	-- upvalues: var3 (write)
	var3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

function CreateSystemMessageLabel(p0, p1)
	-- upvalues: var3 (write), chatSettingsModule (ref), utilModule (ref)
	local message = p0.Message
	
	if var3 and var3.LocalizeFormattedMessage then
		message = var3:LocalizeFormattedMessage(message)
	end
	local extraData = p0.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local var9, var10 = utilModule:CreateBaseMessage(message, font, textSize, chatColor)
	var10.AutoLocalize = true
	local var11 = nil
	
	if p1 ~= p0.OriginalChannel then
		local _ = nil
		local var12 = if var3 and p0.OriginalChannel == "System" then string.format("{%s}", var3:Get("InGame.Chat.Label.SystemMessagePrefix", "System")) elseif var3 and p0.OriginalChannel == "Team" then string.format("{%s}", var3:Get("InGame.Chat.Label.TeamMessagePrefix", "System")) else string.format("{%s}", p0.OriginalChannel)
		var11 = utilModule:AddChannelButtonToBaseMessage(var10, channelColor, var12, p0.OriginalChannel)
		var10.Text = utilModule:CreateLeadingSpaces(utilModule:GetNumberOfSpaces(var12, font, textSize) + 1) .. utilModule:SanitizeForRichText(message)
	end
	local function GetHeightFunction(p2)
		-- upvalues: utilModule (copy), var10 (ref), var9 (ref)
		return utilModule:GetMessageHeight(var10, var9, p2)
	end
	
	local t = {
		[var10] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if var11 then
		t[var11] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var15, var16, var17 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var9,
		[utilModule.KEY_BASE_MESSAGE] = var10,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var15,
		[utilModule.KEY_FADE_OUT] = var16,
		[utilModule.KEY_UPDATE_ANIMATION] = var17
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeSystem,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
}