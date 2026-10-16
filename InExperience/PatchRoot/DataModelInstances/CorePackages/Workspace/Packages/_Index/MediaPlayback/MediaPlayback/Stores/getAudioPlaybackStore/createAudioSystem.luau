local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local CoreGui = game:GetService("CoreGui")
local AssetIdAsContentModule = require(MediaPlayback.Common.assetIdAsContent)
local GetFFlagAudioPreviewLuaModule = require(MediaPlayback.Flags.getFFlagAudioPreviewLua)

local function getOrCreateInstances(Parent) --[[ Line: 15 ]]
	local AudioPlayback = Parent:FindFirstChild("AudioPlayback")
	local AudioDeviceOutput = if AudioPlayback then AudioPlayback:FindFirstChildWhichIsA("AudioDeviceOutput") else nil
	
	if AudioPlayback and AudioDeviceOutput then
		return {
			container = AudioPlayback,
			audioOutput = AudioDeviceOutput
		}
	else
		local AudioPlayback1 = Instance.new("Folder")
		AudioPlayback1.Name = "AudioPlayback"
		local AudioDeviceOutput1 = Instance.new("AudioDeviceOutput")
		AudioDeviceOutput1.Parent = AudioPlayback1
		AudioPlayback1.Parent = Parent
		
		return {
			container = AudioPlayback1,
			audioOutput = AudioDeviceOutput1
		}
	end
end

return function(p1, p2) --[[ Line: 43 | Named "createAudioSystem" ]]
	-- upvalues: getOrCreateInstances (copy), CoreGui (copy), AssetIdAsContentModule (copy), GetFFlagAudioPreviewLuaModule (copy)
	local OrCreateInstances = getOrCreateInstances(CoreGui)
	local AudioPlayer = Instance.new("AudioPlayer")
	AudioPlayer.Asset = AssetIdAsContentModule(p1)
	AudioPlayer.Name = `AudioPlayer_{AudioPlayer.Asset}`
	
	if GetFFlagAudioPreviewLuaModule() and p2 then
		AudioPlayer.AssetRepresentation = Enum.AssetRepresentation.ShortPreview
	end
	AudioPlayer.Parent = OrCreateInstances.container
	AudioPlayer.PlaybackSpeed = 0
	AudioPlayer:Play()
	
	local function destroy() --[[ Line: 78 ]]
		-- upvalues: AudioPlayer (copy), OrCreateInstances (copy)
		AudioPlayer:Destroy()
		
		if not OrCreateInstances.container:FindFirstChildWhichIsA("AudioPlayer") then
			OrCreateInstances.container:Destroy()
		end
	end
	
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = AudioPlayer
	Wire.TargetInstance = OrCreateInstances.audioOutput
	Wire.Parent = AudioPlayer
	
	return { audioPlayer = AudioPlayer, destroy = destroy }
end