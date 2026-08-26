local songbird = script:FindFirstAncestor("Songbird")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local getFFlagDebugMusicSampleSoundsModule = require(songbird.Flags.getFFlagDebugMusicSampleSounds)
local useEffect = require(songbird.Parent.React).useEffect
local list = {
	{
		className = "Sound",
		title = "Beach Morning LoFi",
		assetId = "rbxassetid://83784623771159",
		position = Vector3.new(50, 0, 0)
	},
	{
		className = "AudioPlayer",
		title = "Mirage Portal",
		assetId = "rbxassetid://75793628822368",
		position = Vector3.new(-50, 0, 0)
	},
	{
		className = "Sound",
		title = "Altogether Elsewhere",
		assetId = "rbxassetid://73856926671353",
		position = Vector3.new(0, 0, 50)
	},
	{
		className = "Sound",
		title = "Shiawase",
		assetId = "rbxassetid://5409360995",
		position = Vector3.new(0, 0, -50)
	},
	{
		className = "Sound",
		title = "Life in an Elevator",
		assetId = "rbxassetid://1841647093",
		position = Vector3.new(100, 0, 0),
		shouldSurfaceToUser = false
	},
	{
		className = "Sound",
		title = "Explosion",
		assetId = "rbxassetid://157878578",
		position = Vector3.new(0, 0, 100),
		shouldSurfaceToUser = false
	}
}

local function spawnAudioEmitter(p1)
	local part = Instance.new("Part")
	part.Position = p1.position
	part.Anchored = true
	part.Name = p1.title
	
	if p1.className == "Sound" then
		local sound = Instance.new("Sound")
		sound.SoundId = p1.assetId
		sound.Looped = true
		sound.RollOffMinDistance = 10
		sound.RollOffMaxDistance = 40
		sound.Parent = part
		sound:Play()
	else
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = p1.assetId
		audioPlayer.Looping = true
		audioPlayer.Parent = part
		local audioEmitter = Instance.new("AudioEmitter")
		audioEmitter.Parent = part
		local wire = Instance.new("Wire")
		wire.SourceInstance = audioPlayer
		wire.TargetInstance = audioEmitter
		wire.Parent = audioPlayer
		audioPlayer:Play()
	end
	part.Parent = workspace
	
	return part
end

return function()
	-- upvalues: getFFlagDebugMusicSampleSoundsModule (ref), useEffect (ref), list (ref), spawnAudioEmitter (ref), replicatedStorageService (ref)
	if getFFlagDebugMusicSampleSoundsModule() then
		useEffect(function()
			local audioListener = Instance.new("AudioListener")
			local audioDeviceOutput = Instance.new("AudioDeviceOutput")
			audioDeviceOutput.Parent = audioListener
			local wire = Instance.new("Wire")
			wire.SourceInstance = audioListener
			wire.TargetInstance = audioDeviceOutput
			wire.Parent = audioListener
			audioListener.Parent = workspace.CurrentCamera
		end, {})
		useEffect(function()
			-- upvalues: list (copy), spawnAudioEmitter (copy), replicatedStorageService (copy)
			local t = {}
			
			for i, v in list do
				local var1 = spawnAudioEmitter(v)
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.ExtentsOffsetWorldSpace = Vector3.new(0, 10, 0)
				billboardGui.Size = UDim2.fromScale(10, 2)
				billboardGui.Adornee = var1
				local textLabel = Instance.new("TextLabel")
				textLabel.Text = v.title
				textLabel.Size = UDim2.fromScale(1, 1)
				textLabel.Font = Enum.Font.BuilderSansBold
				textLabel.TextScaled = true
				textLabel.TextColor3 = if v.shouldSurfaceToUser == false then Color3.fromHex("#c4474f") else Color3.fromHex("#fff")
				textLabel.BackgroundTransparency = 1
				textLabel.Parent = billboardGui
				local UIStroke = Instance.new("UIStroke")
				UIStroke.Color = Color3.fromHex("#202020")
				UIStroke.Thickness = 2
				UIStroke.Parent = textLabel
				billboardGui.Parent = var1
				table.insert(t, var1)
			end
			local sound = Instance.new("Sound")
			sound.SoundId = "rbxassetid://9048375035"
			sound.Volume = 0.05
			sound.Looped = true
			sound.Parent = replicatedStorageService
			sound:Play()
			
			return function()
				-- upvalues: sound (ref), t (ref)
				sound:Destroy()
				
				for i, v in t do
					v:Destroy()
				end
			end
		end, {})
	end
	return nil
end