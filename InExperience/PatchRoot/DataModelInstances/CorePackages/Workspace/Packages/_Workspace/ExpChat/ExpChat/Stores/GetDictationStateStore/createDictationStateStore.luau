local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsModule = require(ExpChat.Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local DictationStateModule = require(ExpChat.ChatInput.UI.ChatInputBar.Dictation.DictationState)

return function()
	-- upvalues: CreateSignalFunction (copy), DictationStateModule (copy), CreateComputedFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(DictationStateModule.Idle)
	
	return {
		getDictationState = Signal,
		getIsListening = CreateComputedFunction(function(p1): boolean
			-- upvalues: Signal (copy), DictationStateModule (upval)
			return Signal(p1) == DictationStateModule.Listening
		end),
		setDictationState = Signal2
	}
end