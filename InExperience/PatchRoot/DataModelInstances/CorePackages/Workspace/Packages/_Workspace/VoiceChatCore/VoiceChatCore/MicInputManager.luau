local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local VoiceChatService = game:GetService("VoiceChatService")
local CoreGui = game:GetService("CoreGui")
local FFlagUseAudioDeviceInputAddedSignal = require(Parent.SharedFlags).FFlagUseAudioDeviceInputAddedSignal
local ConstantsModule = require(script.Parent.Constants)
local Flags = script.Parent.Flags
local PromiseModule = require(Parent.Promise)
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local GetFFlagJoinWithoutMicPermissionsFunction = require(Parent.SharedFlags).GetFFlagJoinWithoutMicPermissions
local GetFFlagLocalMutedNilFixFunction = require(Parent.SharedFlags).GetFFlagLocalMutedNilFix
local GetFFlagDebugVoiceChatMicPermissionCliBypassModule = require(Flags.GetFFlagDebugVoiceChatMicPermissionCliBypass)
local FFlagExpChatDictation = require(Parent.SharedFlags).FFlagExpChatDictation
local v1 = require(Flags.GetFFlagUseAudioAnalyzerForLocalMetering2)()
local GetFFlagMicConsumerRegistryModule = require(Flags.GetFFlagMicConsumerRegistry)
local FFlagMicSyncVoiceDeviceAcrossRejoinModule = require(Flags.FFlagMicSyncVoiceDeviceAcrossRejoin)
local FFlagMicPermissionCheckOnConsumerUnmuteModule = require(Flags.FFlagMicPermissionCheckOnConsumerUnmute)
local FFlagMicRegistryIgnoreDefaultVoiceDeviceModule = require(Flags.FFlagMicRegistryIgnoreDefaultVoiceDevice)
local PERMISSIONSTATE = ConstantsModule.PERMISSION_STATE
local MINVOICECHATAPIVERSIONLOCALMICACTIVITY = ConstantsModule.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY
local MicInputManager = {}
MicInputManager.__index = MicInputManager

function MicInputManager.new(p1)
	-- upvalues: MicInputManager (copy), GetFFlagJoinWithoutMicPermissionsFunction (copy), PERMISSIONSTATE (copy), GetFFlagMicConsumerRegistryModule (copy)
	local self = setmetatable({}, MicInputManager)
	self.log = p1.log
	self.callbacks = p1.callbacks
	self.localMuted = nil
	self.isTalking = false
	self.permissionState = if GetFFlagJoinWithoutMicPermissionsFunction() then PERMISSIONSTATE.IDLE else nil
	self.muteChanged = Instance.new("BindableEvent")
	self.talkingChanged = Instance.new("BindableEvent")
	self.permissionPromise = nil
	self.isPlayerWatchingAd = false
	self._connections = {}
	self.localMeteringTask = nil
	
	if GetFFlagMicConsumerRegistryModule() then
		self._consumers = {}
		self._consumerCount = 0
		self.hasConsumersChanged = Instance.new("BindableEvent")
		self._activeConsumerType = nil
		self._levelDetectionTask = nil
		self._hasShownPrivacyToast = false
		self._hasShownPermDeniedToast = false
		self._micIndicatorReady = false
		self._developerDeviceConnections = {}
		self._developerAudioInstancesFolder = nil
		self.levelChanged = Instance.new("BindableEvent")
		self._lastLevel = 0
		self._hasConsumerMicPermission = false
		self._isRequestingConsumerMicPermission = false
	end
	return self
end

local function _(Object)
	-- upvalues: CoreGui (copy)
	return Object:IsDescendantOf(CoreGui)
end

