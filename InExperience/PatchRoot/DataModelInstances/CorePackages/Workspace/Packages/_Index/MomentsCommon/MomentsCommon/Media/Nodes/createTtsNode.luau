local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local HttpService = game:GetService("HttpService")
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local AudioDuckingFastIntsModule = require(MomentsCommon.Media.audioDuckingFastInts)
local FFlagMomentsVideoPermissionContextFixModule = require(MomentsCommon.Flags.FFlagMomentsVideoPermissionContextFix)

local function toAssetUri(Text: string, AssetAccessContext, p1): string --[[ Line: 59 ]]
	-- upvalues: HttpService (copy)
	if typeof(Text) == "string" and string.find(Text, "://") ~= nil then
		return Text
	end
	local AssetId: string = `rbxassetid://{Text}`
	
	if AssetAccessContext == nil or AssetAccessContext == "" then
		return AssetId
	else
		local AccessContextName: string = `{AssetId}&accessContext={HttpService:UrlEncode(AssetAccessContext)}`
		
		return if p1 then AccessContextName else `{AccessContextName}&permissionContext=ignoreUniverse`
	end
end

local function defaultLoadSpeech(AudioTextToSpeech) --[[ Line: 85 ]]
	return if game:GetEngineFeature("TextToSpeechPlatformPreview") then AudioTextToSpeech:LoadPlatformAsync() else Enum.AssetFetchStatus.Failure
end

