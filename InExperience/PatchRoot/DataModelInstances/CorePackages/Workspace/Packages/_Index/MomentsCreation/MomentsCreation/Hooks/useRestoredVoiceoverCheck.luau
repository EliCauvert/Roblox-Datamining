local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1) --[[ Line: 21 | Named "useRestoredVoiceoverCheck" ]]
	-- upvalues: GetCreationFlowStoreModule (copy), ReactModule (copy), SignalsModule (copy)
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	local TtsAudio = p1.ttsAudio
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: TtsAudio (copy), SignalsModule (upval), CreationFlowStoreModule (copy), p1 (copy)
		if TtsAudio == nil then return end
		return SignalsModule.createEffect(function(p2) --[[ Line: 29 ]]
			-- upvalues: CreationFlowStoreModule (upval), TtsAudio (upval), p1 (upval)
			local PendingRestoredVoice = CreationFlowStoreModule.getPendingRestoredVoice(p2)
			
			if PendingRestoredVoice == nil then return end
			local Voice = CreationFlowStoreModule.getEditsMap(p2).voice
			
			if Voice == nil or Voice.text ~= PendingRestoredVoice.text or Voice.voiceId ~= PendingRestoredVoice.voiceId then
				CreationFlowStoreModule.setPendingRestoredVoice(nil)
				
				return
			end
			local State = TtsAudio.getState(p2)
			
			if State == "ready" or State == "playing" then
				if TtsAudio.getLoadedText(p2) == PendingRestoredVoice.text and TtsAudio.getLoadedVoiceId(p2) == PendingRestoredVoice.voiceId then
					CreationFlowStoreModule.setPendingRestoredVoice(nil)
					
					return
				end
			elseif State == "error" then
				local ActiveTool = p1.getActiveTool(p2)
				
				if ActiveTool ~= nil and ActiveTool.kind == "voice" then return end
				CreationFlowStoreModule.setPendingRestoredVoice(nil)
				CreationFlowStoreModule.setCommittedEdit("voice", nil)
				TtsAudio.reset()
			end
		end)
	end, { CreationFlowStoreModule, p1, TtsAudio })
end