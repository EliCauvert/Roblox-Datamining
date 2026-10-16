local SoundService = game:GetService("SoundService")
local VoiceChatService = game:GetService("VoiceChatService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

local function _() --[[ Line: 7 | Named "ShouldUseDefaultVoice" ]]
	-- upvalues: SoundService (copy), VoiceChatService (copy)
	return SoundService.DefaultListenerLocation == Enum.ListenerLocation.Default and VoiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and VoiceChatService.EnableDefaultVoice
end

local _ = function(): boolean --[[ Line: 13 | Named "ShouldUseCamera" ]]
	-- upvalues: SoundService (copy)
	return SoundService.DefaultListenerLocation == Enum.ListenerLocation.Camera
end

local _ = function(): boolean --[[ Line: 17 | Named "ShouldUseCharacter" ]]
	-- upvalues: SoundService (copy)
	return SoundService.DefaultListenerLocation == Enum.ListenerLocation.Character
end

local _ = function() --[[ Line: 21 | Named "ShouldSpawnListener" ]]
	-- upvalues: SoundService (copy), VoiceChatService (copy)
	return SoundService.DefaultListenerLocation ~= Enum.ListenerLocation.None and (SoundService.DefaultListenerLocation == Enum.ListenerLocation.Camera or (SoundService.DefaultListenerLocation == Enum.ListenerLocation.Character or SoundService.DefaultListenerLocation == Enum.ListenerLocation.Default and VoiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and VoiceChatService.EnableDefaultVoice))
end

local _ = function(Parent, TargetInstance) --[[ Line: 28 | Named "WireUp" ]]
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = Parent
	Wire.TargetInstance = TargetInstance
	Wire.Parent = Parent
	
	return Wire
end

local _ = function() --[[ Line: 36 | Named "GetMainOut" ]]
	-- upvalues: SoundService (copy)
	local AudioDeviceOutput = SoundService:FindFirstChildWhichIsA("AudioDeviceOutput", true)
	
	if not AudioDeviceOutput then
		local AudioDeviceOutput1 = Instance.new("AudioDeviceOutput")
		AudioDeviceOutput1.Parent = SoundService
		AudioDeviceOutput = AudioDeviceOutput1
	end
	return AudioDeviceOutput
end

local function SpawnCharacterListener(Character) --[[ Line: 46 ]]
	-- upvalues: SpawnCharacterListener (copy), SoundService (copy), RunService (copy)
	local PrimaryPart = Character.PrimaryPart
	
	if not PrimaryPart then
		Character:GetPropertyChangedSignal("PrimaryPart"):Once(function() --[[ Line: 49 ]]
			-- upvalues: SpawnCharacterListener (upval), Character (copy)
			SpawnCharacterListener(Character)
		end)
		
		return
	end
	local Attachment = Instance.new("Attachment")
	
	local function UpdateCFrame() --[[ Line: 56 ]]
		-- upvalues: Attachment (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			local Rotation = CurrentCamera.CFrame.Rotation
			Attachment.WorldAxis = Rotation.XVector
			Attachment.WorldSecondaryAxis = Rotation.YVector
			
			return
		end
	end
	
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera then
		local Rotation = CurrentCamera.CFrame.Rotation
		Attachment.WorldAxis = Rotation.XVector
		Attachment.WorldSecondaryAxis = Rotation.YVector
	end
	local AudioListener = Instance.new("AudioListener")
	AudioListener.Parent = Attachment
	Attachment.Parent = PrimaryPart
	local AudioDeviceOutput = SoundService:FindFirstChildWhichIsA("AudioDeviceOutput", true)
	
	if not AudioDeviceOutput then
		local AudioDeviceOutput1 = Instance.new("AudioDeviceOutput")
		AudioDeviceOutput1.Parent = SoundService
		AudioDeviceOutput = AudioDeviceOutput1
	end
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = AudioListener
	Wire.TargetInstance = AudioDeviceOutput
	Wire.Parent = AudioListener
	local HeartbeatConnection = RunService.Heartbeat:Connect(UpdateCFrame)
	local Connection = nil
	Connection = Attachment.AncestryChanged:Connect(function() --[[ Line: 76 ]]
		-- upvalues: Attachment (copy), HeartbeatConnection (copy), Connection (ref)
		if not Attachment:IsDescendantOf(game) then
			HeartbeatConnection:Disconnect()
			Connection:Disconnect()
		end
	end)
end

local Flag = false

local function Initialize() --[[ Line: 86 ]]
	-- upvalues: SoundService (copy), VoiceChatService (copy), Flag (ref), LocalPlayer (copy), SpawnCharacterListener (copy)
	if SoundService.DefaultListenerLocation == Enum.ListenerLocation.None or SoundService.DefaultListenerLocation ~= Enum.ListenerLocation.Camera and (SoundService.DefaultListenerLocation ~= Enum.ListenerLocation.Character and (SoundService.DefaultListenerLocation ~= Enum.ListenerLocation.Default or (VoiceChatService.UseAudioApi ~= Enum.AudioApiRollout.Enabled or not VoiceChatService.EnableDefaultVoice))) then return end
	if Flag then return end
	if SoundService.DefaultListenerLocation == Enum.ListenerLocation.Character then
		local Character = LocalPlayer.Character
		
		if Character then
			SpawnCharacterListener(Character)
		end
		LocalPlayer.CharacterAdded:Connect(SpawnCharacterListener)
	elseif SoundService.DefaultListenerLocation == Enum.ListenerLocation.Camera then
		local AudioDeviceOutput = SoundService:FindFirstChildWhichIsA("AudioDeviceOutput", true)
		
		if not AudioDeviceOutput then
			local AudioDeviceOutput1 = Instance.new("AudioDeviceOutput")
			AudioDeviceOutput1.Parent = SoundService
			AudioDeviceOutput = AudioDeviceOutput1
		end
		local AudioListener = Instance.new("AudioListener")
		AudioListener.Parent = workspace.CurrentCamera
		local Wire = Instance.new("Wire")
		Wire.SourceInstance = AudioListener
		Wire.TargetInstance = AudioDeviceOutput
		Wire.Parent = AudioListener
	elseif SoundService.DefaultListenerLocation == Enum.ListenerLocation.Default and (VoiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and VoiceChatService.EnableDefaultVoice) then
		local AudioListener = Instance.new("AudioListener")
		AudioListener.Parent = workspace.CurrentCamera
		local Wire = Instance.new("Wire")
		Wire.Parent = AudioListener
		local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
		AudioDeviceOutput.Parent = Wire
		Wire.SourceInstance = AudioListener
		Wire.TargetInstance = AudioDeviceOutput
	end
	Flag = true
end

Initialize()
SoundService:GetPropertyChangedSignal("DefaultListenerLocation"):Connect(Initialize)
VoiceChatService:GetPropertyChangedSignal("UseAudioApi"):Connect(Initialize)
VoiceChatService:GetPropertyChangedSignal("EnableDefaultVoice"):Connect(Initialize)

return {}