local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Chat.creatorAgentChat)

local function _(p1, UniverseId, SessionId): boolean
	return p1.universeId == UniverseId and (p1.sessionId == nil or p1.sessionId == SessionId)
end

return function()
	-- upvalues: SignalsModule (copy)
	local self = setmetatable({}, { __mode = "k" })
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getSubmittedDraft = function(p1)
			-- upvalues: self (copy)
			return self[p1]
		end,
		setSubmittedDraft = function(Key, p1)
			-- upvalues: self (copy)
			self[Key] = p1
		end,
		getPendingDraft = Signal,
		queueDraft = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		consumeDraft = function(UniverseId, SessionId)
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal()
			
			if SignalResult == nil or (SignalResult.universeId ~= UniverseId or SignalResult.sessionId ~= nil and SignalResult.sessionId ~= SessionId) then
				return nil
			else
				Signal2(nil)
				
				return SignalResult.text
			end
		end,
		reset = function()
			-- upvalues: self (copy), Signal2 (copy)
			table.clear(self)
			Signal2(nil)
		end
	}
end