local _ = function(AudioDeviceInput): boolean
	-- upvalues: Players (copy), VoiceChatService (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return LocalPlayer ~= nil and (VoiceChatService.EnableDefaultVoice == true and LocalPlayer:FindFirstChildOfClass("AudioDeviceInput") == AudioDeviceInput)
end

function MicInputManager:SetMicActive(p1, Context)
	-- upvalues: GetFFlagJoinWithoutMicPermissionsFunction (copy), PERMISSIONSTATE (copy), PermissionsProtocol (copy), VoiceChatService (copy), GetFFlagMicConsumerRegistryModule (copy), Players (copy)
	if self.localMuted == nil then
		self.log:trace("SetMicActive context: {} - Voice not connected yet", Context)
		
		return
	end
	if self.localMuted == not p1 then return end
	self.log:trace("SetMicActive active: {} context: {}", p1, Context)
	
	if GetFFlagJoinWithoutMicPermissionsFunction() then
		if self.permissionState == PERMISSIONSTATE.PENDING_MIC then
			self.log:debug("In pending mic mode, requesting permission")
			self.callbacks.emitGetPermissions(function(p2)
				-- upvalues: self (copy), PERMISSIONSTATE (upval), p1 (copy), Context (copy)
				self.permissionState = if p2.hasMicPermissions then PERMISSIONSTATE.LISTEN_AND_TALK else PERMISSIONSTATE.LISTEN_ONLY
				self.log:debug("Got permissions, setting state to {}", self.permissionState)
				self:SetMicActive(p1, Context)
			end, { PermissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)
			
			return
		end
		if self.permissionState == PERMISSIONSTATE.LISTEN_ONLY then
			self.log:debug("User tried to unmute despite being in listen only mode")
			self.callbacks.emitOnPermissionRequested()
			
			return
		end
	end
	if self.isPlayerWatchingAd then
		self.log:trace("User is watching an ad, skipping mic state change")
		
		return
	end
	if VoiceChatService.UseNewAudioApi then
		self.localMuted = not p1
		self.log:trace("Setting self mute to {} context: {}", p1, Context)
		local SendMuteEvent = self.callbacks.getSendMuteEvent()
		
		if SendMuteEvent then
			SendMuteEvent:FireServer(p1)
			local Inverted = p1 and (not GetFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
			for i in self.callbacks.getAudioDevices() do
				if i.Player and i.Player == Players.LocalPlayer then
					i.Active = Inverted
				end
			end
			if GetFFlagMicConsumerRegistryModule() then
				for _, consumer in self._consumers do
					if consumer.device and consumer.consumerType ~= "VoiceChat" then
						consumer.device.Active = Inverted
					end
				end
			end
			self.muteChanged:Fire(self.localMuted)
		else
			self.log:error("Could not find SendMuteEvent")
		end
	else
		local Service = self.callbacks.getService()
		self.log:trace("Setting self mute to {} context: {}", not p1, Context)
		Service:PublishPause(not p1)
		self.localMuted = not p1
		self.muteChanged:Fire(self.localMuted)
	end
	if self.localMuted then
		if GetFFlagMicConsumerRegistryModule() and self._lastLevel ~= 0 then
			self._lastLevel = 0
			self.levelChanged:Fire(0)
		end
	else
		self.talkingChanged:Fire(self.isTalking)
		self.callbacks.emitOnShowDataConsentToast()
	end
	if Context then
		self.callbacks.reportVoiceMuteSelf(self.callbacks.getJoinWithVoiceMuteData({ context = Context, muted = self.localMuted }))
	end
	self:_assertDeviceStateConsistency()
end

function MicInputManager:SetLocalMuted(LocalMuted)
	self.localMuted = LocalMuted
end

function MicInputManager:SyncLocalAudioDeviceActive()
	-- upvalues: VoiceChatService (copy), FFlagMicSyncVoiceDeviceAcrossRejoinModule (copy), GetFFlagMicConsumerRegistryModule (copy), Players (copy)
	if not VoiceChatService.UseNewAudioApi then return end
	if FFlagMicSyncVoiceDeviceAcrossRejoinModule then
		if self:_setLocalPlayerAudioDevicesActive(self:_shouldLocalAudioDeviceBeActive()) then
			self:_syncLocalAudioDeviceActiveToServer()
		end
		self:_assertDeviceStateConsistency()
		
		return
	else
		local Inverted = self.localMuted == false and (not GetFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
		for i in self.callbacks.getAudioDevices() do
			if i.Player and i.Player == Players.LocalPlayer then
				i.Active = Inverted
			end
		end
		self:_assertDeviceStateConsistency()
	end
end

function MicInputManager._syncLocalAudioDeviceActiveToServer(p2)
	task.spawn(function()
		-- upvalues: p2 (copy)
		local SendMuteEvent = p2.callbacks.getSendMuteEvent()
		
		if not SendMuteEvent then return end
		local ShouldLocalAudioDeviceBeActive = p2:_shouldLocalAudioDeviceBeActive()
		
		if p2:_setLocalPlayerAudioDevicesActive(ShouldLocalAudioDeviceBeActive) then
			SendMuteEvent:FireServer(ShouldLocalAudioDeviceBeActive)
		end
	end)
end

function MicInputManager:_shouldLocalAudioDeviceBeActive()
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	return self.localMuted == false and (not GetFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
end

function MicInputManager._setLocalPlayerAudioDevicesActive(p2, ShouldLocalAudioDeviceBeActive): boolean
	-- upvalues: Players (copy)
	local Flag = false
	
	for i in p2.callbacks.getAudioDevices() do
		if i.Player and i.Player == Players.LocalPlayer then
			i.Active = ShouldLocalAudioDeviceBeActive
			Flag = true
		end
	end
	return Flag
end

function MicInputManager:SetupEarlyAudioDeviceGuard()
	-- upvalues: VoiceChatService (copy), FFlagExpChatDictation (copy), CoreGui (copy), Players (copy), FFlagUseAudioDeviceInputAddedSignal (copy), SoundService (copy)
	local function _(Object): boolean
		-- upvalues: VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (copy)
		return VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil)))
	end
	
	local function guardDevice(Object)
		-- upvalues: VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (copy)
		if VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil))) then
			Object.Active = false
		end
		table.insert(self._connections, (Object:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: Object (copy), VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (upval)
			if VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil))) then
				Object.Active = false
			end
		end)))
		table.insert(self._connections, (Object:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: Object (copy), VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (upval)
			if VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil))) then
				Object.Active = false
			end
		end)))
	end
	
	table.insert(self._connections, if FFlagUseAudioDeviceInputAddedSignal then SoundService.AudioDeviceInputAdded:Connect(function(p3)
		-- upvalues: guardDevice (copy)
		guardDevice(p3)
	end) else SoundService.AudioInstanceAdded:Connect(function(AudioDeviceInput)
		-- upvalues: guardDevice (copy)
		if AudioDeviceInput:IsA("AudioDeviceInput") then
			guardDevice(AudioDeviceInput)
		end
	end))
	
	for _, AudioDeviceInput in game:GetDescendants() do
		if AudioDeviceInput:IsA("AudioDeviceInput") then
			guardDevice(AudioDeviceInput)
		end
	end
