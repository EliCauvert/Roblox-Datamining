local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local reactModule = require(parent.React)
local _ = require(expChat.Stores.GetVoiceStore.createVoiceStore)
local var3 = require(expChat.Stores.GetVoiceStore)(false)
local var4 = signalsModule.createSignal(nil)

return function(value) --[[ line: 24 | named "withSignalsData" ]]
	-- upvalues: var3 (ref), useSignalState (ref), var4 (ref), reactModule (ref)
	return function(p0) --[[ line: 25 ]]
		-- upvalues: var3 (copy), useSignalState (copy), var4 (copy), reactModule (copy), value (ref)
		local userId = p0.userId
		local cloned = table.clone(p0)
		cloned.voiceState = useSignalState((if userId then var3.getOrCreateVoiceState(userId) else nil) or var4)
		
		return reactModule.createElement(value, cloned)
	end
end