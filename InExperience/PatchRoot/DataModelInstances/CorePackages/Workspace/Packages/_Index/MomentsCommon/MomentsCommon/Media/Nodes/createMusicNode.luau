local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)

local function _(value)
	return if typeof(value) == "string" and string.find(value, "://") ~= nil then value else `rbxassetid://{value}`
end

return {
	kind = "music",
	create = function(p1, p2)
		local parent = p1.parent
		assert(parent ~= nil, "createMusicNode: spec.parent (the item media folder) is required")
		local assetId = p1.assetId
		assetId = Content.fromUri(if typeof(assetId) == "string" and string.find(assetId, "://") ~= nil then assetId else `rbxassetid://{assetId}`)
		local startTime = p1.startTime or 0
		local trimmedLen = p1.trimmedLen
		local t = {
			startTime = startTime,
			endTime = if trimmedLen ~= nil then nil else startTime + trimmedLen
		}
		local volume = p1.volume or 1
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Name = `Music_{p1.id}`
		audioPlayer.AudioContent = assetId
		audioPlayer.PlaybackSpeed = 0
		audioPlayer.TimePosition = startTime
		audioPlayer.Parent = parent
		local var1 = false
		
		return {
			kind = "music",
			usesDecoder = false,
			id = p1.id,
			assets = function()
				-- upvalues: assetId (ref)
				return { assetId }
			end,
			download = function()
				-- upvalues: var1 (write), p2 (ref), assetId (ref)
				if var1 then
					return
				end
				p2.contentProvider:PreloadAsync({ assetId.Uri })
			end,
			getAudioSource = function()
				-- upvalues: audioPlayer (ref)
				return audioPlayer
			end,
			audioStem = { stemId = p1.id, defaultVolume = volume },
			play = function()
				-- upvalues: var1 (write), audioPlayer (ref)
				if var1 then return end
				audioPlayer.PlaybackSpeed = 1
				
				if not audioPlayer.IsPlaying then
					audioPlayer:Play()
				end
			end,
			pause = function()
				-- upvalues: var1 (write), audioPlayer (ref)
				if var1 then
					return
				end
				audioPlayer.PlaybackSpeed = 0
			end,
			seek = function(p3)
				-- upvalues: var1 (write), startTime (ref), audioPlayer (ref)
				if var1 then return end
				local var2 = startTime + p3
				local timeLength = audioPlayer.TimeLength
				
				if timeLength > 0 then
					var2 = math.clamp(var2, 0, timeLength)
				end
				audioPlayer.TimePosition = var2
			end,
			realignToRegionStart = function()
				-- upvalues: var1 (write), audioPlayer (ref), startTime (ref)
				if var1 then
					return
				end
				audioPlayer.TimePosition = startTime
			end,
			getRegion = function()
				-- upvalues: t (ref)
				return t
			end,
			dispose = function()
				-- upvalues: var1 (write), audioPlayer (ref)
				if var1 then
					return
				end
				var1 = true
				audioPlayer:Destroy()
			end
		}
	end
}