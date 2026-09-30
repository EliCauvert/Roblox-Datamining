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
local var1 = require(flags.GetFFlagTalkingChangedWithDebounceV2)()
local var2 = require(flags.GetFIntTalkingChangedDebounceTime)()
local var3 = require(flags.GetFFlagUseAudioAnalyzerForLocalMetering2)()
local getFFlagMicConsumerRegistryModule = require(flags.GetFFlagMicConsumerRegistry)
local PERMISSION_STATE = constantsModule.PERMISSION_STATE
local MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = constantsModule.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY
local _ = {
	VoiceChat = "VoiceChat",
	STT = "STT",
	DeveloperAudioDevice = "DeveloperAudioDevice"
}
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), getFFlagMicConsumerRegistryModule (ref)
	local tbl = setmetatable({}, t)
	tbl.log = p1.log
	tbl.callbacks = p1.callbacks
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
	
	if getFFlagMicConsumerRegistryModule() then
		tbl._consumers = {}
		tbl._consumerCount = 0
		tbl.hasConsumersChanged = Instance.new("BindableEvent")
		tbl._activeConsumerType = nil
		tbl._levelDetectionTask = nil
		tbl._hasShownPrivacyToast = false
		tbl._hasShownPermDeniedToast = false
		tbl._micIndicatorReady = false
		tbl._developerDeviceConnections = {}
		tbl._developerAudioInstancesFolder = nil
		tbl.levelChanged = Instance.new("BindableEvent")
		tbl._lastLevel = 0
	end
	return tbl
end

local function _(value)
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

function t:SetMicActive(p1, p2)
	-- upvalues: getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), permissionsProtocol (ref), voiceChatService (ref), getFFlagMicConsumerRegistryModule (ref), playersService (ref)
	if self.localMuted == nil then
		self.log:trace("SetMicActive context: {} - Voice not connected yet", p2)
		
		return
	elseif self.localMuted == not p1 then return end
	self.log:trace("SetMicActive active: {} context: {}", p1, p2)
	
	if getFFlagJoinWithoutMicPermissions() then
		if self.permissionState == PERMISSION_STATE.PENDING_MIC then
			self.log:debug("In pending mic mode, requesting permission")
			self.callbacks.emitGetPermissions(function(p3)
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
				local var4 = p1 and (not getFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
				
				for i in self.callbacks.getAudioDevices() do
					if i.Player and i.Player == playersService.LocalPlayer then
						i.Active = var4
					end
				end
				if getFFlagMicConsumerRegistryModule() then
					for i_1, v in self._consumers do
						if v.device and v.consumerType ~= "VoiceChat" then
							v.device.Active = var4
						end
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
		elseif getFFlagMicConsumerRegistryModule() and self._lastLevel ~= 0 then
			self._lastLevel = 0
			self.levelChanged:Fire(0)
		end
		if p2 then
			self.callbacks.reportVoiceMuteSelf(self.callbacks.getJoinWithVoiceMuteData({ context = p2, muted = self.localMuted }))
		end
		self:_assertDeviceStateConsistency()
	end
end

function t:SetLocalMuted(p3)
	self.localMuted = p3
end

function t:SyncLocalAudioDeviceActive()
	-- upvalues: voiceChatService (ref), getFFlagMicConsumerRegistryModule (ref), playersService (ref)
	if not voiceChatService.UseNewAudioApi then return end
	local var5 = self.localMuted == false and (not getFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
	
	for i in self.callbacks.getAudioDevices() do
		if i.Player and i.Player == playersService.LocalPlayer then
			i.Active = var5
		end
	end
	self:_assertDeviceStateConsistency()
end

function t:SetupEarlyAudioDeviceGuard()
	-- upvalues: voiceChatService (ref), fFlagExpChatDictation (ref), coreGuiService (ref), playersService (ref), soundService (ref)
	local function _(p3)
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		return voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p3:IsDescendantOf(coreGuiService)) and (p3.Player == playersService.LocalPlayer and (p3.Active and self.localMuted == nil)))
	end
	
	local function guardDevice(p3)
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p3:IsDescendantOf(coreGuiService)) and (p3.Player == playersService.LocalPlayer and (p3.Active and self.localMuted == nil))) then
			p3.Active = false
		end
		table.insert(self._connections, p3:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: p3 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var6 = p3
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var6:IsDescendantOf(coreGuiService)) and (var6.Player == playersService.LocalPlayer and (var6.Active and self.localMuted == nil))) then
				p3.Active = false
			end
		end))
		table.insert(self._connections, p3:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: p3 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var6 = p3
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var6:IsDescendantOf(coreGuiService)) and (var6.Player == playersService.LocalPlayer and (var6.Active and self.localMuted == nil))) then
				p3.Active = false
			end
		end))
	end
	
	table.insert(self._connections, soundService.AudioInstanceAdded:Connect(function(p3)
		-- upvalues: guardDevice (ref)
		if p3:IsA("AudioDeviceInput") then
			guardDevice(p3)
		end
	end))
	
	for i, v in game:GetDescendants() do
		if v:IsA("AudioDeviceInput") then
			guardDevice(v)
		end
	end
