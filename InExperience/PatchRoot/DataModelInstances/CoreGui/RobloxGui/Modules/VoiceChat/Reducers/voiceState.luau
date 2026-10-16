local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local VOICESTATE = nil
VOICESTATE = if require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagEnableVoiceChatStorybookFix)() then require(CorePackages.Workspace.Packages.VoiceChat).Constants.VOICE_STATE else require(script.Parent.Parent.VoiceChatServiceManager).default.VOICE_STATE

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.VoiceEnabledChanged).name] = function(p1, p2) --[[ Line: 26 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { voiceEnabled = p2.enabled })
	end,
	[require(script.Parent.Parent.Actions.ParticipantAdded).name] = function(p1, p2) --[[ Line: 32 ]]
		-- upvalues: VOICESTATE (ref), CryoModule (copy)
		local UserId = p2.userId
		
		return CryoModule.Dictionary.join(p1, { [UserId] = p1[UserId] or VOICESTATE.HIDDEN })
	end,
	[require(script.Parent.Parent.Actions.ParticipantRemoved).name] = function(p1, p2) --[[ Line: 42 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.userId] = CryoModule.None })
	end,
	[require(script.Parent.Parent.Actions.ParticipantsChanged).name] = function(Tbl, p1) --[[ Line: 49 ]]
		-- upvalues: VOICESTATE (ref)
		local Copy = table.clone(Tbl)
		
		for i, newParticipant in p1.newParticipants do
			Copy[tostring(i)] = if newParticipant.subscriptionCompleted then if newParticipant.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif newParticipant.isMuted then VOICESTATE.MUTED elseif newParticipant.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
		end
		return Copy
	end,
	[require(script.Parent.Parent.Actions.VoiceStateChanged).name] = function(p2, p3) --[[ Line: 69 ]]
		-- upvalues: CryoModule (copy)
		return if p2[p3.userId] then CryoModule.Dictionary.join(p2, { [p3.userId] = p3.newState }) else p2
	end
}))