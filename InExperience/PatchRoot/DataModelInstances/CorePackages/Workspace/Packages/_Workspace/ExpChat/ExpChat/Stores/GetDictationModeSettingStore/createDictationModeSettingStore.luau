local expChat = script:FindFirstAncestor("ExpChat")
local signalsModule = require(expChat.Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local fFlagExpChatDictationContinuousByDefaultModule = require(expChat.Flags.FFlagExpChatDictationContinuousByDefault)
local dictationModeModule = require(expChat.ChatInput.UI.ChatInputBar.Dictation.DictationMode)
local dictationModeSettingStorageModule = require(script.Parent.DictationModeSettingStorage)

local function _()
	-- upvalues: fFlagExpChatDictationContinuousByDefaultModule (ref), dictationModeModule (ref)
	return if fFlagExpChatDictationContinuousByDefaultModule then dictationModeModule.Continuous else dictationModeModule.Standard
end

return function(p1)
	-- upvalues: dictationModeSettingStorageModule (ref), createSignal (ref), createComputed (ref), fFlagExpChatDictationContinuousByDefaultModule (ref), dictationModeModule (ref)
	p1 = p1 or dictationModeSettingStorageModule
	local var1, var2 = createSignal(p1.read())
	
	return {
		getMode = createComputed(function(p2)
			-- upvalues: var1 (ref), fFlagExpChatDictationContinuousByDefaultModule (copy), dictationModeModule (copy)
			local var3 = var1(p2)
			
			if not var3 then
				if fFlagExpChatDictationContinuousByDefaultModule then
					return dictationModeModule.Continuous
				end
				var3 = dictationModeModule.Standard
			end
			return var3
		end),
		setMode = function(value)
			-- upvalues: var1 (ref), var2 (ref), p1 (ref)
			if var1(false) == value then
				return
			end
			var2(value)
			p1.write(value)
		end
	}
end