local userInputService = game:GetService("UserInputService")
local expChatPresetChatVREnabled = game:DefineFastFlag("ExpChatPresetChatVREnabled", false)

local function _()
	-- upvalues: userInputService (ref), expChatPresetChatVREnabled (ref)
	return if userInputService.VREnabled then expChatPresetChatVREnabled else true
end

local expChatTextChannelWindowExpressionTray = game:DefineFastFlag("ExpChatTextChannelWindowExpressionTray", false)

if expChatTextChannelWindowExpressionTray then
	expChatTextChannelWindowExpressionTray = game:GetEngineFeature("TextChatPresetsEnabled")
	
	if expChatTextChannelWindowExpressionTray then
		if userInputService.VREnabled then
			return expChatPresetChatVREnabled
		end
		expChatTextChannelWindowExpressionTray = true
	end
end
return expChatTextChannelWindowExpressionTray