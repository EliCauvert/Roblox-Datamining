local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)

local function _(Text: string): string
	return if typeof(Text) == "string" and string.find(Text, "://") ~= nil then Text else `rbxassetid://{Text}`
end

return {
	kind = "music",
	create = function(p1, p2)
		local Parent = p1.parent
		assert(Parent ~= nil, "createMusicNode: spec.parent (the item media folder) is required")
		local AssetId: string = p1.assetId
		local Content1 = Content.fromUri(if typeof(AssetId) == "string" and string.find(AssetId, "://") ~= nil then AssetId else `rbxassetid://{AssetId}`)
		local StartTime = p1.startTime or 0
		local TrimmedLen = p1.trimmedLen
		local config = {
			startTime = StartTime,
			endTime = if TrimmedLen == nil then nil else StartTime + TrimmedLen
		}
		local Volume = p1.volume or 1
		local AudioPlayer = Instance.new("AudioPlayer")
		AudioPlayer.Name = `Music_{p1.id}`
		AudioPlayer.AudioContent = Content1
		AudioPlayer.PlaybackSpeed = 0
		AudioPlayer.TimePosition = StartTime
		AudioPlayer.Parent = Parent
		local Flag = false
		
		return {
			kind = "music",
			usesDecoder = false,
			id = p1.id,
			assets = function()
				-- upvalues: Content1 (copy)
				return { Content1 }
			end,
			download = function()
				-- upvalues: Flag (ref), p2 (copy), Content1 (copy)
				if not Flag then
					p2.contentProvider:PreloadAsync({ Content1.Uri })
					
					return
				end
			end,
			getAudioSource = function()
				-- upvalues: AudioPlayer (copy)
				return AudioPlayer
			end,
			audioStem = { stemId = p1.id, defaultVolume = Volume },
			play = function()
				-- upvalues: Flag (ref), AudioPlayer (copy)
				if Flag then return end
				AudioPlayer.PlaybackSpeed = 1
				
				if not AudioPlayer.IsPlaying then
					AudioPlayer:Play()
				end
			end,
			pause = function()
				-- upvalues: Flag (ref), AudioPlayer (copy)
				if not Flag then
					AudioPlayer.PlaybackSpeed = 0
					
					return
				end
			end,
			seek = function(p3)
				-- upvalues: Flag (ref), StartTime (copy), AudioPlayer (copy)
				if Flag then return end
				local NewStartTime = StartTime + p3
				local TimeLength: number = AudioPlayer.TimeLength
				
				if TimeLength > 0 then
					NewStartTime = math.clamp(NewStartTime, 0, TimeLength)
				end
				AudioPlayer.TimePosition = NewStartTime
			end,
			realignToRegionStart = function()
				-- upvalues: Flag (ref), AudioPlayer (copy), StartTime (copy)
				if not Flag then
					AudioPlayer.TimePosition = StartTime
					
					return
				end
			end,
			getRegion = function()
				-- upvalues: config (copy)
				return config
			end,
			dispose = function()
				-- upvalues: Flag (ref), AudioPlayer (copy)
				if not Flag then
					Flag = true
					AudioPlayer:Destroy()
					
					return
				end
			end
		}
	end
}