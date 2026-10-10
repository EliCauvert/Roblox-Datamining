local userInputService = game:GetService("UserInputService")
local fFlagDebugExpChatTextChannelWindowStaticExpressionsModule = require(script.Parent.FFlagDebugExpChatTextChannelWindowStaticExpressions)
local expChatPresetChatVREnabled = game:DefineFastFlag("ExpChatPresetChatVREnabled", false)

local function _()
	-- upvalues: userInputService (ref), expChatPresetChatVREnabled (ref)
	return if userInputService.VREnabled then expChatPresetChatVREnabled else true
end

local expChatTextChannelWindowExpressionTray = game:DefineFastFlag("ExpChatTextChannelWindowExpressionTray", false)

if expChatTextChannelWindowExpressionTray then
	if not game:GetEngineFeature("TextChatPresetsEnabled") then
		expChatTextChannelWindowExpressionTray = fFlagDebugExpChatTextChannelWindowStaticExpressionsModule
		
		if expChatTextChannelWindowExpressionTray then
			if userInputService.VREnabled then
				return expChatPresetChatVREnabled
			end
			expChatTextChannelWindowExpressionTray = true
		end
	end
end
return expChatTextChannelWindowExpressionTray