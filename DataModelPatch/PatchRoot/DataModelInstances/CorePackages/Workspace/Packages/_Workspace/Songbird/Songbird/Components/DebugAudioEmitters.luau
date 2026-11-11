local Songbird = script:FindFirstAncestor("Songbird")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GetFFlagDebugMusicSampleSoundsModule = require(Songbird.Flags.getFFlagDebugMusicSampleSounds)
local UseEffectFunction = require(Songbird.Parent.React).useEffect
local list = {
	{
		className = "Sound",
		title = "Beach Morning LoFi",
		assetId = "rbxassetid://83784623771159",
		position = vector.create(50, 0, 0)
	},
	{
		className = "AudioPlayer",
		title = "Mirage Portal",
		assetId = "rbxassetid://75793628822368",
		position = vector.create(-50, 0, 0)
	},
	{
		className = "Sound",
		title = "Altogether Elsewhere",
		assetId = "rbxassetid://73856926671353",
		position = vector.create(0, 0, 50)
	},
	{
		className = "Sound",
		title = "Shiawase",
		assetId = "rbxassetid://5409360995",
		position = vector.create(0, 0, -50)
	},
	{
		className = "Sound",
		title = "Life in an Elevator",
		assetId = "rbxassetid://1841647093",
		position = vector.create(100, 0, 0),
		shouldSurfaceToUser = false
	},
	{
		className = "Sound",
		title = "Explosion",
		assetId = "rbxassetid://157878578",
		position = vector.create(0, 0, 100),
		shouldSurfaceToUser = false
	}
}

local function spawnAudioEmitter(p1)
	local Part = Instance.new("Part")
	Part.Position = p1.position
	Part.Anchored = true
	Part.Name = p1.title
	
	if p1.className == "Sound" then
		local Sound = Instance.new("Sound")
		Sound.SoundId = p1.assetId
		Sound.Looped = true
		Sound.RollOffMinDistance = 10
		Sound.RollOffMaxDistance = 40
		Sound.Parent = Part
		Sound:Play()
	else
		local AudioPlayer = Instance.new("AudioPlayer")
		AudioPlayer.Asset = p1.assetId
		AudioPlayer.Looping = true
		AudioPlayer.Parent = Part
		local AudioEmitter = Instance.new("AudioEmitter")
		AudioEmitter.Parent = Part
		local Wire = Instance.new("Wire")
		Wire.SourceInstance = AudioPlayer
		Wire.TargetInstance = AudioEmitter
		Wire.Parent = AudioPlayer
		AudioPlayer:Play()
	end
	Part.Parent = workspace
	
	return Part
end

return function()
	-- upvalues: GetFFlagDebugMusicSampleSoundsModule (copy), UseEffectFunction (copy), list (copy), spawnAudioEmitter (copy), ReplicatedStorage (copy)
	if GetFFlagDebugMusicSampleSoundsModule() then
		UseEffectFunction(function()
			local AudioListener = Instance.new("AudioListener")
			local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
			AudioDeviceOutput.Parent = AudioListener
			local Wire = Instance.new("Wire")
			Wire.SourceInstance = AudioListener
			Wire.TargetInstance = AudioDeviceOutput
			Wire.Parent = AudioListener
			AudioListener.Parent = workspace.CurrentCamera
		end, {})
		UseEffectFunction(function()
			-- upvalues: list (upval), spawnAudioEmitter (upval), ReplicatedStorage (upval)
			local Adornees = {}
			
			for _, value in list do
				local SpawnAudioEmitterResult = spawnAudioEmitter(value)
				local Billboard = Instance.new("BillboardGui")
				Billboard.ExtentsOffsetWorldSpace = vector.create(0, 10, 0)
				Billboard.Size = UDim2.fromScale(10, 2)
				Billboard.Adornee = SpawnAudioEmitterResult
				local Label = Instance.new("TextLabel")
				Label.Text = value.title
				Label.Size = UDim2.fromScale(1, 1)
				Label.Font = Enum.Font.BuilderSansBold
				Label.TextScaled = true
				Label.TextColor3 = if value.shouldSurfaceToUser == false then Color3.fromHex("#c4474f") else Color3.fromHex("#fff")
				Label.BackgroundTransparency = 1
				Label.Parent = Billboard
				local Stroke = Instance.new("UIStroke")
				Stroke.Color = Color3.fromHex("#202020")
				Stroke.Thickness = 2
				Stroke.Parent = Label
				Billboard.Parent = SpawnAudioEmitterResult
				table.insert(Adornees, SpawnAudioEmitterResult)
			end
			local Sound = Instance.new("Sound")
			Sound.SoundId = "rbxassetid://9048375035"
			Sound.Volume = 0.05
			Sound.Looped = true
			Sound.Parent = ReplicatedStorage
			Sound:Play()
			
			return function()
				-- upvalues: Sound (copy), Adornees (copy)
				Sound:Destroy()
				
				for _, adornee in Adornees do
					adornee:Destroy()
				end
			end
		end, {})
	end
	return nil
end