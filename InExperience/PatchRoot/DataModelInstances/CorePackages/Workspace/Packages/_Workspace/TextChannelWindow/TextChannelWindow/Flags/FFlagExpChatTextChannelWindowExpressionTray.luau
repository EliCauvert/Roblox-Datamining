local UserInputService = game:GetService("UserInputService")
local FFlagDebugExpChatTextChannelWindowStaticExpressionsModule = require(script.Parent.FFlagDebugExpChatTextChannelWindowStaticExpressions)
local ExpChatPresetChatVREnabled = game:DefineFastFlag("ExpChatPresetChatVREnabled", false)

local function _()
	-- upvalues: UserInputService (copy), ExpChatPresetChatVREnabled (copy)
	return not UserInputService.VREnabled or ExpChatPresetChatVREnabled
end

local ExpChatTextChannelWindowExpressionTray = game:DefineFastFlag("ExpChatTextChannelWindowExpressionTray", false)

if ExpChatTextChannelWindowExpressionTray then
	local TextChatPresetsEnabledEngineFeature = game:GetEngineFeature("TextChatPresetsEnabled")
	
	if not TextChatPresetsEnabledEngineFeature then
		ExpChatTextChannelWindowExpressionTray = FFlagDebugExpChatTextChannelWindowStaticExpressionsModule
		TextChatPresetsEnabledEngineFeature = ExpChatTextChannelWindowExpressionTray
	end
	if TextChatPresetsEnabledEngineFeature then
		if UserInputService.VREnabled then
			return ExpChatPresetChatVREnabled
		end
		ExpChatTextChannelWindowExpressionTray = true
	end
end
return ExpChatTextChannelWindowExpressionTray