local BuildExperience = script:FindFirstAncestor("BuildExperience")
local SignalsModule = require(BuildExperience.Parent.Signals)
local _ = require(BuildExperience.Chat.chatTypes)

local function _(p1, UniverseId, SessionId): boolean --[[ Line: 22 | Named "targetsMatch" ]]
	return p1.universeId == UniverseId and (p1.sessionId == nil or p1.sessionId == SessionId)
end

return function() --[[ Line: 29 | Named "createBuildPromptDraftStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getPendingDraft = Signal,
		queueDraft = function(p1) --[[ Line: 33 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		consumeDraft = function(UniverseId, SessionId) --[[ Line: 37 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal()
			
			if SignalResult == nil or (SignalResult.universeId ~= UniverseId or SignalResult.sessionId ~= nil and SignalResult.sessionId ~= SessionId) then
				return nil
			else
				Signal2(nil)
				
				return SignalResult.text
			end
		end,
		reset = function() --[[ Line: 46 ]]
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end