end

function MicInputManager:SetAndSyncActive(p3, Active)
	-- upvalues: Players (copy)
	p3.Active = Active
	local SendMuteEvent = self.callbacks.getSendMuteEvent()
	
	if SendMuteEvent and p3.Player == Players.LocalPlayer then
		SendMuteEvent:FireServer(Active)
	end
end

function MicInputManager:RequestMicPermission()
	-- upvalues: GetFFlagDebugVoiceChatMicPermissionCliBypassModule (copy), PERMISSIONSTATE (copy), PromiseModule (copy), PermissionsProtocol (copy)
	if GetFFlagDebugVoiceChatMicPermissionCliBypassModule() then
		self.permissionState = PERMISSIONSTATE.LISTEN_AND_TALK
		
		return PromiseModule.resolve()
	elseif self.permissionPromise then
		self.log:trace("PermissionProtocol already invoked")
		
		return self.permissionPromise
	else
		self.permissionPromise = self.callbacks.requestPermissions({ PermissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(Result)
			-- upvalues: self (copy), PromiseModule (upval), PermissionsProtocol (upval)
			self.callbacks.recordExperienceJoinMicPerm(Result)
			
			if Result or Result.status then
				self.log:debug("Permission status {}", Result.status)
				local IsStatusMatch = Result.status == PermissionsProtocol.Status.AUTHORIZED
				
				return if self.callbacks.getPassInitErrorInPromiseReject() and not IsStatusMatch then PromiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else IsStatusMatch and PromiseModule.resolve() or PromiseModule.reject()
			else
				self.log:debug("No permission response, rejecting access")
				self.callbacks.reportJoinFailed("noPermissionResponse", nil)
				
				return if self.callbacks.getPassInitErrorInPromiseReject() then PromiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else PromiseModule.reject()
			end
		end):andThen(function()
			-- upvalues: self (copy), PromiseModule (upval)
			self.callbacks.emitOnRequestMicPermissionResolved()
			
			return PromiseModule.resolve()
		end):catch(function()
			-- upvalues: self (copy), PromiseModule (upval)
			self.callbacks.emitOnRequestMicPermissionRejected()
			
			return if self.callbacks.getPassInitErrorInPromiseReject() then PromiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else PromiseModule.reject()
		end)
		
		return self.permissionPromise
	end
end

function MicInputManager:UpdateLocalMetering()
	-- upvalues: Players (copy)
	self.isTalking = self.callbacks.isSignalActive(Players.LocalPlayer.UserId)
	
	if self.localMuted == false then
		self.talkingChanged:Fire(self.isTalking)
	end
end

function MicInputManager:SetupMicActivityListener(VoiceChatInternal)
	-- upvalues: v1 (copy), VoiceChatService (copy), MINVOICECHATAPIVERSIONLOCALMICACTIVITY (copy), GetFFlagLocalMutedNilFixFunction (copy)
	if v1 and VoiceChatService.UseNewAudioApi then
		if not self.localMeteringTask then
			self.localMeteringTask = task.spawn(function()
				-- upvalues: self (copy)
				while true do
					self:UpdateLocalMetering()
					task.wait()
				end
			end)
			
			return
		end
	elseif MINVOICECHATAPIVERSIONLOCALMICACTIVITY <= VoiceChatInternal:GetVoiceChatApiVersion() then
		table.insert(self._connections, (VoiceChatInternal.PlayerMicActivitySignalChange:Connect(function(ActivityInfo)
			-- upvalues: self (copy), GetFFlagLocalMutedNilFixFunction (upval)
			self.callbacks.onVoiceCapturedDuringVideoCapture(ActivityInfo.isActive)
			self.isTalking = ActivityInfo.isActive
			
			if GetFFlagLocalMutedNilFixFunction() then
				if self.localMuted == false then
					self.talkingChanged:Fire(self.isTalking)
					
					return
				end
			elseif not self.localMuted then
				self.talkingChanged:Fire(self.isTalking)
			end
		end)))
	end
end

function MicInputManager:SetAdMuteBlocked(IsPlayerWatchingAd)
	self.isPlayerWatchingAd = IsPlayerWatchingAd
end

function MicInputManager:RegisterConsumer(p3): boolean
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy), PERMISSIONSTATE (copy)
	if not GetFFlagMicConsumerRegistryModule() then
		return false
	end
	if self._consumers[p3.id] then
		self.log:trace("Consumer already registered: {}", p3.id)
		
		return true
	end
	local IsVoiceChat = p3.consumerType == "VoiceChat"
	
	if self.permissionState == PERMISSIONSTATE.LISTEN_ONLY and IsVoiceChat then
		self.log:debug("RegisterConsumer rejected for {}: voice chat permission denied", p3.id)
		
		if not self._hasShownPermDeniedToast and self.callbacks.emitOnMicPermissionDeniedToast then
			self._hasShownPermDeniedToast = true
			self.callbacks.emitOnMicPermissionDeniedToast()
		end
		return false
	else
		local HasConsumer = false
		
		if IsVoiceChat and p3.device then
			local Text = "dev_" .. tostring(p3.device:GetDebugId())
			HasConsumer = self._consumers[Text] ~= nil
			
			if HasConsumer then
				self:UnregisterConsumer(Text, true)
			end
		end
		self._consumers[p3.id] = p3
		local ConsumerCount = self._consumerCount
		self._consumerCount += 1
		self:_updateActiveConsumerType()
		
		if ConsumerCount == 0 and not HasConsumer then
			self._micIndicatorReady = false
		end
		self.hasConsumersChanged:Fire(self._consumerCount)
		
		if p3.device then
			local MicIndicatorReady = self.localMuted == false and self._micIndicatorReady
			
			if p3.device.Active ~= MicIndicatorReady then
				p3.device.Active = MicIndicatorReady
			end
		end
		self.log:trace("Consumer registered: {} type={} count={}", p3.id, p3.consumerType, self._consumerCount)
		self:_assertDeviceStateConsistency()
		
		return true
	end
