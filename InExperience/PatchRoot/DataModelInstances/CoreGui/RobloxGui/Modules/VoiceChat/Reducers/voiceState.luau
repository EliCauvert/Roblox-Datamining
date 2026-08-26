local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local var1 = if require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagEnableVoiceChatStorybookFix)() then require(corePackagesService.Workspace.Packages.VoiceChat).Constants.VOICE_STATE else require(script.Parent.Parent.VoiceChatServiceManager).default.VOICE_STATE

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.VoiceEnabledChanged).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { voiceEnabled = p2.enabled })
	end,
	[require(script.Parent.Parent.Actions.ParticipantAdded).name] = function(p1, p2)
		-- upvalues: var1 (write), cryoModule (ref)
		local userId = p2.userId
		
		return cryoModule.Dictionary.join(p1, { [userId] = p1[userId] or var1.HIDDEN })
	end,
	[require(script.Parent.Parent.Actions.ParticipantRemoved).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.userId] = cryoModule.None })
	end,
	[require(script.Parent.Parent.Actions.ParticipantsChanged).name] = function(p1, p2)
		-- upvalues: var1 (write)
		local cloned = table.clone(p1)
		
		for i, v in p2.newParticipants do
			local INACTIVE = var1.INACTIVE
			
			if not v.subscriptionCompleted then
				INACTIVE = var1.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = var1.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = var1.MUTED
			elseif v.isSignalActive then
				INACTIVE = var1.TALKING
			end
			cloned[tostring(i)] = INACTIVE
		end
		return cloned
	end,
	[require(script.Parent.Parent.Actions.VoiceStateChanged).name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		return if p3[p4.userId] then cryoModule.Dictionary.join(p3, { [p4.userId] = p4.newState }) else p3
	end
})