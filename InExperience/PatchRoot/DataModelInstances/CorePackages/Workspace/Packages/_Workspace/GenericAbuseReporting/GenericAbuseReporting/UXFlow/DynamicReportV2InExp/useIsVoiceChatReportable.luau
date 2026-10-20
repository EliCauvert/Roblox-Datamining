local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local VOICEJOINPROGRESS = require(Parent.VoiceChatCore).Constants.VOICE_JOIN_PROGRESS

return {
	useIsVoiceChatReportable = function(p1)
		-- upvalues: VOICEJOINPROGRESS (copy), ReactModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
			-- upvalues: p1 (copy), VOICEJOINPROGRESS (upval)
			return p1:UserVoiceEnabled() and p1:GetVoiceJoinProgress() ~= VOICEJOINPROGRESS.Suspended
		end)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy), p1 (copy), VOICEJOINPROGRESS (upval)
			local Flag = true
			
			local function recheck()
				-- upvalues: Flag (ref), UseStateResult2 (upval), p1 (upval), VOICEJOINPROGRESS (upval)
				if Flag then
					UseStateResult2(p1:UserVoiceEnabled() and p1:GetVoiceJoinProgress() ~= VOICEJOINPROGRESS.Suspended)
					
					return
				end
			end
			
			p1:asyncInit():andThen(recheck):catch(recheck)
			local EventConnection = p1.VoiceJoinProgressChanged.Event:Connect(recheck)
			
			return function()
				-- upvalues: Flag (ref), EventConnection (copy)
				Flag = false
				EventConnection:Disconnect()
			end
		end, { p1 })
		
		return UseStateResult
	end
}