end

function MicInputManager:UnregisterConsumer(p3, p4)
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	if not GetFFlagMicConsumerRegistryModule() then return end
	local Consumer = self._consumers[p3]
	
	if not Consumer then return end
	if Consumer.wire then
		Consumer.wire:Destroy()
	end
	if Consumer.analyzer then
		Consumer.analyzer:Destroy()
	end
	if Consumer.device and Consumer.device.Active then
		Consumer.device.Active = false
	end
	self._consumers[p3] = nil
	self._consumerCount -= 1
	self:_updateActiveConsumerType()
	
	if self._consumerCount == 0 and not p4 then
		self.localMuted = nil
		self._micIndicatorReady = false
		self:_stopLevelDetectionTask()
	end
	if not p4 then
		self.hasConsumersChanged:Fire(self._consumerCount)
	end
	self.log:trace("Consumer unregistered: {} count={}", p3, self._consumerCount)
end

function MicInputManager:SetMicIndicatorReady(_micIndicatorReady)
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy), FFlagMicSyncVoiceDeviceAcrossRejoinModule (copy), VoiceChatService (copy)
	if not GetFFlagMicConsumerRegistryModule() or self._micIndicatorReady == _micIndicatorReady then return end
	self._micIndicatorReady = _micIndicatorReady
	local IsNotLocalMuted: boolean = _micIndicatorReady and self.localMuted == false
	for _, consumer in self._consumers do
		if consumer.device and consumer.device.Active ~= IsNotLocalMuted then
			consumer.device.Active = IsNotLocalMuted
		end
	end
	if FFlagMicSyncVoiceDeviceAcrossRejoinModule and VoiceChatService.UseNewAudioApi and self._activeConsumerType == "VoiceChat" then
		self:_syncLocalAudioDeviceActiveToServer()
	end
	self:_assertDeviceStateConsistency()