return {
	kind = "tts",
	create = function(p1, p2) --[[ Line: 94 ]]
		-- upvalues: AudioDuckingFastIntsModule (copy), toAssetUri (copy), FFlagMomentsVideoPermissionContextFixModule (copy), defaultLoadSpeech (copy)
		local Parent = p1.parent
		assert(Parent ~= nil, "createTtsNode: spec.parent (the item media folder) is required")
		local AssetId = p1.assetId
		local AssetAccessContext = p1.assetAccessContext
		local StartTime = p1.startTime or 0
		local config = { endTime = nil, startTime = StartTime }
		local Volume = p1.volume or AudioDuckingFastIntsModule.getTtsVolume()
		local Content = if AssetId == nil then nil else Content.fromUri((toAssetUri(AssetId, AssetAccessContext)))
		local Content1 = if FFlagMomentsVideoPermissionContextFixModule and game.GameId == 0 and AssetId ~= nil then Content.fromUri((toAssetUri(AssetId, AssetAccessContext, true))) else Content
		local Sound = nil
		
		if Content1 ~= nil then
			local AudioPlayer = Instance.new("AudioPlayer")
			AudioPlayer.Name = `Tts_{p1.id}`
			AudioPlayer.AudioContent = Content1
			AudioPlayer.PlaybackSpeed = 0
			AudioPlayer.TimePosition = 0
			AudioPlayer.Parent = Parent
			Sound = AudioPlayer
		end
		local Text = p1.text
		local AudioTextToSpeech = nil
		
		if Sound == nil and Text ~= nil and Text ~= "" then
			local AudioTextToSpeech1 = Instance.new("AudioTextToSpeech")
			AudioTextToSpeech1.Name = `Tts_{p1.id}`
			AudioTextToSpeech1.Text = Text
			AudioTextToSpeech1.VoiceId = tostring(p1.voiceId)
			AudioTextToSpeech1.PlaybackSpeed = 0
			AudioTextToSpeech1.TimePosition = 0
			AudioTextToSpeech1.Parent = Parent
			AudioTextToSpeech = AudioTextToSpeech1
			Sound = AudioTextToSpeech1
		end
		local LoadSpeech = p2.loadSpeech or defaultLoadSpeech
		local NoAudioTextToSpeech = AudioTextToSpeech == nil
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		local Flag3 = false
		local v1 = nil
		local config1 = {
			kind = "tts",
			usesDecoder = false,
			id = p1.id,
			assets = function() --[[ Line: 154 ]]
				-- upvalues: Content (copy)
				return if Content == nil then {} else { Content }
			end,
			download = function() --[[ Line: 158 ]]
				-- upvalues: Flag1 (ref), AudioTextToSpeech (ref), Flag (ref), LoadSpeech (copy), NoAudioTextToSpeech (ref), Content (copy), p2 (copy)
				if Flag1 then return end
				if AudioTextToSpeech ~= nil and not Flag then
					Flag = true
					task.spawn(function() --[[ Line: 166 ]]
						-- upvalues: LoadSpeech (upval), AudioTextToSpeech (upval), Flag1 (upval), NoAudioTextToSpeech (upval)
						local Success, Result = pcall(LoadSpeech, AudioTextToSpeech)
						
						if not Flag1 and Success and Result == Enum.AssetFetchStatus.Success then
							NoAudioTextToSpeech = true
							
							return
						end
					end)
				end
				if Content ~= nil then
					p2.contentProvider:PreloadAsync({ Content.Uri })
					
					return
				end
			end,
			play = function() --[[ Line: 190 ]]
				-- upvalues: Flag1 (ref), Sound (ref), Flag2 (ref)
				if not Flag1 and Sound ~= nil then
					Flag2 = true
					
					return
				end
			end,
			pause = function() --[[ Line: 198 ]]
				-- upvalues: Flag1 (ref), Sound (ref), Flag2 (ref), Flag3 (ref)
				if not Flag1 and Sound ~= nil then
					Flag2 = false
					Flag3 = false
					Sound.PlaybackSpeed = 0
					
					return
				end
			end,
			seek = function(p3) --[[ Line: 209 ]]
				-- upvalues: Flag1 (ref), Sound (ref), StartTime (copy)
				if Flag1 or Sound == nil then return end
				local Largest = math.max(0, p3 - StartTime)
				local TimeLength: number = Sound.TimeLength
				
				if TimeLength > 0 then
					Largest = math.clamp(Largest, 0, TimeLength)
				end
				Sound.TimePosition = Largest
			end,
			realignToRegionStart = function() --[[ Line: 222 ]]
				-- upvalues: Flag1 (ref), Sound (ref), Flag3 (ref)
				if not Flag1 and Sound ~= nil then
					Sound.PlaybackSpeed = 0
					Sound.TimePosition = 0
					Flag3 = false
					
					return
				end
			end,
			syncToClock = function(p3) --[[ Line: 233 ]]
				-- upvalues: Flag1 (ref), Sound (ref), Flag2 (ref), NoAudioTextToSpeech (ref), v1 (ref), StartTime (copy), Flag3 (ref)
				if Flag1 or Sound == nil or not Flag2 or not NoAudioTextToSpeech then return end
				local v2 = v1
				v1 = p3
				local v3: boolean = v2 ~= nil and p3 > v2
				
				if StartTime <= p3 then
					local Largest = math.max(0, p3 - StartTime)
					
					if Flag3 then
						local TimeLength: number = Sound.TimeLength
						
						if TimeLength <= 0 or Largest < TimeLength then
							local LargestDelta = Largest - Sound.TimePosition
							
							if LargestDelta > 0.1 or LargestDelta < -0.5 then
								Sound.TimePosition = Largest
								
								return
							end
						end
					else
						if not v3 then return end
						local TimeLength: number = Sound.TimeLength
						
						if TimeLength > 0 and Largest >= TimeLength then return end
						Sound.TimePosition = Largest
						Sound.PlaybackSpeed = 1
						
						if not Sound.IsPlaying then
							Sound:Play()
						end
						Flag3 = true
						
						return
					end
				elseif Flag3 then
					Sound.PlaybackSpeed = 0
					Sound.TimePosition = 0
					Flag3 = false
				end
			end,
			getRegion = function() --[[ Line: 275 ]]
				-- upvalues: config (copy)
				return config
			end,
			dispose = function() --[[ Line: 279 ]]
				-- upvalues: Flag1 (ref), Sound (ref)
				if Flag1 then return end
				Flag1 = true
				
				if Sound ~= nil then
					Sound:Destroy()
				end
			end
		}
		
		if Sound ~= nil then
			function config1.getAudioSource() --[[ Line: 307 ]]
				-- upvalues: Sound (ref)
				return Sound
			end
			
			config1.audioStem = {
				role = "sidechain",
				stemId = p1.id,
				defaultVolume = Volume
			}
		end
		return config1
	end,
	hasAudioRemaining = function(p1, p2: number): boolean --[[ Line: 73 ]]
		return p2 <= 0 or p1 < p2
	end
}