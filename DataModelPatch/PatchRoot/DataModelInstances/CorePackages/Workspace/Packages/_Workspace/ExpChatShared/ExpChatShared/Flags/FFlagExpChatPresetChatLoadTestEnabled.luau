local UserInputService = game:GetService("UserInputService")
local FFlagExpChatPresetChatVREnabledModule = require(script.Parent.FFlagExpChatPresetChatVREnabled)

local function _()
	-- upvalues: UserInputService (copy), FFlagExpChatPresetChatVREnabledModule (copy)
	return not UserInputService.VREnabled or FFlagExpChatPresetChatVREnabledModule
end

local ExpChatPresetChatLoadTestEnabled = game:DefineFastFlag("ExpChatPresetChatLoadTestEnabled", false)

if ExpChatPresetChatLoadTestEnabled then
	ExpChatPresetChatLoadTestEnabled = game:GetEngineFeature("TextChatPresetsEnabled")
	
	if ExpChatPresetChatLoadTestEnabled then
		if UserInputService.VREnabled then
			return FFlagExpChatPresetChatVREnabledModule
		end
		ExpChatPresetChatLoadTestEnabled = true
	end
end
return ExpChatPresetChatLoadTestEnabled