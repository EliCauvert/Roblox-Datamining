local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsModule = require(ExpChat.Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local FFlagExpChatDictationContinuousByDefaultModule = require(ExpChat.Flags.FFlagExpChatDictationContinuousByDefault)
local DictationModeModule = require(ExpChat.ChatInput.UI.ChatInputBar.Dictation.DictationMode)
local DictationModeSettingStorageModule = require(script.Parent.DictationModeSettingStorage)

local function _()
	-- upvalues: FFlagExpChatDictationContinuousByDefaultModule (copy), DictationModeModule (copy)
	return if FFlagExpChatDictationContinuousByDefaultModule then DictationModeModule.Continuous else DictationModeModule.Standard
end

return function(p1)
	-- upvalues: DictationModeSettingStorageModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), FFlagExpChatDictationContinuousByDefaultModule (copy), DictationModeModule (copy)
	local P0 = p1 or DictationModeSettingStorageModule
	local Signal, Signal2 = CreateSignalFunction((P0.read()))
	
	return {
		getMode = CreateComputedFunction(function(p2)
			-- upvalues: Signal (copy), FFlagExpChatDictationContinuousByDefaultModule (upval), DictationModeModule (upval)
			local SignalResult = Signal(p2)
			
			if not SignalResult then
				if FFlagExpChatDictationContinuousByDefaultModule then
					return DictationModeModule.Continuous
				end
				SignalResult = DictationModeModule.Standard
			end
			return SignalResult
		end),
		setMode = function(p2)
			-- upvalues: Signal (copy), Signal2 (copy), P0 (copy)
			if Signal(false) ~= p2 then
				Signal2(p2)
				P0.write(p2)
				
				return
			end
		end
	}
end