local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local _ = require(MomentsCommon.Media.MediaTypes)
local CreateAudioGraphModule = require(MomentsCommon.Media.createAudioGraph)
local MediaRootModule = require(MomentsCommon.Media.mediaRoot)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local DefaultMediaNodeRegistryModule = require(MomentsCommon.Media.defaultMediaNodeRegistry)
local FFlagMomentsVideoPermissionContextFixModule = require(MomentsCommon.Flags.FFlagMomentsVideoPermissionContextFix)
local FFlagMomentsOptimisticProfilePending = require(Parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local FFlagMomentsRenderAvatarPostsInFeed = require(Parent.SharedFlags).FFlagMomentsRenderAvatarPostsInFeed
local _ = require(MomentsCommon.Media.Nodes.createVideoNode)
local _ = require(MomentsCommon.Media.Nodes.createScreenshotNode)
local _ = require(MomentsCommon.Media.Nodes.createMusicNode)
local _ = require(MomentsCommon.Media.Nodes.createTtsNode)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local GetFFlagMomentsStickerButtonModule = require(MomentsCommon.Flags.GetFFlagMomentsStickerButton)
local LoopEpsilonSeconds = require(MomentsCommon.Media.Preload.preloadConstants).loopEpsilonSeconds

return function(p1, p2)
	-- upvalues: DefaultMediaNodeRegistryModule (copy), MediaRootModule (copy), CreateAudioGraphModule (copy), FFlagMomentsVideoPermissionContextFixModule (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), FFlagMomentsOptimisticProfilePending (copy), GetFFlagMomentsStickerButtonModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), CryoModule (copy), LoopEpsilonSeconds (copy)
	local Services = p2.services
	local Registry = p2.registry or DefaultMediaNodeRegistryModule()
	local IsCaptureTypeMatch = p1.captureType == Enum.CaptureType.Video
	local Edits = p1.edits
	local TtsAudios = if Edits == nil then nil else Edits.ttsAudios
	local EnableDucking = false
	
	if TtsAudios ~= nil then
		for _, ttsAudio in TtsAudios do
			if ttsAudio.assetId ~= nil then
				EnableDucking = true
				break
			end
		end
	end
	local LocalTts = p1.localTts
	
	if LocalTts ~= nil then
		EnableDucking = true
	end
	local MediaRootModuleResult = MediaRootModule(p1.momentId, p2.parent)
	local Folder = MediaRootModuleResult.folder
	local AudioGraphModule = CreateAudioGraphModule(Folder, p2.audioDeviceOutput, {
		masterVolume = p2.masterVolume,
		enableDucking = EnableDucking
	})
	local List = {}
	local Musics = {}
	
	local function _(p3)
		-- upvalues: List (copy), Musics (copy)
		table.insert(List, p3)
		Musics[p3.id] = p3
	end
	
	local v1 = nil
	local v2 = nil
	
	if IsCaptureTypeMatch then
		local Video = Registry.create("video", {
			id = "video",
			kind = "video",
			zIndex = 0,
			content = p1.content,
			preloadContent = if FFlagMomentsVideoPermissionContextFixModule then p1.preloadContent else nil,
			region = if Edits == nil then nil else Edits.trim,
			parent = Folder,
			cornerRadius = p1.cornerRadius
		}, Services)
		v1 = Video
		table.insert(List, Video)
		Musics[Video.id] = Video
	else
		local Screenshot = Registry.create("screenshot", {
			id = "screenshot",
			kind = "screenshot",
			image = if FFlagMomentsRenderAvatarPostsInFeed and p1.isExternalBase == true then nil else p1.content.Uri,
			imageContent = if FFlagMomentsRenderAvatarPostsInFeed and p1.isExternalBase == true then p1.content elseif FFlagMomentsOptimisticProfilePending then p1.content else nil,
			poster = if p1.posterContent == nil then nil else p1.posterContent.Uri,
			posterContent = if FFlagMomentsOptimisticProfilePending then p1.posterContent else nil,
			parent = Folder
		}, Services)
		v2 = Screenshot
		table.insert(List, Screenshot)
		Musics[Screenshot.id] = Screenshot
	end
	local v3 = nil
	
	if Edits ~= nil and Edits.music ~= nil then
		local Music = Registry.create("music", {
			id = "music",
			kind = "music",
			assetId = Edits.music.assetId,
			startTime = Edits.music.startTime,
			parent = Folder
		}, Services)
		v3 = Music
		table.insert(List, Music)
		Musics[Music.id] = Music
	end
	local v4 = v3 ~= nil
	local List1 = {}
	
	if TtsAudios ~= nil then
		for i, ttsAudio1 in TtsAudios do
			if ttsAudio1.assetId ~= nil then
				local Tts = Registry.create("tts", {
					kind = "tts",
					id = `tts:{i - 1}`,
					assetId = ttsAudio1.assetId,
					assetAccessContext = ttsAudio1.assetAccessContext,
					startTime = ttsAudio1.startTime,
					parent = Folder
				}, Services)
				table.insert(List1, Tts)
				table.insert(List, Tts)
				Musics[Tts.id] = Tts
			end
		end
	end
	if LocalTts ~= nil then
		local Tts = Registry.create("tts", {
			kind = "tts",
			id = `tts:{#List1}`,
			text = LocalTts.text,
			voiceId = LocalTts.voiceId,
			startTime = LocalTts.startTime,
			parent = Folder
		}, Services)
		table.insert(List1, Tts)
		table.insert(List, Tts)
		Musics[Tts.id] = Tts
	end
	if Edits ~= nil and Edits.textOverlays ~= nil then
		for i1, textOverlay in Edits.textOverlays do
			local Text = Registry.create("text", {
				kind = "text",
				id = `text:{i1 - 1}`,
				overlay = textOverlay
			}, Services)
			table.insert(List, Text)
			Musics[Text.id] = Text
		end
	end
	if GetFFlagMomentsStickerButtonModule() and Edits ~= nil and Edits.stickerOverlays ~= nil then
		for i2, stickerOverlay in Edits.stickerOverlays do
			local Sticker = Registry.create("sticker", {
				kind = "sticker",
				id = `sticker:{i2 - 1}`,
				overlay = stickerOverlay
			}, Services)
			table.insert(List, Sticker)
			Musics[Sticker.id] = Sticker
		end
	end
	local List2 = {}
	
	for _, value in List do
		if value.usesDecoder then
			table.insert(List2, value)
		end
	end
	local List3 = {}
	
	for _, value1 in List do
		local Render = value1.render
		
		if Render ~= nil then
			table.insert(List3, {
				id = value1.id,
				zIndex = value1.zIndex or 0,
				render = Render
			})
		end
	end
	table.sort(List3, function(A, B): boolean
		return A.zIndex < B.zIndex
	end)
	local Signal = CreateSignalFunction(List3)
	local AddStemResults = {}
	
	local _ = function(p3)
		-- upvalues: AddStemResults (copy), AudioGraphModule (copy)
		local AudioStem = p3.audioStem
		local GetAudioSourceFunction = p3.getAudioSource
		
		if AudioStem ~= nil and GetAudioSourceFunction ~= nil and AddStemResults[AudioStem.stemId] == nil then
			AddStemResults[AudioStem.stemId] = AudioGraphModule.addStem(AudioStem.stemId, GetAudioSourceFunction(), AudioStem.defaultVolume, AudioStem.role)
			
			return
		end
	end
	
	local _ = function(p3)
		-- upvalues: AddStemResults (copy)
		local AudioStem = p3.audioStem
		
		if AudioStem == nil then return end
		local AddStemResult: () -> () = AddStemResults[AudioStem.stemId]
		
		if AddStemResult ~= nil then
			AddStemResult()
			AddStemResults[AudioStem.stemId] = nil
		end
	end
	
	for _, value2 in List do
		local NoGetAudioSource = value2.getAudioSource == nil or value2.usesDecoder
		local AudioStem = nil
		local GetAudioSourceFunction = nil
		
		if not NoGetAudioSource then
			AudioStem = value2.audioStem
			GetAudioSourceFunction = value2.getAudioSource
			NoGetAudioSource = AudioStem == nil or GetAudioSourceFunction == nil or AddStemResults[AudioStem.stemId] ~= nil
		end
		if not NoGetAudioSource then
			AddStemResults[AudioStem.stemId] = AudioGraphModule.addStem(AudioStem.stemId, GetAudioSourceFunction(), AudioStem.defaultVolume, AudioStem.role)
		end
	end
	local Signal1, Signal2 = CreateSignalFunction(false)
	local Signal3, Signal2_1 = CreateSignalFunction(false)
	local Signal4, Signal2_2 = CreateSignalFunction(false)
	local Loading, Loading2 = CreateSignalFunction("Loading")
	local Signal5, Signal2_3 = CreateSignalFunction(nil)
	local Signal6, Signal2_4 = CreateSignalFunction(0)
	local Signal7, Signal2_5 = CreateSignalFunction(false)
	local Flag = false
	local Largest = nil
	local GetPosition = if v1 == nil then v2.getPosition else v1.getPosition
	local Computed = CreateComputedFunction(function(p3): string
		-- upvalues: Signal4 (copy), Signal3 (copy), Signal1 (copy)
		return if Signal4(p3) then "Playing" elseif Signal3(p3) then "Decoded" elseif Signal1(p3) then "Downloaded" else "Idle"
	end)
	local Computed1 = CreateComputedFunction(function(p3)
		-- upvalues: v1 (ref), Signal3 (copy), Signal1 (copy), v2 (ref), FFlagMomentsRenderAvatarPostsInFeed (upval), p1 (copy), Loading (copy), Signal5 (copy), Signal4 (copy), Signal7 (copy)
		local Resolution = nil
		local Ready = nil
		local FailureReason1 = nil
		local TimeLength = nil
		local Duration = nil
		
		if v1 == nil then
			local v5 = v2
			
			if FFlagMomentsRenderAvatarPostsInFeed and p1.isExternalBase == true then
				Ready = Loading(p3)
				FailureReason1 = Signal5(p3)
			else
				local FailureReason = v5.getFailureReason(p3)
				Ready = if FailureReason == nil then if v5.getIsImageLoaded(p3) then "Ready" else "Loading" else "Failed"
				FailureReason1 = FailureReason
			end
			Duration = v5.getDuration()
			TimeLength = v5.getDuration()
		else
			local FailureReason = v1.getFailureReason(p3)
			Ready = if FailureReason == nil then if v1.getIsLoaded(p3) then "Ready" elseif Signal3(p3) or Signal1(p3) then "Loading" else "Idle" else "Failed"
			FailureReason1 = FailureReason
			Resolution = v1.getResolution(p3)
			Duration = v1.getDuration(p3)
			TimeLength = v1.getTimeLength(p3)
		end
		return {
			readiness = Ready,
			resolution = Resolution,
			duration = Duration,
			timeLength = TimeLength,
			isPlaying = Signal4(p3),
			isMuted = Signal7(p3),
			failureReason = FailureReason1
		}
	end, CryoModule.Dictionary.equals)
	local RenderSteppedConnection = nil
	local v5 = 0
	
	local _ = function()
		-- upvalues: RenderSteppedConnection (ref), v3 (ref), List1 (copy), v5 (ref), GetPosition (copy), Services (copy), Flag (ref), LoopEpsilonSeconds (upval)
		if RenderSteppedConnection == nil and (v3 ~= nil or #List1 ~= 0) then
			v5 = GetPosition(false)
			RenderSteppedConnection = Services.runService.RenderStepped:Connect(function()
				-- upvalues: Flag (upval), GetPosition (upval), v5 (upval), LoopEpsilonSeconds (upval), v3 (upval), List1 (upval)
				if Flag then return end
				local v6 = GetPosition(false)
				
				if v6 < v5 - LoopEpsilonSeconds then
					if v3 ~= nil then
						v3.realignToRegionStart()
					end
					for _, value in List1 do
						value.realignToRegionStart()
					end
				end
				for _, value1 in List1 do
					value1.syncToClock(v6)
				end
				v5 = v6
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection ~= nil then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
	end
	
	local _ = function()
		-- upvalues: v1 (ref)
		return v1 == nil or v1.isPlaybackReady()
	end
	
	local function play()
		-- upvalues: Flag (ref), v1 (ref), Largest (ref), v3 (ref), List1 (copy), v2 (ref), List (copy), GetPosition (copy), Signal2_2 (copy), RenderSteppedConnection (ref), v5 (ref), Services (copy), LoopEpsilonSeconds (upval)
		if Flag or v1 ~= nil and not v1.isPlaybackReady() then return end
		local Largest1: number = Largest
		Largest = nil
		
		if v3 ~= nil then
			v3.realignToRegionStart()
		end
		for _, value in List1 do
			value.realignToRegionStart()
		end
		if v2 ~= nil then
			v2.seek(0)
		end
		for _, value1 in List do
			local PlayFunction: () -> () = value1.play
			
			if PlayFunction ~= nil then
				PlayFunction()
			end
		end
		if Largest1 ~= nil and Largest1 > 0 then
			for _, value2 in List do
				local SeekFunction: (any) -> () = value2.seek
				
				if SeekFunction ~= nil then
					SeekFunction(Largest1)
				end
			end
		end
		for _, value3 in List1 do
			value3.syncToClock(GetPosition(false))
		end
		Signal2_2(true)
		
		if RenderSteppedConnection == nil then
			if v3 == nil and #List1 == 0 then return end
			v5 = GetPosition(false)
			RenderSteppedConnection = Services.runService.RenderStepped:Connect(function()
				-- upvalues: Flag (upval), GetPosition (upval), v5 (upval), LoopEpsilonSeconds (upval), v3 (upval), List1 (upval)
				if Flag then return end
				local v6 = GetPosition(false)
				
				if v6 < v5 - LoopEpsilonSeconds then
					if v3 ~= nil then
						v3.realignToRegionStart()
					end
					for _, value in List1 do
						value.realignToRegionStart()
					end
				end
				for _, value1 in List1 do
					value1.syncToClock(v6)
				end
				v5 = v6
			end)
		end
	end
	
	local function pauseAndRemember(p3)
		-- upvalues: Flag (ref), v1 (ref), Largest (ref), GetPosition (copy), List (copy), Signal2_2 (copy), RenderSteppedConnection (ref)
		if Flag then return end
		if v1 ~= nil then
			Largest = math.max(0, GetPosition(false) - p3)
		end
		for _, value in List do
			local PauseFunction: () -> () = value.pause
			
			if PauseFunction ~= nil then
				PauseFunction()
			end
		end
		Signal2_2(false)
		
		if RenderSteppedConnection ~= nil then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
	end
	
	return {
		getState = Computed1,
		getPosition = GetPosition,
		getUserToggleNonce = Signal6,
		getVisualLayers = Signal,
		getResourceLevel = Computed,
		audio = {
			setVolume = function(p4, p5)
				-- upvalues: Flag (ref), AudioGraphModule (copy)
				if not Flag then
					AudioGraphModule.setVolume(p4, p5)
				end
			end,
			setMuted = function(p4, p5)
				-- upvalues: Flag (ref), AudioGraphModule (copy)
				if not Flag then
					AudioGraphModule.setMuted(p4, p5)
				end
			end,
			setMasterMuted = function(p4)
				-- upvalues: Flag (ref), AudioGraphModule (copy), Signal2_5 (copy)
				if not Flag then
					AudioGraphModule.setMasterMuted(p4)
					Signal2_5(p4)
					
					return
				end
			end
		},
		download = function()
			-- upvalues: Flag (ref), List (copy), Signal2 (copy)
			if Flag then return end
			for _, value in List do
				value.download()
			end
			if not Flag then
				Signal2(true)
				
				return
			end
		end,
		decode = function()
			-- upvalues: Flag (ref), List2 (copy), AddStemResults (copy), AudioGraphModule (copy), v4 (copy), Signal2_1 (copy)
			if Flag then return end
			for _, value in List2 do
				local DecodeFunction: () -> () = value.decode
				
				if DecodeFunction ~= nil then
					DecodeFunction()
				end
				local AudioStem = value.audioStem
				local GetAudioSourceFunction = value.getAudioSource
				
				if AudioStem ~= nil and GetAudioSourceFunction ~= nil and AddStemResults[AudioStem.stemId] == nil then
					AddStemResults[AudioStem.stemId] = AudioGraphModule.addStem(AudioStem.stemId, GetAudioSourceFunction(), AudioStem.defaultVolume, AudioStem.role)
				end
			end
			if v4 and AddStemResults.video ~= nil then
				AudioGraphModule.setMuted("video", true)
			end
			Signal2_1(true)
		end,
		releaseDecoder = function()
			-- upvalues: Flag (ref), List2 (copy), AddStemResults (copy), Signal2_1 (copy), Signal2_2 (copy)
			if Flag then return end
			for _, value in List2 do
				local AudioStem = value.audioStem
				local NoAudioStem = AudioStem == nil
				local AddStemResult = nil
				
				if not NoAudioStem then
					AddStemResult = AddStemResults[AudioStem.stemId]
					NoAudioStem = AddStemResult == nil
				end
				if not NoAudioStem then
					AddStemResult()
					AddStemResults[AudioStem.stemId] = nil
				end
				local ReleaseDecoderFunction: () -> () = value.releaseDecoder
				
				if ReleaseDecoderFunction ~= nil then
					ReleaseDecoderFunction()
				end
			end
			Signal2_1(false)
			Signal2_2(false)
		end,
		play = play,
		pause = function(p4)
			-- upvalues: pauseAndRemember (copy)
			pauseAndRemember(p4 or 2)
		end,
		toggle = function()
			-- upvalues: Flag (ref), Signal4 (copy), v1 (ref), pauseAndRemember (copy), play (copy), Signal2_4 (copy), Signal6 (copy)
			if Flag then return end
			if not Signal4(false) and (v1 ~= nil and not v1.isPlaybackReady()) then return end
			if Signal4(false) then
				pauseAndRemember(0)
			else
				play()
			end
			Signal2_4(Signal6(false) + 1)
		end,
		seek = function(p4: number)
			-- upvalues: Flag (ref), Signal4 (copy), Computed1 (copy), List (copy)
			if Flag then return end
			if Signal4(false) then
				local Duration: number = Computed1(false).duration
				
				if Duration > 0 and Duration <= p4 then
					p4 = 0
				end
			end
			for _, value in List do
				local SeekFunction: (any) -> () = value.seek
				
				if SeekFunction ~= nil then
					SeekFunction(p4)
				end
			end
		end,
		setRegion = function(p5)
			-- upvalues: Flag (ref), v1 (ref)
			if Flag then return end
			if v1 ~= nil then
				v1.setRegion(p5)
			end
		end,
		setActive = function(p5)
			-- upvalues: Largest (ref), Flag (ref), AudioGraphModule (copy), Signal2_5 (copy)
			if p5 then
				Largest = nil
			end
			local NoP14 = not p5
			
			if not Flag then
				AudioGraphModule.setMasterMuted(NoP14)
				Signal2_5(NoP14)
				
				return
			end
		end,
		setExternalBaseReadiness = function(p5, p6)
			-- upvalues: Flag (ref), FFlagMomentsRenderAvatarPostsInFeed (upval), p1 (copy), Signal2_3 (copy), Loading2 (copy)
			if not Flag and FFlagMomentsRenderAvatarPostsInFeed and p1.isExternalBase == true then
				Signal2_3(if p5 == "Failed" then p6 else nil)
				Loading2(p5)
				
				return
			end
		end,
		setSurface = function(p5, p6)
			-- upvalues: Flag (ref), Musics (copy)
			if Flag then return end
			local Music = Musics[p5]
			
			if Music ~= nil and Music.setSurface ~= nil then
				Music.setSurface(p6)
			end
		end,
		getVideoPreviewSource = function()
			-- upvalues: IsCaptureTypeMatch (copy), p1 (copy), Edits (copy)
			return if IsCaptureTypeMatch then {
				content = p1.content,
				region = if Edits == nil then nil else Edits.trim
			} else nil
		end,
		getHasVideoPreview = function()
			-- upvalues: IsCaptureTypeMatch (copy)
			return IsCaptureTypeMatch
		end,
		dispose = function()
			-- upvalues: Flag (ref), RenderSteppedConnection (ref), List (copy), AudioGraphModule (copy), MediaRootModuleResult (copy)
			if Flag then return end
			Flag = true
			
			if RenderSteppedConnection ~= nil then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
			for _, value in List do
				value.dispose()
			end
			AudioGraphModule.dispose()
			MediaRootModuleResult.dispose()
		end
	}
end