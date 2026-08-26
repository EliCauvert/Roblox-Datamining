local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local reactModule = require(parent.React)
local _ = require(expChat.Stores.GetVoiceStore.createVoiceStore)
local var1 = require(expChat.Stores.GetVoiceStore)(false)
local var2 = signalsModule.createSignal(nil)

return function(value)
	-- upvalues: var1 (ref), useSignalState (ref), var2 (ref), reactModule (ref)
	return function(p1)
		-- upvalues: var1 (copy), useSignalState (copy), var2 (copy), reactModule (copy), value (ref)
		local userId = p1.userId
		local cloned = table.clone(p1)
		cloned.voiceState = useSignalState((if userId then var1.getOrCreateVoiceState(userId) else nil) or var2)
		
		return reactModule.createElement(value, cloned)
	end
end