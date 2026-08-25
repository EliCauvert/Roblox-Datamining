local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))

function CreateSetCoreMessageLabel(value, _)
	-- upvalues: chatSettingsModule (ref), utilModule (ref)
	local extraData = value.ExtraData or {}
	local message, message_1 = utilModule:CreateBaseMessage(value.Message, extraData.Font or chatSettingsModule.DefaultFont, extraData.TextSize or chatSettingsModule.ChatWindowTextSize, extraData.Color or chatSettingsModule.DefaultMessageColor)
	
	local function GetHeightFunction(p0)
		-- upvalues: utilModule (copy), message_1 (ref), message (ref)
		return utilModule:GetMessageHeight(message_1, message, p0)
	end
	
	local var7, var8, var9 = utilModule:CreateFadeFunctions({
		[message_1] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	})
	
	return {
		[utilModule.KEY_BASE_FRAME] = message,
		[utilModule.KEY_BASE_MESSAGE] = message_1,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var7,
		[utilModule.KEY_FADE_OUT] = var8,
		[utilModule.KEY_UPDATE_ANIMATION] = var9
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeSetCore,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateSetCoreMessageLabel
}