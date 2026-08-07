local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)

local function _(value) --[[ line: 76 | named "toAssetUri" ]]
	return if typeof(value) == "string" and string.find(value, "://") ~= nil then value else `rbxassetid://{value}`
end

return {
	kind = "music",
	create = function(p0, p1) --[[ line: 83 ]]
		local parent = p0.parent
		assert(parent ~= nil, "createMusicNode: spec.parent (the item media folder) is required")
		local assetId = p0.assetId
		assetId = Content.fromUri(if typeof(assetId) == "string" and string.find(assetId, "://") ~= nil then assetId else `rbxassetid://{assetId}`)
		local startTime = p0.startTime or 0
		local trimmedLen = p0.trimmedLen
		local t = {
			startTime = startTime,
			endTime = if trimmedLen ~= nil then nil else startTime + trimmedLen
		}
		local volume = p0.volume or 1
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Name = `Music_{p0.id}`
		audioPlayer.AudioContent = assetId
		audioPlayer.PlaybackSpeed = 0
		audioPlayer.TimePosition = startTime
		audioPlayer.Parent = parent
		local var5 = false
		
		return {
			kind = "music",
			usesDecoder = false,
			id = p0.id,
			assets = function() --[[ line: 109 ]]
				-- upvalues: assetId (ref)
				return { assetId }
			end,
			download = function() --[[ line: 113 ]]
				-- upvalues: var5 (write), p1 (ref), assetId (ref)
				if var5 then
					return
				end
				p1.contentProvider:PreloadAsync({ assetId.Uri })
			end,
			getAudioSource = function() --[[ line: 123 ]]
				-- upvalues: audioPlayer (ref)
				return audioPlayer
			end,
			audioStem = { stemId = p0.id, defaultVolume = volume },
			play = function() --[[ line: 127 ]]
				-- upvalues: var5 (write), audioPlayer (ref)
				if var5 then return end
				audioPlayer.PlaybackSpeed = 1
				
				if not audioPlayer.IsPlaying then
					audioPlayer:Play()
				end
			end,
			pause = function() --[[ line: 137 ]]
				-- upvalues: var5 (write), audioPlayer (ref)
				if var5 then
					return
				end
				audioPlayer.PlaybackSpeed = 0
			end,
			seek = function(p2) --[[ line: 146 ]]
				-- upvalues: var5 (write), startTime (ref), audioPlayer (ref)
				if var5 then return end
				local var6 = startTime + p2
				local timeLength = audioPlayer.TimeLength
				
				if timeLength > 0 then
					var6 = math.clamp(var6, 0, timeLength)
				end
				audioPlayer.TimePosition = var6
			end,
			realignToRegionStart = function() --[[ line: 158 ]]
				-- upvalues: var5 (write), audioPlayer (ref), startTime (ref)
				if var5 then
					return
				end
				audioPlayer.TimePosition = startTime
			end,
			getRegion = function() --[[ line: 165 ]]
				-- upvalues: t (ref)
				return t
			end,
			dispose = function() --[[ line: 169 ]]
				-- upvalues: var5 (write), audioPlayer (ref)
				if var5 then
					return
				end
				var5 = true
				audioPlayer:Destroy()
			end
		}
	end
}