end

function MicInputManager.GetConsumerCount(p3)
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	return if GetFFlagMicConsumerRegistryModule() then p3._consumerCount else 0
end

function MicInputManager.HasConsumer(p3, p4): boolean
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	return if GetFFlagMicConsumerRegistryModule() then p3._consumers[p4] ~= nil else false
end

function MicInputManager.GetActiveConsumerType(p3)
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	return if GetFFlagMicConsumerRegistryModule() then p3._activeConsumerType else nil
end

function MicInputManager:_updateActiveConsumerType()
	self._activeConsumerType = nil
	
	for _, consumer in self._consumers do
		if consumer.consumerType == "VoiceChat" then
			self._activeConsumerType = "VoiceChat"
			self:_stopLevelDetectionTask()
			
			return
		end
		if self._activeConsumerType == nil then
			self._activeConsumerType = consumer.consumerType
		end
	end
	if self._activeConsumerType and self._activeConsumerType ~= "VoiceChat" then
		self:_startLevelDetectionTask()
	end
end

function MicInputManager:_startLevelDetectionTask()
	if not self._levelDetectionTask then
		self._levelDetectionTask = task.spawn(function()
			-- upvalues: self (copy)
			while true do
				self:_updateCustomLevelDetection()
				task.wait()
			end
		end)
		
		return
	end
end

function MicInputManager:_stopLevelDetectionTask()
	if self._levelDetectionTask then
		task.cancel(self._levelDetectionTask)
		self._levelDetectionTask = nil
	end
end

