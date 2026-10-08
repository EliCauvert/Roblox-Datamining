local expChat = script:FindFirstAncestor("ExpChat")
local perUserAppStorageModule = require(expChat.Utils.perUserAppStorage)
local dictationModeModule = require(expChat.ChatInput.UI.ChatInputBar.Dictation.DictationMode)

return {
	read = function()
		-- upvalues: perUserAppStorageModule (ref), dictationModeModule (ref)
		local expChatDictationModeSetting = perUserAppStorageModule.getEntry("ExpChatDictationModeSetting")
		
		return if expChatDictationModeSetting.mode == dictationModeModule.Standard or expChatDictationModeSetting.mode == dictationModeModule.Continuous then expChatDictationModeSetting.mode else nil
	end,
	write = function(p1)
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationModeSetting", function(p2)
			-- upvalues: p1 (ref)
			if p2.mode == p1 then
				return nil
			end
			p2.mode = p1
			
			return p2
		end)
	end
}