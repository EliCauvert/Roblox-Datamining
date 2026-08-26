local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions
local legacyDefaultSettingsModule = require(script.Parent.LegacyDefaultSettings)

return roduxModule.createReducer(legacyDefaultSettingsModule, {
	[require(actions.LegacyBubbleChatEnabledChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { Enabled = p2.value })
	end,
	[require(actions.LegacyBubbleChatSettingsChanged).name] = function(_, p1)
		-- upvalues: dictionary (ref), legacyDefaultSettingsModule (ref)
		local chatSettings = p1.chatSettings
		
		if chatSettings.Transparency then
			chatSettings.BackgroundTransparency = chatSettings.Transparency
		end
		local var1 = dictionary.join(legacyDefaultSettingsModule, chatSettings)
		
		if chatSettings and chatSettings.UserSpecificSettings then
			for i, v in pairs(chatSettings.UserSpecificSettings) do
				local var2 = dictionary.copyDeep(legacyDefaultSettingsModule)
				
				if v.Transparency then
					v.BackgroundTransparency = v.Transparency
				end
				var2.UserSpecificSettings = nil
				var1.UserSpecificSettings[i] = dictionary.join(var2, v)
			end
		end
		return var1
	end
})