end

function t:SetAndSyncActive(p3, p4)
	-- upvalues: playersService (ref)
	p3.Active = p4
	local sendMuteEvent = self.callbacks.getSendMuteEvent()
	
	if sendMuteEvent and p3.Player == playersService.LocalPlayer then
		sendMuteEvent:FireServer(p4)
	end
end

function t:RequestMicPermission()
	-- upvalues: getFFlagDebugVoiceChatMicPermissionCliBypassModule (ref), PERMISSION_STATE (ref), promiseModule (ref), permissionsProtocol (ref), getFFlagEnableExpJoinMicPermAnalyticsModule (ref)
	if getFFlagDebugVoiceChatMicPermissionCliBypassModule() then
		self.permissionState = PERMISSION_STATE.LISTEN_AND_TALK
		
		return promiseModule.resolve()
	elseif self.permissionPromise then
		self.log:trace("PermissionProtocol already invoked")
		
		return self.permissionPromise
	end
	self.permissionPromise = self.callbacks.requestPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p3)
		-- upvalues: getFFlagEnableExpJoinMicPermAnalyticsModule (copy), self (ref), promiseModule (copy), permissionsProtocol (copy)
		if getFFlagEnableExpJoinMicPermAnalyticsModule() then
			self.callbacks.recordExperienceJoinMicPerm(p3)
		end
		if p3 or p3.status then
			self.log:debug("Permission status {}", p3.status)
			local var6 = p3.status == permissionsProtocol.Status.AUTHORIZED
			
			return if self.callbacks.getPassInitErrorInPromiseReject() and not var6 then promiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else var6 and promiseModule.resolve() or promiseModule.reject()
		end
		self.log:debug("No permission response, rejecting access")
		self.callbacks.reportJoinFailed("noPermissionResponse", nil)
		
		return if self.callbacks.getPassInitErrorInPromiseReject() then promiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else promiseModule.reject()
	end):andThen(function()
		-- upvalues: self (ref), promiseModule (copy)
		self.callbacks.emitOnRequestMicPermissionResolved()
		
		return promiseModule.resolve()
	end):catch(function()
		-- upvalues: self (ref), promiseModule (copy)
		self.callbacks.emitOnRequestMicPermissionRejected()
		
		return if self.callbacks.getPassInitErrorInPromiseReject() then promiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else promiseModule.reject()
	end)
	
	return self.permissionPromise
end

function t:UpdateLocalMetering()
	-- upvalues: playersService (ref), var1 (ref)
	self.isTalking = self.callbacks.isSignalActive(playersService.LocalPlayer.UserId)
	
	if self.localMuted == false then
		if var1 then
			self:FireTalkingChangedDebounced(self.isTalking)
			
			return
		end
		self.talkingChanged:Fire(self.isTalking)
	end
end

