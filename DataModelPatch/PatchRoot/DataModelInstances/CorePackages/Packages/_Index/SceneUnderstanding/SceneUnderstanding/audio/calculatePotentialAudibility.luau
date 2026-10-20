local SceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SafelyAccessPropertyModule = require(SceneUnderstanding.safelyAccessProperty)
local GetOutputWiresModule = require(SceneUnderstanding.wiring.getOutputWires)
local _ = require(SceneUnderstanding.wiring.types)
local ToWirableInstanceModule = require(SceneUnderstanding.wiring.toWirableInstance)

local function _(Sound)
	-- upvalues: SafelyAccessPropertyModule (copy)
	if not Sound.IsPlaying then
		return 0
	end
	local RollOffGain = SafelyAccessPropertyModule(Sound, "RollOffGain", 0)
	local Volume = if Sound.SoundGroup then Sound.SoundGroup.Volume else 1
	
	if RollOffGain < 1 then
		RollOffGain /= 10
	end
	return Volume * Sound.Volume * RollOffGain
end

local function getOutputsOf(AudioEmitter)
	-- upvalues: GetOutputWiresModule (copy), ToWirableInstanceModule (copy)
	if typeof(AudioEmitter) == "Instance" and AudioEmitter:IsA("AudioEmitter") then
		return (AudioEmitter:GetInteractingListeners())
	end
	local List = {}
	
	for _, value in GetOutputWiresModule(AudioEmitter) do
		local WirableInstanceModule = ToWirableInstanceModule(value.TargetInstance)
		
		if WirableInstanceModule then
			table.insert(List, WirableInstanceModule)
		end
	end
	return List
end

local _ = function(AudioEmitter): number
	local NewAudibilityFor = 0
	
	for _, interactingListener in AudioEmitter:GetInteractingListeners() do
		NewAudibilityFor += interactingListener:GetAudibilityFor(AudioEmitter)
	end
	return NewAudibilityFor
end

local function getAudibilityOf(Object, p1): number
	-- upvalues: getOutputsOf (copy), getAudibilityOf (copy)
	local T = if p1 then p1 else {}
	
	if T[Object] then
		return 0
	end
	T[Object] = true
	local Volume = 1
	
	if typeof(Object) == "Instance" then
		if Object:IsA("AudioPlayer") or Object:IsA("AudioFader") then
			Volume = Object.Volume
		elseif Object:IsA("AudioEmitter") then
			local NewAudibilityFor = 0
			
			for _, interactingListener in Object:GetInteractingListeners() do
				NewAudibilityFor += interactingListener:GetAudibilityFor(Object)
			end
			Volume = NewAudibilityFor
		elseif Object:IsA("AudioDeviceOutput") then
			return 1
		end
	end
	local Total = 0
	
	for _, value in getOutputsOf(Object) do
		Total += Volume * getAudibilityOf(value, T)
	end
	return Total
end

return function(Sound: Sound)
	-- upvalues: SafelyAccessPropertyModule (copy), UserGameSettings (copy), getAudibilityOf (copy)
	local MasterVolume = SafelyAccessPropertyModule(UserGameSettings, "MasterVolume", 0)
	local AudibilityOf = nil
	
	if Sound:IsA("Sound") then
		if Sound.IsPlaying then
			local RollOffGain = SafelyAccessPropertyModule(Sound, "RollOffGain", 0)
			local Volume = if Sound.SoundGroup then Sound.SoundGroup.Volume else 1
			
			if RollOffGain < 1 then
				RollOffGain /= 10
			end
			AudibilityOf = Volume * Sound.Volume * RollOffGain
		else
			AudibilityOf = 0
		end
	else
		AudibilityOf = getAudibilityOf(Sound)
	end
	return MasterVolume * AudibilityOf
end