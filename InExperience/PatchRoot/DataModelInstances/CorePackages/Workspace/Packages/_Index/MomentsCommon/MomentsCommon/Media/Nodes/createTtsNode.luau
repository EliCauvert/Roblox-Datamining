local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local httpService = game:GetService("HttpService")
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local audioDuckingFastIntsModule = require(momentsCommon.Media.audioDuckingFastInts)

local function toAssetUri(value, p1)
	-- upvalues: httpService (ref)
	if typeof(value) == "string" and string.find(value, "://") ~= nil then
		return value
	end
	local var1 = `rbxassetid://{value}`
	
	return if p1 == nil or p1 == "" then var1 else `{var1}&accessContext={httpService:UrlEncode(p1)}&permissionContext=ignoreUniverse`
end

return {
	kind = "tts",
	create = function(p1, p2)
		-- upvalues: audioDuckingFastIntsModule (ref), toAssetUri (ref)
		local parent = p1.parent
		assert(parent ~= nil, "createTtsNode: spec.parent (the item media folder) is required")
		local assetId = p1.assetId
		local assetAccessContext = p1.assetAccessContext
		local startTime = p1.startTime or 0
		local t = { endTime = nil, startTime = startTime }
		local volume = p1.volume or audioDuckingFastIntsModule.getTtsVolume()
		local var1 = if assetId ~= nil then nil else Content.fromUri(toAssetUri(assetId, assetAccessContext))
		local var2 = nil
		
		if var1 ~= nil then
			local audioPlayer = Instance.new("AudioPlayer")
			audioPlayer.Name = `Tts_{p1.id}`
			audioPlayer.AudioContent = var1
			audioPlayer.PlaybackSpeed = 0
			audioPlayer.TimePosition = 0
			audioPlayer.Parent = parent
			var2 = audioPlayer
		end
		local var3 = false
		
		local function assets()
			-- upvalues: var1 (ref)
			return if var1 == nil then {} else { var1 }
		end
		
		local function download()
			-- upvalues: var3 (write), var1 (ref), p2 (ref)
			if var3 or var1 == nil then
				return
			end
			p2.contentProvider:PreloadAsync({ var1.Uri })
		end
		
		local var4 = false
		local var5 = false
		local var6 = nil
		local t_1 = {
			kind = "tts",
			usesDecoder = false,
			id = p1.id,
			assets = assets,
			download = download,
			play = function()
				-- upvalues: var3 (write), var2 (write), var4 (write)
				if var3 or var2 == nil then
					return
				end
				var4 = true
			end,
			pause = function()
				-- upvalues: var3 (write), var2 (write), var4 (write), var5 (write)
				if var3 or var2 == nil then
					return
				end
				var4 = false
				var5 = false
				var2.PlaybackSpeed = 0
			end,
			seek = function(p3)
				-- upvalues: var3 (write), var2 (write), startTime (ref)
				if var3 or var2 == nil then return end
				local maxValue = math.max(0, p3 - startTime)
				local timeLength = var2.TimeLength
				
				if timeLength > 0 then
					maxValue = math.clamp(maxValue, 0, timeLength)
				end
				var2.TimePosition = maxValue
			end,
			realignToRegionStart = function()
				-- upvalues: var3 (write), var2 (write), var5 (write)
				if var3 or var2 == nil then
					return
				end
				var2.PlaybackSpeed = 0
				var2.TimePosition = 0
				var5 = false
			end,
			syncToClock = function(p3)
				-- upvalues: var3 (write), var2 (write), var4 (write), var6 (write), startTime (ref), var5 (write)
				if var3 or var2 == nil or not var4 then return end
				var6 = p3
				local var7 = var6 ~= nil and var6 < p3
				
				if startTime <= p3 then
					local maxValue = math.max(0, p3 - startTime)
					
					if var5 then
						local timeLength = var2.TimeLength
						local var8 = if timeLength > 0 then maxValue < timeLength else true
						
						if var8 then
							var8 = maxValue - var2.TimePosition
							
							if var8 > 0.1 or var8 < -0.5 then
								var2.TimePosition = maxValue
								
								return
							end
						end
					elseif not var7 then return end
					local timeLength = var2.TimeLength
					
					if not (if timeLength > 0 then maxValue < timeLength else true) then return end
					var2.TimePosition = maxValue
					var2.PlaybackSpeed = 1
					
					if not var2.IsPlaying then
						var2:Play()
					end
					var5 = true
					
					return
				elseif var5 then
					var2.PlaybackSpeed = 0
					var2.TimePosition = 0
					var5 = false
				end
			end,
			getRegion = function()
				-- upvalues: t (ref)
				return t
			end,
			dispose = function()
				-- upvalues: var3 (write), var2 (write)
				if var3 then return end
				var3 = true
				
				if var2 ~= nil then
					var2:Destroy()
				end
			end
		}
		
		if var2 ~= nil then
			function t_1.getAudioSource()
				-- upvalues: var2 (write)
				return var2
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