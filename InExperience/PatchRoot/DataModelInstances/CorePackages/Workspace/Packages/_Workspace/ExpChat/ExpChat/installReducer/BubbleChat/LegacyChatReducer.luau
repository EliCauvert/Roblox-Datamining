local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoduxModule = require(Parent.Rodux)
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions
local LegacyBubbleChatEnabledChangedModule = require(Actions.LegacyBubbleChatEnabledChanged)
local LegacyBubbleChatSettingsChangedModule = require(Actions.LegacyBubbleChatSettingsChanged)
local LegacyDefaultSettingsModule = require(script.Parent.LegacyDefaultSettings)

return RoduxModule.createReducer(LegacyDefaultSettingsModule, {
	[LegacyBubbleChatEnabledChangedModule.name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { Enabled = p2.value })
	end,
	[LegacyBubbleChatSettingsChangedModule.name] = function(_, p1)
		-- upvalues: Dictionary (copy), LegacyDefaultSettingsModule (copy)
		local ChatSettings = p1.chatSettings
		
		if ChatSettings.Transparency then
			ChatSettings.BackgroundTransparency = ChatSettings.Transparency
		end
		local JoinResult = Dictionary.join(LegacyDefaultSettingsModule, ChatSettings)
		
		if ChatSettings and ChatSettings.UserSpecificSettings then
			for i, userSpecificSetting in pairs(ChatSettings.UserSpecificSettings) do
				local CopyDeepResult = Dictionary.copyDeep(LegacyDefaultSettingsModule)
				
				if userSpecificSetting.Transparency then
					userSpecificSetting.BackgroundTransparency = userSpecificSetting.Transparency
				end
				CopyDeepResult.UserSpecificSettings = nil
				JoinResult.UserSpecificSettings[i] = Dictionary.join(CopyDeepResult, userSpecificSetting)
			end
		end
		return JoinResult
	end
})