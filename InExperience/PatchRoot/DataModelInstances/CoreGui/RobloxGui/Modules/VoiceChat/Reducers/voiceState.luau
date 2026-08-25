local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local var2 = if require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagEnableVoiceChatStorybookFix)() then require(corePackagesService.Workspace.Packages.VoiceChat).Constants.VOICE_STATE else require(script.Parent.Parent.VoiceChatServiceManager).default.VOICE_STATE

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.VoiceEnabledChanged).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { voiceEnabled = p1.enabled })
	end,
	[require(script.Parent.Parent.Actions.ParticipantAdded).name] = function(p2, p3)
		-- upvalues: var2 (write), cryoModule (ref)
		local userId = p3.userId
		
		return cryoModule.Dictionary.join(p2, { [userId] = p2[userId] or var2.HIDDEN })
	end,
	[require(script.Parent.Parent.Actions.ParticipantRemoved).name] = function(p4, p5)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { [p5.userId] = cryoModule.None })
	end,
	[require(script.Parent.Parent.Actions.ParticipantsChanged).name] = function(p6, p7)
		-- upvalues: var2 (write)
		local cloned = table.clone(p6)
		
		for i, v in p7.newParticipants do
			local INACTIVE = var2.INACTIVE
			
			if not v.subscriptionCompleted then
				INACTIVE = var2.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = var2.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = var2.MUTED
			elseif v.isSignalActive then
				INACTIVE = var2.TALKING
			end
			cloned[tostring(i)] = INACTIVE
		end
		return cloned
	end,
	[require(script.Parent.Parent.Actions.VoiceStateChanged).name] = function(p8, p9)
		-- upvalues: cryoModule (ref)
		return if p8[p9.userId] then cryoModule.Dictionary.join(p8, { [p9.userId] = p9.newState }) else p8
	end
})