function t:FireTalkingChangedDebounced(p3)
	-- upvalues: var2 (ref)
	local var6 = tick() * 1000
	
	if p3 ~= self._lastTalkingChangedFireValue or var2 < var6 - self._lastTalkingChangedFireTime then
		self._lastTalkingChangedFireTime = var6
		self._lastTalkingChangedFireValue = p3
		self.talkingChanged:Fire(p3)
	end
end

function t:SetupMicActivityListener(p3)
	-- upvalues: var3 (ref), voiceChatService (ref), MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY (ref), getFFlagLocalMutedNilFix (ref), var1 (ref)
	if var3 and voiceChatService.UseNewAudioApi then
		if self.localMeteringTask then
			return
		else
			self.localMeteringTask = task.spawn(function()
				-- upvalues: self (ref)
				while true do
					self:UpdateLocalMetering()
					task.wait()
				end
			end)
			
			return
		end
	elseif MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY <= p3:GetVoiceChatApiVersion() then
		table.insert(self._connections, p3.PlayerMicActivitySignalChange:Connect(function(p4)
			-- upvalues: self (ref), getFFlagLocalMutedNilFix (copy), var1 (copy)
			self.callbacks.onVoiceCapturedDuringVideoCapture(p4.isActive)
			self.isTalking = p4.isActive
			
			if getFFlagLocalMutedNilFix() then
				if self.localMuted ~= false then return end
				if var1 then
					self:FireTalkingChangedDebounced(self.isTalking)
					
					return
				end
				self.talkingChanged:Fire(self.isTalking)
				
				return
			elseif not self.localMuted then
				if var1 then
					self:FireTalkingChangedDebounced(self.isTalking)
					
					return
				end
				self.talkingChanged:Fire(self.isTalking)
			end
		end))
	end
end

function t:SetAdMuteBlocked(p4)
	self.isPlayerWatchingAd = p4
end

function t:RegisterConsumer(p4)
	-- upvalues: getFFlagMicConsumerRegistryModule (ref), PERMISSION_STATE (ref)
	if not getFFlagMicConsumerRegistryModule() then
		return false
	elseif self._consumers[p4.id] then
		self.log:trace("Consumer already registered: {}", p4.id)
		
		return true
	end
	local isVoiceChat = p4.consumerType == "VoiceChat"
	
	if self.permissionState == PERMISSION_STATE.LISTEN_ONLY and isVoiceChat then
		self.log:debug("RegisterConsumer rejected for {}: voice chat permission denied", p4.id)
		
		if not self._hasShownPermDeniedToast and self.callbacks.emitOnMicPermissionDeniedToast then
			self._hasShownPermDeniedToast = true
			self.callbacks.emitOnMicPermissionDeniedToast()
		end
		return false
	else
		local var6 = false
		
		if isVoiceChat and p4.device then
			local text = "dev_" .. tostring(p4.device:GetDebugId())
			var6 = self._consumers[text] ~= nil
			
			if var6 then
				self:UnregisterConsumer(text, true)
			end
		end
		self._consumers[p4.id] = p4
		local consumerCount = self._consumerCount
		self._consumerCount += 1
		self:_updateActiveConsumerType()
		
		if consumerCount == 0 and not var6 then
			self._micIndicatorReady = false
		end
		self.hasConsumersChanged:Fire(self._consumerCount)
		
		if p4.device then
			local var7 = self.localMuted == false and self._micIndicatorReady
			
			if p4.device.Active ~= var7 then
				p4.device.Active = var7
			end
		end
		self.log:trace("Consumer registered: {} type={} count={}", p4.id, p4.consumerType, self._consumerCount)
		self:_assertDeviceStateConsistency()
		
		return true
	end
end

