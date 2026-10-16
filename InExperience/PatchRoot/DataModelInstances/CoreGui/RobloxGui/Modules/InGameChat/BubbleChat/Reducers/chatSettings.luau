local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.Cryo)
local ChatSettingsModule = require(script.Parent.Parent.ChatSettings)

local function deepCopy(ChatSettingsModule) --[[ Line: 9 ]]
	-- upvalues: deepCopy (copy)
	if type(ChatSettingsModule) ~= "table" then
		return ChatSettingsModule
	end
	local t = {}
	
	for i, value in pairs(ChatSettingsModule) do
		t[i] = deepCopy(value)
	end
	return t
end

local function mergeInto(p1, Settings) --[[ Line: 22 ]]
	-- upvalues: mergeInto (copy)
	for i, setting in pairs(Settings) do
		if type(setting) ~= "table" then
			p1[i] = setting
		elseif p1[i] then
			mergeInto(p1[i], setting)
		end
	end
end

return (require(CorePackages.Packages.Rodux).createReducer(ChatSettingsModule, {
	[require(script.Parent.Parent.Actions.UpdateChatSettings).name] = function(_, p2) --[[ Line: 33 ]]
		-- upvalues: deepCopy (copy), ChatSettingsModule (copy), mergeInto (copy)
		local DeepCopyResult = deepCopy(ChatSettingsModule)
		mergeInto(DeepCopyResult, p2.settings)
		local UserSpecificSettings = p2.settings.UserSpecificSettings
		
		if UserSpecificSettings then
			for i, userSpecificSetting in pairs(UserSpecificSettings) do
				local DeepCopyResult1 = deepCopy(ChatSettingsModule)
				DeepCopyResult1.UserSpecificSettings = nil
				mergeInto(DeepCopyResult1, userSpecificSetting)
				DeepCopyResult.UserSpecificSettings[i] = DeepCopyResult1
			end
		end
		return DeepCopyResult
	end
}))