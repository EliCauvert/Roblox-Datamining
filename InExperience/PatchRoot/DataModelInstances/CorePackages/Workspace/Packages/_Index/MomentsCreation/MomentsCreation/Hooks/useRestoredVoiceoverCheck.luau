local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: getCreationFlowStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var1 = getCreationFlowStoreModule(false)
	local ttsAudio = p1.ttsAudio
	reactModule.useEffect(function()
		-- upvalues: ttsAudio (ref), signalsModule (copy), var1 (ref), p1 (ref)
		if ttsAudio == nil then
			return
		end
		return signalsModule.createEffect(function(p2)
			-- upvalues: var1 (copy), ttsAudio (copy), p1 (copy)
			local pendingRestoredVoice = var1.getPendingRestoredVoice(p2)
			
			if pendingRestoredVoice == nil then return end
			local voice = var1.getEditsMap(p2).voice
			
			if voice == nil or voice.text ~= pendingRestoredVoice.text or voice.voiceId ~= pendingRestoredVoice.voiceId then
				var1.setPendingRestoredVoice(nil)
				
				return
			end
			local state = ttsAudio.getState(p2)
			
			if state == "ready" or state == "playing" then
				if ttsAudio.getLoadedText(p2) == pendingRestoredVoice.text and ttsAudio.getLoadedVoiceId(p2) == pendingRestoredVoice.voiceId then
					var1.setPendingRestoredVoice(nil)
					
					return
				end
			elseif state == "error" then
				local activeTool = p1.getActiveTool(p2)
				
				if activeTool ~= nil and activeTool.kind == "voice" then return end
				var1.setPendingRestoredVoice(nil)
				var1.setCommittedEdit("voice", nil)
				ttsAudio.reset()
			end
		end)
	end, { var1, p1, ttsAudio })
end