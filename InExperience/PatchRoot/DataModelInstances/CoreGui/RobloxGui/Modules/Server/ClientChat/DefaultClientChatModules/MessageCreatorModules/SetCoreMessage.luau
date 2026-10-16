local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))

function CreateSetCoreMessageLabel(p1, _) --[[ Line: 11 ]]
	-- upvalues: ChatSettingsModule (copy), UtilModule (copy)
	local ExtraData = p1.ExtraData or {}
	local BaseMessage, BaseMessage2 = UtilModule:CreateBaseMessage(p1.Message, ExtraData.Font or ChatSettingsModule.DefaultFont, ExtraData.TextSize or ChatSettingsModule.ChatWindowTextSize, ExtraData.Color or ChatSettingsModule.DefaultMessageColor)
	
	local function GetHeightFunction(p2) --[[ Line: 20 ]]
		-- upvalues: UtilModule (upval), BaseMessage2 (copy), BaseMessage (copy)
		return UtilModule:GetMessageHeight(BaseMessage2, BaseMessage, p2)
	end
	
	local FadeFunctions, FadeFunctions2, FadeFunctions3 = UtilModule:CreateFadeFunctions({
		[BaseMessage2] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	})
	
	return {
		[UtilModule.KEY_BASE_FRAME] = BaseMessage,
		[UtilModule.KEY_BASE_MESSAGE] = BaseMessage2,
		[UtilModule.KEY_UPDATE_TEXT_FUNC] = nil,
		[UtilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[UtilModule.KEY_FADE_IN] = FadeFunctions,
		[UtilModule.KEY_FADE_OUT] = FadeFunctions2,
		[UtilModule.KEY_UPDATE_ANIMATION] = FadeFunctions3
	}
end

return {
	[UtilModule.KEY_MESSAGE_TYPE] = ChatConstantsModule.MessageTypeSetCore,
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateSetCoreMessageLabel
}