function t:UnregisterConsumer(p4, p5)
	-- upvalues: getFFlagMicConsumerRegistryModule (ref)
	if not getFFlagMicConsumerRegistryModule() then return end
	local var6 = self._consumers[p4]
	
	if not var6 then return end
	if var6.wire then
		var6.wire:Destroy()
	end
	if var6.analyzer then
		var6.analyzer:Destroy()
	end
	if var6.device and var6.device.Active then
		var6.device.Active = false
	end
	self._consumers[p4] = nil
	self._consumerCount -= 1
	self:_updateActiveConsumerType()
	
	if self._consumerCount == 0 and not p5 then
		self.localMuted = nil
		self._micIndicatorReady = false
		self:_stopLevelDetectionTask()
	end
	if not p5 then
		self.hasConsumersChanged:Fire(self._consumerCount)
	end
	self.log:trace("Consumer unregistered: {} count={}", p4, self._consumerCount)
end

function t:SetMicIndicatorReady(p4)
	-- upvalues: getFFlagMicConsumerRegistryModule (ref)
	if not getFFlagMicConsumerRegistryModule() or self._micIndicatorReady == p4 then return end
	self._micIndicatorReady = p4
	local var6 = p4 and self.localMuted == false
	
	for i, v in self._consumers do
		if v.device and v.device.Active ~= var6 then
			v.device.Active = var6
		end
	end
	self:_assertDeviceStateConsistency()
end

function t:GetConsumerCount()
	-- upvalues: getFFlagMicConsumerRegistryModule (ref)
	return if getFFlagMicConsumerRegistryModule() then self._consumerCount else 0
end

function t:HasConsumer(p5)
	-- upvalues: getFFlagMicConsumerRegistryModule (ref)
	return if getFFlagMicConsumerRegistryModule() then self._consumers[p5] ~= nil else false
end

function t:GetActiveConsumerType()
	-- upvalues: getFFlagMicConsumerRegistryModule (ref)
	return if getFFlagMicConsumerRegistryModule() then self._activeConsumerType else nil
end

function t:_updateActiveConsumerType()
	self._activeConsumerType = nil
	
	for i, v in self._consumers do
		if v.consumerType ~= "VoiceChat" then
			if self._activeConsumerType == nil then
				self._activeConsumerType = v.consumerType
			end
		end
		self._activeConsumerType = "VoiceChat"
		self:_stopLevelDetectionTask()
		
		return
	end
	if self._activeConsumerType and self._activeConsumerType ~= "VoiceChat" then
		self:_startLevelDetectionTask()
	end
end

function t:_startLevelDetectionTask()
	if self._levelDetectionTask then
		return
	end
	self._levelDetectionTask = task.spawn(function()
		-- upvalues: self (ref)
		while true do
			self:_updateCustomLevelDetection()
			task.wait()
		end
	end)
end

function t:_stopLevelDetectionTask()
	if self._levelDetectionTask then
		task.cancel(self._levelDetectionTask)
		self._levelDetectionTask = nil
	end
end

function t:_updateCustomLevelDetection()
	-- upvalues: var1 (ref), getFFlagMicConsumerRegistryModule (ref)
	if self.localMuted ~= false then return end
	local var7 = 0
	
	for i, v in self._consumers do
		if v.analyzer then
			local peakLevel = v.analyzer.PeakLevel
			
			if peakLevel > 0 then
				local var8 = math.log10(peakLevel) * 20
				
				if var8 > -36 then
					local clampedValue = math.clamp((var8 - -36) / 36, 0, 1)
					
					if var7 < clampedValue then
						var7 = clampedValue
					end
				end
			end
		end
	end
	local clampedValue = math.clamp(math.floor(var7 * 100 / 20 + 0.5) * 20, 0, 100)
	self.isTalking = clampedValue > 0
	
	if var1 then
		self:FireTalkingChangedDebounced(self.isTalking)
	else
		self.talkingChanged:Fire(self.isTalking)
	end
	if getFFlagMicConsumerRegistryModule() and clampedValue ~= self._lastLevel then
		self._lastLevel = clampedValue
		self.levelChanged:Fire(clampedValue)
	end
end

function t:_isVoiceChatDevice(p5)
	-- upvalues: playersService (ref)
	for i, v in self._consumers do
		if v.consumerType == "VoiceChat" then
			if v.device ~= p5 then
				if v.device == nil and p5.Player == playersService.LocalPlayer then
					v.device = p5
					p5.Active = self.localMuted == false and self._micIndicatorReady
					
					return true
				end
			end
			return true
		end
	end
	return false
