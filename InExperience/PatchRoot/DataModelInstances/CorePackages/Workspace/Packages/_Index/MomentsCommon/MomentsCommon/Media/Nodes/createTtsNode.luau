local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local audioDuckingFastIntsModule = require(momentsCommon.Media.audioDuckingFastInts)

local function _(value)
	return if typeof(value) == "string" and string.find(value, "://") ~= nil then value else `rbxassetid://{value}`
end

return {
	kind = "tts",
	create = function(p1, p2)
		-- upvalues: audioDuckingFastIntsModule (ref)
		local fromUri
		local parent = p1.parent
		assert(parent ~= nil, "createTtsNode: spec.parent (the item media folder) is required")
		local assetId = p1.assetId
		local startTime = p1.startTime or 0
		local t = { endTime = nil, startTime = startTime }
		local volume = p1.volume or audioDuckingFastIntsModule.getTtsVolume()
		
		if assetId == nil then
			fromUri = nil
		else
			fromUri = Content.fromUri
			fromUri = fromUri(if typeof(assetId) == "string" and string.find(assetId, "://") ~= nil then assetId else `rbxassetid://{assetId}`)
		end
		local var1 = nil
		
		if fromUri ~= nil then
			local audioPlayer = Instance.new("AudioPlayer")
			audioPlayer.Name = `Tts_{p1.id}`
			audioPlayer.AudioContent = fromUri
			audioPlayer.PlaybackSpeed = 0
			audioPlayer.TimePosition = 0
			audioPlayer.Parent = parent
			var1 = audioPlayer
		end
		local var2 = false
		
		local function assets()
			-- upvalues: fromUri (ref)
			return if fromUri == nil then {} else { fromUri }
		end
		
		local function download()
			-- upvalues: var2 (write), fromUri (ref), p2 (ref)
			if var2 or fromUri == nil then
				return
			end
			p2.contentProvider:PreloadAsync({ fromUri.Uri })
		end
		
		local var3 = false
		local var4 = false
		local var5 = nil
		local t_1 = {
			kind = "tts",
			usesDecoder = false,
			id = p1.id,
			assets = assets,
			download = download,
			play = function()
				-- upvalues: var2 (write), var1 (write), var3 (write)
				if var2 or var1 == nil then
					return
				end
				var3 = true
			end,
			pause = function()
				-- upvalues: var2 (write), var1 (write), var3 (write), var4 (write)
				if var2 or var1 == nil then
					return
				end
				var3 = false
				var4 = false
				var1.PlaybackSpeed = 0
			end,
			seek = function(p3)
				-- upvalues: var2 (write), var1 (write), startTime (ref)
				if var2 or var1 == nil then return end
				local maxValue = math.max(0, p3 - startTime)
				local timeLength = var1.TimeLength
				
				if timeLength > 0 then
					maxValue = math.clamp(maxValue, 0, timeLength)
				end
				var1.TimePosition = maxValue
			end,
			realignToRegionStart = function()
				-- upvalues: var2 (write), var1 (write), var4 (write)
				if var2 or var1 == nil then
					return
				end
				var1.PlaybackSpeed = 0
				var1.TimePosition = 0
				var4 = false
			end,
			syncToClock = function(p3)
				-- upvalues: var2 (write), var1 (write), var3 (write), var5 (write), startTime (ref), var4 (write)
				if var2 or var1 == nil or not var3 then return end
				var5 = p3
				local var6 = var5 ~= nil and var5 < p3
				
				if startTime <= p3 then
					local maxValue = math.max(0, p3 - startTime)
					
					if var4 then
						local timeLength = var1.TimeLength
						local var7 = if timeLength > 0 then maxValue < timeLength else true
						
						if var7 then
							var7 = maxValue - var1.TimePosition
							
							if var7 > 0.1 or var7 < -0.5 then
								var1.TimePosition = maxValue
								
								return
							end
						end
					elseif not var6 then return end
					local timeLength = var1.TimeLength
					
					if not (if timeLength > 0 then maxValue < timeLength else true) then return end
					var1.TimePosition = maxValue
					var1.PlaybackSpeed = 1
					
					if not var1.IsPlaying then
						var1:Play()
					end
					var4 = true
					
					return
				elseif var4 then
					var1.PlaybackSpeed = 0
					var1.TimePosition = 0
					var4 = false
				end
			end,
			getRegion = function()
				-- upvalues: t (ref)
				return t
			end,
			dispose = function()
				-- upvalues: var2 (write), var1 (write)
				if var2 then return end
				var2 = true
				
				if var1 ~= nil then
					var1:Destroy()
				end
			end
		}
		
		if var1 ~= nil then
			function t_1.getAudioSource()
				-- upvalues: var1 (write)
				return var1
			end
			
			t_1.audioStem = {
				role = "sidechain",
				stemId = p1.id,
				defaultVolume = volume
			}
		end
		return t_1
	end,
	hasAudioRemaining = function(p1, p2)
		return if p2 > 0 then p1 < p2 else true
	end
}