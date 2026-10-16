local UserInputService = game:GetService("UserInputService")
local FFlagExpChatPresetChatVREnabledModule = require(script.Parent.FFlagExpChatPresetChatVREnabled)

local function _() --[[ Line: 5 | Named "isSupportedPlatform" ]]
	-- upvalues: UserInputService (copy), FFlagExpChatPresetChatVREnabledModule (copy)
	return not UserInputService.VREnabled or FFlagExpChatPresetChatVREnabledModule
end

local ExpChatPresetChatEnabled10 = game:DefineFastFlag("ExpChatPresetChatEnabled10", false)

if ExpChatPresetChatEnabled10 then
	ExpChatPresetChatEnabled10 = game:GetEngineFeature("TextChatPresetsEnabled")
	
	if ExpChatPresetChatEnabled10 then
		if UserInputService.VREnabled then
			return FFlagExpChatPresetChatVREnabledModule
		end
		ExpChatPresetChatEnabled10 = true
	end
end
return ExpChatPresetChatEnabled10