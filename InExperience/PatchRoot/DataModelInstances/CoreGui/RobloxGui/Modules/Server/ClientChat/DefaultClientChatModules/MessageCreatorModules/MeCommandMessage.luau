local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))

function CreateMeCommandMessageLabel(p0, p1)
	-- upvalues: chatSettingsModule (ref), utilModule (ref)
	local _ = p0.Message
	local extraData = p0.ExtraData or {}
	local font = extraData.Font or Enum.Font.SourceSansItalic
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local color3 = Color3.new(1, 1, 1)
	local channelColor = extraData.ChannelColor or color3
	local var8 = 0
	local var9, var10 = utilModule:CreateBaseMessage("", font, textSize, color3)
	local var11 = nil
	
	if p1 ~= p0.OriginalChannel then
		local formattedText = string.format("{%s}", p0.OriginalChannel)
		var11 = utilModule:AddChannelButtonToBaseMessage(var10, channelColor, formattedText, p0.OriginalChannel)
		var8 = utilModule:GetNumberOfSpaces(formattedText, font, textSize) + 1
	end
	local function UpdateTextFunction(p2)
		-- upvalues: p0 (ref), var10 (ref), utilModule (copy), var8 (write)
		if p0.IsFiltered then
			var10.Text = utilModule:CreateLeadingSpaces(var8) .. utilModule:SanitizeForRichText(p2.FromSpeaker .. " " .. string.sub(p2.Message, 5))
			
			return
		end
		var10.Text = utilModule:CreateLeadingSpaces(var8) .. string.rep("_", utf8.len(utf8.nfcnormalize(p2.FromSpeaker)) + (p2.MessageLengthUtf8 or p2.MessageLength) - 4)
	end
	
	UpdateTextFunction(p0)
	
	local function GetHeightFunction(p3)
		-- upvalues: utilModule (copy), var10 (ref), var9 (ref)
		return utilModule:GetMessageHeight(var10, var9, p3)
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
	local var16, var17, var18 = utilModule:CreateFadeFunctions(t)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var9,
		[utilModule.KEY_BASE_MESSAGE] = var10,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var16,
		[utilModule.KEY_FADE_OUT] = var17,
		[utilModule.KEY_UPDATE_ANIMATION] = var18
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeMeCommand,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateMeCommandMessageLabel
}