function MicInputManager:_updateCustomLevelDetection()
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	if self.localMuted ~= false then return end
	local v2 = 0
	
	for _, consumer in self._consumers do
		if consumer.analyzer then
			local PeakLevel: number = consumer.analyzer.PeakLevel
			
			if PeakLevel > 0 then
				local ScaledLog10Result = math.log10(PeakLevel) * 20
				
				if ScaledLog10Result > -36 then
					local ClampedValue = math.clamp((ScaledLog10Result - -36) / 36, 0, 1)
					
					if v2 < ClampedValue then
						v2 = ClampedValue
					end
				end
			end
		end
	end
	local ClampedValue = math.clamp(math.floor(v2 * 100 / 20 + 0.5) * 20, 0, 100)
	self.isTalking = ClampedValue > 0
	self.talkingChanged:Fire(self.isTalking)
	
	if GetFFlagMicConsumerRegistryModule() and ClampedValue ~= self._lastLevel then
		self._lastLevel = ClampedValue
		self.levelChanged:Fire(ClampedValue)
	end
end

function MicInputManager:_isVoiceChatDevice(Device): boolean
	-- upvalues: Players (copy)
	for _, consumer in self._consumers do
		if consumer.consumerType == "VoiceChat" then
			if consumer.device == Device then
				return true
			elseif consumer.device == nil and Device.Player == Players.LocalPlayer then
				consumer.device = Device
				Device.Active = self.localMuted == false and self._micIndicatorReady
				
				return true
			end
			continue
		end
	end
	return false
end

function MicInputManager:_isDeveloperDevice(Device): boolean
	-- upvalues: CoreGui (copy), FFlagMicRegistryIgnoreDefaultVoiceDeviceModule (copy), Players (copy), VoiceChatService (copy)
	if Device:IsDescendantOf(CoreGui) then
		return false
	end
	if self:_isVoiceChatDevice(Device) then
		return false
	end
	if FFlagMicRegistryIgnoreDefaultVoiceDeviceModule then
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer ~= nil and (VoiceChatService.EnableDefaultVoice == true and LocalPlayer:FindFirstChildOfClass("AudioDeviceInput") == Device) then
			return false
		end
	end
	return Device.Player == Players.LocalPlayer
end

function MicInputManager:_getDeveloperAudioInstancesFolder()
	-- upvalues: CoreGui (copy)
	if self._developerAudioInstancesFolder then
		return self._developerAudioInstancesFolder
	else
		local MicConsumerRegistry = Instance.new("Folder")
		MicConsumerRegistry.Name = "MicConsumerRegistry"
		MicConsumerRegistry.Parent = CoreGui
		self._developerAudioInstancesFolder = MicConsumerRegistry
		
		return MicConsumerRegistry
	end
end

function MicInputManager:_registerDeveloperDevice(Device)
	local Text = "dev_" .. tostring(Device:GetDebugId())
	
	if self._consumers[Text] then return end
	local DeveloperAudioInstancesFolder = self:_getDeveloperAudioInstancesFolder()
	local AudioAnalyzer = Instance.new("AudioAnalyzer")
	AudioAnalyzer.Parent = DeveloperAudioInstancesFolder
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = Device
	Wire.TargetInstance = AudioAnalyzer
	Wire.Parent = DeveloperAudioInstancesFolder
	
	if not self:RegisterConsumer({
		consumerType = "DeveloperAudioDevice",
		id = Text,
		device = Device,
		analyzer = AudioAnalyzer,
		wire = Wire
	}) then
		Wire:Destroy()
		AudioAnalyzer:Destroy()
	end
end

function MicInputManager:_unregisterDeveloperDevice(Device)
	self:UnregisterConsumer("dev_" .. tostring(Device:GetDebugId()))
end

