local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local soundService = game:GetService("SoundService")
local voiceChatService = game:GetService("VoiceChatService")
local coreGuiService = game:GetService("CoreGui")
local constantsModule = require(script.Parent.Constants)
local flags = script.Parent.Flags
local promiseModule = require(parent.Promise)
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local getFFlagJoinWithoutMicPermissions = require(parent.SharedFlags).GetFFlagJoinWithoutMicPermissions
local getFFlagLocalMutedNilFix = require(parent.SharedFlags).GetFFlagLocalMutedNilFix
local getFFlagDebugVoiceChatMicPermissionCliBypassModule = require(flags.GetFFlagDebugVoiceChatMicPermissionCliBypass)
local getFFlagEnableExpJoinMicPermAnalyticsModule = require(flags.GetFFlagEnableExpJoinMicPermAnalytics)
local fFlagExpChatDictation = require(parent.SharedFlags).FFlagExpChatDictation
local var8 = require(flags.GetFFlagTalkingChangedWithDebounceV2)()
local var9 = require(flags.GetFIntTalkingChangedDebounceTime)()
local var10 = require(flags.GetFFlagUseAudioAnalyzerForLocalMetering2)()
local PERMISSION_STATE = constantsModule.PERMISSION_STATE
local MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = constantsModule.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY
local t = {}
t.__index = t

function t.new(p0) --[[ line: 55 ]]
	-- upvalues: t (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref)
	local tbl = setmetatable({}, t)
	tbl.log = p0.log
	tbl.callbacks = p0.callbacks
	tbl.localMuted = nil
	tbl.isTalking = false
	tbl.permissionState = if getFFlagJoinWithoutMicPermissions() then PERMISSION_STATE.IDLE else nil
	tbl.muteChanged = Instance.new("BindableEvent")
	tbl.talkingChanged = Instance.new("BindableEvent")
	tbl.permissionPromise = nil
	tbl.isPlayerWatchingAd = false
	tbl._lastTalkingChangedFireTime = 0
	tbl._lastTalkingChangedFireValue = nil
	tbl._connections = {}
	tbl.localMeteringTask = nil
	
	return tbl
end

local function _(value) --[[ line: 79 | named "isIgnoredAudioInput" ]]
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

