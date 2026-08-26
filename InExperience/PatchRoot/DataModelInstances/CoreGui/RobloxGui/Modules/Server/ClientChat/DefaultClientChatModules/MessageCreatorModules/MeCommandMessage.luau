local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))

function CreateMeCommandMessageLabel(p1, p2)
	-- upvalues: chatSettingsModule (ref), utilModule (ref)
	local _ = p1.Message
	local extraData = p1.ExtraData or {}
	local font = extraData.Font or Enum.Font.SourceSansItalic
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local color3 = Color3.new(1, 1, 1)
	local channelColor = extraData.ChannelColor or color3
	local var1 = 0
	local var2, var3 = utilModule:CreateBaseMessage("", font, textSize, color3)
	local var4 = nil
	
	if p2 ~= p1.OriginalChannel then
		local formattedText = string.format("{%s}", p1.OriginalChannel)
		var4 = utilModule:AddChannelButtonToBaseMessage(var3, channelColor, formattedText, p1.OriginalChannel)
		var1 = utilModule:GetNumberOfSpaces(formattedText, font, textSize) + 1
	end
	local function UpdateTextFunction(p3)
		-- upvalues: p1 (ref), var3 (ref), utilModule (copy), var1 (write)
		if p1.IsFiltered then
			var3.Text = utilModule:CreateLeadingSpaces(var1) .. utilModule:SanitizeForRichText(p3.FromSpeaker .. " " .. string.sub(p3.Message, 5))
			
			return
		end
		var3.Text = utilModule:CreateLeadingSpaces(var1) .. string.rep("_", utf8.len(utf8.nfcnormalize(p3.FromSpeaker)) + (p3.MessageLengthUtf8 or p3.MessageLength) - 4)
	end
	
	UpdateTextFunction(p1)
	
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
	local var5, var6, var7 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var2,
		[utilModule.KEY_BASE_MESSAGE] = var3,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var5,
		[utilModule.KEY_FADE_OUT] = var6,
		[utilModule.KEY_UPDATE_ANIMATION] = var7
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeMeCommand,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateMeCommandMessageLabel
}