local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local VOICE_STATE = require(parent.VoiceChat).Constants.VOICE_STATE

return function()
	-- upvalues: createSignal (ref), createComputed (ref), VOICE_STATE (ref)
	local var1, var2 = createSignal({})
	local t = {}
	
	local function _(p1)
		return tostring(p1)
	end
	
	return {
		getOrCreateVoiceState = function(p1)
			-- upvalues: t (ref), createComputed (copy), var1 (ref)
			local var3 = tostring(p1)
			
			if not t[var3] then
				t[var3] = createComputed(function(p2)
					-- upvalues: var1 (copy), var3 (ref)
					return var1(p2)[var3]
				end)
			end
			return t[var3]
		end,
		getVoiceParticipants = var1,
		handleVoiceParticipantAdded = function(p1)
			-- upvalues: var2 (ref), VOICE_STATE (copy)
			local var3 = tostring(p1)
			var2(function(p2)
				-- upvalues: var3 (ref), VOICE_STATE (copy)
				local cloned = table.clone(p2)
				cloned[var3] = cloned[var3] or VOICE_STATE.HIDDEN
				
				return cloned
			end)
		end,
		handleVoiceParticipantRemoved = function(p1)
			-- upvalues: var2 (ref), t (ref)
			local var3 = tostring(p1)
			var2(function(p2)
				-- upvalues: t (copy), var3 (ref)
				if t[var3] then
					t[var3] = nil
				end
				local cloned = table.clone(p2)
				cloned[var3] = nil
				
				return cloned
			end)
		end,
		handleVoiceParticipantsChanged = function(p1)
			-- upvalues: var2 (ref), VOICE_STATE (copy)
			var2(function(p2)
				-- upvalues: p1 (ref), VOICE_STATE (copy)
				local cloned = table.clone(p2)
				
				for i, v in p1 do
					local INACTIVE = VOICE_STATE.INACTIVE
					
					if not v.subscriptionCompleted then
						INACTIVE = VOICE_STATE.CONNECTING
					elseif v.isMutedLocally then
						INACTIVE = VOICE_STATE.LOCAL_MUTED
					elseif v.isMuted then
						INACTIVE = VOICE_STATE.MUTED
					elseif v.isSignalActive then
						INACTIVE = VOICE_STATE.TALKING
					end
					cloned[tostring(i)] = INACTIVE
				end
				return cloned
			end)
		end,
		handleVoiceStateChanged = function(p2, p3)
			-- upvalues: var2 (ref)
			local var3 = tostring(p2)
			var2(function(p4)
				-- upvalues: var3 (ref), p3 (ref)
				if p4[var3] then
					local cloned = table.clone(p4)
					cloned[var3] = p3
					
					return cloned
				end
				return p4
			end)
		end
	}
end