function t:SetMicActive(p1, p2) --[[ line: 83 ]]
	-- upvalues: getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), permissionsProtocol (ref), voiceChatService (ref), playersService (ref)
	if self.localMuted == nil then
		self.log:trace("SetMicActive context: {} - Voice not connected yet", p2)
		
		return
	elseif self.localMuted == not p1 then return end
	self.log:trace("SetMicActive active: {} context: {}", p1, p2)
	
	if getFFlagJoinWithoutMicPermissions() then
		if self.permissionState == PERMISSION_STATE.PENDING_MIC then
			self.log:debug("In pending mic mode, requesting permission")
			self.callbacks.emitGetPermissions(function(p3) --[[ line: 98 ]]
				-- upvalues: self (ref), PERMISSION_STATE (copy), p1 (ref), p2 (ref)
				self.permissionState = if p3.hasMicPermissions then PERMISSION_STATE.LISTEN_AND_TALK else PERMISSION_STATE.LISTEN_ONLY
				self.log:debug("Got permissions, setting state to {}", self.permissionState)
				self:SetMicActive(p1, p2)
			end, { permissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)
			
			return
		elseif self.permissionState == PERMISSION_STATE.LISTEN_ONLY then
			self.log:debug("User tried to unmute despite being in listen only mode")
			self.callbacks.emitOnPermissionRequested()
			
			return
		elseif self.isPlayerWatchingAd then
			self.log:trace("User is watching an ad, skipping mic state change")
			
			return
		elseif voiceChatService.UseNewAudioApi then
			self.localMuted = not p1
			self.log:trace("Setting self mute to {} context: {}", p1, p2)
			local sendMuteEvent = self.callbacks.getSendMuteEvent()
			
			if sendMuteEvent then
				sendMuteEvent:FireServer(p1)
				
				for i in self.callbacks.getAudioDevices() do
					if i.Player and i.Player == playersService.LocalPlayer then
						i.Active = p1
					end
				end
				self.muteChanged:Fire(self.localMuted)
			else
				self.log:error("Could not find SendMuteEvent")
			end
		else
			local service = self.callbacks.getService()
			self.log:trace("Setting self mute to {} context: {}", not p1, p2)
			service:PublishPause(not p1)
			self.localMuted = not p1
			self.muteChanged:Fire(self.localMuted)
		end
		if not self.localMuted then
			self.talkingChanged:Fire(self.isTalking)
			self.callbacks.emitOnShowDataConsentToast()
		end
		if p2 then
			self.callbacks.reportVoiceMuteSelf(self.callbacks.getJoinWithVoiceMuteData({ context = p2, muted = self.localMuted }))
		end
		self:_assertDeviceStateConsistency()
	end
end

function t:SetLocalMuted(p4) --[[ line: 158 ]]
	self.localMuted = p4
end

function t:SyncLocalAudioDeviceActive() --[[ line: 162 ]]
	-- upvalues: voiceChatService (ref), playersService (ref)
	if not voiceChatService.UseNewAudioApi then return end
	local var15 = if self.localMuted == nil then false else not self.localMuted
	
	for i in self.callbacks.getAudioDevices() do
		if i.Player and i.Player == playersService.LocalPlayer then
			i.Active = var15
		end
	end
	self:_assertDeviceStateConsistency()
end

function t:SetupEarlyAudioDeviceGuard() --[[ line: 175 ]]
	-- upvalues: voiceChatService (ref), fFlagExpChatDictation (ref), coreGuiService (ref), playersService (ref), soundService (ref)
	local function _(p5) --[[ line: 176 | named "shouldDeactivate" ]]
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		return voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p5:IsDescendantOf(coreGuiService)) and (p5.Player == playersService.LocalPlayer and (p5.Active and self.localMuted == nil)))
	end
	
	local function guardDevice(p6) --[[ line: 184 ]]
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p6:IsDescendantOf(coreGuiService)) and (p6.Player == playersService.LocalPlayer and (p6.Active and self.localMuted == nil))) then
			p6.Active = false
		end
		table.insert(self._connections, p6:GetPropertyChangedSignal("Player"):Connect(function() --[[ line: 189 ]]
			-- upvalues: p6 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var17 = p6
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var17:IsDescendantOf(coreGuiService)) and (var17.Player == playersService.LocalPlayer and (var17.Active and self.localMuted == nil))) then
				p6.Active = false
			end
		end))
		table.insert(self._connections, p6:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 196 ]]
			-- upvalues: p6 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var18 = p6
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var18:IsDescendantOf(coreGuiService)) and (var18.Player == playersService.LocalPlayer and (var18.Active and self.localMuted == nil))) then
				p6.Active = false
			end
		end))
	end
	
	table.insert(self._connections, soundService.AudioInstanceAdded:Connect(function(p7) --[[ line: 204 ]]
		-- upvalues: guardDevice (ref)
		if p7:IsA("AudioDeviceInput") then
			guardDevice(p7)
		end
	end))
	
	for i, v in game:GetDescendants() do
		if v:IsA("AudioDeviceInput") then
			guardDevice(v)
		end
	end
end

function t:SetAndSyncActive(p8, p9) --[[ line: 218 ]]
	-- upvalues: playersService (ref)
	p8.Active = p9
	local sendMuteEvent = self.callbacks.getSendMuteEvent()
	
	if sendMuteEvent and p8.Player == playersService.LocalPlayer then
		sendMuteEvent:FireServer(p9)
	end
end

