local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local httpService = game:GetService("HttpService")
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local audioDuckingFastIntsModule = require(momentsCommon.Media.audioDuckingFastInts)
local fFlagMomentsVideoPermissionContextFixModule = require(momentsCommon.Flags.FFlagMomentsVideoPermissionContextFix)

local function toAssetUri(value, p1, p2)
	-- upvalues: httpService (ref)
	if typeof(value) == "string" and string.find(value, "://") ~= nil then
		return value
	end
	local var1 = `rbxassetid://{value}`
	
	if p1 == nil or p1 == "" then
		return var1
	end
	local var2 = `{var1}&accessContext={httpService:UrlEncode(p1)}`
	
	return if p2 then var2 else `{var2}&permissionContext=ignoreUniverse`
end

local function defaultLoadSpeech(p1)
	return if game:GetEngineFeature("TextToSpeechPlatformPreview") then p1:LoadPlatformAsync() else Enum.AssetFetchStatus.Failure
end

return {
	kind = "tts",
	create = function(p1, p2)
		-- upvalues: audioDuckingFastIntsModule (ref), toAssetUri (ref), fFlagMomentsVideoPermissionContextFixModule (ref), defaultLoadSpeech (ref)
		local parent = p1.parent
		assert(parent ~= nil, "createTtsNode: spec.parent (the item media folder) is required")
		local assetId = p1.assetId
		local assetAccessContext = p1.assetAccessContext
		local startTime = p1.startTime or 0
		local t = { endTime = nil, startTime = startTime }
		local volume = p1.volume or audioDuckingFastIntsModule.getTtsVolume()
		local var1 = if assetId ~= nil then nil else Content.fromUri(toAssetUri(assetId, assetAccessContext))
		local var2 = if fFlagMomentsVideoPermissionContextFixModule and game.GameId == 0 and assetId ~= nil then Content.fromUri(toAssetUri(assetId, assetAccessContext, true)) else var1
		local var3 = nil
		
		if var2 ~= nil then
			local audioPlayer = Instance.new("AudioPlayer")
			audioPlayer.Name = `Tts_{p1.id}`
			audioPlayer.AudioContent = var2
			audioPlayer.PlaybackSpeed = 0
			audioPlayer.TimePosition = 0
			audioPlayer.Parent = parent
			var3 = audioPlayer
		end
		local text = p1.text
		local var4 = nil
		
		if var3 == nil and text ~= nil and text ~= "" then
			local audioTextToSpeech = Instance.new("AudioTextToSpeech")
			audioTextToSpeech.Name = `Tts_{p1.id}`
			audioTextToSpeech.Text = text
			audioTextToSpeech.VoiceId = tostring(p1.voiceId)
			audioTextToSpeech.PlaybackSpeed = 0
			audioTextToSpeech.TimePosition = 0
			audioTextToSpeech.Parent = parent
			var4 = audioTextToSpeech
			var3 = audioTextToSpeech
		end
		local loadSpeech = p2.loadSpeech or defaultLoadSpeech
		local var5 = var4 == nil
		local var6 = false
		local var7 = false
		
		local function assets()
			-- upvalues: var1 (ref)
			return if var1 == nil then {} else { var1 }
		end
		
		local function download()
			-- upvalues: var7 (write), var4 (write), var6 (write), loadSpeech (ref), var5 (write), var1 (ref), p2 (ref)
			if var7 then return end
			if var4 ~= nil and not var6 then
				var6 = true
				task.spawn(function()
					-- upvalues: loadSpeech (copy), var4 (copy), var7 (copy), var5 (copy)
					local ok, status = pcall(loadSpeech, var4)
					
					if var7 or not ok or status ~= Enum.AssetFetchStatus.Success then
						return
					end
					var5 = true
				end)
			end
			if var1 == nil then
				return
			end
			p2.contentProvider:PreloadAsync({ var1.Uri })
		end
		
		local var8 = false
		local var9 = false
		local var10 = nil
		local t_1 = {
			kind = "tts",
			usesDecoder = false,
			id = p1.id,
			assets = assets,
			download = download,
			play = function()
				-- upvalues: var7 (write), var3 (write), var8 (write)
				if var7 or var3 == nil then
					return
				end
				var8 = true
			end,
			pause = function()
				-- upvalues: var7 (write), var3 (write), var8 (write), var9 (write)
				if var7 or var3 == nil then
					return
				end
				var8 = false
				var9 = false
				var3.PlaybackSpeed = 0
			end,
			seek = function(p3)
				-- upvalues: var7 (write), var3 (write), startTime (ref)
				if var7 or var3 == nil then return end
				local maxValue = math.max(0, p3 - startTime)
				local timeLength = var3.TimeLength
				
				if timeLength > 0 then
					maxValue = math.clamp(maxValue, 0, timeLength)
				end
				var3.TimePosition = maxValue
			end,
			realignToRegionStart = function()
				-- upvalues: var7 (write), var3 (write), var9 (write)
				if var7 or var3 == nil then
					return
				end
				var3.PlaybackSpeed = 0
				var3.TimePosition = 0
				var9 = false
			end,
			syncToClock = function(p3)
				-- upvalues: var7 (write), var3 (write), var8 (write), var5 (write), var10 (write), startTime (ref), var9 (write)
				if var7 or var3 == nil or (not var8 or not var5) then return end
				var10 = p3
				local var11 = var10 ~= nil and var10 < p3
				
				if startTime <= p3 then
					local maxValue = math.max(0, p3 - startTime)
					
					if var9 then
						local timeLength = var3.TimeLength
						local var12 = if timeLength > 0 then maxValue < timeLength else true
						
						if var12 then
							var12 = maxValue - var3.TimePosition
							
							if var12 > 0.1 or var12 < -0.5 then
								var3.TimePosition = maxValue
								
								return
							end
						end
					elseif not var11 then return end
					local timeLength = var3.TimeLength
					
					if not (if timeLength > 0 then maxValue < timeLength else true) then return end
					var3.TimePosition = maxValue
					var3.PlaybackSpeed = 1
					
					if not var3.IsPlaying then
						var3:Play()
					end
					var9 = true
					
					return
				elseif var9 then
					var3.PlaybackSpeed = 0
					var3.TimePosition = 0
					var9 = false
				end
			end,
			getRegion = function()
				-- upvalues: t (ref)
				return t
			end,
			dispose = function()
				-- upvalues: var7 (write), var3 (write)
				if var7 then return end
				var7 = true
				
				if var3 ~= nil then
					var3:Destroy()
				end
			end
		}
		
		if var3 ~= nil then
			function t_1.getAudioSource()
				-- upvalues: var3 (write)
				return var3
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