end

function t:_isDeveloperDevice(p6)
	-- upvalues: coreGuiService (ref), playersService (ref)
	return if p6:IsDescendantOf(coreGuiService) then false elseif self:_isVoiceChatDevice(p6) then false else p6.Player == playersService.LocalPlayer
end

function t:_getDeveloperAudioInstancesFolder()
	-- upvalues: coreGuiService (ref)
	if self._developerAudioInstancesFolder then
		return self._developerAudioInstancesFolder
	end
	local micConsumerRegistry = Instance.new("Folder")
	micConsumerRegistry.Name = "MicConsumerRegistry"
	micConsumerRegistry.Parent = coreGuiService
	self._developerAudioInstancesFolder = micConsumerRegistry
	
	return micConsumerRegistry
end

function t:_registerDeveloperDevice(p6)
	local text = "dev_" .. tostring(p6:GetDebugId())
	
	if self._consumers[text] then return end
	local developerAudioInstancesFolder = self:_getDeveloperAudioInstancesFolder()
	local audioAnalyzer = Instance.new("AudioAnalyzer")
	audioAnalyzer.Parent = developerAudioInstancesFolder
	local wire = Instance.new("Wire")
	wire.SourceInstance = p6
	wire.TargetInstance = audioAnalyzer
	wire.Parent = developerAudioInstancesFolder
	
	if not self:RegisterConsumer({
		consumerType = "DeveloperAudioDevice",
		id = text,
		device = p6,
		analyzer = audioAnalyzer,
		wire = wire
	}) then
		wire:Destroy()
		audioAnalyzer:Destroy()
	end
end

function t:_unregisterDeveloperDevice(p6)
	self:UnregisterConsumer("dev_" .. tostring(p6:GetDebugId()))
end

function t:SetupDeveloperDeviceTracking()
	-- upvalues: getFFlagMicConsumerRegistryModule (ref), coreGuiService (ref), soundService (ref)
	if not getFFlagMicConsumerRegistryModule() then return end
	local function onDeviceAdded(p6)
		-- upvalues: self (ref), coreGuiService (copy)
		if self._developerDeviceConnections[p6] then return end
		if p6:IsDescendantOf(coreGuiService) then return end
		if self:_isDeveloperDevice(p6) then
			self:_registerDeveloperDevice(p6)
		end
		local t = {}
		table.insert(t, p6:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: self (copy), p6 (ref)
			if self:_isDeveloperDevice(p6) then
				self:_registerDeveloperDevice(p6)
				
				return
			end
			self:_unregisterDeveloperDevice(p6)
		end))
		table.insert(t, p6.AncestryChanged:Connect(function(_, p7)
			-- upvalues: self (copy), p6 (ref)
			if p7 == nil then
				self:_unregisterDeveloperDevice(p6)
				local var9 = self._developerDeviceConnections[p6]
				
				if var9 then
					for i, v in var9 do
						v:Disconnect()
					end
					self._developerDeviceConnections[p6] = nil
				end
			end
		end))
		self._developerDeviceConnections[p6] = t
	end
	
	table.insert(self._connections, soundService.AudioInstanceAdded:Connect(function(p7)
		-- upvalues: onDeviceAdded (ref)
		if p7:IsA("AudioDeviceInput") then
			onDeviceAdded(p7)
		end
	end))
	
	for i, v in game:GetDescendants() do
		if v:IsA("AudioDeviceInput") then
			onDeviceAdded(v)
		end
	end
end

