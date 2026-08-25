local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions
local legacyDefaultSettingsModule = require(script.Parent.LegacyDefaultSettings)

return roduxModule.createReducer(legacyDefaultSettingsModule, {
	[require(actions.LegacyBubbleChatEnabledChanged).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, { Enabled = p1.value })
	end,
	[require(actions.LegacyBubbleChatSettingsChanged).name] = function(_, p2)
		-- upvalues: dictionary (ref), legacyDefaultSettingsModule (ref)
		local chatSettings = p2.chatSettings
		
		if chatSettings.Transparency then
			chatSettings.BackgroundTransparency = chatSettings.Transparency
		end
		local var3 = dictionary.join(legacyDefaultSettingsModule, chatSettings)
		
		if chatSettings and chatSettings.UserSpecificSettings then
			for i, v in pairs(chatSettings.UserSpecificSettings) do
				local var4 = dictionary.copyDeep(legacyDefaultSettingsModule)
				
				if v.Transparency then
					v.BackgroundTransparency = v.Transparency
				end
				var4.UserSpecificSettings = nil
				var3.UserSpecificSettings[i] = dictionary.join(var4, v)
			end
		end
		return var3
	end
})