local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local VOICE_STATE = require(parent.VoiceChat).Constants.VOICE_STATE

return function()
	-- upvalues: createSignal (ref), createComputed (ref), VOICE_STATE (ref)
	local var1, var2 = createSignal({})
	local t = {}
	
	local function _(p0)
		return tostring(p0)
	end
	
	return {
		getOrCreateVoiceState = function(p1)
			-- upvalues: t (ref), createComputed (copy), var1 (ref)
			local var4 = tostring(p1)
			
			if not t[var4] then
				t[var4] = createComputed(function(p2)
					-- upvalues: var1 (copy), var4 (ref)
					return var1(p2)[var4]
				end)
			end
			return t[var4]
		end,
		getVoiceParticipants = var1,
		handleVoiceParticipantAdded = function(p3)
			-- upvalues: var2 (ref), VOICE_STATE (copy)
			local var5 = tostring(p3)
			var2(function(p4)
				-- upvalues: var5 (ref), VOICE_STATE (copy)
				local cloned = table.clone(p4)
				cloned[var5] = cloned[var5] or VOICE_STATE.HIDDEN
				
				return cloned
			end)
		end,
		handleVoiceParticipantRemoved = function(p5)
			-- upvalues: var2 (ref), t (ref)
			local var7 = tostring(p5)
			var2(function(p6)
				-- upvalues: t (copy), var7 (ref)
				if t[var7] then
					t[var7] = nil
				end
				local cloned = table.clone(p6)
				cloned[var7] = nil
				
				return cloned
			end)
		end,
		handleVoiceParticipantsChanged = function(p7)
			-- upvalues: var2 (ref), VOICE_STATE (copy)
			var2(function(p8)
				-- upvalues: p7 (ref), VOICE_STATE (copy)
				local cloned = table.clone(p8)
				
				for i, v in p7 do
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
		handleVoiceStateChanged = function(p9, p10)
			-- upvalues: var2 (ref)
			local var10 = tostring(p9)
			var2(function(p11)
				-- upvalues: var10 (ref), p10 (ref)
				if p11[var10] then
					local cloned = table.clone(p11)
					cloned[var10] = p10
					
					return cloned
				end
				return p11
			end)
		end
	}
end