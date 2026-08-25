local soundService = game:GetService("SoundService")
local voiceChatService = game:GetService("VoiceChatService")
local runService = game:GetService("RunService")
local localPlayer = game:GetService("Players").LocalPlayer

local function _()
	-- upvalues: soundService (ref), voiceChatService (ref)
	return soundService.DefaultListenerLocation == Enum.ListenerLocation.Default and (voiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and voiceChatService.EnableDefaultVoice)
end

local _ = function()
	-- upvalues: soundService (ref)
	return soundService.DefaultListenerLocation == Enum.ListenerLocation.Camera
end

local _ = function()
	-- upvalues: soundService (ref)
	return soundService.DefaultListenerLocation == Enum.ListenerLocation.Character
end

local _ = function()
	-- upvalues: soundService (ref), voiceChatService (ref)
	return if soundService.DefaultListenerLocation == Enum.ListenerLocation.None then false else soundService.DefaultListenerLocation == Enum.ListenerLocation.Camera or (soundService.DefaultListenerLocation == Enum.ListenerLocation.Character or (soundService.DefaultListenerLocation == Enum.ListenerLocation.Default and (voiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and voiceChatService.EnableDefaultVoice)))
end

local _ = function(p0, p1)
	local wire = Instance.new("Wire")
	wire.SourceInstance = p0
	wire.TargetInstance = p1
	wire.Parent = p0
	
	return wire
end

local _ = function()
	-- upvalues: soundService (ref)
	local audioDeviceOutput = soundService:FindFirstChildWhichIsA("AudioDeviceOutput", true)
	
	if not audioDeviceOutput then
		local audioDeviceOutput_1 = Instance.new("AudioDeviceOutput")
		audioDeviceOutput_1.Parent = soundService
		audioDeviceOutput = audioDeviceOutput_1
	end
	return audioDeviceOutput
end

local function SpawnCharacterListener(p2)
	-- upvalues: SpawnCharacterListener (ref), soundService (ref), runService (ref)
	local primaryPart = p2.PrimaryPart
	
	if not primaryPart then
		p2:GetPropertyChangedSignal("PrimaryPart"):Once(function()
			-- upvalues: SpawnCharacterListener (copy), p2 (ref)
			SpawnCharacterListener(p2)
		end)
		
		return
	end
	local attachment = Instance.new("Attachment")
	
	local function UpdateCFrame()
		-- upvalues: attachment (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			local rotation = currentCamera.CFrame.Rotation
			attachment.WorldAxis = rotation.XVector
			attachment.WorldSecondaryAxis = rotation.YVector
			
			return
		end
	end
	
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		local rotation = currentCamera.CFrame.Rotation
		attachment.WorldAxis = rotation.XVector
		attachment.WorldSecondaryAxis = rotation.YVector
	end
	local audioListener = Instance.new("AudioListener")
	audioListener.Parent = attachment
	attachment.Parent = primaryPart
	local audioDeviceOutput = soundService:FindFirstChildWhichIsA("AudioDeviceOutput", true)
	
	if not audioDeviceOutput then
		local audioDeviceOutput_1 = Instance.new("AudioDeviceOutput")
		audioDeviceOutput_1.Parent = soundService
		audioDeviceOutput = audioDeviceOutput_1
	end
	local wire = Instance.new("Wire")
	wire.SourceInstance = audioListener
	wire.TargetInstance = audioDeviceOutput
	wire.Parent = audioListener
	local heartbeatConnection = runService.Heartbeat:Connect(UpdateCFrame)
	local ancestryChangedConnection = nil
	ancestryChangedConnection = attachment.AncestryChanged:Connect(function()
		-- upvalues: attachment (ref), heartbeatConnection (ref), ancestryChangedConnection (write)
		if not attachment:IsDescendantOf(game) then
			heartbeatConnection:Disconnect()
			ancestryChangedConnection:Disconnect()
		end
	end)
end

local var4 = false

local function Initialize()
	-- upvalues: soundService (ref), voiceChatService (ref), var4 (write), localPlayer (ref), SpawnCharacterListener (ref)
	if not (if soundService.DefaultListenerLocation == Enum.ListenerLocation.None then false else soundService.DefaultListenerLocation == Enum.ListenerLocation.Camera or (soundService.DefaultListenerLocation == Enum.ListenerLocation.Character or (soundService.DefaultListenerLocation == Enum.ListenerLocation.Default and (voiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and voiceChatService.EnableDefaultVoice)))) then return end
	if var4 then return end
	if soundService.DefaultListenerLocation == Enum.ListenerLocation.Character then
		local character = localPlayer.Character
		
		if character then
			SpawnCharacterListener(character)
		end
		localPlayer.CharacterAdded:Connect(SpawnCharacterListener)
	elseif soundService.DefaultListenerLocation == Enum.ListenerLocation.Camera then
		local audioDeviceOutput = soundService:FindFirstChildWhichIsA("AudioDeviceOutput", true)
		
		if not audioDeviceOutput then
			local audioDeviceOutput_1 = Instance.new("AudioDeviceOutput")
			audioDeviceOutput_1.Parent = soundService
			audioDeviceOutput = audioDeviceOutput_1
		end
		local var22 = audioDeviceOutput
		local audioListener = Instance.new("AudioListener")
		audioListener.Parent = workspace.CurrentCamera
		local wire = Instance.new("Wire")
		wire.SourceInstance = audioListener
		wire.TargetInstance = var22
		wire.Parent = audioListener
	elseif soundService.DefaultListenerLocation == Enum.ListenerLocation.Default and (voiceChatService.UseAudioApi == Enum.AudioApiRollout.Enabled and voiceChatService.EnableDefaultVoice) then
		local audioListener = Instance.new("AudioListener")
		audioListener.Parent = workspace.CurrentCamera
		local wire = Instance.new("Wire")
		wire.Parent = audioListener
		local audioDeviceOutput = Instance.new("AudioDeviceOutput")
		audioDeviceOutput.Parent = wire
		wire.SourceInstance = audioListener
		wire.TargetInstance = audioDeviceOutput
	end
	var4 = true
end

Initialize()
soundService:GetPropertyChangedSignal("DefaultListenerLocation"):Connect(Initialize)
voiceChatService:GetPropertyChangedSignal("UseAudioApi"):Connect(Initialize)
voiceChatService:GetPropertyChangedSignal("EnableDefaultVoice"):Connect(Initialize)

return {}