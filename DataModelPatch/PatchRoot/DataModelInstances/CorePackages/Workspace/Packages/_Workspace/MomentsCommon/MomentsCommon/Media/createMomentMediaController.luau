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
local _ = require(MomentsCommon.Media.Nodes.createVideoNode)
local _ = require(MomentsCommon.Media.Nodes.createScreenshotNode)
local _ = require(MomentsCommon.Media.Nodes.createMusicNode)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local LoopEpsilonSeconds = require(MomentsCommon.Media.Preload.preloadConstants).loopEpsilonSeconds

return function(p1, p2)
	-- upvalues: DefaultMediaNodeRegistryModule (copy), MediaRootModule (copy), CreateAudioGraphModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), CryoModule (copy), LoopEpsilonSeconds (copy)
	local Services = p2.services
	local Registry = p2.registry or DefaultMediaNodeRegistryModule()
	local IsCaptureTypeMatch = p1.captureType == Enum.CaptureType.Video
	local MediaRootModuleResult = MediaRootModule(p1.momentId, p2.parent)
	local Folder = MediaRootModuleResult.folder
	local AudioGraphModule = CreateAudioGraphModule(Folder, p2.audioDeviceOutput, p2.masterVolume)
	local Edits = p1.edits
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
			image = p1.content.Uri,
			poster = if p1.posterContent == nil then nil else p1.posterContent.Uri,
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
	
	if Edits ~= nil and Edits.textOverlays ~= nil then
		for i, textOverlay in Edits.textOverlays do
			local Text = Registry.create("text", {
				kind = "text",
				id = `text:{i - 1}`,
				overlay = textOverlay
			}, Services)
			table.insert(List, Text)
			Musics[Text.id] = Text
		end
	end
	local List1 = {}
	
	for _, value1 in List do
		if value1.usesDecoder then
			table.insert(List1, value1)
		end
	end
	local List2 = {}
	
	for _, value2 in List do
		local Render = value2.render
		
		if Render ~= nil then
			table.insert(List2, {
				id = value2.id,
				zIndex = value2.zIndex or 0,
				render = Render
			})
		end
	end
	table.sort(List2, function(A, B): boolean
		return A.zIndex < B.zIndex
	end)
	local Signal6 = CreateSignalFunction(List2)
	local AddStemResults = {}
	
	local _ = function(p3)
		-- upvalues: AddStemResults (copy), AudioGraphModule (copy)
		local AudioStem = p3.audioStem
		local GetAudioSourceFunction = p3.getAudioSource
		
		if AudioStem ~= nil and GetAudioSourceFunction ~= nil and AddStemResults[AudioStem.stemId] == nil then
			AddStemResults[AudioStem.stemId] = AudioGraphModule.addStem(AudioStem.stemId, GetAudioSourceFunction(), AudioStem.defaultVolume)
			
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
	
	for _, value in List do
		local NoGetAudioSource = value.getAudioSource == nil or value.usesDecoder
		local AudioStem = nil
		local GetAudioSourceFunction = nil
		
		if not NoGetAudioSource then
			AudioStem = value.audioStem
			GetAudioSourceFunction = value.getAudioSource
			NoGetAudioSource = AudioStem == nil or (GetAudioSourceFunction == nil or AddStemResults[AudioStem.stemId] ~= nil)
		end
		if not NoGetAudioSource then
			AddStemResults[AudioStem.stemId] = AudioGraphModule.addStem(AudioStem.stemId, GetAudioSourceFunction(), AudioStem.defaultVolume)
		end
	end
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(0)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local Flag = false
	local Largest = nil
	local GetPosition = if v1 == nil then v2.getPosition else v1.getPosition
	local Computed = CreateComputedFunction(function(p3): string
		-- upvalues: Signal3 (copy), Signal1 (copy), Signal (copy)
		return if Signal3(p3) then "Playing" elseif Signal1(p3) then "Decoded" elseif Signal(p3) then "Downloaded" else "Idle"
	end)
	local Computed1 = CreateComputedFunction(function(p3)
		-- upvalues: v1 (ref), Signal1 (copy), Signal (copy), v2 (ref), Signal3 (copy), Signal5 (copy)
		local Resolution = nil
		local FailureReason1 = nil
		local TimeLength = nil
		local Ready = nil
		local Duration = nil
		
		if v1 == nil then
			local v5 = v2
			local FailureReason = v5.getFailureReason(p3)
			Ready = if FailureReason == nil then if v5.getIsImageLoaded(p3) then "Ready" else "Loading" else "Failed"
			FailureReason1 = FailureReason
			Duration = v5.getDuration()
			TimeLength = v5.getDuration()
		else
			local FailureReason = v1.getFailureReason(p3)
			Ready = if FailureReason == nil then if v1.getIsLoaded(p3) then "Ready" elseif Signal1(p3) or Signal(p3) then "Loading" else "Idle" else "Failed"
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
			isPlaying = Signal3(p3),
			isMuted = Signal5(p3),
			failureReason = FailureReason1
		}
	end, CryoModule.Dictionary.equals)
	local RenderSteppedConnection = nil
	local v5 = 0
	
	local _ = function()
		-- upvalues: RenderSteppedConnection (ref), v3 (ref), v5 (ref), GetPosition (copy), Services (copy), Flag (ref), LoopEpsilonSeconds (upval)
		if RenderSteppedConnection == nil and v3 ~= nil then
			v5 = GetPosition(false)
			RenderSteppedConnection = Services.runService.RenderStepped:Connect(function()
				-- upvalues: Flag (upval), GetPosition (upval), v5 (upval), LoopEpsilonSeconds (upval), v3 (upval)
				if Flag then return end
				local v6 = GetPosition(false)
				
				if v6 < v5 - LoopEpsilonSeconds then
					v3.realignToRegionStart()
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
	
	local function play()
		-- upvalues: Flag (ref), Largest (ref), v3 (ref), v2 (ref), List (copy), Signal2_2 (copy), RenderSteppedConnection (ref), v5 (ref), GetPosition (copy), Services (copy), LoopEpsilonSeconds (upval)
		if Flag then return end
		local Largest1: number = Largest
		Largest = nil
		
		if v3 ~= nil then
			v3.realignToRegionStart()
		end
		if v2 ~= nil then
			v2.seek(0)
		end
		for _, value in List do
			local PlayFunction: () -> () = value.play
			
			if PlayFunction ~= nil then
				PlayFunction()
			end
		end
		if Largest1 ~= nil and Largest1 > 0 then
			for _, value1 in List do
				local SeekFunction: (any) -> () = value1.seek
				
				if SeekFunction ~= nil then
					SeekFunction(Largest1)
				end
			end
		end
		Signal2_2(true)
		
		if RenderSteppedConnection == nil then
			if v3 == nil then return end
			v5 = GetPosition(false)
			RenderSteppedConnection = Services.runService.RenderStepped:Connect(function()
				-- upvalues: Flag (upval), GetPosition (upval), v5 (upval), LoopEpsilonSeconds (upval), v3 (upval)
				if Flag then return end
				local v6 = GetPosition(false)
				
				if v6 < v5 - LoopEpsilonSeconds then
					v3.realignToRegionStart()
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
		getUserToggleNonce = Signal4,
		getVisualLayers = Signal6,
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
				-- upvalues: Flag (ref), AudioGraphModule (copy), Signal2_4 (copy)
				if not Flag then
					AudioGraphModule.setMasterMuted(p4)
					Signal2_4(p4)
					
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
			-- upvalues: Flag (ref), List1 (copy), AddStemResults (copy), AudioGraphModule (copy), v4 (copy), Signal2_1 (copy)
			if Flag then return end
			for _, value in List1 do
				local DecodeFunction: () -> () = value.decode
				
				if DecodeFunction ~= nil then
					DecodeFunction()
				end
				local AudioStem = value.audioStem
				local GetAudioSourceFunction = value.getAudioSource
				
				if AudioStem ~= nil and GetAudioSourceFunction ~= nil and AddStemResults[AudioStem.stemId] == nil then
					AddStemResults[AudioStem.stemId] = AudioGraphModule.addStem(AudioStem.stemId, GetAudioSourceFunction(), AudioStem.defaultVolume)
				end
			end
			if v4 and AddStemResults.video ~= nil then
				AudioGraphModule.setMuted("video", true)
			end
			Signal2_1(true)
		end,
		releaseDecoder = function()
			-- upvalues: Flag (ref), List1 (copy), AddStemResults (copy), Signal2_1 (copy), Signal2_2 (copy)
			if Flag then return end
			for _, value in List1 do
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
			-- upvalues: Flag (ref), Signal3 (copy), pauseAndRemember (copy), play (copy), Signal2_3 (copy), Signal4 (copy)
			if Flag then return end
			if Signal3(false) then
				pauseAndRemember(0)
			else
				play()
			end
			Signal2_3(Signal4(false) + 1)
		end,
		seek = function(p4)
			-- upvalues: Flag (ref), List (copy)
			if Flag then return end
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
			-- upvalues: Largest (ref), Flag (ref), AudioGraphModule (copy), Signal2_4 (copy)
			if p5 then
				Largest = nil
			end
			local NoP14 = not p5
			
			if not Flag then
				AudioGraphModule.setMasterMuted(NoP14)
				Signal2_4(NoP14)
				
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