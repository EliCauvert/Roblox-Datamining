local userInputService = game:GetService("UserInputService")
local fFlagExpChatPresetChatVREnabledModule = require(script.Parent.FFlagExpChatPresetChatVREnabled)

local function _() --[[ line: 5 | named "isSupportedPlatform" ]]
	-- upvalues: userInputService (ref), fFlagExpChatPresetChatVREnabledModule (ref)
	return if userInputService.VREnabled then fFlagExpChatPresetChatVREnabledModule else true
end

local expChatPresetChatLoadTestEnabled = game:DefineFastFlag("ExpChatPresetChatLoadTestEnabled", false)

if expChatPresetChatLoadTestEnabled then
	expChatPresetChatLoadTestEnabled = game:GetEngineFeature("TextChatPresetsEnabled")
	
	if expChatPresetChatLoadTestEnabled then
		if userInputService.VREnabled then
			return fFlagExpChatPresetChatVREnabledModule
		end
		expChatPresetChatLoadTestEnabled = true
	end
end
return expChatPresetChatLoadTestEnabled