local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local coreGuiService = game:GetService("CoreGui")
local assetIdAsContentModule = require(mediaPlayback.Common.assetIdAsContent)
local getFFlagAudioPreviewLuaModule = require(mediaPlayback.Flags.getFFlagAudioPreviewLua)

local function getOrCreateInstances(p1)
	local audioPlayback = p1:FindFirstChild("AudioPlayback")
	local var1 = if audioPlayback then audioPlayback:FindFirstChildWhichIsA("AudioDeviceOutput") else nil
	
	if audioPlayback and var1 then
		return { container = audioPlayback, audioOutput = var1 }
	end
	local audioPlayback_1 = Instance.new("Folder")
	audioPlayback_1.Name = "AudioPlayback"
	local audioDeviceOutput = Instance.new("AudioDeviceOutput")
	audioDeviceOutput.Parent = audioPlayback_1
	audioPlayback_1.Parent = p1
	
	return {
		container = audioPlayback_1,
		audioOutput = audioDeviceOutput
	}
end

return function(p1, p2)
	-- upvalues: getOrCreateInstances (ref), coreGuiService (ref), assetIdAsContentModule (ref), getFFlagAudioPreviewLuaModule (ref)
	local var1 = getOrCreateInstances(coreGuiService)
	local audioPlayer = Instance.new("AudioPlayer")
	audioPlayer.Asset = assetIdAsContentModule(p1)
	audioPlayer.Name = `AudioPlayer_{audioPlayer.Asset}`
	
	if getFFlagAudioPreviewLuaModule() and p2 then
		audioPlayer.AssetRepresentation = Enum.AssetRepresentation.ShortPreview
	end
	audioPlayer.Parent = var1.container
	audioPlayer.PlaybackSpeed = 0
	audioPlayer:Play()
	
	local function destroy()
		-- upvalues: audioPlayer (ref), var1 (ref)
		audioPlayer:Destroy()
		
		if not var1.container:FindFirstChildWhichIsA("AudioPlayer") then
			var1.container:Destroy()
		end
	end
	
	local wire = Instance.new("Wire")
	wire.SourceInstance = audioPlayer
	wire.TargetInstance = var1.audioOutput
	wire.Parent = audioPlayer
	
	return { audioPlayer = audioPlayer, destroy = destroy }
end