function MicInputManager:SetupDeveloperDeviceTracking()
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy), CoreGui (copy), FFlagMicRegistryIgnoreDefaultVoiceDeviceModule (copy), FFlagUseAudioDeviceInputAddedSignal (copy), SoundService (copy)
	if not GetFFlagMicConsumerRegistryModule() then return end
	local function onDeviceAdded(Device)
		-- upvalues: self (copy), CoreGui (upval), FFlagMicRegistryIgnoreDefaultVoiceDeviceModule (upval)
		if self._developerDeviceConnections[Device] then return end
		if Device:IsDescendantOf(CoreGui) then return end
		if self:_isDeveloperDevice(Device) then
			self:_registerDeveloperDevice(Device)
		end
		local List = {}
		table.insert(List, (Device:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: self (upval), Device (copy)
			if self:_isDeveloperDevice(Device) then
				self:_registerDeveloperDevice(Device)
				
				return
			else
				self:_unregisterDeveloperDevice(Device)
			end
		end)))
		table.insert(List, (Device.AncestryChanged:Connect(function(_, NewParent)
			-- upvalues: self (upval), Device (copy), FFlagMicRegistryIgnoreDefaultVoiceDeviceModule (upval)
			if NewParent == nil then
				self:_unregisterDeveloperDevice(Device)
				local DeveloperDeviceConnection = self._developerDeviceConnections[Device]
				
				if DeveloperDeviceConnection then
					for _, Connection in DeveloperDeviceConnection do
						Connection:Disconnect()
					end
					self._developerDeviceConnections[Device] = nil
					
					return
				end
			elseif FFlagMicRegistryIgnoreDefaultVoiceDeviceModule then
				if self:_isDeveloperDevice(Device) then
					self:_registerDeveloperDevice(Device)
					
					return
				end
				self:_unregisterDeveloperDevice(Device)
			end
		end)))
		self._developerDeviceConnections[Device] = List
	end
	
	table.insert(self._connections, if FFlagUseAudioDeviceInputAddedSignal then SoundService.AudioDeviceInputAdded:Connect(function(Device)
		-- upvalues: onDeviceAdded (copy)
		onDeviceAdded(Device)
	end) else SoundService.AudioInstanceAdded:Connect(function(AudioDeviceInput)
		-- upvalues: onDeviceAdded (copy)
		if AudioDeviceInput:IsA("AudioDeviceInput") then
			onDeviceAdded(AudioDeviceInput)
		end
	end))
	
	for _, AudioDeviceInput in game:GetDescendants() do
		if AudioDeviceInput:IsA("AudioDeviceInput") then
			onDeviceAdded(AudioDeviceInput)
		end
	end
end

