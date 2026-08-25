local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local VOICE_JOIN_PROGRESS = require(parent.VoiceChatCore).Constants.VOICE_JOIN_PROGRESS

return {
	useIsVoiceChatReportable = function(p0)
		-- upvalues: VOICE_JOIN_PROGRESS (ref), reactModule (ref)
		local var1, var2 = reactModule.useState(function()
			-- upvalues: p0 (ref), VOICE_JOIN_PROGRESS (copy)
			return p0:UserVoiceEnabled() and p0:GetVoiceJoinProgress() ~= VOICE_JOIN_PROGRESS.Suspended
		end)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), p0 (ref), VOICE_JOIN_PROGRESS (copy)
			local var3 = true
			
			local function recheck()
				-- upvalues: var3 (write), var2 (copy), p0 (copy), VOICE_JOIN_PROGRESS (copy)
				if var3 then
					var2(p0:UserVoiceEnabled() and p0:GetVoiceJoinProgress() ~= VOICE_JOIN_PROGRESS.Suspended)
					
					return
				end
			end
			
			p0:asyncInit():andThen(recheck):catch(recheck)
			local eventConnection = p0.VoiceJoinProgressChanged.Event:Connect(recheck)
			
			return function()
				-- upvalues: var3 (write), eventConnection (ref)
				var3 = false
				eventConnection:Disconnect()
			end
		end, { p0 })
		
		return var1
	end
}