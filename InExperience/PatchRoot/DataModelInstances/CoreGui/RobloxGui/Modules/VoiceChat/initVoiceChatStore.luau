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
local var10 = require(robloxGui.Modules.VoiceChat.Logger)(script.Name)
local var11 = if fFlagEnableVoiceChatStorybookFixModule() then constants.VOICE_STATE else default.VOICE_STATE

local function _(p0) --[[ line: 28 | named "shorten" ]]
	return "..." .. string.sub(tostring(p0), -4)
end

local var12 = nil

local function setVoiceEnabled(value, p1) --[[ line: 34 ]]
	-- upvalues: playersService (ref), voiceEnabledChangedModule (ref), var12 (write), var10 (ref), voiceStateChangedModule (ref), var11 (write), getFFlagLocalMutedNilFix (ref), default (ref)
	local var15 = tostring(playersService.LocalPlayer.UserId)
	p1:dispatch(voiceEnabledChangedModule(value ~= Enum.VoiceChatState.Ended))
	
	if var12[value] then
		p1:dispatch(voiceStateChangedModule(var15, var12[value]))
	else
		var10:warning("LOCAL_STATE_MAP does not exist for {} state", value)
		p1:dispatch(voiceStateChangedModule(var15, var11.MUTED))
	end
	if value == Enum.VoiceChatState.Failed then
		for i, v in pairs(playersService:GetPlayers()) do
			local var16 = tostring(v.UserId)
			
			if v ~= playersService.LocalPlayer then
				p1:dispatch(voiceStateChangedModule(var16, var11.HIDDEN))
			end
		end
		return
	elseif value == Enum.VoiceChatState.Joined then
		local var17
		if getFFlagLocalMutedNilFix then
			var17 = default.localMuted == false
			var17 = nil
		else
			var17 = not default.localMuted
		end
		if var17 then
			p1:dispatch(voiceStateChangedModule(var15, var11.INACTIVE))
		end
	end
end

local var14 = function(p2) --[[ line: 64 ]]
	-- upvalues: var12 (write), var11 (write), default (ref), var10 (ref), playersService (ref), participantAddedModule (ref), playerRemovedModule (ref), participantRemovedModule (ref), voiceStateChangedModule (ref), blockingUtilityModule (ref), setVoiceEnabled (ref)
	var12 = {
		[Enum.VoiceChatState.Idle] = var11.HIDDEN,
		[Enum.VoiceChatState.Joining] = var11.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = var11.CONNECTING,
		[Enum.VoiceChatState.Joined] = var11.MUTED,
		[Enum.VoiceChatState.Leaving] = var11.MUTED,
		[Enum.VoiceChatState.Ended] = var11.HIDDEN,
		[Enum.VoiceChatState.Failed] = var11.ERROR
	}
	local service = default:getService()
	
	if not service then
		var10:debug("VoiceChatService is not available")
		
		return
	end
	local userId = playersService.LocalPlayer.UserId
	
	for i, v in pairs(playersService:GetPlayers()) do
		var10:trace("Adding existing player {}", "..." .. string.sub(tostring(v.UserId), -4))
		p2:dispatch(participantAddedModule(tostring(v.UserId)))
	end
	playersService.PlayerAdded:Connect(function(p3) --[[ line: 88 ]]
		-- upvalues: var10 (copy), p2 (ref), participantAddedModule (copy)
		var10:trace("Adding joining player {}", "..." .. string.sub(tostring(p3.UserId), -4))
		p2:dispatch(participantAddedModule(tostring(p3.userId)))
	end)
	playersService.PlayerRemoving:Connect(function(p4) --[[ line: 93 ]]
		-- upvalues: var10 (copy), p2 (ref), playerRemovedModule (copy), participantRemovedModule (copy)
		var10:trace("Removing player {}", "..." .. string.sub(tostring(p4.UserId), -4))
		p2:dispatch(playerRemovedModule(tostring(p4.userId)))
		p2:dispatch(participantRemovedModule(tostring(p4.userId)))
	end)
	p2:dispatch(voiceStateChangedModule(userId, var11.HIDDEN))
	default.muteChanged.Event:Connect(function(p5) --[[ line: 101 ]]
		-- upvalues: var10 (copy), var11 (copy), p2 (ref), voiceStateChangedModule (copy), userId (ref)
		var10:debug("Mute changed to {}", p5)
		p2:dispatch(voiceStateChangedModule(userId, if p5 then var11.MUTED else var11.INACTIVE))
	end)
	default.participantsUpdate.Event:Connect(function(p6) --[[ line: 107 ]]
		-- upvalues: var11 (copy), var10 (copy), p2 (ref), voiceStateChangedModule (copy)
		for i, v in pairs(p6) do
			local INACTIVE = var11.INACTIVE
			
			if v.subscriptionFailed then
				INACTIVE = var11.ERROR
			elseif not v.subscriptionCompleted then
				INACTIVE = var11.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = var11.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = var11.MUTED
			elseif v.isSignalActive then
				INACTIVE = var11.TALKING
			end
			var10:trace("Participant update for {}, voice state {}", i, INACTIVE)
			p2:dispatch(voiceStateChangedModule(i, INACTIVE))
		end
	end)
	default.talkingChanged.Event:Connect(function(p7) --[[ line: 128 ]]
		-- upvalues: p2 (ref), voiceStateChangedModule (copy), userId (ref), var11 (copy)
		if p7 then
			p2:dispatch(voiceStateChangedModule(userId, var11.TALKING))
			
			return
		end
		p2:dispatch(voiceStateChangedModule(userId, var11.INACTIVE))
	end)
	blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p8, p9) --[[ line: 139 ]]
		-- upvalues: p2 (ref), participantRemovedModule (copy), participantAddedModule (copy)
		if p9 then
			p2:dispatch(participantRemovedModule(tostring(p8)))
			
			return
		end
		p2:dispatch(participantAddedModule(tostring(p8)))
	end)
	var10:debug("Initial voice state is {}", service.VoiceChatState)
	setVoiceEnabled(service.VoiceChatState, p2)
	service.StateChanged:Connect(function(_, p10) --[[ line: 149 ]]
		-- upvalues: var10 (copy), setVoiceEnabled (copy), p2 (ref)
		var10:debug("Voice state changed to {}", p10)
		setVoiceEnabled(p10, p2)
	end)
end

return function(p11) --[[ line: 155 ]]
	-- upvalues: default (ref), var14 (ref), var10 (ref)
	if game:GetEngineFeature("VoiceChatSupported") then
		default:asyncInit():andThen(function() --[[ line: 158 ]]
			-- upvalues: default (copy), var14 (copy), p11 (ref)
			default:SetupParticipantListeners()
			var14(p11)
		end):catch(function() --[[ line: 162 ]]
			-- upvalues: var10 (copy)
			var10:warning("Failed to init VoiceChatServiceManager")
		end)
	end
end