function MicInputManager:SetMicActiveForAllConsumers(p3, p4)
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy), FFlagMicPermissionCheckOnConsumerUnmuteModule (copy), GetFFlagJoinWithoutMicPermissionsFunction (copy), PERMISSIONSTATE (copy), PermissionsProtocol (copy)
	if not GetFFlagMicConsumerRegistryModule() then return end
	if p3 then
		if self.isPlayerWatchingAd then
			self.log:trace("SetMicActiveForAllConsumers: blocked by ad-mute")
			
			return
		end
		if FFlagMicPermissionCheckOnConsumerUnmuteModule and not self._hasConsumerMicPermission then
			self:_requestConsumerMicPermission(p4)
			
			return
		end
		if not FFlagMicPermissionCheckOnConsumerUnmuteModule and GetFFlagJoinWithoutMicPermissionsFunction() then
			if self.permissionState == PERMISSIONSTATE.LISTEN_ONLY then
				self.log:debug("SetMicActiveForAllConsumers: permission denied")
				
				if not self._hasShownPermDeniedToast and self.callbacks.emitOnMicPermissionDeniedToast then
					self._hasShownPermDeniedToast = true
					self.callbacks.emitOnMicPermissionDeniedToast()
				end
				return
			elseif self.permissionState == PERMISSIONSTATE.PENDING_MIC then
				self.log:debug("SetMicActiveForAllConsumers: requesting permission")
				self.callbacks.emitGetPermissions(function(p5)
					-- upvalues: self (copy), PERMISSIONSTATE (upval), p3 (copy), p4 (copy)
					self.permissionState = if p5.hasMicPermissions then PERMISSIONSTATE.LISTEN_AND_TALK else PERMISSIONSTATE.LISTEN_ONLY
					self:SetMicActiveForAllConsumers(p3, p4)
				end, { PermissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)
				
				return
			end
		end
	end
	local MicIndicatorReady = p3 and self._micIndicatorReady
	for _, consumer in self._consumers do
		if consumer.device then
			consumer.device.Active = MicIndicatorReady
		end
	end
	self.localMuted = not p3
	self.muteChanged:Fire(self.localMuted)
	
	if p3 and not self._hasShownPrivacyToast then
		local Flag = false
		
		for _, consumer1 in self._consumers do
			if consumer1.consumerType == "VoiceChat" then
				Flag = true
				break
			end
		end
		if not Flag and self.callbacks.emitOnMicFirstUnmutePrivacy then
			self._hasShownPrivacyToast = true
			self.callbacks.emitOnMicFirstUnmutePrivacy()
		end
	end
	if p3 then
		self.talkingChanged:Fire(self.isTalking)
		self.callbacks.emitOnShowDataConsentToast()
	elseif self._lastLevel ~= 0 then
		self._lastLevel = 0
		self.levelChanged:Fire(0)
	end
	self:_assertDeviceStateConsistency()
end

function MicInputManager:_requestConsumerMicPermission(p5)
	-- upvalues: PermissionsProtocol (copy), GetFFlagDebugVoiceChatMicPermissionCliBypassModule (copy)
	if self._isRequestingConsumerMicPermission then return end
	self._isRequestingConsumerMicPermission = true
	
	local function onResult(AUTHORIZED)
		-- upvalues: self (copy), PermissionsProtocol (upval), p5 (copy)
		self._isRequestingConsumerMicPermission = false
		self.log:debug("Consumer mic permission status {}", AUTHORIZED)
		
		if AUTHORIZED == PermissionsProtocol.Status.AUTHORIZED or AUTHORIZED == PermissionsProtocol.Status.UNSUPPORTED then
			self._hasConsumerMicPermission = true
			
			if self._activeConsumerType ~= nil and self._activeConsumerType ~= "VoiceChat" then
				self:SetMicActiveForAllConsumers(true, p5)
			end
			return
		elseif self.callbacks.emitOnMicPermissionDeniedToast then
			self.callbacks.emitOnMicPermissionDeniedToast()
		end
	end
	
	if GetFFlagDebugVoiceChatMicPermissionCliBypassModule() then
		onResult(PermissionsProtocol.Status.AUTHORIZED)
		
		return
	else
		self.callbacks.requestPermissions({ PermissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(Result)
			-- upvalues: onResult (copy)
			onResult(if Result then Result.status else nil)
		end, function(p6)
			-- upvalues: self (copy), onResult (copy)
			self.log:warning("Consumer mic permission request failed: {}", (tostring(p6)))
			onResult(nil)
		end)
	end
end

function MicInputManager:Disconnect()
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy)
	for _, connection in self._connections do
		connection:Disconnect()
	end
	self._connections = {}
	
	if self.localMeteringTask then
		task.cancel(self.localMeteringTask)
		self.localMeteringTask = nil
	end
	if GetFFlagMicConsumerRegistryModule() then
		self:_stopLevelDetectionTask()
		
		for _, developerDeviceConnection in self._developerDeviceConnections do
			for _, Connection in developerDeviceConnection do
				Connection:Disconnect()
			end
		end
		self._developerDeviceConnections = {}
		
		for _, consumer in self._consumers do
			if consumer.wire then
				consumer.wire:Destroy()
			end
			if consumer.analyzer then
				consumer.analyzer:Destroy()
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

function MicInputManager:_assertDeviceStateConsistency()
	-- upvalues: GetFFlagMicConsumerRegistryModule (copy), Players (copy)
	local Inverted = self.localMuted == false and (not GetFFlagMicConsumerRegistryModule() or self._micIndicatorReady)
	for i in self.callbacks.getAudioDevices() do
		if i.Player and i.Player == Players.LocalPlayer and i.Active ~= Inverted then
			self.log:warning("MicManager consistency: device.Active={} expected={} localMuted={}", i.Active, Inverted, self.localMuted)
		end
	end
	if GetFFlagMicConsumerRegistryModule() then
		for _, consumer in self._consumers do
			if consumer.device and consumer.device.Active ~= Inverted then
				self.log:warning("MicManager consistency (consumer {}): device.Active={} expected={} localMuted={}", consumer.id, consumer.device.Active, Inverted, self.localMuted)
			end
		end
		if self._consumerCount == 0 and self.localMuted ~= nil then
			self.log:warning("MicManager consistency: no consumers but localMuted={}", self.localMuted)
		end
	end
end

return MicInputManager