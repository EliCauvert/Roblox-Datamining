local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local GetFFlagLocalMutedNilFix = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix
local VoiceEnabledChangedModule = require(script.Parent.Actions.VoiceEnabledChanged)
local VoiceStateChangedModule = require(script.Parent.Actions.VoiceStateChanged)
local ParticipantAddedModule = require(script.Parent.Actions.ParticipantAdded)
local ParticipantRemovedModule = require(script.Parent.Actions.ParticipantRemoved)
local PlayerRemovedModule = require(script.Parent.Actions.PlayerRemoved)
local Default = require(script.Parent.VoiceChatServiceManager).default
local Constants = require(CorePackages.Workspace.Packages.VoiceChat).Constants
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local v1 = require(RobloxGui.Modules.VoiceChat.Logger)(script.Name)
local VOICESTATE = nil
VOICESTATE = if require(RobloxGui.Modules.Flags.FFlagEnableVoiceChatStorybookFix)() then Constants.VOICE_STATE else Default.VOICE_STATE

local function _(p1): string --[[ Line: 28 | Named "shorten" ]]
	return "..." .. string.sub(tostring(p1), -4)
end

local Config = nil

local function setVoiceEnabled(VoiceChatState, p1) --[[ Line: 34 ]]
	-- upvalues: Players (copy), VoiceEnabledChangedModule (copy), Config (ref), v1 (copy), VoiceStateChangedModule (copy), VOICESTATE (ref), GetFFlagLocalMutedNilFix (copy), Default (copy)
	local Text = tostring(Players.LocalPlayer.UserId)
	p1:dispatch(VoiceEnabledChangedModule(VoiceChatState ~= Enum.VoiceChatState.Ended))
	
	if Config[VoiceChatState] then
		p1:dispatch(VoiceStateChangedModule(Text, Config[VoiceChatState]))
	else
		v1:warning("LOCAL_STATE_MAP does not exist for {} state", VoiceChatState)
		p1:dispatch(VoiceStateChangedModule(Text, VOICESTATE.MUTED))
	end
	if VoiceChatState == Enum.VoiceChatState.Failed then
		for _, player in pairs(Players:GetPlayers()) do
			local Text1 = tostring(player.UserId)
			
			if player ~= Players.LocalPlayer then
				p1:dispatch(VoiceStateChangedModule(Text1, VOICESTATE.HIDDEN))
			end
		end
		return
	elseif VoiceChatState == Enum.VoiceChatState.Joined and (if GetFFlagLocalMutedNilFix then Default.localMuted == false else not Default.localMuted) then
		p1:dispatch(VoiceStateChangedModule(Text, VOICESTATE.INACTIVE))
	end
end

