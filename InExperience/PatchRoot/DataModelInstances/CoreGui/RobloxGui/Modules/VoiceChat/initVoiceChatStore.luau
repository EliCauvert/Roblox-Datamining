local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local fFlagEnableVoiceChatStorybookFixModule = require(robloxGui.Modules.Flags.FFlagEnableVoiceChatStorybookFix)
local getFFlagLocalMutedNilFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix
local voiceEnabledChangedModule = require(script.Parent.Actions.VoiceEnabledChanged)
local voiceStateChangedModule = require(script.Parent.Actions.VoiceStateChanged)
local participantAddedModule = require(script.Parent.Actions.ParticipantAdded)
local participantRemovedModule = require(script.Parent.Actions.ParticipantRemoved)
local playerRemovedModule = require(script.Parent.Actions.PlayerRemoved)
local default = require(script.Parent.VoiceChatServiceManager).default
local constants = require(corePackagesService.Workspace.Packages.VoiceChat).Constants
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local var1 = require(robloxGui.Modules.VoiceChat.Logger)(script.Name)
local var2 = if fFlagEnableVoiceChatStorybookFixModule() then constants.VOICE_STATE else default.VOICE_STATE

local function _(p1)
	return "..." .. string.sub(tostring(p1), -4)
end

local var3 = nil

local function setVoiceEnabled(value, p1)
	-- upvalues: playersService (ref), voiceEnabledChangedModule (ref), var3 (write), var1 (ref), voiceStateChangedModule (ref), var2 (write), getFFlagLocalMutedNilFix (ref), default (ref)
	local var4 = tostring(playersService.LocalPlayer.UserId)
	p1:dispatch(voiceEnabledChangedModule(value ~= Enum.VoiceChatState.Ended))
	
	if var3[value] then
		p1:dispatch(voiceStateChangedModule(var4, var3[value]))
	else
		var1:warning("LOCAL_STATE_MAP does not exist for {} state", value)
		p1:dispatch(voiceStateChangedModule(var4, var2.MUTED))
	end
	if value == Enum.VoiceChatState.Failed then
		for i, v in pairs(playersService:GetPlayers()) do
			local var5 = tostring(v.UserId)
			
			if v ~= playersService.LocalPlayer then
				p1:dispatch(voiceStateChangedModule(var5, var2.HIDDEN))
			end
		end
		return
	elseif value == Enum.VoiceChatState.Joined then
		local var6
		if getFFlagLocalMutedNilFix then
			var6 = default.localMuted == false
			var6 = nil
		else
			var6 = not default.localMuted
		end
		if var6 then
			p1:dispatch(voiceStateChangedModule(var4, var2.INACTIVE))
		end
	end
end

local var7 = function(p2)
	-- upvalues: var3 (write), var2 (write), default (ref), var1 (ref), playersService (ref), participantAddedModule (ref), playerRemovedModule (ref), participantRemovedModule (ref), voiceStateChangedModule (ref), blockingUtilityModule (ref), setVoiceEnabled (ref)
	var3 = {
		[Enum.VoiceChatState.Idle] = var2.HIDDEN,
		[Enum.VoiceChatState.Joining] = var2.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = var2.CONNECTING,
		[Enum.VoiceChatState.Joined] = var2.MUTED,
		[Enum.VoiceChatState.Leaving] = var2.MUTED,
		[Enum.VoiceChatState.Ended] = var2.HIDDEN,
		[Enum.VoiceChatState.Failed] = var2.ERROR
	}
	local service = default:getService()
	
	if not service then
		var1:debug("VoiceChatService is not available")
		
		return
	end
	local userId = playersService.LocalPlayer.UserId
	
	for i, v in pairs(playersService:GetPlayers()) do
		var1:trace("Adding existing player {}", "..." .. string.sub(tostring(v.UserId), -4))
		p2:dispatch(participantAddedModule(tostring(v.UserId)))
	end
	playersService.PlayerAdded:Connect(function(p3)
		-- upvalues: var1 (copy), p2 (ref), participantAddedModule (copy)
		var1:trace("Adding joining player {}", "..." .. string.sub(tostring(p3.UserId), -4))
		p2:dispatch(participantAddedModule(tostring(p3.userId)))
	end)
	playersService.PlayerRemoving:Connect(function(p3)
		-- upvalues: var1 (copy), p2 (ref), playerRemovedModule (copy), participantRemovedModule (copy)
		var1:trace("Removing player {}", "..." .. string.sub(tostring(p3.UserId), -4))
		p2:dispatch(playerRemovedModule(tostring(p3.userId)))
		p2:dispatch(participantRemovedModule(tostring(p3.userId)))
	end)
	p2:dispatch(voiceStateChangedModule(userId, var2.HIDDEN))
	default.muteChanged.Event:Connect(function(p3)
		-- upvalues: var1 (copy), var2 (copy), p2 (ref), voiceStateChangedModule (copy), userId (ref)
		var1:debug("Mute changed to {}", p3)
		p2:dispatch(voiceStateChangedModule(userId, if p3 then var2.MUTED else var2.INACTIVE))
	end)
	default.participantsUpdate.Event:Connect(function(p3)
		-- upvalues: var2 (copy), var1 (copy), p2 (ref), voiceStateChangedModule (copy)
		for i, v in pairs(p3) do
			local INACTIVE = var2.INACTIVE
			
			if v.subscriptionFailed then
				INACTIVE = var2.ERROR
			elseif not v.subscriptionCompleted then
				INACTIVE = var2.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = var2.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = var2.MUTED
			elseif v.isSignalActive then
				INACTIVE = var2.TALKING
			end
			var1:trace("Participant update for {}, voice state {}", i, INACTIVE)
			p2:dispatch(voiceStateChangedModule(i, INACTIVE))
		end
	end)
	default.talkingChanged.Event:Connect(function(p4)
		-- upvalues: p2 (ref), voiceStateChangedModule (copy), userId (ref), var2 (copy)
		if p4 then
			p2:dispatch(voiceStateChangedModule(userId, var2.TALKING))
			
			return
		end
		p2:dispatch(voiceStateChangedModule(userId, var2.INACTIVE))
	end)
	blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p4, p5)
		-- upvalues: p2 (ref), participantRemovedModule (copy), participantAddedModule (copy)
		if p5 then
			p2:dispatch(participantRemovedModule(tostring(p4)))
			
			return
		end
		p2:dispatch(participantAddedModule(tostring(p4)))
	end)
	var1:debug("Initial voice state is {}", service.VoiceChatState)
	setVoiceEnabled(service.VoiceChatState, p2)
	service.StateChanged:Connect(function(_, p4)
		-- upvalues: var1 (copy), setVoiceEnabled (copy), p2 (ref)
		var1:debug("Voice state changed to {}", p4)
		setVoiceEnabled(p4, p2)
	end)
end

return function(p3)
	-- upvalues: default (ref), var7 (ref), var1 (ref)
	if game:GetEngineFeature("VoiceChatSupported") then
		default:asyncInit():andThen(function()
			-- upvalues: default (copy), var7 (copy), p3 (ref)
			default:SetupParticipantListeners()
			var7(p3)
		end):catch(function()
			-- upvalues: var1 (copy)
			var1:warning("Failed to init VoiceChatServiceManager")
		end)
	end
end