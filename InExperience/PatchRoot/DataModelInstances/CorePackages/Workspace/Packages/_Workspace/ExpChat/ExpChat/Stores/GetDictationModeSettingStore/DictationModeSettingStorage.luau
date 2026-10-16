local ExpChat = script:FindFirstAncestor("ExpChat")
local PerUserAppStorageModule = require(ExpChat.Utils.perUserAppStorage)
local DictationModeModule = require(ExpChat.ChatInput.UI.ChatInputBar.Dictation.DictationMode)

return {
	read = function() --[[ Line: 14 ]]
		-- upvalues: PerUserAppStorageModule (copy), DictationModeModule (copy)
		local ExpChatDictationModeSettingEntry = PerUserAppStorageModule.getEntry("ExpChatDictationModeSetting")
		
		return if ExpChatDictationModeSettingEntry.mode == DictationModeModule.Standard or ExpChatDictationModeSettingEntry.mode == DictationModeModule.Continuous then ExpChatDictationModeSettingEntry.mode else nil
	end,
	write = function(Mode) --[[ Line: 22 ]]
		-- upvalues: PerUserAppStorageModule (copy)
		PerUserAppStorageModule.updateEntry("ExpChatDictationModeSetting", function(p1) --[[ Line: 23 ]]
			-- upvalues: Mode (copy)
			if p1.mode == Mode then
				return nil
			else
				p1.mode = Mode
				
				return p1
			end
		end)
	end
}