local function v18(p2) --[[ Line: 64 ]]
	-- upvalues: Config (ref), VOICESTATE (ref), Default (copy), v1 (copy), Players (copy), ParticipantAddedModule (copy), PlayerRemovedModule (copy), ParticipantRemovedModule (copy), VoiceStateChangedModule (copy), BlockingUtilityModule (copy), setVoiceEnabled (copy)
	Config = {
		[Enum.VoiceChatState.Idle] = VOICESTATE.HIDDEN,
		[Enum.VoiceChatState.Joining] = VOICESTATE.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = VOICESTATE.CONNECTING,
		[Enum.VoiceChatState.Joined] = VOICESTATE.MUTED,
		[Enum.VoiceChatState.Leaving] = VOICESTATE.MUTED,
		[Enum.VoiceChatState.Ended] = VOICESTATE.HIDDEN,
		[Enum.VoiceChatState.Failed] = VOICESTATE.ERROR
	}
	local Service = Default:getService()
	
	if not Service then
		v1:debug("VoiceChatService is not available")
		
		return
	end
	local UserId = Players.LocalPlayer.UserId
	
	for _, player in pairs(Players:GetPlayers()) do
		v1:trace("Adding existing player {}", "..." .. string.sub(tostring(player.UserId), -4))
		p2:dispatch(ParticipantAddedModule((tostring(player.UserId))))
	end
	Players.PlayerAdded:Connect(function(Player) --[[ Line: 88 ]]
		-- upvalues: v1 (upval), p2 (copy), ParticipantAddedModule (upval)
		v1:trace("Adding joining player {}", "..." .. string.sub(tostring(Player.UserId), -4))
		p2:dispatch(ParticipantAddedModule((tostring(Player.userId))))
	end)
	Players.PlayerRemoving:Connect(function(Player) --[[ Line: 93 ]]
		-- upvalues: v1 (upval), p2 (copy), PlayerRemovedModule (upval), ParticipantRemovedModule (upval)
		v1:trace("Removing player {}", "..." .. string.sub(tostring(Player.UserId), -4))
		p2:dispatch(PlayerRemovedModule((tostring(Player.userId))))
		p2:dispatch(ParticipantRemovedModule((tostring(Player.userId))))
	end)
	p2:dispatch(VoiceStateChangedModule(UserId, VOICESTATE.HIDDEN))
	Default.muteChanged.Event:Connect(function(p3) --[[ Line: 101 ]]
		-- upvalues: v1 (upval), VOICESTATE (upval), p2 (copy), VoiceStateChangedModule (upval), UserId (copy)
		v1:debug("Mute changed to {}", p3)
		p2:dispatch(VoiceStateChangedModule(UserId, p3 and VOICESTATE.MUTED or VOICESTATE.INACTIVE))
	end)
	Default.participantsUpdate.Event:Connect(function(List) --[[ Line: 107 ]]
		-- upvalues: VOICESTATE (upval), v1 (upval), p2 (copy), VoiceStateChangedModule (upval)
		for i, value in pairs(List) do
			local ERROR = if value.subscriptionFailed then VOICESTATE.ERROR elseif value.subscriptionCompleted then if value.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif value.isMuted then VOICESTATE.MUTED elseif value.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING
			v1:trace("Participant update for {}, voice state {}", i, ERROR)
			p2:dispatch(VoiceStateChangedModule(i, ERROR))
		end
	end)
	Default.talkingChanged.Event:Connect(function(p3) --[[ Line: 128 ]]
		-- upvalues: p2 (copy), VoiceStateChangedModule (upval), UserId (copy), VOICESTATE (upval)
		if p3 then
			p2:dispatch(VoiceStateChangedModule(UserId, VOICESTATE.TALKING))
			
			return
		else
			p2:dispatch(VoiceStateChangedModule(UserId, VOICESTATE.INACTIVE))
		end
	end)
	BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p3, p4) --[[ Line: 139 ]]
		-- upvalues: p2 (copy), ParticipantRemovedModule (upval), ParticipantAddedModule (upval)
		if p4 then
			p2:dispatch(ParticipantRemovedModule((tostring(p3))))
			
			return
		else
			p2:dispatch(ParticipantAddedModule((tostring(p3))))
		end
	end)
	v1:debug("Initial voice state is {}", Service.VoiceChatState)
	setVoiceEnabled(Service.VoiceChatState, p2)
	Service.StateChanged:Connect(function(_, NewState) --[[ Line: 149 ]]
		-- upvalues: v1 (upval), setVoiceEnabled (upval), p2 (copy)
		v1:debug("Voice state changed to {}", NewState)
		setVoiceEnabled(NewState, p2)
	end)
end

return function(p3) --[[ Line: 155 ]]
	-- upvalues: Default (copy), v18 (copy), v1 (copy)
	if game:GetEngineFeature("VoiceChatSupported") then
		Default:asyncInit():andThen(function() --[[ Line: 158 ]]
			-- upvalues: Default (upval), v18 (upval), p3 (copy)
			Default:SetupParticipantListeners()
			v18(p3)
		end):catch(function() --[[ Line: 162 ]]
			-- upvalues: v1 (upval)
			v1:warning("Failed to init VoiceChatServiceManager")
		end)
	end
end