function t:RequestMicPermission() --[[ line: 226 ]]
	-- upvalues: getFFlagDebugVoiceChatMicPermissionCliBypassModule (ref), PERMISSION_STATE (ref), promiseModule (ref), permissionsProtocol (ref), getFFlagEnableExpJoinMicPermAnalyticsModule (ref)
	if getFFlagDebugVoiceChatMicPermissionCliBypassModule() then
		self.permissionState = PERMISSION_STATE.LISTEN_AND_TALK
		
		return promiseModule.resolve()
	elseif self.permissionPromise then
		self.log:trace("PermissionProtocol already invoked")
		
		return self.permissionPromise
	end
	self.permissionPromise = self.callbacks.requestPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p10) --[[ line: 240 ]]
		-- upvalues: getFFlagEnableExpJoinMicPermAnalyticsModule (copy), self (ref), promiseModule (copy), permissionsProtocol (copy)
		if getFFlagEnableExpJoinMicPermAnalyticsModule() then
			self.callbacks.recordExperienceJoinMicPerm(p10)
		end
		if p10 or p10.status then
			self.log:debug("Permission status {}", p10.status)
			local var20 = p10.status == permissionsProtocol.Status.AUTHORIZED
			
			return if self.callbacks.getPassInitErrorInPromiseReject() and not var20 then promiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else var20 and promiseModule.resolve() or promiseModule.reject()
		end
		self.log:debug("No permission response, rejecting access")
		self.callbacks.reportJoinFailed("noPermissionResponse", nil)
		
		return if self.callbacks.getPassInitErrorInPromiseReject() then promiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else promiseModule.reject()
	end):andThen(function() --[[ line: 260 ]]
		-- upvalues: self (ref), promiseModule (copy)
		self.callbacks.emitOnRequestMicPermissionResolved()
		
		return promiseModule.resolve()
	end):catch(function() --[[ line: 264 ]]
		-- upvalues: self (ref), promiseModule (copy)
		self.callbacks.emitOnRequestMicPermissionRejected()
		
		return if self.callbacks.getPassInitErrorInPromiseReject() then promiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else promiseModule.reject()
	end)
	
	return self.permissionPromise
end

function t:UpdateLocalMetering() --[[ line: 274 ]]
	-- upvalues: playersService (ref), var8 (ref)
	self.isTalking = self.callbacks.isSignalActive(playersService.LocalPlayer.UserId)
	
	if self.localMuted == false then
		if var8 then
			self:FireTalkingChangedDebounced(self.isTalking)
			
			return
		end
		self.talkingChanged:Fire(self.isTalking)
	end
end

function t:FireTalkingChangedDebounced(p11) --[[ line: 285 ]]
	-- upvalues: var9 (ref)
	local var21 = tick() * 1000
	
	if p11 ~= self._lastTalkingChangedFireValue or var9 < var21 - self._lastTalkingChangedFireTime then
		self._lastTalkingChangedFireTime = var21
		self._lastTalkingChangedFireValue = p11
		self.talkingChanged:Fire(p11)
	end
end

function t:SetupMicActivityListener(p12) --[[ line: 299 ]]
	-- upvalues: var10 (ref), voiceChatService (ref), MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY (ref), getFFlagLocalMutedNilFix (ref), var8 (ref)
	if var10 and voiceChatService.UseNewAudioApi then
		if self.localMeteringTask then
			return
		else
			self.localMeteringTask = task.spawn(function() --[[ line: 302 ]]
				-- upvalues: self (ref)
				while true do
					self:UpdateLocalMetering()
					task.wait()
				end
			end)
			
			return
		end
	elseif MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY <= p12:GetVoiceChatApiVersion() then
		table.insert(self._connections, p12.PlayerMicActivitySignalChange:Connect(function(p13) --[[ line: 311 ]]
			-- upvalues: self (ref), getFFlagLocalMutedNilFix (copy), var8 (copy)
			self.callbacks.onVoiceCapturedDuringVideoCapture(p13.isActive)
			self.isTalking = p13.isActive
			
			if getFFlagLocalMutedNilFix() then
				if self.localMuted ~= false then return end
				if var8 then
					self:FireTalkingChangedDebounced(self.isTalking)
					
					return
				end
				self.talkingChanged:Fire(self.isTalking)
				
				return
			elseif not self.localMuted then
				if var8 then
					self:FireTalkingChangedDebounced(self.isTalking)
					
					return
				end
				self.talkingChanged:Fire(self.isTalking)
			end
		end))
	end
end

function t:SetAdMuteBlocked(p14) --[[ line: 337 ]]
	self.isPlayerWatchingAd = p14
end

function t:Disconnect() --[[ line: 341 ]]
	for i, v in self._connections do
		v:Disconnect()
	end
	self._connections = {}
	
	if self.localMeteringTask then
		task.cancel(self.localMeteringTask)
		self.localMeteringTask = nil
	end
end

function t:_assertDeviceStateConsistency() --[[ line: 352 ]]
	-- upvalues: playersService (ref)
	local var22 = if self.localMuted == nil then false else not self.localMuted
	
	for i in self.callbacks.getAudioDevices() do
		if i.Player and i.Player == playersService.LocalPlayer and i.Active ~= var22 then
			self.log:warning("MicManager consistency: device.Active={} expected={} localMuted={}", i.Active, var22, self.localMuted)
		end
	end
end

return t