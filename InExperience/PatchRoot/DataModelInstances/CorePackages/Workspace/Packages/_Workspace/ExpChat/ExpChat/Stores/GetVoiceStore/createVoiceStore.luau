local Parent = script:FindFirstAncestor("ExpChat").Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local VOICESTATE = require(Parent.VoiceChat).Constants.VOICE_STATE

return function() --[[ Line: 26 | Named "createVoiceStore" ]]
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), VOICESTATE (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local t = {}
	
	local function _(p1): string --[[ Line: 32 | Named "getKey" ]]
		return (tostring(p1))
	end
	
	return {
		getOrCreateVoiceState = function(p1) --[[ Line: 36 ]]
			-- upvalues: t (copy), CreateComputedFunction (upval), Signal (copy)
			local Text = tostring(p1)
			
			if not t[Text] then
				t[Text] = CreateComputedFunction(function(p2) --[[ Line: 39 ]]
					-- upvalues: Signal (upval), Text (copy)
					return Signal(p2)[Text]
				end)
			end
			return t[Text]
		end,
		getVoiceParticipants = Signal,
		handleVoiceParticipantAdded = function(p1) --[[ Line: 48 ]]
			-- upvalues: Signal2 (copy), VOICESTATE (upval)
			local Text = tostring(p1)
			Signal2(function(Tbl) --[[ Line: 51 ]]
				-- upvalues: Text (copy), VOICESTATE (upval)
				local Copy = table.clone(Tbl)
				Copy[Text] = Copy[Text] or VOICESTATE.HIDDEN
				
				return Copy
			end)
		end,
		handleVoiceParticipantRemoved = function(p1) --[[ Line: 61 ]]
			-- upvalues: Signal2 (copy), t (copy)
			local Text = tostring(p1)
			Signal2(function(Tbl) --[[ Line: 64 ]]
				-- upvalues: t (upval), Text (copy)
				if t[Text] then
					t[Text] = nil
				end
				local Copy = table.clone(Tbl)
				Copy[Text] = nil
				
				return Copy
			end)
		end,
		handleVoiceParticipantsChanged = function(p1) --[[ Line: 75 ]]
			-- upvalues: Signal2 (copy), VOICESTATE (upval)
			Signal2(function(Tbl) --[[ Line: 76 ]]
				-- upvalues: p1 (copy), VOICESTATE (upval)
				local Copy = table.clone(Tbl)
				
				for i, value in p1 do
					Copy[tostring(i)] = if value.subscriptionCompleted then if value.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif value.isMuted then VOICESTATE.MUTED elseif value.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
				end
				return Copy
			end)
		end,
		handleVoiceStateChanged = function(p2, p3) --[[ Line: 96 ]]
			-- upvalues: Signal2 (copy)
			local Text = tostring(p2)
			Signal2(function(Tbl) --[[ Line: 99 ]]
				-- upvalues: Text (copy), p3 (copy)
				if Tbl[Text] then
					local Copy = table.clone(Tbl)
					Copy[Text] = p3
					
					return Copy
				else
					return Tbl
				end
			end)
		end
	}
end