function t:SetMicActiveForAllConsumers(p7, p8)
	-- upvalues: getFFlagMicConsumerRegistryModule (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), permissionsProtocol (ref)
	if not getFFlagMicConsumerRegistryModule() then return end
	if p7 then
		if self.isPlayerWatchingAd then
			self.log:trace("SetMicActiveForAllConsumers: blocked by ad-mute")
			
			return
		elseif getFFlagJoinWithoutMicPermissions() then
			if self.permissionState == PERMISSION_STATE.LISTEN_ONLY then
				self.log:debug("SetMicActiveForAllConsumers: permission denied")
				
				if not self._hasShownPermDeniedToast and self.callbacks.emitOnMicPermissionDeniedToast then
					self._hasShownPermDeniedToast = true
					self.callbacks.emitOnMicPermissionDeniedToast()
				end
				return
			elseif self.permissionState == PERMISSION_STATE.PENDING_MIC then
				self.log:debug("SetMicActiveForAllConsumers: requesting permission")
				self.callbacks.emitGetPermissions(function(p9)
					-- upvalues: self (ref), PERMISSION_STATE (copy), p7 (ref), p8 (ref)
					self.permissionState = if p9.hasMicPermissions then PERMISSION_STATE.LISTEN_AND_TALK else PERMISSION_STATE.LISTEN_ONLY
					self:SetMicActiveForAllConsumers(p7, p8)
				end, { permissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)
				
				return
			end
		end
	end
	local micIndicatorReady = p7 and self._micIndicatorReady
	
	for i, v in self._consumers do
		if v.device then
			v.device.Active = micIndicatorReady
		end
	end
	self.localMuted = not p7
	self.muteChanged:Fire(self.localMuted)
	
	if p7 and not self._hasShownPrivacyToast then
		local var9 = false
		
		for i_1, v_1 in self._consumers do
			if v_1.consumerType == "VoiceChat" then
				var9 = true
				break
			end
		end
		if not var9 and self.callbacks.emitOnMicFirstUnmutePrivacy then
			self._hasShownPrivacyToast = true
			self.callbacks.emitOnMicFirstUnmutePrivacy()
		end
	end
	if p7 then
		self.talkingChanged:Fire(self.isTalking)
		self.callbacks.emitOnShowDataConsentToast()
	elseif self._lastLevel ~= 0 then
		self._lastLevel = 0
		self.levelChanged:Fire(0)
	end
	self:_assertDeviceStateConsistency()
end

function t:Disconnect()
	-- upvalues: getFFlagMicConsumerRegistryModule (ref)
	for i, v in self._connections do
		v:Disconnect()
	end
	self._connections = {}
	
	if self.localMeteringTask then
		task.cancel(self.localMeteringTask)
		self.localMeteringTask = nil
	end
	if getFFlagMicConsumerRegistryModule() then
		self:_stopLevelDetectionTask()
		
		for i, v_1 in self._developerDeviceConnections do
			for i_3, v_2 in v_1 do
				v_2:Disconnect()
			end
		end
		self._developerDeviceConnections = {}
		
		for i, v_2 in self._consumers do
			if v_2.wire then
				v_2.wire:Destroy()
			end
			if v_2.analyzer then
				v_2.analyzer:Destroy()
			end
		end
		self._consumers = {}
		self._consumerCount = 0
		
		if self._developerAudioInstancesFolder then
			self._developerAudioInstancesFolder:Destroy()
			self._developerAudioInstancesFolder = nil
		end
	end
end

function t:_assertDeviceStateConsistency()
	-- upvalues: getFFlagMicConsumerRegistryModule (ref), playersService (ref)
	local var10 = self.localMuted == false and (not getFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
	
	for i in self.callbacks.getAudioDevices() do
		if i.Player and i.Player == playersService.LocalPlayer and i.Active ~= var10 then
			self.log:warning("MicManager consistency: device.Active={} expected={} localMuted={}", i.Active, var10, self.localMuted)
		end
	end
	if getFFlagMicConsumerRegistryModule() then
		for i_1, v in self._consumers do
			if v.device and v.device.Active ~= var10 then
				self.log:warning("MicManager consistency (consumer {}): device.Active={} expected={} localMuted={}", v.id, v.device.Active, var10, self.localMuted)
			end
		end
		if self._consumerCount == 0 and self.localMuted ~= nil then
			self.log:warning("MicManager consistency: no consumers but localMuted={}", self.localMuted)
		end
	end
end

return t