local userInputService = game:GetService("UserInputService")
local fFlagExpChatPresetChatVREnabledModule = require(script.Parent.FFlagExpChatPresetChatVREnabled)

local function _() --[[ line: 5 | named "isSupportedPlatform" ]]
	-- upvalues: userInputService (ref), fFlagExpChatPresetChatVREnabledModule (ref)
	return if userInputService.VREnabled then fFlagExpChatPresetChatVREnabledModule else true
end

local expChatPresetChatEnabled10 = game:DefineFastFlag("ExpChatPresetChatEnabled10", false)

if expChatPresetChatEnabled10 then
	expChatPresetChatEnabled10 = game:GetEngineFeature("TextChatPresetsEnabled")
	
	if expChatPresetChatEnabled10 then
		if userInputService.VREnabled then
			return fFlagExpChatPresetChatVREnabledModule
		end
		expChatPresetChatEnabled10 = true
	end
end
return expChatPresetChatEnabled10